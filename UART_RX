module uart_rx(
    input        clk,
    input        reset,
    input        rx,
    output reg [7:0] data_out,
    output reg   rx_done
);

reg [3:0] bit_count;
reg [7:0] shift_reg;
reg busy;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        bit_count <= 4'd0;
        shift_reg <= 8'd0;
        data_out  <= 8'd0;
        rx_done   <= 1'b0;
        busy      <= 1'b0;
    end
    else
    begin
        rx_done <= 1'b0;

        if(!busy)
        begin
            // Detect Start Bit
            if(rx == 1'b0)
            begin
                busy <= 1'b1;
                bit_count <= 4'd0;
            end
        end
        else
        begin
            if(bit_count < 8)
            begin
                shift_reg[bit_count] <= rx;
                bit_count <= bit_count + 1;
            end
            else
            begin
                // Stop bit received
                data_out <= shift_reg;
                rx_done <= 1'b1;
                busy <= 1'b0;
            end
        end
    end
end

endmodule