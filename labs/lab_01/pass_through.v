`timescale 1ns / 1ps
module pass_through(
    input [7:0] sw,
	 input mclk,
	 input btn,
    output [7:0] Led,
    output [0:6] seg,
    output dp,
    output [3:0] an
    );
	 wire [3:0] count2;
	 wire [15:0] count1;
	 wire [25:0] count0;

assign Led=sw;

sseg_driver my_sseg_conv(
    .num(count2),
    .sseg(seg),
    .dp(dp)
    );

counter #(26) my_timer(
	.clk(mclk),
	.reset(0),
	.count(count0)
	);

counter #(16) my_count(
	.clk(count0[25]),
	.reset(btn),
	.count(count1)
	);
	
assign count2= count0[19]?
						count0[18]?count1[15:12]:count1[11:8] :
						count0[18]?count1[7:4]:count1[3:0];

assign an    = count0[19]?
						count0[18]?4'b0111:4'b1011 :
						count0[18]?4'b1101:4'b1110;



endmodule
