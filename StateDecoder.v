module StateDecoder (
    input wire [3:0] state,
    input wire [3:0] next_state,
    output reg [5:0] enable_signals, // start with all 
    output reg [3:0] alu_op
);

    // en5: R3en
    // en4: R2en
    // en3: R1en
    // en2: OutBuf
    // en1: ImmBuf
    // en0: ExternBuf

    // parameter ADD = 4'b0001,
    // parameter OR = 4'b0010,
    // parameter XOR = 4'b0100,
    // parameter NOT = 4'b1000

    // alu_op changes on the transition from S to S
    always @(next_state) begin
        case (next_state)
            4'd0: alu_op = 4'bXXXX;
            4'd1: alu_op = 4'bXXXX;
            4'd2: alu_op = 4'bXXXX;
            4'd3: alu_op = 4'b0001;
            4'd4: alu_op = 4'b0001;
            4'd5: alu_op = 4'b0010;
            4'd6: alu_op = 4'b0010;
            4'd7: alu_op = 4'b1000;
            4'd8: alu_op = 4'b1000;
            4'd9: alu_op = 4'b0100;
            default: alu_op = 4'bXXXX;
        endcase
    end

    always @(state) begin
        case(state)
            4'd0: enable_signals = 6'd0;
            4'd1: enable_signals = 6'b001001; 
            4'd2: enable_signals = 6'b010010;
            4'd3: enable_signals = 6'b100000;
            4'd4: enable_signals = 6'b010100;
            4'd5: enable_signals = 6'b100000;
            4'd6: enable_signals = 6'b001100;
            4'd7: enable_signals = 6'b100000;
            4'd8: enable_signals = 6'b001100;
            4'd9: enable_signals = 6'b100000;
            default: enable_signals = 6'd0;
        endcase
    end
endmodule