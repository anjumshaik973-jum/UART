`timescale 1ns/1ps

module uart_tb;

reg clk;
reg reset;
reg tx_start;
reg [7:0] data_in;

wire [7:0] data_out;
wire tx_done;
wire rx_done;

// Instantiate Top Module
uart_top DUT(
    .clk(clk),
    .reset(reset),
    .tx_start(tx_start),
    .data_in(data_in),
    .data_out(data_out),
    .tx_done(tx_done),
    .rx_done(rx_done)
);

// Clock Generation
always #5 clk = ~clk;

// Stimulus
initial
begin
    clk = 0;
    reset = 1;
    tx_start = 0;
    data_in = 8'b00000000;

    #20;
    reset = 0;

    #10;
    data_in = 8'b10101010;
    tx_start = 1;

    #10;
    tx_start = 0;

    #200;

    data_in = 8'b11001100;
    tx_start = 1;

    #10;
    tx_start = 0;

    #200;

    $finish;
end

// Monitor
initial
begin
    $monitor("Time=%0t TX_Done=%b RX_Done=%b Data_Out=%b",
              $time, tx_done, rx_done, data_out);
end

// Waveform
initial
begin
    $dumpfile("uart.vcd");
    $dumpvars(0, uart_tb);
end

endmodule