module FSM #(
    parameter S0 = 4'd0,
    parameter S1 = 4'd1,
    parameter S2 = 4'd2,
    parameter S3 = 4'd3,
    parameter S4 = 4'd4,
    parameter S5 = 4'd5,
    parameter S6 = 4'd6,
    parameter S7 = 4'd7,
    parameter S8 = 4'd8,
    parameter S9 = 4'd9
) (
    input wire clk, reset,
    output reg [3:0] state,
    output reg [3:0] next_state
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
        S7: next_state = S8;
        S8: next_state = S9;
        S9: next_state = S9;
        default: next_state = S0;
    endcase

end

always @(negedge clk, negedge reset) begin
    if(!reset) state <= S0;
    else state <= next_state;
end
    
endmodule