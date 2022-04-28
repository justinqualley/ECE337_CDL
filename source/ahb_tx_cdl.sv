module ahb_tx_cdl(
    input logic clk, n_rst,                     //Standard CLK and NRST
    input logic hsel,                           //AHB Lite Signals
    input logic [3:0] haddr,
    input logic [1:0] htrans,
    input logic [1:0] hsize,
    input logic hwrite,
    input logic [31:0] hwdata,
    output logic [31:0] hrdata,
    output logic hresp, hready,
    input logic [2:0] hburst,    //TX
    output logic dplus_out, dminus_out, dmode
);
logic [7:0] tx_packet_data;
logic [2:0] tx_packet;
logic [6:0] buffer_occupancy;
logic get_tx_packet_data;
logic tx_transfer_active;
logic tx_error;
logic [7:0] tx_data;
logic store_tx_data;
logic clear;

ahb_slave AHB (.clk(clk), .n_rst(n_rst),                     //Standard CLK and NRST
                .hsel(hsel),                           //AHB Lite Signals
                .haddr(haddr),
                .htrans(htrans),
                .hsize(hsize),
                .hwrite(hwrite),
                .hwdata(hwdata),
                .hrdata(hrdata),
                .hresp(hresp), 
                .hready(hready),
                .hburst(hburst),
                .buffer_occupancy(buffer_occupancy),         //Data Buffer Signals
                .tx_transfer_active(tx_transfer_active), 
                .tx_error(tx_error),
                .store_tx_data(store_tx_data), 
                .clear(clear), 
                .dmode(dmode),
                .tx_data(tx_data),
                .tx_packet(tx_packet));

tx USB (.clk(clk), .n_rst(n_rst),
        .tx_packet_data(tx_packet_data),
        .tx_packet(tx_packet),
        .buffer_occupancy(buffer_occupancy),
        .get_tx_packet_data(get_tx_packet_data),
        .tx_transfer_active(tx_transfer_active),
        .tx_error(tx_error),
        .dplus_out(dplus_out),
        .dminus_out(dminus_out));

data_buffer DB (.clk(clk), .n_rst(n_rst),
                .tx_data(tx_data),
                .store_tx_data(store_tx_data),
                .get_tx_packet_data(get_tx_packet_data),
                .clear(clear),
                .buffer_occupancy(buffer_occupancy),
                .tx_packet_data(tx_packet_data));
endmodule
