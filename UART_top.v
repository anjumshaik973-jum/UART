module uart_top(
    input        clk,
    input        reset,
    input        tx_start,
    input  [7:0] data_in,
    output [7:0] data_out,
    output       tx_done,
    output       rx_done
);

wire tx;

// UART Transmitter
uart_tx TX (
    .clk(clk),
    .reset(reset),
    .tx_start(tx_start),
    .data_in(data_in),
    .tx(tx),
    .tx_done(tx_done)
);

// UART Receiver
uart_rx RX (
    .clk(clk),
    .reset(reset),
    .rx(tx),          // Connect TX output to RX input
    .data_out(data_out),
    .rx_done(rx_done)
);

endmodule