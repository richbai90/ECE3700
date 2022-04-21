module FSM #(
    parameter S0 = 11'b00000000001,
    parameter S1 = 11'b00000000010,
    parameter S2 = 11'b00000000100,
    parameter S3 = 11'b00000001000,
    parameter S4 = 11'b00000010000,
    parameter S5 = 11'b00000100000,
    parameter S6 = 11'b00001000000,
    parameter S7 = 11'b00010000000,
    parameter S8 = 11'b00100000000,
    parameter S9 = 11'b01000000000
) (
    input wire clk, reset,
    output reg [10:0] state,
    output reg [10:0] next_state
);

always @(state) begin
    case(state)
        S0: next_state = S1;
        S1: next_state = S2;
        S2: next_state = S3;
        S3: next_state = S4;
        S4: next_state = S5;
        S5: next_state = S6;
        S6: next_state = S7;
        S8: next_state = S9;
        S9: next_state = S9;
        default: next_state = S0;
    endcase

end

always @(posedge clk, negedge reset) begin
    if(!reset) state <= S0;
    else state <= next_state;
end
    
endmodule