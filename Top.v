module Top (
    input wire [3:0] external, // switches
    input wire reset, clk, logictapclk,
    output wire [6:0] sevseg,
    output wire [6:0] sevseg2
);

    wire [3:0] state, next_state;
    wire [5:0] enable_signals;
    wire [3:0] R1out, R2out, R3out, alu_op, R3, databus;

    FSM fsm(.clk(clk), .reset(reset), .state(state), .next_state(next_state));
    StateDecoder sd(.state(state), .next_state(next_state), .enable_signals(enable_signals), .alu_op(alu_op));
    ALU alu(.A(R1out), .B(R2out), .op(alu_op), .result(R3));
    Registers registers(.R1(databus), .R2(databus), .R3(R3), .en(enable_signals[5:3]), .reset(reset), .R1out(R1out), .R2out(R2out), .R3out(R3out));
    Buffer out_buf(.write(R3out), .en(enable_signals[2]), .io(databus));
    Buffer imm_buf(.write(4'b0011), .en(enable_signals[1]), .io(databus));
    Buffer extern_buf(.write(external), .en(enable_signals[0]), .io(databus));
    SevenSeg ss(.hex_input(R3out), .seven_seg(sevseg));
    SevenSeg ss2(.hex_input(state), .seven_seg(sevseg2));
endmodule
