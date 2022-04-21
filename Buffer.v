module Buffer(inout [3:0] io, input [3:0] write, input en);
    assign io = en ? write : 4'bZZZZ;
endmodule
