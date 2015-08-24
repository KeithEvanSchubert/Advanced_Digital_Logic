`timescale 1ns / 1ps
module pass_through_simple(
    input [7:0] sw,
    output [7:0] Led
    );

assign Led=sw;

endmodule
