module Registers (
    input wire [3:0] R1, R2, R3,
    input wire [2:0] en,
    input wire reset,
    output reg [3:0] R1out, R2out, R3out
);
    always @(posedge en[0], negedge reset) begin
        if(!reset) R1out = 4'd0;
        else R1out = R1;
    end

    always @(posedge en[1], negedge reset) begin
        if(!reset) R2out = 4'd0;
        else R2out = R2;
    end

    always @(posedge en[2], negedge reset) begin
        if(!reset) R3out = 4'd0;
        else R3out = R3;
    end
endmodule