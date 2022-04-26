module ahb_slave(
    input logic clk, n_rst,                     //Standard CLK and NRST
    input logic hsel,                           //AHB Lite Signals
    input logic [3:0] haddr,
    input logic [1:0] htrans,
    input logic [1:0] hsize,
    input logic hwrite,
    input logic [31:0] hwdata,
    output logic [31:0] hrdata,
    output logic hresp, hready,
    input logic [2:0] hburst,
    input logic [7:0] buffer_occupancy,         //Data Buffer Signals
    input logic tx_transfer_active, tx_error,
    output logic store_tx_data, clear,
    output logic [7:0] tx_data,
    output logic [1:0] tx_packet
);
//AHB Registers set up as 2D Array of Bytes
reg [13:0][7:0] mem;
reg [13:0][7:0] next_mem;
//Registered AHB signals for pipelining
reg [3:0] prev_haddr;
reg [1:0] prev_htrans;
reg [1:0] prev_hsize;
reg [1:0] data_hsize;
reg [1:0] next_data_hsize;
reg prev_hwrite, prev_hsel;
//States for transfer to Data Buffer
typedef enum logic [2:0] {IDLE, B0, B1, B2, B3} stateType;
stateType state;
stateType next_state;

//Data Buffer Transfer FSM
always_ff @ (posedge clk, negedge n_rst) begin
	if(n_rst == 1'b0) begin
		state <= IDLE;
    end else begin
		state <= next_state;
	end
end

always_comb begin
    next_data_hsize = (prev_haddr inside {[0:3]} && hsel == 1'b1 && prev_hwrite == 1'b1) ? prev_hsize : data_hsize;
    case(state)
        IDLE: begin                                                 
                store_tx_data = 1'b0;
                tx_data = '0;
                tx_packet = '0;
                next_state = (prev_haddr inside {[0:3]} && hsel == 1'b1 && prev_hwrite == 1'b1) ? B0 : IDLE;    //FSM starts when any data address is written to
              end
        B0:   begin 
                //hready = 1'b0;
                tx_packet = 2'd3;
                store_tx_data = 1'b1;                               //Signals we are storing data into the buffer
                tx_data = mem[0];                                   //Put the least-significant byte first
                next_state = (data_hsize > 2'd0) ? B1 : IDLE;            //Go to 2 byte transfer if size demands
              end
        B1:   begin
                tx_data = mem[1];                       
                next_state = (data_hsize > 2'd1) ? B2 : IDLE;            //Go to 4 byte transfer if size demands
              end
        B2:   begin
                tx_data = mem[2];
                next_state = B3;                                    //3rd byte transferred
              end       
        B3:   begin
                tx_data = mem[3];
                next_data_hsize = '0;
                next_state = IDLE;                                  //4th byte transferred
              end
    endcase
end

always_comb begin
    if(hwrite == 1'b1 && haddr inside {[4:8]}) begin //Write to Read Only Error
        hready = '0;
    end else if(state == B0) begin                   //Transferring to Data Buffer, busy
        hready = '0;
    end else if(!(haddr inside {[0:14]})) begin      //Address out of Bounds Error
        hready = '0;
    end else begin                                   //Else we're always ready
        hready = '1;
    end
end

//Address Mapping + Error Logic
always_ff @ (negedge n_rst, posedge clk) begin
    if(1'b0 == n_rst) begin
        mem <= '0;
        prev_haddr <= '0;
        prev_htrans <= '0;
        prev_hsize <= '0;
        prev_hwrite <= '0;
        prev_hsel <= '0;
        data_hsize <= '0;
    end else begin
        mem <= next_mem;
        prev_haddr <= haddr;
        prev_htrans <= htrans;
        prev_hsize <= hsize;
        data_hsize <= next_data_hsize;
        prev_hwrite <= hwrite;
        prev_hsel <= hsel;
    end
end

always_comb begin
    hresp = '0;
    //hready = 1'b1;
    hrdata = '0;
    next_mem = mem;
    //Registers
    //next_mem[4] = '0;                                                   //Status Register
    next_mem[5] = (tx_transfer_active == 1'b1) ? 8'b10 : mem[5];
   // next_mem[6] = '0;
    next_mem[7] = (tx_error == 1'b1) ? 8'b1 : mem[7];                             //Error Register
    next_mem[12] = (tx_transfer_active == 1'b0) ? '0 : mem[12];         //TX Control Register
    next_mem[13] = (buffer_occupancy == '0) ? '0 : mem[13];             //Flush Register
    //Outputs
    clear  = (mem[13] == 8'd1) ? 1'b1 : 1'b0; 

    if(hsel == 1'b1) begin												//Device Selected
	    if(prev_hwrite == 1'b1 && prev_htrans == 2'd2) begin					//Write Operation htrans correct ???
		    if(prev_haddr inside {[4:8]}) begin 					    //W to R only error
			    hresp = 1;
			    //hready = 0;
            end else if(prev_haddr inside {[12:13]}) begin 	            //1 byte write
                next_mem[prev_haddr] = hwdata[7:0];
            end else if(prev_haddr inside {[0:3]}) begin		        //4 byte write
                case(prev_hsize)							            //Data Logic:
                    2'd0: begin 
                            next_mem[0] = hwdata[7:0]; 
                          end
                    2'd1: begin 
                            next_mem[0] = hwdata[7:0];
                            next_mem[1] = hwdata[15:8]; 
                          end
                    2'd2: begin 
                            next_mem[0] = hwdata[7:0];
                            next_mem[1] = hwdata[15:8];
                            next_mem[2] = hwdata[23:16];
                            next_mem[3] = hwdata[31:24]; 
                          end
                endcase	
            end
        end else begin												        //Read Operation
            if(prev_haddr inside {[0:3]}) begin 							//4 byte read ???
                hrdata = {mem[3], mem[2], mem[1], mem[0]}; 
            end else if(prev_haddr inside {[4:7]}) begin 					//2 byte read
                if(prev_haddr[0] == 1'b1) begin 							//Write is not aligned
                    hrdata = {16'b0, mem[prev_haddr], mem[prev_haddr - 1]};
                end else begin										        //Write aligned
                    hrdata = {16'b0, mem[prev_haddr + 1], mem[prev_haddr]};
                end
            end else if(prev_haddr inside {[12:13]}) begin                  //1 byte read
                hrdata = {24'b0, mem[prev_haddr]};
            end else begin                                                  //Address out of range error
                hresp = 1;
                //hready = 0;
            end
        end
    end
end
endmodule
