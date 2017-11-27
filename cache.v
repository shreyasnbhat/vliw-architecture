
`timescale 1ns / 1ps

/*
=====================================
D flip flop
======================================
*/
module D_ff(input clk, input reset, input regWrite, input d, output reg q);
	always@(negedge clk)
		begin
			if(reset)
				q=0;
			else
				if(regWrite == 1) begin q=d; end
		end
endmodule

/*
=====================================
D flip flop for Register File
======================================
*/
module D_ff_reg (input clk, input reset, input regWrite, input decOut1b, input d, output reg q);
	always @ (negedge clk)
		begin
		if(reset==1'b1)
			q=0;
		else
			if(regWrite == 1'b1 && decOut1b==1'b1)
				begin 
					q=d; 
				end
		end
endmodule

/*
=====================================
D flip flop for Instruction Memory
======================================
*/
module D_ff_IM(input clk, input reset, input d, output reg q);
	always@(reset or posedge clk)
	if(reset)
		q=d;
endmodule


/*
=====================================
Decoders
======================================
*/
module decoder4to16( input [3:0] decIn, output reg [15:0] decOut);
	always@(decIn)
	case(decIn)
			4'b0000: decOut=16'b0000000000000001; 
			4'b0001: decOut=16'b0000000000000010;
			4'b0010: decOut=16'b0000000000000100;
			4'b0011: decOut=16'b0000000000001000;
			4'b0100: decOut=16'b0000000000010000;
			4'b0101: decOut=16'b0000000000100000;
			4'b0110: decOut=16'b0000000001000000;
			4'b0111: decOut=16'b0000000010000000;
			4'b1000: decOut=16'b0000000100000000; 
			4'b1001: decOut=16'b0000001000000000;
			4'b1010: decOut=16'b0000010000000000;
			4'b1011: decOut=16'b0000100000000000;
			4'b1100: decOut=16'b0001000000000000;
			4'b1101: decOut=16'b0010000000000000;
			4'b1110: decOut=16'b0100000000000000;
			4'b1111: decOut=16'b1000000000000000;
	endcase
endmodule

module decoder3to8( input [2:0] decIn, output reg [7:0] decOut);
	always@(decIn)
	case(decIn)
			3'b000: decOut=8'b00000001; 
			3'b001: decOut=8'b00000010;
			3'b010: decOut=8'b00000100;
			3'b011: decOut=8'b00001000;
			3'b100: decOut=8'b00010000;
			3'b101: decOut=8'b00100000;
			3'b110: decOut=8'b01000000;
			3'b111: decOut=8'b10000000;
	endcase
endmodule

module decoder5to32( input [4:0] decIn, output reg [31:0] decOut);
	always@(decIn)
		begin
			case(decIn)
					5'b00000: decOut=32'b00000000000000000000000000000001; 
					5'b00001: decOut=32'b00000000000000000000000000000010;
					5'b00010: decOut=32'b00000000000000000000000000000100;
					5'b00011: decOut=32'b00000000000000000000000000001000;
					5'b00100: decOut=32'b00000000000000000000000000010000;
					5'b00101: decOut=32'b00000000000000000000000000100000;
					5'b00110: decOut=32'b00000000000000000000000001000000;
					5'b00111: decOut=32'b00000000000000000000000010000000;
					5'b01000: decOut=32'b00000000000000000000000100000000; 
					5'b01001: decOut=32'b00000000000000000000001000000000;
					5'b01010: decOut=32'b00000000000000000000010000000000;
					5'b01011: decOut=32'b00000000000000000000100000000000;
					5'b01100: decOut=32'b00000000000000000001000000000000;
					5'b01101: decOut=32'b00000000000000000010000000000000;
					5'b01110: decOut=32'b00000000000000000100000000000000;
					5'b01111: decOut=32'b00000000000000001000000000000000;
					5'b10000: decOut=32'b00000000000000010000000000000000; 
					5'b10001: decOut=32'b00000000000000100000000000000000;
					5'b10010: decOut=32'b00000000000001000000000000000000;
					5'b10011: decOut=32'b00000000000010000000000000000000;
					5'b10100: decOut=32'b00000000000100000000000000000000;
					5'b10101: decOut=32'b00000000001000000000000000000000;
					5'b10110: decOut=32'b00000000010000000000000000000000;
					5'b10111: decOut=32'b00000000100000000000000000000000;
					5'b11000: decOut=32'b00000001000000000000000000000000; 
					5'b11001: decOut=32'b00000010000000000000000000000000;
					5'b11010: decOut=32'b00000100000000000000000000000000;
					5'b11011: decOut=32'b00001000000000000000000000000000;
					5'b11100: decOut=32'b00010000000000000000000000000000;
					5'b11101: decOut=32'b00100000000000000000000000000000;
					5'b11110: decOut=32'b01000000000000000000000000000000;
					5'b11111: decOut=32'b10000000000000000000000000000000;
			endcase
		end
endmodule

/*
=====================================
2 - 1 Multiplexers in all bit widths
======================================
*/
module mux2to1_16bits(input [15:0] in1,in2, input sel, output reg [15:0] muxOut);
	 always@(in1 , in2 , sel)
	 begin
		case(sel)
			2'b0 : muxOut = in1;
			2'b1 : muxOut = in2;			
		endcase
	 end
endmodule

module mux2to1_8bits(input [7:0] in1,in2, input sel, output reg [7:0] muxOut);
	 always@(in1 , in2 , sel)
	 begin
		case(sel)
			2'b0 : muxOut = in1;
			2'b1 : muxOut = in2;			
		endcase
	 end
endmodule

module mux2to1_4bits(input [3:0] in1,in2, input sel, output reg [3:0] muxOut);
	 always@(in1 , in2 , sel)
	 begin
		case(sel)
			2'b0 : muxOut = in1;
			2'b1 : muxOut = in2;
		endcase
	 end
endmodule

module mux2to1_2bits(input [1:0] in1,in2, input sel, output reg [1:0] muxOut);
	 always@(in1 , in2 , sel)
	 begin
		case(sel)
			2'b0 : muxOut = in1;
			2'b1 : muxOut = in2;
		endcase
	 end
endmodule

module mux2to1_5bits(input [4:0] in1,in2, input sel, output reg [4:0] muxOut);
	 always@(in1 , in2 , sel)
	 begin
		case(sel)
			2'b0 : muxOut = in1;
			2'b1 : muxOut = in2;
		endcase
	 end
endmodule

module mux2to1_32bits(input [31:0] in1,in2, input sel, output reg [31:0] muxOut);
	 always@(in1 , in2 , sel)
	 begin
		case(sel)
			2'b0 : muxOut = in1;
			2'b1 : muxOut = in2;			
		endcase
	 end
endmodule

module mux2to1_128bits(input [127:0] in1,in2, input sel, output reg [127:0] muxOut);
	 always@(in1 , in2 , sel)
	 begin
		case(sel)
			2'b0 : muxOut = in1;
			2'b1 : muxOut = in2;
		endcase
	 end
endmodule

/*
=====================================
4 - 1 Multiplexers in all bit widths
======================================
*/
module mux4to1_16bits(input [15:0] in1,in2,in3,in4, input [1:0] sel,output reg [15:0] muxOut);
	 always@(in1 , in2 , in3 , in4 , sel)
	 begin
		case(sel)
			2'b00 : muxOut = in1;
			2'b01 : muxOut = in2;
			2'b10 : muxOut = in3;
			2'b11 : muxOut = in4;
		endcase
	 end
endmodule

module mux4to1_2bits(input [1:0] in1,in2,in3,in4, input [1:0] sel,output reg [1:0] muxOut);
	 always@(in1 , in2 , in3 , in4 , sel)
	 begin
		case(sel)
			2'b00 : muxOut = in1;
			2'b01 : muxOut = in2;
			2'b10 : muxOut = in3;
			2'b11 : muxOut = in4;
		endcase
	 end
endmodule

module mux4to1_32bits(input [31:0] in1,in2,in3,in4, input [1:0] sel,output reg [31:0] muxOut);
	 always@(in1 , in2 , in3 , in4 , sel)
	 begin
		case(sel)
			2'b00 : muxOut = in1;
			2'b01 : muxOut = in2;
			2'b10 : muxOut = in3;
			2'b11 : muxOut = in4;
		endcase
	 end
endmodule

module mux4to1_128bits( input [127:0] in0,in1,in2,in3, input [1:0] sel, output reg [127:0] muxOut );
	always@(in0,in1,in2,in3,sel)
	case (sel)
				2'b00: muxOut=in0;
				2'b01: muxOut=in1;
				2'b10: muxOut=in2;
				2'b11: muxOut=in3;
	endcase
endmodule

module mux8to1_8bits ( input [7:0] in0,in1,in2,in3,in4,in5,in6,in7,input [2:0] sel, output reg [7:0] muxOut );
	always@(in0,in1,in2,in3,in4,in5,in6,in7,sel)
	case (sel)
				3'b000: muxOut=in0;
				3'b001: muxOut=in1;
				3'b010: muxOut=in2;
				3'b011: muxOut=in3;
				3'b100: muxOut=in4;
				3'b101: muxOut=in5;
				3'b110: muxOut=in6;
				3'b111: muxOut=in7;
	endcase
endmodule

/*
=====================================
16 - 1 Multiplexers in all bit widths
======================================
*/
module mux16to1_1bit( input in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15, input [3:0] sel, output reg muxOut );
	always@(in0 , in1 , in2 , in3 , in4 , in5 , in6 , in7 , in8 , in9 , in10 , in11 , in12 , in13 , in14 , in15 , sel)
	case (sel)
				4'b0000: muxOut=in0;
				4'b0001: muxOut=in1;
				4'b0010: muxOut=in2;
				4'b0011: muxOut=in3;
				4'b0100: muxOut=in4;
				4'b0101: muxOut=in5;
				4'b0110: muxOut=in6;
				4'b0111: muxOut=in7;
				4'b1000: muxOut=in8;
				4'b1001: muxOut=in9;
				4'b1010: muxOut=in10;
				4'b1011: muxOut=in11;
				4'b1100: muxOut=in12;
				4'b1101: muxOut=in13;
				4'b1110: muxOut=in14;
				4'b1111: muxOut=in15;
	endcase
endmodule

module mux16to1_2bits( input [1:0] in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15, input [3:0] sel, output reg [1:0] muxOut );
	always@(in0 , in1 , in2 , in3 , in4 , in5 , in6 , in7 , in8 , in9 , in10 , in11 , in12 , in13 , in14 , in15 , sel)
	case (sel)
				4'b0000: muxOut=in0;
				4'b0001: muxOut=in1;
				4'b0010: muxOut=in2;
				4'b0011: muxOut=in3;
				4'b0100: muxOut=in4;
				4'b0101: muxOut=in5;
				4'b0110: muxOut=in6;
				4'b0111: muxOut=in7;
				4'b1000: muxOut=in8;
				4'b1001: muxOut=in9;
				4'b1010: muxOut=in10;
				4'b1011: muxOut=in11;
				4'b1100: muxOut=in12;
				4'b1101: muxOut=in13;
				4'b1110: muxOut=in14;
				4'b1111: muxOut=in15;
	endcase
endmodule

module mux16to1_4bits ( input [3:0] in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15, input [3:0] sel, output reg [3:0] muxOut );
	always@(in0 , in1 , in2 , in3 , in4 , in5 , in6 , in7 , in8 , in9 , in10 , in11 , in12 , in13 , in14 , in15 , sel)
	case (sel)
				4'b0000: muxOut=in0;
				4'b0001: muxOut=in1;
				4'b0010: muxOut=in2;
				4'b0011: muxOut=in3;
				4'b0100: muxOut=in4;
				4'b0101: muxOut=in5;
				4'b0110: muxOut=in6;
				4'b0111: muxOut=in7;
				4'b1000: muxOut=in8;
				4'b1001: muxOut=in9;
				4'b1010: muxOut=in10;
				4'b1011: muxOut=in11;
				4'b1100: muxOut=in12;
				4'b1101: muxOut=in13;
				4'b1110: muxOut=in14;
				4'b1111: muxOut=in15;
	endcase
endmodule	

module mux16to1_16bits( input [15:0] in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15, input [3:0] sel, output reg [15:0] muxOut );
	always@(in0 , in1 , in2 , in3 , in4 , in5 , in6 , in7 , in8 , in9 , in10 , in11 , in12 , in13 , in14 , in15 , sel)
	case (sel)
				4'b0000: muxOut=in0;
				4'b0001: muxOut=in1;
				4'b0010: muxOut=in2;
				4'b0011: muxOut=in3;
				4'b0100: muxOut=in4;
				4'b0101: muxOut=in5;
				4'b0110: muxOut=in6;
				4'b0111: muxOut=in7;
				4'b1000: muxOut=in8;
				4'b1001: muxOut=in9;
				4'b1010: muxOut=in10;
				4'b1011: muxOut=in11;
				4'b1100: muxOut=in12;
				4'b1101: muxOut=in13;
				4'b1110: muxOut=in14;
				4'b1111: muxOut=in15;
	endcase
endmodule

module mux16to1_20bits( input [19:0] in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15, input [3:0] sel, output reg [19:0] muxOut );
	always@(in0 , in1 , in2 , in3 , in4 , in5 , in6 , in7 , in8 , in9 , in10 , in11 , in12 , in13 , in14 , in15 , sel)
	case (sel)
				4'b0000: muxOut=in0;
				4'b0001: muxOut=in1;
				4'b0010: muxOut=in2;
				4'b0011: muxOut=in3;
				4'b0100: muxOut=in4;
				4'b0101: muxOut=in5;
				4'b0110: muxOut=in6;
				4'b0111: muxOut=in7;
				4'b1000: muxOut=in8;
				4'b1001: muxOut=in9;
				4'b1010: muxOut=in10;
				4'b1011: muxOut=in11;
				4'b1100: muxOut=in12;
				4'b1101: muxOut=in13;
				4'b1110: muxOut=in14;
				4'b1111: muxOut=in15;
	endcase
endmodule

module mux16to1_48bits(input [47:0] in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,
							  input [3:0] sel, output reg [47:0] muxOut );
	
	always@(in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,sel)
		case (sel)
			4'd0: muxOut = in0;
			4'd1: muxOut = in1;
			4'd2: muxOut = in2;
			4'd3: muxOut = in3;
			4'd4: muxOut = in4;
			4'd5: muxOut = in5;
			4'd6: muxOut = in6;
			4'd7: muxOut = in7;
			4'd8: muxOut = in8;
			4'd9: muxOut = in9;
			4'd10: muxOut = in10;
			4'd11: muxOut = in11;
			4'd12: muxOut = in12;
			4'd13: muxOut = in13;
			4'd14: muxOut = in14;
			4'd15: muxOut = in15;
		endcase
endmodule

module mux16to1_128bits( input [127:0] in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15, input [3:0] sel, output reg [127:0] muxOut );
	always@(in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,sel)
	case (sel)
				4'b0000: muxOut=in0;
				4'b0001: muxOut=in1;
				4'b0010: muxOut=in2;
				4'b0011: muxOut=in3;
				4'b0100: muxOut=in4;
				4'b0101: muxOut=in5;
				4'b0110: muxOut=in6;
				4'b0111: muxOut=in7;
				4'b1000: muxOut=in8;
				4'b1001: muxOut=in9;
				4'b1010: muxOut=in10;
				4'b1011: muxOut=in11;
				4'b1100: muxOut=in12;
				4'b1101: muxOut=in13;
				4'b1110: muxOut=in14;
				4'b1111: muxOut=in15;
	endcase
endmodule

/*
=====================================
32 - 1 Multiplexers in all bit widths
======================================
*/
module mux32to1_32bits( input [4:0] sel, input [31:0] in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,
								in16,in17,in18,in19,in20,in21,in22,in23,in24,in25,in26,in27,in28,in29,in30,in31,output reg [31:0] muxOut);
	
	always@(in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,in16,in17,in18,in19,in20,in21,in22,in23,in24,in25,in26,in27,in28,in29,in30,in31, sel)
	case (sel)
				5'b00000:  muxOut=in0;
				5'b00001:  muxOut=in1;
				5'b00010:  muxOut=in2;
				5'b00011:  muxOut=in3;
				5'b00100:  muxOut=in4;
				5'b00101:  muxOut=in5;
				5'b00110:  muxOut=in6;
				5'b00111:  muxOut=in7;
				5'b01000:  muxOut=in8;
				5'b01001:  muxOut=in9;
				5'b01010:  muxOut=in10;
				5'b01011:  muxOut=in11;
				5'b01100:  muxOut=in12;
				5'b01101:  muxOut=in13;
				5'b01110:  muxOut=in14;
				5'b01111:  muxOut=in15;
				5'b10000:  muxOut=in16;
				5'b10001:  muxOut=in17;
				5'b10010:  muxOut=in18;
				5'b10011:  muxOut=in19;
				5'b10100:  muxOut=in20;
				5'b10101:  muxOut=in21;
				5'b10110:  muxOut=in22;
				5'b10111:  muxOut=in23;
				5'b11000:  muxOut=in24;
				5'b11001:  muxOut=in25;
				5'b11010:  muxOut=in26;
				5'b11011:  muxOut=in27;
				5'b11100:  muxOut=in28;
				5'b11101:  muxOut=in29;
				5'b11110:  muxOut=in30;
				5'b11111:  muxOut=in31;
	endcase
endmodule

module priorityEncoder(input [3:0] in1, output reg [1:0] op);
		
	//Write your code here
	always @(in1)
	begin
		casex(in1)
			4'b0001 : op = 2'b00;	
			4'b001x : op = 2'b01;	
			4'b01xx : op = 2'b10;	
			4'b1xxx : op = 2'b11;	
			default: op = 2'b00;
		endcase	
	end
endmodule

module priorityEncoderInvalid(input [3:0] in1, output reg [1:0] op);
		
	//Write your code here
	always @(in1)
	begin
		casex(in1)
			4'bxxx0 : op = 2'b00;	
			4'bxx01 : op = 2'b01;	
			4'bx011 : op = 2'b10;	
			4'b0111 : op = 2'b11;	
			default: op = 2'b00;
		endcase	
	end
endmodule			

module encoder16bit(input [15:0] encIn,output reg [3:0] encOut,output reg invalid);
	always@(encIn)
		begin
			invalid = 1'b0;
			case(encIn)
				16'b0000000000000001	: encOut = 4'b0000 ;
				16'b0000000000000010	: encOut = 4'b0001 ;
				16'b0000000000000100	: encOut = 4'b0010 ;
				16'b0000000000001000	: encOut = 4'b0011 ;
				16'b0000000000010000	: encOut = 4'b0100 ;
				16'b0000000000100000	: encOut = 4'b0101 ;
				16'b0000000001000000	: encOut = 4'b0110 ;
				16'b0000000010000000	: encOut = 4'b0111 ;
				16'b0000000100000000	: encOut = 4'b1000 ;
				16'b0000001000000000	: encOut = 4'b1001 ; 
				16'b0000010000000000	: encOut = 4'b1010 ;
				16'b0000100000000000	: encOut = 4'b1011 ;
				16'b0001000000000000	: encOut = 4'b1100 ;
				16'b0010000000000000	: encOut = 4'b1101 ;
				16'b0100000000000000	: encOut = 4'b1110 ; 
				16'b1000000000000000	: encOut = 4'b1111 ;
				default:  begin encOut= 4'b0000; invalid = 1'b1; end
			endcase		 
		end
endmodule
	

/*
=====================================
Register File Design
======================================
*/
module register32bit_PC( input clk, input reset, input regWrite, input decOut1b, input [31:0] writeData, output  [31:0] outR );
	
	D_ff_reg d00(clk, reset, regWrite, decOut1b, writeData[0], outR[0]);
	D_ff_reg d01(clk, reset, regWrite, decOut1b, writeData[1], outR[1]);
	D_ff_reg d02(clk, reset, regWrite, decOut1b, writeData[2], outR[2]);
	D_ff_reg d03(clk, reset, regWrite, decOut1b, writeData[3], outR[3]);
	D_ff_reg d04(clk, reset, regWrite, decOut1b, writeData[4], outR[4]);
	D_ff_reg d05(clk, reset, regWrite, decOut1b, writeData[5], outR[5]);
	D_ff_reg d06(clk, reset, regWrite, decOut1b, writeData[6], outR[6]);
	D_ff_reg d07(clk, reset, regWrite, decOut1b, writeData[7], outR[7]);
	D_ff_reg d08(clk, reset, regWrite, decOut1b, writeData[8], outR[8]);
	D_ff_reg d09(clk, reset, regWrite, decOut1b, writeData[9], outR[9]);
	D_ff_reg d10(clk, reset, regWrite, decOut1b, writeData[10], outR[10]);
	D_ff_reg d11(clk, reset, regWrite, decOut1b, writeData[11], outR[11]);
	D_ff_reg d12(clk, reset, regWrite, decOut1b, writeData[12], outR[12]);
	D_ff_reg d13(clk, reset, regWrite, decOut1b, writeData[13], outR[13]);
	D_ff_reg d14(clk, reset, regWrite, decOut1b, writeData[14], outR[14]);
	D_ff_reg d15(clk, reset, regWrite, decOut1b, writeData[15], outR[15]);
	
	D_ff_reg d16(clk, reset, regWrite, decOut1b, writeData[16], outR[16]);
	D_ff_reg d17(clk, reset, regWrite, decOut1b, writeData[17], outR[17]);
	D_ff_reg d18(clk, reset, regWrite, decOut1b, writeData[18], outR[18]);
	D_ff_reg d19(clk, reset, regWrite, decOut1b, writeData[19], outR[19]);
	D_ff_reg d20(clk, reset, regWrite, decOut1b, writeData[20], outR[20]);
	D_ff_reg d21(clk, reset, regWrite, decOut1b, writeData[21], outR[21]);
	D_ff_reg d22(clk, reset, regWrite, decOut1b, writeData[22], outR[22]);
	D_ff_reg d23(clk, reset, regWrite, decOut1b, writeData[23], outR[23]);
	D_ff_reg d24(clk, reset, regWrite, decOut1b, writeData[24], outR[24]);
	D_ff_reg d25(clk, reset, regWrite, decOut1b, writeData[25], outR[25]);
	D_ff_reg d26(clk, reset, regWrite, decOut1b, writeData[26], outR[26]);
	D_ff_reg d27(clk, reset, regWrite, decOut1b, writeData[27], outR[27]);
	D_ff_reg d28(clk, reset, regWrite, decOut1b, writeData[28], outR[28]);
	D_ff_reg d29(clk, reset, regWrite, decOut1b, writeData[29], outR[29]);
	D_ff_reg d30(clk, reset, regWrite, decOut1b, writeData[30], outR[30]);
	D_ff_reg d31(clk, reset, regWrite, decOut1b, writeData[31], outR[31]);
	
	
endmodule


module registerFileRegister32bits(input clk, input reset, input regWrite, input decOut1b, input decOut_final,
											 input [31:0] writeData_a,input [31:0] writeData_b, output  [31:0] outR);
	  
	  wire [31:0] writeData;
	  mux2to1_32bits writeDataSelect(writeData_a,writeData_b,decOut1b,writeData);
	  
	  D_ff_reg 	d0(clk, reset, regWrite,decOut_final, writeData[0], outR[0]),
								d1(clk, reset, regWrite,decOut_final, writeData[1], outR[1]),
								d2(clk, reset, regWrite,decOut_final, writeData[2], outR[2]),
								d3(clk, reset, regWrite,decOut_final, writeData[3], outR[3]),
								d4(clk, reset, regWrite,decOut_final, writeData[4], outR[4]),
								d5(clk, reset, regWrite,decOut_final, writeData[5], outR[5]),
								d6(clk, reset, regWrite,decOut_final, writeData[6], outR[6]),
								d7(clk, reset, regWrite,decOut_final, writeData[7], outR[7]),
								d8(clk, reset, regWrite,decOut_final, writeData[8], outR[8]),
								d9(clk, reset, regWrite,decOut_final, writeData[9], outR[9]),
								d10(clk, reset, regWrite,decOut_final, writeData[10], outR[10]),
								d11(clk, reset, regWrite,decOut_final, writeData[11], outR[11]),
								d12(clk, reset, regWrite,decOut_final, writeData[12], outR[12]),
								d13(clk, reset, regWrite,decOut_final, writeData[13], outR[13]),
								d14(clk, reset, regWrite,decOut_final, writeData[14], outR[14]),
								d15(clk, reset, regWrite,decOut_final, writeData[15], outR[15]),
								d16(clk, reset, regWrite,decOut_final, writeData[16], outR[16]),
								d17(clk, reset, regWrite,decOut_final, writeData[17], outR[17]),
								d18(clk, reset, regWrite,decOut_final, writeData[18], outR[18]),
								d19(clk, reset, regWrite,decOut_final, writeData[19], outR[19]),
								d20(clk, reset, regWrite,decOut_final, writeData[20], outR[20]),
								d21(clk, reset, regWrite,decOut_final, writeData[21], outR[21]),
								d22(clk, reset, regWrite,decOut_final, writeData[22], outR[22]),
								d23(clk, reset, regWrite,decOut_final, writeData[23], outR[23]),
								d24(clk, reset, regWrite,decOut_final, writeData[24], outR[24]),
								d25(clk, reset, regWrite,decOut_final, writeData[25], outR[25]),
								d26(clk, reset, regWrite,decOut_final, writeData[26], outR[26]),
								d27(clk, reset, regWrite,decOut_final, writeData[27], outR[27]),
								d28(clk, reset, regWrite,decOut_final, writeData[28], outR[28]),
								d29(clk, reset, regWrite,decOut_final, writeData[29], outR[29]),
								d30(clk, reset, regWrite,decOut_final, writeData[30], outR[30]),
								d31(clk, reset, regWrite,decOut_final, writeData[31], outR[31]);
			 

endmodule

module registerSet( input clk, input reset, input regWrite, input [31:0] decOut, input [31:0] decOutfinal,
						  input [31:0] writeData_a,input [31:0] writeData_b,output [31:0] outR0,outR1,outR2,outR3,
						  outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,
						  outR14,outR15,outR16,outR17,outR18,outR19,outR20,outR21,outR22,
						  outR23,outR24,outR25,outR26,outR27,outR28,outR29,outR30,outR31); 
		
		registerFileRegister32bits r1 (clk, reset, regWrite, decOut[0] , 	decOutfinal[0],	writeData_a , writeData_b, outR0),
											r2 (clk, reset, regWrite, decOut[1] , 	decOutfinal[1], writeData_a , writeData_b ,outR1 ),
											r3 (clk, reset, regWrite, decOut[2] , 	decOutfinal[2], writeData_a , writeData_b ,outR2 ),
											r4 (clk, reset, regWrite, decOut[3] , 	decOutfinal[3], writeData_a , writeData_b ,outR3 ),
											r5 (clk, reset, regWrite, decOut[4] , 	decOutfinal[4], writeData_a , writeData_b ,outR4 ),
											r6 (clk, reset, regWrite, decOut[5] , 	decOutfinal[5], writeData_a , writeData_b ,outR5 ),
											r7 (clk, reset, regWrite, decOut[6] , 	decOutfinal[6], writeData_a , writeData_b ,outR6 ),
											r8 (clk, reset, regWrite, decOut[7] , 	decOutfinal[7], writeData_a , writeData_b ,outR7 ),
											r9 (clk, reset, regWrite, decOut[8] , 	decOutfinal[8], writeData_a , writeData_b ,outR8 ),
											r10 (clk, reset, regWrite, decOut[9], 	decOutfinal[9], writeData_a , writeData_b ,outR9 ),
											r11 (clk, reset, regWrite, decOut[10],	decOutfinal[10], writeData_a , writeData_b,outR10 ),
											r12 (clk, reset, regWrite, decOut[11],	decOutfinal[11], writeData_a , writeData_b,outR11 ),
											r13 (clk, reset, regWrite, decOut[12], decOutfinal[12],writeData_a , writeData_b,outR12 ),
											r14 (clk, reset, regWrite, decOut[13], decOutfinal[13],writeData_a , writeData_b,outR13 ),
											r15 (clk, reset, regWrite, decOut[14], decOutfinal[14],writeData_a , writeData_b,outR14 ),
											r16 (clk, reset, regWrite, decOut[15], decOutfinal[15],writeData_a , writeData_b,outR15 ),
											r17 (clk, reset, regWrite, decOut[16], decOutfinal[16],writeData_a , writeData_b,outR16 ),
											r18 (clk, reset, regWrite, decOut[17], decOutfinal[17],writeData_a , writeData_b,outR17 ),
											r19 (clk, reset, regWrite, decOut[18], decOutfinal[18],writeData_a , writeData_b,outR18 ),
											r20 (clk, reset, regWrite, decOut[19], decOutfinal[19],writeData_a , writeData_b,outR19 ),
											r21 (clk, reset, regWrite, decOut[20], decOutfinal[20],writeData_a , writeData_b,outR20 ),
											r22 (clk, reset, regWrite, decOut[21], decOutfinal[21],writeData_a , writeData_b,outR21 ),
											r23 (clk, reset, regWrite, decOut[22], decOutfinal[22],writeData_a , writeData_b,outR22 ),
											r24 (clk, reset, regWrite, decOut[23], decOutfinal[23],writeData_a , writeData_b,outR23 ),
											r25 (clk, reset, regWrite, decOut[24], decOutfinal[24],writeData_a , writeData_b,outR24 ),
											r26 (clk, reset, regWrite, decOut[25], decOutfinal[25],writeData_a , writeData_b,outR25 ),
											r27 (clk, reset, regWrite, decOut[26], decOutfinal[26],writeData_a , writeData_b,outR26 ),
											r28 (clk, reset, regWrite, decOut[27], decOutfinal[27],writeData_a , writeData_b,outR27 ),
											r29 (clk, reset, regWrite, decOut[28], decOutfinal[28],writeData_a , writeData_b,outR28 ),
											r30 (clk, reset, regWrite, decOut[29], decOutfinal[29],writeData_a , writeData_b,outR29 ),
											r31 (clk, reset, regWrite, decOut[30],	decOutfinal[30],writeData_a , writeData_b,outR30 ),
											r32 (clk, reset, regWrite, decOut[31], decOutfinal[31],writeData_a , writeData_b,outR31 );
							 
endmodule


module registerFile( input clk, input reset, input regWrite, input [4:0] rs1_a, input [4:0] rs2_a, input [4:0] rs1_b, input [4:0] rs2_b,
							input [4:0] rd_a, input [4:0] rd_b, input [31:0] writeData_a, input [31:0] writeData_b, output [31:0] out_rs1_a,
							output [31:0] out_rs2_a,output [31:0] out_rs1_b,output [31:0] out_rs2_b);
	
	wire [31:0] decOut_a;
	wire [31:0] decOut_b;
	wire [31:0] decOut_final;
	wire [31:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,
					outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15, 
					outR16,outR17,outR18,outR19,outR20,outR21,outR22,outR23,
					outR24,outR25,outR26,outR27,outR28,outR29,outR30,outR31;
	
	decoder5to32 decoder_a(rd_a, decOut_a);
	decoder5to32 decoder_b(rd_b, decOut_b);
	
	assign decOut_final = decOut_a | decOut_b;

	registerSet rSet(clk, reset, regWrite, decOut_b, decOut_final, writeData_a,writeData_b,outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,
						  outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15,outR16,outR17,outR18,outR19,outR20,
						  outR21,outR22,outR23,outR24,outR25,outR26,outR27,outR28,outR29,outR30,outR31);
						  
	mux32to1_32bits mux_rs1_a(rs1_a,outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15,outR16,outR17,outR18,outR19,outR20,outR21,outR22,outR23,outR24,outR25,outR26,outR27,outR28,outR29,outR30,outR31,out_rs1_a),
						 mux_rs2_a(rs2_a,outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15,outR16,outR17,outR18,outR19,outR20,outR21,outR22,outR23,outR24,outR25,outR26,outR27,outR28,outR29,outR30,outR31,out_rs2_a),
						 mux_rs1_b(rs1_b,outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15,outR16,outR17,outR18,outR19,outR20,outR21,outR22,outR23,outR24,outR25,outR26,outR27,outR28,outR29,outR30,outR31,out_rs1_b),
						 mux_rs2_b(rs2_b,outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15,outR16,outR17,outR18,outR19,outR20,outR21,outR22,outR23,outR24,outR25,outR26,outR27,outR28,outR29,outR30,outR31,out_rs2_b);
	
endmodule

/*
=====================================
Instruction Memory Design
=====================================
*/
module VLIW_IM(input clk, input reset, input [47:0] d, output [47:0] q);
	D_ff_IM 	im_dff0(clk, reset, d[0], q[0]),
				im_dff1(clk, reset, d[1], q[1]),
				im_dff2(clk, reset, d[2], q[2]),
				im_dff3(clk, reset, d[3], q[3]),
				im_dff4(clk, reset, d[4], q[4]),
				im_dff5(clk, reset, d[5], q[5]),
				im_dff6(clk, reset, d[6], q[6]),
				im_dff7(clk, reset, d[7], q[7]),
				im_dff8(clk, reset, d[8], q[8]),
				im_dff9(clk, reset, d[9], q[9]),
				im_dff10(clk, reset, d[10], q[10]),
				im_dff11(clk, reset, d[11], q[11]),
				im_dff12(clk, reset, d[12], q[12]),
				im_dff13(clk, reset, d[13], q[13]),
				im_dff14(clk, reset, d[14], q[14]),
				im_dff15(clk, reset, d[15], q[15]),
				im_dff16(clk, reset, d[16], q[16]),
				im_dff17(clk, reset, d[17], q[17]),
				im_dff18(clk, reset, d[18], q[18]),
				im_dff19(clk, reset, d[19], q[19]),
				im_dff20(clk, reset, d[20], q[20]),
				im_dff21(clk, reset, d[21], q[21]),
				im_dff22(clk, reset, d[22], q[22]),
				im_dff23(clk, reset, d[23], q[23]),
				im_dff24(clk, reset, d[24], q[24]),
				im_dff25(clk, reset, d[25], q[25]),
				im_dff26(clk, reset, d[26], q[26]),
				im_dff27(clk, reset, d[27], q[27]),
				im_dff28(clk, reset, d[28], q[28]),
				im_dff29(clk, reset, d[29], q[29]),
				im_dff30(clk, reset, d[30], q[30]),
				im_dff31(clk, reset, d[31], q[31]),
				im_dff32(clk, reset, d[32], q[32]),
				im_dff33(clk, reset, d[33], q[33]),
				im_dff34(clk, reset, d[34], q[34]),
				im_dff35(clk, reset, d[35], q[35]),
				im_dff36(clk, reset, d[36], q[36]),
				im_dff37(clk, reset, d[37], q[37]),
				im_dff38(clk, reset, d[38], q[38]),
				im_dff39(clk, reset, d[39], q[39]),
				im_dff40(clk, reset, d[40], q[40]),
				im_dff41(clk, reset, d[41], q[41]),
				im_dff42(clk, reset, d[42], q[42]),
				im_dff43(clk, reset, d[43], q[43]),
				im_dff44(clk, reset, d[44], q[44]),
				im_dff45(clk, reset, d[45], q[45]),
				im_dff46(clk, reset, d[46], q[46]),
				im_dff47(clk, reset, d[47], q[47]);
				
endmodule

module IM(input clk, input reset, input [3:0] pc_4bits, output [47:0] IR);
	
	wire [47:0] Qout0, Qout1, Qout2, Qout3, Qout4, Qout5, Qout6, Qout7,
					Qout8, Qout9, Qout10, Qout11, Qout12, Qout13, Qout14, Qout15;

	VLIW_IM rIM0 (clk, reset, 48'h0000000040C5, Qout0); //  nop|| c.li $1,17  
	VLIW_IM rIM1 (clk, reset, 48'h000000004109, Qout1); //  nop|| c.li $2,2 
	VLIW_IM rIM2 (clk, reset, 48'h000000004211, Qout2); //  nop|| c.li $4,4 
	VLIW_IM rIM3 (clk, reset, 48'h000000004295, Qout3); //  nop|| c.li $5,5 
	VLIW_IM rIM4 (clk, reset, 48'h00000000dce8, Qout4); // nop || c.sw $2, $1 , 0
	VLIW_IM rIM5 (clk, reset, 48'h000000000000, Qout5); 
	VLIW_IM rIM6 (clk, reset, 48'h000000000000, Qout6); 
	VLIW_IM rIM7 (clk, reset, 48'h000000000000, Qout7); 
	VLIW_IM rIM8 (clk, reset, 48'h000000000000, Qout8);
	VLIW_IM rIM9 (clk, reset, 48'h000000000000, Qout9); 
	VLIW_IM rIM10 (clk, reset, 48'h000000000000, Qout10); 	
	VLIW_IM rIM11 (clk, reset, 48'h000000000000, Qout11); 
	VLIW_IM rIM12 (clk, reset, 48'h000000000000, Qout12); 
	VLIW_IM rIM13 (clk, reset, 48'h000000000000, Qout13);
	VLIW_IM rIM14 (clk, reset, 48'h000000000000, Qout14); 	
	VLIW_IM rIM15 (clk, reset, 48'h000000000000, Qout15);
	
	mux16to1_48bits mIM (Qout0,Qout1,Qout2,Qout3,Qout4,Qout5,Qout6,Qout7,Qout8,Qout9,Qout10,Qout11,Qout12,Qout13,Qout14,Qout15,pc_4bits,IR);
endmodule


/*
=====================================
Utility blocks
======================================
*/
module adder16(input [15:0] in1, input [15:0] in2, output reg [15:0] adder_out);
	always@(in1 , in2)
		adder_out = in1 +in2;
endmodule

module adder32(input [31:0] in1, input [31:0] in2, output reg [31:0] adder_out);
	always@(in1 , in2)
		adder_out = in1 +in2;
endmodule

module signExt5to32( input [4:0] offset, output reg [31:0] signExtOffset);
	always@(offset)
	begin
			signExtOffset={{27{offset[4]}},offset[4:0]};
	end
endmodule

module signExt6to32( input [5:0] offset, output reg [31:0] signExtOffset);
	always@(offset)
	begin
			signExtOffset={{26{offset[5]}},offset[5:0]};
	end
endmodule

module signExt13to32( input [12:0] offset, output reg [31:0] signExtOffset);
	always@(offset)
	begin
			signExtOffset={{19{offset[12]}},offset[12:0]};
	end
endmodule

module signExt12to32( input [11:0] offset, output reg [31:0] signExtOffset);
	always@(offset)
	begin
			signExtOffset={{20{offset[11]}},offset[11:0]};
	end
endmodule

module comparator_20bits( input [19:0] in1, input [19:0] in2, output reg result);
	always@(in1 or in2) begin
		result = (in1 == in2) ? 1'b1 : 1'b0;
	end
endmodule

module comparator_24bits( input [23:0] in1, input [23:0] in2, output reg result);
	always@(in1 or in2) begin
		result = (in1 == in2) ? 1'b1 : 1'b0;
	end
endmodule

module comparator_4bits( input [3:0] in1, input [3:0] in2, output reg result);
	always@(in1 or in2) begin
		result = (in1 == in2) ? 1'b1 : 1'b0;
	end
endmodule

module comparator_2bits( input [1:0] in1, input [1:0] in2, output reg result);
	always@(in1 or in2) begin
		result = (in1 == in2) ? 1'b1 : 1'b0;
	end
endmodule
/*
=====================================
ALU Design
======================================
*/
module ALU(input signed [31:0] aluIn1, input signed [31:0] aluIn2, input [1:0] aluOp, output reg [31:0] aluOut, output reg zeroFlag);
	always@(aluIn1 or aluIn2 or aluOp)
	begin
		case(aluOp)
			2'd0: aluOut = aluIn1 << aluIn2;
			2'd1:	aluOut = aluIn1 + aluIn2;
			2'd2: aluOut = aluIn1 ^ aluIn2;
			2'd3: aluOut = aluIn1 & aluIn2;
		endcase
		
		if( aluOut ) 
			zeroFlag = 1'b1;
		else 
			zeroFlag = 1'b0;
	end
endmodule

/*
===========================================
Control for the 32 bit instruction in VLIW
===========================================
*/
module ctrlCkt_a(input [6:0] opcode, input [2:0] funct3,
					  output reg [1:0] aluOp, output reg [1:0] aluSrcB,
					  output reg branch,output reg memRd,output reg memWr,
					  output reg regWr, output reg [1:0] destReg, output reg jump);
	
	always @ (opcode, funct3)
		begin
			aluOp = 2'b00; aluSrcB = 2'b00; branch = 1'b0;
			if(opcode[1:0] == 2'b11)
				begin
					case(opcode[6:2])
						5'b00100:
							case(funct3)
								3'b001:
									begin
									// slli
										aluSrcB = 2'b01;
										aluOp = 2'b00;
										memRd=1'b0;
										memWr=1'b0;
										regWr=1'b1;
										destReg = 2'b00;
										branch = 1'b0;
										jump = 1'b0;
									end
								3'b100:
									begin
									// xori
										aluSrcB = 2'b10;
										aluOp = 2'b10;
										memRd=1'b0;
										memWr=1'b0;
										regWr=1'b1;
										destReg = 2'b00;
										branch = 1'b0;
										jump = 1'b0;
									end
							endcase	
						5'b01100:
							begin
							// add
								aluSrcB = 2'b00;
								aluOp = 2'b01;
								memRd=1'b0;
								memWr=1'b0;
								regWr=1'b1;
								destReg = 2'b00;
								branch = 1'b0;
								jump = 1'b0;
							end
						5'b11001:
							begin
							// jalr
								aluSrcB = 2'b00;
								aluOp = 2'b00;
								memRd=1'b0;
								memWr=1'b0;
								regWr=1'b1;
								destReg= 2'b01;
								branch = 1'b0;
								jump = 1'b1;
							end
						5'b00000:
							begin
							// lh
								aluSrcB = 2'b10;
								aluOp = 2'b00;
								memRd=1'b1;
								memWr=1'b0;
								regWr=1'b1;
								destReg=2'b10;
								branch = 1'b0;
								jump = 1'b0;
							end
						5'b11000:
							begin
							// beq
								aluSrcB = 2'b00;
								aluOp = 2'b00;
								memRd=1'b0;
								memWr=1'b0;
								regWr=1'b0;
								destReg=2'b11;
								branch = 1'b1;
								jump = 1'b0;
							end
						default:	
							begin
								aluSrcB = 2'b00;
								aluOp = 2'b00;
								memRd=1'b0;
								memWr=1'b0;
								regWr=1'b0;
								destReg=2'b00;
								branch = 1'b0;
								jump = 1'b0;
							end	
					endcase
				end
		end				
endmodule


/*
===========================================
Control for the 16 bit instruction in VLIW
===========================================
*/
module ctrlCkt_b(input [2:0] funct3_msb, input [1:0] op, input [1:0] funct2,
					  input [2:0] funct3_lsb, output reg [1:0] aluOp, 
					  output reg aluSrcB,output reg memRd,output reg rd_bSelect,
					  output reg memWr,output reg regWr, output reg destReg);	
						
	always @ (op, {funct3_msb,funct3_lsb}, funct2)
			begin
				aluOp = 2'b00; aluSrcB = 1'b0;
				case(op)
					2'b01:
						begin
						if( funct3_msb == 3'b010 ) 
							begin
								// c.li
								aluSrcB = 1'b0;
								aluOp = 2'b00;
								memRd=1'b0;
								memWr=1'b0;
								regWr=1'b1;
								destReg=1'b1;
								rd_bSelect=1'b0; 
							end
						else if( {funct3_msb,funct3_lsb} == 6'b100011 && funct2 == 2'b11 )
							begin
								// c.and
								aluSrcB = 1'b0;
								aluOp = 2'b11;
								memRd=1'b0;
								memWr=1'b0;
								regWr=1'b1;
								destReg=1'b0;
								rd_bSelect=1'b1; 
							end
						end
					2'b00: 
						begin
						if( funct3_msb == 3'b110 )
							begin
								 // c.sw
								aluSrcB = 1'b1;
								aluOp = 2'b01;
								memRd=1'b0;
								memWr=1'b1;
								regWr=1'b0;
								destReg=1'b0;
								rd_bSelect=1'b1;
							end
						end
					default:	
						begin
							aluSrcB = 1'b0;
							aluOp = 2'b00;
							memRd=1'b0;
							memWr=1'b0;
							regWr=1'b0;
							destReg=1'b0;
							rd_bSelect=1'b0;
						end
				endcase
			end	
						
endmodule	


/*
=====================================
Tag Register of 20 bits
regWrite: Is fixed for all the bits
======================================
*/
module TagRegister20_bit(input clk, input reset, input regWrite, input decOut, input [19:0] d, output [19:0] q);
	D_ff_reg d0 (clk,	reset,	regWrite,decOut,	d[0],	q[0]);
	D_ff_reg d1 (clk,	reset,	regWrite,decOut,	d[1],	q[1]);
	D_ff_reg d2 (clk,	reset,	regWrite,decOut,	d[2],	q[2]);
	D_ff_reg d3 (clk,	reset,	regWrite,decOut,	d[3],	q[3]);
	D_ff_reg d4 (clk,	reset,	regWrite,decOut,	d[4],	q[4]);
	D_ff_reg d5 (clk,	reset,	regWrite,decOut,	d[5],	q[5]);
	D_ff_reg d6 (clk,	reset,	regWrite,decOut,	d[6],	q[6]);
	D_ff_reg d7 (clk,	reset,	regWrite,decOut,	d[7],	q[7]);
	D_ff_reg d8 (clk,	reset,	regWrite,decOut,	d[8],	q[8]);
	D_ff_reg d9 (clk,	reset,	regWrite,decOut,	d[9],	q[9]);
	D_ff_reg d10(clk,	reset,	regWrite,decOut,	d[10],	q[10]);
	D_ff_reg d11(clk,	reset,	regWrite,decOut,	d[11],	q[11]);
	D_ff_reg d12(clk,	reset,	regWrite,decOut,	d[12],	q[12]);
	D_ff_reg d13(clk,	reset,	regWrite,decOut,	d[13],	q[13]);
	D_ff_reg d14(clk,	reset,	regWrite,decOut,	d[14],	q[14]);
	D_ff_reg d15(clk,	reset,	regWrite,decOut,	d[15],	q[15]);
	D_ff_reg d16(clk,	reset,	regWrite,decOut,	d[16],	q[16]);
	D_ff_reg d17(clk,	reset,	regWrite,decOut,	d[17],	q[17]);
	D_ff_reg d18(clk,	reset,	regWrite,decOut,  d[18],	q[18]);
	D_ff_reg d19(clk,	reset,	regWrite,decOut,  d[19],	q[19]);
		
endmodule

	
/*
=====================================
Halt Tag Register of 4 bits
regWrite: Is fixed for all the bits
======================================
*/
module HaltTagRegister4_bit(input clk, input reset, input regWrite,input decOut, input [3:0] d, output [3:0] q);
	D_ff_reg d0 (clk,	reset,	regWrite, decOut,	d[0],	q[0]); 
	D_ff_reg d1 (clk,	reset,	regWrite, decOut,	d[1],	q[1]);
	D_ff_reg d2 (clk,	reset,	regWrite, decOut,	d[2],	q[2]);
	D_ff_reg d3 (clk,	reset,	regWrite, decOut, d[3],	q[3]);
endmodule


/*
=====================================
Byte Register of 8 bits
regWrite: Is fixed for all the bits
======================================
*/
module Byte(input clk, input reset, input regWrite, input decOut,input [7:0] d, output [7:0] q);
	D_ff_reg v0 (clk,	reset,	regWrite,decOut,	d[0],	q[0]);
	D_ff_reg v1 (clk,	reset,	regWrite,decOut,	d[1],	q[1]);
	D_ff_reg v2 (clk,	reset,	regWrite,decOut,	d[2],	q[2]);
	D_ff_reg v3 (clk,	reset,	regWrite,decOut,	d[3],	q[3]);
	D_ff_reg v4 (clk,	reset,	regWrite,decOut,	d[4],	q[4]);
	D_ff_reg v5 (clk,	reset,	regWrite,decOut,	d[5],	q[5]);
	D_ff_reg v6 (clk,	reset,	regWrite,decOut,	d[6],	q[6]);
	D_ff_reg v7 (clk,	reset,	regWrite,decOut,	d[7],	q[7]);
endmodule

module Byte_Status(input clk, input reset, input regWrite, input [7:0] decOut, input [7:0] d, output [7:0] q);
	D_ff_reg v0 (clk,	reset,	regWrite,decOut[0],	d[0],	q[0]);
	D_ff_reg v1 (clk,	reset,	regWrite,decOut[1],	d[1],	q[1]);
	D_ff_reg v2 (clk,	reset,	regWrite,decOut[2],	d[2],	q[2]);
	D_ff_reg v3 (clk,	reset,	regWrite,decOut[3],	d[3],	q[3]);
	D_ff_reg v4 (clk,	reset,	regWrite,decOut[4],	d[4],	q[4]);
	D_ff_reg v5 (clk,	reset,	regWrite,decOut[5],	d[5],	q[5]);
	D_ff_reg v6 (clk,	reset,	regWrite,decOut[6],	d[6],	q[6]);
	D_ff_reg v7 (clk,	reset,	regWrite,decOut[7],	d[7],	q[7]);
endmodule                              

module statusRegister_2Bytes(input clk, input reset, input regWrite, input [15:0] decOut, input d, output [15:0] q);
	Byte_Status b0(clk, reset, regWrite, decOut[7:0],{8{d}}, q[7:0]),
		  b1(clk, reset, regWrite,decOut[15:8], {8{d}}, q[15:8]);
endmodule

/*
=====================================
16 Bytes Data Register Block
regWrite: Is fixed for all the bits
======================================
*/
module Data_16Byte(input clk, input reset, input regWrite, input decOut, input [127:0] d, input [15:0] inputData16bits, input [2:0] offset,input writeWord ,output [127:0] q);
	
	wire [7:0] decOutWriteWord;
	wire [7:0] decMuxOut;
	wire [127:0] dataMuxOut;
	
	decoder3to8 offsetOut( offset, decOutWriteWord);
	mux2to1_8bits decOutMux( {8{decOut}},decOutWriteWord,writeWord,decMuxOut );
	mux2to1_128bits dataMux( d , {8{inputData16bits}} , writeWord , dataMuxOut);
	
	Byte b0 ( clk, reset, regWrite, decMuxOut[0],	dataMuxOut[7:0]	 ,q[7:0] );
	Byte b1 ( clk, reset, regWrite, decMuxOut[0],	dataMuxOut[15:8]	 ,q[15:8]);
	Byte b2 ( clk, reset, regWrite, decMuxOut[1],	dataMuxOut[23:16]	 ,q[23:16]);
	Byte b3 ( clk, reset, regWrite, decMuxOut[1],	dataMuxOut[31:24]	 ,q[31:24]);
	Byte b4 ( clk, reset, regWrite, decMuxOut[2],	dataMuxOut[39:32]	 ,q[39:32]);
	Byte b5 ( clk, reset, regWrite, decMuxOut[2],	dataMuxOut[47:40]	 ,q[47:40]);
	Byte b6 ( clk, reset, regWrite, decMuxOut[3],	dataMuxOut[55:48]	 ,q[55:48]);
	Byte b7 ( clk, reset, regWrite, decMuxOut[3],	dataMuxOut[63:56]	 ,q[63:56]);
	Byte b8 ( clk, reset, regWrite, decMuxOut[4],	dataMuxOut[71:64]  ,q[71:64]);
	Byte b9 ( clk, reset, regWrite, decMuxOut[4],	dataMuxOut[79:72]  ,q[79:72]);
	Byte b10( clk, reset, regWrite, decMuxOut[5],	dataMuxOut[87:80]  ,q[87:80]);
	Byte b11( clk, reset, regWrite, decMuxOut[5],	dataMuxOut[95:88]  ,q[95:88]);
	Byte b12( clk, reset, regWrite, decMuxOut[6],	dataMuxOut[103:96] ,q[103:96]);
	Byte b13( clk, reset, regWrite, decMuxOut[6],	dataMuxOut[111:104],q[111:104]);
	Byte b14( clk, reset, regWrite, decMuxOut[7],	dataMuxOut[119:112],q[119:112]);
	Byte b15( clk, reset, regWrite, decMuxOut[7],	dataMuxOut[127:120],q[127:120]);
endmodule

/*
=====================================
16x16B Data Register Block
One such block per set
regWrite: Varies for each line/row
======================================
*/
module DataRegisterSet(input clk, input reset, input regWrite, input [15:0]decOut,input [127:0] inputData, input [15:0] inputData16bits, input [2:0] offset,input writeWord,
							output [127:0] data0 , output [127:0] data1, output [127:0] data2, output [127:0] data3,
							output [127:0] data4 , output [127:0] data5, output [127:0] data6, output [127:0] data7,
							output [127:0] data8 , output [127:0] data9, output [127:0] data10,output [127:0] data11,
							output [127:0] data12, output [127:0] data13,output [127:0] data14,output [127:0] data15);
		
	
	Data_16Byte d0( clk,  reset,  regWrite ,	decOut[0], inputData , inputData16bits, offset,writeWord,data0);
	Data_16Byte d1( clk,  reset,  regWrite ,	decOut[1], inputData , inputData16bits, offset,writeWord,data1);
	Data_16Byte d2( clk,  reset,  regWrite ,	decOut[2], inputData , inputData16bits, offset,writeWord,data2);
	Data_16Byte d3( clk,  reset,  regWrite ,	decOut[3], inputData , inputData16bits, offset,writeWord,data3);
	Data_16Byte d4( clk,  reset,  regWrite ,	decOut[4], inputData , inputData16bits, offset,writeWord,data4);
	Data_16Byte d5( clk,  reset,  regWrite ,	decOut[5], inputData , inputData16bits, offset,writeWord,data5);
	Data_16Byte d6( clk,  reset,  regWrite ,	decOut[6], inputData , inputData16bits, offset,writeWord,data6);
	Data_16Byte d7( clk,  reset,  regWrite ,	decOut[7], inputData , inputData16bits, offset,writeWord,data7);
	Data_16Byte d8( clk,  reset,  regWrite ,	decOut[8], inputData , inputData16bits, offset,writeWord,data8);
	Data_16Byte d9( clk,  reset,  regWrite ,	decOut[9], inputData , inputData16bits, offset,writeWord,data9);
	Data_16Byte d10( clk,  reset,  regWrite ,decOut[10], inputData , inputData16bits, offset,writeWord,data10);
	Data_16Byte d11( clk,  reset,  regWrite ,decOut[11], inputData , inputData16bits, offset,writeWord,data11);
	Data_16Byte d12( clk,  reset,  regWrite ,decOut[12], inputData , inputData16bits, offset,writeWord,data12);
	Data_16Byte d13( clk,  reset,  regWrite ,decOut[13], inputData , inputData16bits, offset,writeWord,data13);
	Data_16Byte d14( clk,  reset,  regWrite ,decOut[14], inputData , inputData16bits, offset,writeWord,data14);
	Data_16Byte d15( clk,  reset,  regWrite ,decOut[15], inputData , inputData16bits, offset,writeWord,data15);
	
endmodule


/*
=====================================
16x19bits Tag Register Block
One such block per set
regWrite: Varies for each line/row
======================================
*/
module TagRegisterSet(input clk, input reset, input regWrite, input [15:0] decOut,input [19:0] inputTag, 
							output [19:0] tag0, output [19:0] tag1, output [19:0] tag2, output [19:0] tag3,
							output [19:0] tag4, output [19:0] tag5, output [19:0] tag6, output [19:0] tag7,
							output [19:0] tag8, output [19:0] tag9, output [19:0] tag10, output [19:0] tag11,
							output [19:0] tag12, output [19:0] tag13, output [19:0] tag14, output [19:0] tag15);
	
	TagRegister20_bit t0( clk,  reset, regWrite, decOut[0], inputTag, tag0);
	TagRegister20_bit t1( clk,  reset, regWrite, decOut[1], inputTag, tag1);
	TagRegister20_bit t2( clk,  reset, regWrite, decOut[2], inputTag, tag2);
	TagRegister20_bit t3( clk,  reset, regWrite, decOut[3], inputTag, tag3);
	TagRegister20_bit t4( clk,  reset, regWrite, decOut[4], inputTag, tag4);
	TagRegister20_bit t5( clk,  reset, regWrite, decOut[5], inputTag, tag5);
	TagRegister20_bit t6( clk,  reset, regWrite, decOut[6], inputTag, tag6);
	TagRegister20_bit t7( clk,  reset, regWrite, decOut[7], inputTag, tag7);
	TagRegister20_bit t8( clk,  reset, regWrite, decOut[8], inputTag, tag8);
	TagRegister20_bit t9( clk,  reset, regWrite, decOut[9], inputTag, tag9);
	TagRegister20_bit t10(clk,  reset, regWrite,decOut[10], inputTag, tag10);
	TagRegister20_bit t11(clk,  reset, regWrite,decOut[11], inputTag, tag11);
	TagRegister20_bit t12(clk,  reset, regWrite,decOut[12], inputTag, tag12);
	TagRegister20_bit t13(clk,  reset, regWrite,decOut[13], inputTag, tag13);
	TagRegister20_bit t14(clk,  reset, regWrite,decOut[14], inputTag, tag14);
	TagRegister20_bit t15(clk,  reset, regWrite,decOut[15], inputTag, tag15);
	
endmodule

module HaltTagRegisterSet(input clk,input reset, input regWrite,input [15:0] decOut, input [3:0] inputHaltTag, 
							output [3:0] htag0, output [3:0] htag1, output [3:0] htag2, output [3:0] htag3,
							output [3:0] htag4, output [3:0] htag5, output [3:0] htag6, output [3:0] htag7,
							output [3:0] htag8, output [3:0] htag9, output [3:0] htag10, output [3:0] htag11,
							output [3:0] htag12, output [3:0] htag13, output [3:0] htag14, output [3:0] htag15);
							
	HaltTagRegister4_bit h0 (clk, reset, regWrite, decOut[0], inputHaltTag, htag0);
	HaltTagRegister4_bit h1 (clk, reset, regWrite, decOut[1], inputHaltTag, htag1);
	HaltTagRegister4_bit h2 (clk, reset, regWrite, decOut[2], inputHaltTag, htag2);
	HaltTagRegister4_bit h3 (clk, reset, regWrite, decOut[3], inputHaltTag, htag3);
	HaltTagRegister4_bit h4 (clk, reset, regWrite, decOut[4], inputHaltTag, htag4);
	HaltTagRegister4_bit h5 (clk, reset, regWrite, decOut[5], inputHaltTag, htag5);
	HaltTagRegister4_bit h6 (clk, reset, regWrite, decOut[6], inputHaltTag, htag6);
	HaltTagRegister4_bit h7 (clk, reset, regWrite, decOut[7], inputHaltTag, htag7);
	HaltTagRegister4_bit h8 (clk, reset, regWrite, decOut[8], inputHaltTag, htag8);
	HaltTagRegister4_bit h9 (clk, reset, regWrite, decOut[9], inputHaltTag, htag9);
	HaltTagRegister4_bit h10(clk, reset, regWrite,decOut[10], inputHaltTag, htag10);
	HaltTagRegister4_bit h11(clk, reset, regWrite,decOut[11], inputHaltTag, htag11);
	HaltTagRegister4_bit h12(clk, reset, regWrite,decOut[12], inputHaltTag, htag12);
	HaltTagRegister4_bit h13(clk, reset, regWrite,decOut[13], inputHaltTag, htag13);
	HaltTagRegister4_bit h14(clk, reset, regWrite,decOut[14], inputHaltTag, htag14);
	HaltTagRegister4_bit h15(clk, reset, regWrite,decOut[15], inputHaltTag, htag15);

endmodule

module cacheDataOffsetMux(input [2:0] offset, input [127:0] outData, output reg [15:0] outDataMux);
	always@(offset,outData) 
		begin
			case(offset) 
				3'b000: outDataMux = outData[15:0];
				3'b001: outDataMux = outData[31:16];
				3'b010: outDataMux = outData[47:32];
				3'b011: outDataMux = outData[63:48];
				3'b100: outDataMux = outData[79:64];
				3'b101: outDataMux = outData[95:80];
				3'b110: outDataMux = outData[111:96];
				3'b111: outDataMux = outData[127:112];
			endcase
		end
endmodule

module FIFOCounter(input clk,input clear,input counter_write,input [1:0] d,input load,output [1:0] qd);

	reg     [1:0] cnt;
	assign qd = cnt;

	always @ (negedge clk)
	begin
		 if (clear)
			  cnt <= 2'b00;
		 else if (load)
			  cnt <= d;
		 else if ( counter_write == 1'b1)
			  if(cnt == 2'b00) cnt <= 2'b11;
			  else cnt <= cnt-1;
	end 

endmodule

module FIFOCounterSet(input clk, input reset,input load, input [1:0] countIn,input counter_write, input [15:0] decOut, output [1:0] outCount0,  output [1:0] outCount1, 
							 output [1:0] outCount2 ,output [1:0] outCount3, output [1:0] outCount4,  output [1:0] outCount5,
							 output [1:0] outCount6,  output[1:0] outCount7, output[1:0] outCount8, output [1:0] outCount9,
							 output [1:0] outCount10,  output [1:0] outCount11, output [1:0] outCount12, output [1:0] outCount13, 
							 output [1:0] outCount14,  output [1:0] outCount15);
							 
	FIFOCounter f0(clk, reset,decOut[0] & counter_write,countIn,load,outCount0);	
	FIFOCounter f1(clk, reset,decOut[1] & counter_write,countIn,load,outCount1);	
	FIFOCounter f2(clk, reset,decOut[2] & counter_write,countIn,load,outCount2);	
	FIFOCounter f3(clk, reset,decOut[3] & counter_write,countIn,load,outCount3);	
	FIFOCounter f4(clk, reset,decOut[4] & counter_write,countIn,load,outCount4);	
	FIFOCounter f5(clk, reset,decOut[5] & counter_write,countIn,load,outCount5);	
	FIFOCounter f6(clk, reset,decOut[6] & counter_write,countIn,load,outCount6);	
	FIFOCounter f7(clk, reset,decOut[7] & counter_write,countIn,load,outCount7);	
	FIFOCounter f8(clk, reset,decOut[8] & counter_write,countIn,load,outCount8);	
	FIFOCounter f9(clk, reset,decOut[9] & counter_write,countIn,load,outCount9);	
	FIFOCounter f10(clk, reset,decOut[10] & counter_write,countIn,load,outCount10);	
	FIFOCounter f11(clk, reset,decOut[11] & counter_write,countIn,load,outCount11);	
	FIFOCounter f12(clk, reset,decOut[12] & counter_write,countIn,load,outCount12);	
	FIFOCounter f13(clk, reset,decOut[13] & counter_write,countIn,load,outCount13);	
	FIFOCounter f14(clk, reset,decOut[14] & counter_write,countIn,load,outCount14);	
	FIFOCounter f15(clk, reset,decOut[15] & counter_write,countIn,load,outCount15);	

endmodule
/*
=====================================
Cache Set Design
======================================
*/
module HaltTagApparatus(input clk, input reset, input [3:0] haltTagFromAddress, input haltTagWrite, input [3:0] index, input [15:0] indexDecIn, input memRd, output [15:0] lineSelect, output earlyMiss, output [3:0] outHalt);

	wire [3:0] outHalt0,outHalt1,outHalt2,outHalt3,outHalt4,outHalt5,outHalt6,outHalt7,
				  outHalt8,outHalt9,outHalt10,outHalt11,outHalt12,outHalt13,outHalt14,outHalt15;	
	HaltTagRegisterSet HaltArray_1(clk,reset,haltTagWrite,indexDecIn,haltTagFromAddress,outHalt0,outHalt1,outHalt2,outHalt3,outHalt4,outHalt5,outHalt6,outHalt7,
											 outHalt8,outHalt9,outHalt10,outHalt11,outHalt12,outHalt13,outHalt14,outHalt15);
	
	// Wires
	wire [15:0] lineSelectRead;
	wire [15:0] lineSelectWrite;
	wire [15:0] cmp;
	
	// Halt Tag Compare
	comparator_4bits c0 (outHalt0 ,haltTagFromAddress,cmp[0] );
	comparator_4bits c1 (outHalt1 ,haltTagFromAddress,cmp[1] );
	comparator_4bits c2 (outHalt2 ,haltTagFromAddress,cmp[2] );
	comparator_4bits c3 (outHalt3 ,haltTagFromAddress,cmp[3] );
	comparator_4bits c4 (outHalt4 ,haltTagFromAddress,cmp[4] );
	comparator_4bits c5 (outHalt5 ,haltTagFromAddress,cmp[5] );
	comparator_4bits c6 (outHalt6 ,haltTagFromAddress,cmp[6] );
	comparator_4bits c7 (outHalt7 ,haltTagFromAddress,cmp[7] );
	comparator_4bits c8 (outHalt8 ,haltTagFromAddress,cmp[8] );
	comparator_4bits c9 (outHalt9 ,haltTagFromAddress,cmp[9]);
	comparator_4bits c10(outHalt10,haltTagFromAddress,cmp[10]);
	comparator_4bits c11(outHalt11,haltTagFromAddress,cmp[11]);
	comparator_4bits c12(outHalt12,haltTagFromAddress,cmp[12]);
	comparator_4bits c13(outHalt13,haltTagFromAddress,cmp[13]);
	comparator_4bits c14(outHalt14,haltTagFromAddress,cmp[14]);
	comparator_4bits c15(outHalt15,haltTagFromAddress,cmp[15]);
	
	mux16to1_4bits outHaltMux(outHalt0,outHalt1,outHalt2,outHalt3,outHalt4,outHalt5,outHalt6,outHalt7,
									  outHalt8,outHalt9,outHalt10,outHalt11,outHalt12,outHalt13,outHalt14,outHalt15,index,outHalt);
	
	assign earlyMiss = ~(|cmp);

	// Compute line select signals
	assign lineSelectRead = indexDecIn & cmp ;
	assign lineSelectWrite = indexDecIn;
	mux2to1_16bits selectMux(lineSelectWrite,lineSelectRead, memRd, lineSelect);	
	

endmodule

module CacheSet(input clk, input reset,input load,input [1:0] countIn, input [1:0] wayID,  input [23:0] inputTag, input [15:0] lineSelect, input [2:0] offset,input [1:0] waySelect, input [127:0] inputData,
						input [15:0] inputData16bits, input writeWord,input inDirty,input inValid,input wayWrite,input dirtyWrite,input tagWrite,input validWrite,input counter_write, input memRd, output [19:0] outTag, output [15:0] outData16bits,
						output outValid, output outDirty, output [1:0] outCounter);

	wire [19:0] tag0,tag1,tag2,tag3,tag4,tag5,tag6,tag7,tag8,tag9,tag10,tag11,tag12,tag13,tag14,tag15;
	wire [127:0] data0,data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12,data13,data14,data15;
	wire [3:0] haltTagFromAddress;
	wire [127:0] outData;
	wire [15:0] valid; 
	wire [15:0] dirty;
	wire [1:0] outCount0,outCount1,outCount2,outCount3,outCount4,outCount5,outCount6,outCount7;
	wire [1:0] outCount8,outCount9,outCount10,outCount11,outCount12,outCount13,outCount14,outCount15;			  
	wire [3:0] encOut;
	wire lineSelectInvalid;
	
	assign haltTagFromAddress = inputTag[3:0];
	
	encoder16bit lineSelectEncoder(lineSelect, encOut, lineSelectInvalid);
	
	wire wayCompCheck;
	comparator_2bits wayComp(wayID,waySelect,wayCompCheck);
		
	TagRegisterSet tagSet(clk,reset,tagWrite,lineSelect,inputTag[23:4],tag0,tag1,tag2,tag3,tag4,tag5,tag6,tag7,tag8,tag9,tag10,tag11,tag12,tag13,tag14,tag15);
	mux16to1_20bits tagMux(tag0,tag1,tag2,tag3,tag4,tag5,tag6,tag7,tag8,tag9,tag10,tag11,tag12,tag13,tag14,tag15,encOut,outTag);

	DataRegisterSet dataSet(clk,reset,wayWrite,lineSelect,inputData,inputData16bits,offset,writeWord,data0,data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12,data13,data14,data15);
	mux16to1_128bits dataMux(data0,data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12,data13,data14,data15,encOut,outData);
	
	// CountIn comes from control
	FIFOCounterSet counterSet( clk, reset, load, countIn, counter_write,lineSelect,outCount0,outCount1,outCount2,outCount3,outCount4,outCount5,outCount6,
										outCount7,outCount8,outCount9,outCount10,outCount11,outCount12,outCount13,outCount14,outCount15);
	mux16to1_2bits counterMux(outCount0,outCount1,outCount2,outCount3,outCount4,outCount5,outCount6,outCount7,outCount8,
									 outCount9,outCount10,outCount11,outCount12,outCount13,outCount14,outCount15,encOut,outCounter);
	
	statusRegister_2Bytes validBits(clk, reset, validWrite, lineSelect,inValid , valid);
	mux16to1_1bit validBitMux(valid[0],valid[1],valid[2],valid[3],valid[4],valid[5],valid[6],valid[7],
									  valid[8],valid[9],valid[10],valid[11],valid[12],valid[13],valid[14],valid[15],
									  encOut,outValid);
	
	statusRegister_2Bytes dirtyBits(clk, reset,dirtyWrite,lineSelect, inDirty , dirty);
	mux16to1_1bit dirtyBitMux(dirty[0],dirty[1],dirty[2],dirty[3],dirty[4],dirty[5],dirty[6],dirty[7],
									  dirty[8],dirty[9],dirty[10],dirty[11],dirty[12],dirty[13],dirty[14],dirty[15],
									  encOut,outDirty);

	
	// Sending 16 bits of data using offset information
	cacheDataOffsetMux offsetDataMux(offset,outData,outData16bits);

		
endmodule

module cacheControl(input memRd, input memWr,input [31:0] address, input hit, input placement, input [1:0] waySelect, output reg [3:0] wayWrite, output reg [3:0] dirtyWrite, 
						  output reg [3:0] counter_write, output reg [3:0] dirtyInput, output reg [3:0] tagWrite, output reg [3:0] validWrite, output reg [3:0] countLoad);

	reg [1:0] prevState = 2'b00;
	
	always@(memRd,memWr,hit,waySelect,placement,address)
		begin
			wayWrite = 4'b0000;dirtyWrite = 4'b0000;counter_write = 4'b0000;
			dirtyInput = 4'b0000;tagWrite = 4'b0000;validWrite = 4'b0000;
			countLoad = 4'b0000;
			case({placement,hit})
				2'b01: 
					begin
						if(memRd == 1'b1)
							begin
								// Cache Hit for read
								wayWrite = 4'd0;dirtyWrite = 4'd0;counter_write = 4'd0;
								dirtyInput = 4'd0;tagWrite = 4'd0;validWrite = 4'd0;
								prevState = 2'b01;
							end
						else if(memWr == 1'b1 & prevState == 2'b10)
							begin
								// Cache Hit for Write. Need to set dirty bits write signals for Write Back
								prevState = 2'b01;
								case(waySelect)
									2'b00: 
										begin
											wayWrite = 4'b0000;dirtyWrite = 4'b0001;counter_write = 4'b0000;
											dirtyInput = 4'b0001;tagWrite = 4'd0;validWrite = 4'd0;
										end
									2'b01:
										begin
											wayWrite = 4'b0000;dirtyWrite = 4'b0010;counter_write = 4'b0000;dirtyInput = 4'b0010;
											tagWrite = 4'd0;validWrite = 4'd0;
										end
									2'b10:
										begin
											wayWrite = 4'b0000;dirtyWrite = 4'b0100;counter_write = 4'b0000;dirtyInput = 4'b0100;
											tagWrite = 4'd0;validWrite = 4'd0;
										end
									2'b11:
										begin
											wayWrite = 4'b0000;dirtyWrite = 4'b1000;counter_write = 4'b0000;dirtyInput = 4'b1000;
											tagWrite = 4'd0;validWrite = 4'd0;
										end
								endcase		
							end
						else if(memWr == 1'b1 && prevState == 2'b01)
							begin 
								// Cache Hit for Write. Need to set dirty bits write signals for Write Back
								prevState = 2'b01;
								case(waySelect)
									2'b00: 
										begin
											wayWrite = 4'b0001;dirtyWrite = 4'b0001;counter_write = 4'b0000;
											dirtyInput = 4'b0001;tagWrite = 4'd0;validWrite = 4'd0;
										end
									2'b01:
										begin
											wayWrite = 4'b0010;dirtyWrite = 4'b0010;counter_write = 4'b0000;dirtyInput = 4'b0010;
											tagWrite = 4'd0;validWrite = 4'd0;
										end
									2'b10:
										begin
											wayWrite = 4'b0100;dirtyWrite = 4'b0100;counter_write = 4'b0000;dirtyInput = 4'b0100;
											tagWrite = 4'd0;validWrite = 4'd0;
										end
									2'b11:
										begin
											wayWrite = 4'b1000;dirtyWrite = 4'b1000;counter_write = 4'b0000;dirtyInput = 4'b1000;
											tagWrite = 4'd0;validWrite = 4'd0;
										end
								endcase		
							end	
						else
							begin
								wayWrite = 4'd0;dirtyWrite = 4'd0;counter_write = 4'd0;dirtyInput = 4'd0;
								tagWrite = 4'd0;validWrite = 4'd0;
								prevState = 2'b01;
							end
					end
				2'b00:
					begin
						prevState = 2'b00;
						if(memRd == 1'b1)
							begin
								// Cache Miss with Read FIFO Replacement POLICY 
								case(waySelect)
									2'b00: 
										begin
											wayWrite = 4'b0001;dirtyWrite = 4'b0001;counter_write = 4'b1111;
											dirtyInput = 4'b0000;tagWrite = 4'b0001;validWrite = 4'b0001;
										end
									2'b01:
										begin
											wayWrite = 4'b0010;dirtyWrite = 4'b0010;counter_write = 4'b1111;dirtyInput = 4'b0000;
											tagWrite = 4'b0010;validWrite = 4'b0010;
										end
									2'b10:
										begin
											wayWrite = 4'b0100;dirtyWrite = 4'b0100;counter_write = 4'b1111;
											dirtyInput = 4'b0000;tagWrite = 4'b0100;validWrite = 4'b0100;
										end
									2'b11:
										begin
											wayWrite = 4'b1000;dirtyWrite = 4'b1000;counter_write = 4'b1111;
											dirtyInput = 4'b0000;tagWrite = 4'b1000;validWrite = 4'b1000;
										end
								endcase		
							end
							else if (memWr == 1'b1)
								begin
									// Cache Miss with Write FIFO Replace 
									case(waySelect)
										2'b00: 
											begin
												wayWrite = 4'b0001;dirtyWrite = 4'b0001;counter_write = 4'b1111;
												dirtyInput = 4'b0000;tagWrite = 4'b0001;validWrite = 4'b0001;
											end
										2'b01:
											begin
												wayWrite = 4'b0010;dirtyWrite = 4'b0010;counter_write = 4'b1111;
												dirtyInput = 4'b0000;tagWrite = 4'b0010;validWrite = 4'b0010;
											end
										2'b10:
											begin
												wayWrite = 4'b0100;dirtyWrite = 4'b0100;counter_write = 4'b1111;
												dirtyInput = 4'b0000;tagWrite = 4'b0100;validWrite = 4'b0100;
											end
										2'b11:
											begin
												wayWrite = 4'b1000;dirtyWrite = 4'b1000;counter_write = 4'b1111;
												dirtyInput = 4'b0000;tagWrite = 4'b1000;validWrite = 4'b1000;
											end
									endcase		
								end
							else
								begin
									wayWrite = 4'b0000;dirtyWrite = 4'b0000;counter_write = 4'b0000;
									dirtyInput = 4'b0000;tagWrite = 4'b0000;validWrite = 4'b0000;
								end
					end
				2'b10:	
					begin
						if( memWr == 1'b1)
							prevState = 2'b10;
							case(waySelect)
								2'b00: 
									begin
										wayWrite = 4'b0001;dirtyWrite = 4'b0001;counter_write = 4'b0000;
										dirtyInput = 4'b0000;tagWrite = 4'b0001;validWrite = 4'b0001;
										countLoad = 4'b0001;
									end
								2'b01:
									begin
										wayWrite = 4'b0010;dirtyWrite = 4'b0010;counter_write = 4'b0000;
										dirtyInput = 4'b0000;tagWrite = 4'b0010;validWrite = 4'b0010;
										countLoad = 4'b0010;
								end
								2'b10:
									begin
										wayWrite = 4'b0100;dirtyWrite = 4'b0100;counter_write = 4'b0000;
										dirtyInput = 4'b0000;tagWrite = 4'b0100;validWrite = 4'b0100;
										countLoad = 4'b0100;
									end
								2'b11:
									begin
										wayWrite = 4'b1000;dirtyWrite = 4'b1000;counter_write = 4'b0000;
										dirtyInput = 4'b0000;tagWrite = 4'b1000;validWrite = 4'b1000;
										countLoad = 4'b1000;
									end
							endcase
						end
				2'b11:
					begin
						prevState=2'b11;
						if( memWr == 1'b1)
								begin
									wayWrite = 4'b0000;dirtyWrite = 4'b0000;counter_write = 4'b0000;
									dirtyInput = 4'b0000;tagWrite = 4'b0000;validWrite = 4'b0000;
									countLoad = 4'b0000;
								end
						end			
			endcase
		end
endmodule

/*
=====================================
Main Cache Design
======================================
*/
module cache(input clk, input reset, input load,input [31:0] address, input [127:0] inData, input [15:0] inData16bits,input writeWord,  
				  input memRd, input memWr,output  [15:0] outData0, outData1, outData2, outData3, 
				 output [19:0] outTag0, outTag1, outTag2, outTag3, output  [3:0] outValid, outDirty,
				 output cache_miss, output [15:0] outData,output earlyMissHalt,output [1:0] lineNo);
		
	// Obtained by address provided by processor
	wire [23:0] Tag; 
	wire [3:0] index; 
	wire [2:0] offset;
	wire [15:0] decOut;
	wire [3:0] haltTagFromAddress;
	wire [1:0] placementWaySelect;
	wire [1:0] waySelect;

	assign offset = address[3:1];
	assign index = address[7:4];
	assign Tag = address[31:8];
	assign haltTagFromAddress = address[11:8];
	
	//Decoder
	decoder4to16 decoder4to16_1(index,decOut);
	
	//Set valid and dirty bits
	wire [1:0] outCounter0,outCounter1,outCounter2,outCounter3;
	wire [3:0] earlyMiss;
	wire hit;
	wire [1:0] invalidCount;
	wire [3:0] countLoad;
	wire [3:0] wayWrite, dirtyWrite, counter_write, dirtyInput, tagWrite, validWrite;
	wire [15:0] lineSelect0,lineSelect1,lineSelect2,lineSelect3;
	wire [3:0] haltTag0,haltTag1,haltTag2,haltTag3;
	
	HaltTagApparatus h0(clk,reset,haltTagFromAddress,tagWrite[0],index,decOut,memRd,lineSelect0,earlyMiss[0],haltTag0);
	CacheSet CacheSet0(clk,reset,countLoad[0],invalidCount,2'b00,Tag,lineSelect0,offset,waySelect,
							 inData,inData16bits,writeWord,dirtyInput[0],1'b1, 
							 wayWrite[0], dirtyWrite[0],tagWrite[0],validWrite[0],counter_write[0],memRd,
							 outTag0,outData0,outValid[0],outDirty[0],outCounter0);
	
	HaltTagApparatus h1(clk,reset,haltTagFromAddress,tagWrite[1],index,decOut,memRd,lineSelect1,earlyMiss[1],haltTag1);
	CacheSet CacheSet1(clk,reset,countLoad[1],invalidCount,2'b01,Tag,lineSelect1,offset,waySelect,
							 inData,inData16bits,writeWord,dirtyInput[1],1'b1,
							 wayWrite[1], dirtyWrite[1],tagWrite[1],validWrite[1],counter_write[1],memRd,
							 outTag1,outData1,outValid[1],outDirty[1],outCounter1);
	
	HaltTagApparatus h2(clk,reset,haltTagFromAddress,tagWrite[2],index,decOut,memRd,lineSelect2,earlyMiss[2],haltTag2);
	CacheSet CacheSet2(clk,reset,countLoad[2],invalidCount,2'b10,Tag,lineSelect2,offset,waySelect,
							 inData,inData16bits,writeWord,dirtyInput[2],1'b1,
							 wayWrite[2], dirtyWrite[2],tagWrite[2],validWrite[2],counter_write[2],memRd,
							 outTag2,outData2,outValid[2],outDirty[2],outCounter2);
	
	HaltTagApparatus h3(clk,reset,haltTagFromAddress,tagWrite[3],index,decOut,memRd,lineSelect3,earlyMiss[3],haltTag3);
	CacheSet CacheSet3(clk,reset,countLoad[3],invalidCount,2'b11,Tag,lineSelect3,offset,waySelect,
							 inData,inData16bits,writeWord,dirtyInput[3],1'b1,
							 wayWrite[3], dirtyWrite[3],tagWrite[3],validWrite[3],counter_write[3],memRd,
							 outTag3,outData3,outValid[3],outDirty[3],outCounter3); 
	
	assign earlyMissHalt = &earlyMiss;
	
	priorityEncoderInvalid pr({outValid},placementWaySelect);
	
	comparator_24bits cmp0( Tag, {outTag0,haltTag0} , tagCmp0);
	comparator_24bits cmp1( Tag, {outTag1,haltTag1} , tagCmp1);
	comparator_24bits cmp2( Tag, {outTag2,haltTag2} , tagCmp2);
	comparator_24bits cmp3( Tag, {outTag3,haltTag3} , tagCmp3);

	wire [1:0] hitWayNo;
	wire [1:0] replacementWaySelect;
	priorityEncoder prWay({tagCmp3,tagCmp2,tagCmp1,tagCmp0}, hitWayNo);
		
	assign invalidCount = ~outValid[0] + ~outValid[1] + ~outValid[2] + ~outValid[3] - 1'b1;
	
	assign cache_miss = earlyMissHalt | ~(tagCmp0 | tagCmp1 | tagCmp2 | tagCmp3);
	assign hit = ~cache_miss;
	
	comparator_2bits cnt0( outCounter0, 2'b00 , cntCmp0);
	comparator_2bits cnt1( outCounter1, 2'b00 , cntCmp1);
	comparator_2bits cnt2( outCounter2, 2'b00 , cntCmp2);
	comparator_2bits cnt3( outCounter3, 2'b00 , cntCmp3);
	
	wire [1:0] SecondaryWaySelect;
	priorityEncoder cntEnc({cntCmp3,cntCmp2,cntCmp1,cntCmp0}, replacementWaySelect);
	mux4to1_2bits waySelectMux( placementWaySelect, replacementWaySelect , 2'b00, hitWayNo , {hit,&outValid} , waySelect);
	
	assign lineNo = waySelect;
	
	cacheControl cacheCtrl(memRd, memWr, address, hit, ~(&outValid), waySelect,  wayWrite, dirtyWrite, counter_write, dirtyInput, tagWrite, validWrite, countLoad);

	mux4to1_16bits finalHitMux(outData0,outData1,outData2,outData3,replacementWaySelect,outData);
		
endmodule


/*
===========================================
Pipeline Registers
===========================================
*/
module Byte_pipe(input clk, input reset, input regWrite,input [7:0] d, output [7:0] q);
	D_ff v0 (clk,	reset,	regWrite,	d[0],	q[0]);
	D_ff v1 (clk,	reset,	regWrite,	d[1],	q[1]);
	D_ff v2 (clk,	reset,	regWrite,	d[2],	q[2]);
	D_ff v3 (clk,	reset,	regWrite,	d[3],	q[3]);
	D_ff v4 (clk,	reset,	regWrite,	d[4],	q[4]);
	D_ff v5 (clk,	reset,	regWrite,	d[5],	q[5]);
	D_ff v6 (clk,	reset,	regWrite,	d[6],	q[6]);
	D_ff v7 (clk,	reset,	regWrite,	d[7],	q[7]);
endmodule

module register8bits_pipe(input clk, input reset, input regWrite, input [7:0] d, output [7:0] q);
	
	Byte_pipe b0( clk,  reset, regWrite, d[7:0], q[7:0]);

endmodule


module register16bits_pipe(input clk, input reset, input regWrite, input [15:0] d, output [15:0] q);
	
	Byte_pipe b0( clk,  reset, regWrite, d[7:0], q[7:0]);
	Byte_pipe b1( clk,  reset, regWrite, d[15:8], q[15:8]);

endmodule


module register32bits_pipe(input clk, input reset, input regWrite, input [31:0] d, output [31:0] q);
	
	Byte_pipe b0( clk,  reset, regWrite, d[7:0], q[7:0]);
	Byte_pipe b1( clk,  reset, regWrite, d[15:8], q[15:8]);
	Byte_pipe b2( clk,  reset, regWrite, d[23:16], q[23:16]);
	Byte_pipe b3( clk,  reset, regWrite, d[31:24], q[31:24]);
	
endmodule

module register48bits_pipe(input clk, input reset, input regWrite, input [47:0] d, output [47:0] q);
	Byte_pipe b0( clk,  reset, regWrite, d[7:0], q[7:0]);
	Byte_pipe b1( clk,  reset, regWrite, d[15:8], q[15:8]);
	Byte_pipe b2( clk,  reset, regWrite, d[23:16], q[23:16]);
	Byte_pipe b3( clk,  reset, regWrite, d[31:24], q[31:24]);
	Byte_pipe b4( clk,  reset, regWrite, d[39:32], q[39:32]);
	Byte_pipe b5( clk,  reset, regWrite, d[47:40], q[47:40]);
endmodule

module IF_ID_pipeline(input clk, input reset, input pipelineWrite, input [47:0] IR, input [31:0] nextPC,
							 output [47:0] IROut, output [31:0] nextPCOut);
							 
	register48bits_pipe IR_register(clk, reset, pipelineWrite, IR, IROut);
	register32bits_pipe PC_register(clk, reset, pipelineWrite, nextPC, nextPCOut);
	
endmodule

module ID_EX_pipeline(input clk, input reset, input pipelineWrite,input [31:0] pcPlus3_in,input [4:0] rs1_a_in,input [4:0] rs1_b_in, input [4:0] rd_a_in , 
							 input [4:0] rd_b_in,input [4:0] rs2_a_in,input [4:0] rs2_b_in, input [31:0] out_rs1_a_in,input [31:0] out_rs2_a_in,
							 input [31:0] out_rs1_b_in, input [31:0] out_rs2_b_in, input [31:0] jalr_alu_in , input [31:0] xori_lh_alu_in , 
							 input [31:0] beq_alu_in , input [31:0] cli_alu_in , input [31:0] csw_alu_in , input [1:0] aluOp_a_in, input [1:0] aluSrcB_a_in,
							 input branch_in, input memRd_a_in, input memWr_a_in, input regWr_a_in,input [1:0] destReg_a_in, input jump_in, 
							 input [1:0] aluOp_b_in, input aluSrcB_b_in, input memRd_b_in , input memWr_b_in, input regWr_b_in, input destReg_b_in,
							 output [31:0] pcPlus3,output [4:0] rs1_a,output [4:0] rs1_b, output [4:0] rd_a, output [4:0] rd_b,
							 output [4:0] rs2_a,output [4:0] rs2_b, output [31:0] out_rs1_a,output [31:0] out_rs2_a,output [31:0] out_rs1_b,
							 output [31:0] out_rs2_b, output [31:0] jalr_alu , output [31:0] xori_lh_alu , output [31:0] beq_alu , 
							 output [31:0] cli_alu , output [31:0] csw_alu , output [1:0] aluOp_a, output [1:0] aluSrcB_a,output branch, 
							 output memRd_a, output memWr_a, output regWr_a,output [1:0] destReg_a, output jump, output [1:0] aluOp_b,
							 output aluSrcB_b, output memRd_b , output memWr_b, output regWr_b, output destReg_b);
							 
		wire [1:0] dummy1;
		wire [13:0] dummy2;
		register32bits_pipe pc_register(clk, reset, pipelineWrite, pcPlus3_in, pcPlus3);
		register32bits_pipe reg_rs1_a(clk, reset, pipelineWrite, out_rs1_a_in , out_rs1_a);
		register32bits_pipe reg_rs2_a(clk, reset, pipelineWrite, out_rs2_a_in , out_rs2_a);
		register32bits_pipe reg_rs1_b(clk, reset, pipelineWrite, out_rs1_b_in , out_rs1_b);
		register32bits_pipe reg_rs2_b(clk, reset, pipelineWrite, out_rs2_b_in , out_rs2_b);
		register32bits_pipe jalr_sext(clk, reset, pipelineWrite, jalr_alu_in  , jalr_alu);
		register32bits_pipe xori_lh_sext(clk, reset, pipelineWrite, xori_lh_alu_in , xori_lh_alu);
		register32bits_pipe beq_concat(clk, reset, pipelineWrite, beq_alu_in, beq_alu);
		register32bits_pipe cli_sext(clk, reset, pipelineWrite, cli_alu_in, cli_alu);
		register32bits_pipe csw_concat(clk, reset, pipelineWrite, csw_alu_in, csw_alu);
		// Order is { rs1_a , rs1_b , rs2_a , rs2_ b , rd_a , rd_b , 00} --> 32bits
 		register32bits_pipe register_nos(clk, reset, pipelineWrite, { rs1_a_in , rs1_b_in , rs2_a_in , rs2_b_in , rd_a_in , rd_b_in , 2'b00}, { rs1_a , rs1_b , rs2_a , rs2_b , rd_a , rd_b , dummy1});
		register32bits_pipe controls(clk, reset, pipelineWrite, {aluOp_a_in,aluSrcB_a_in,branch_in,memRd_a_in,memWr_a_in,regWr_a_in,destReg_a_in,jump_in,aluOp_b_in,aluSrcB_b_in,memRd_b_in,memWr_b_in,regWr_b_in,destReg_b_in,14'd0},
															    {aluOp_a,aluSrcB_a,branch,memRd_a,memWr_a,regWr_a,destReg_a,jump,aluOp_b,aluSrcB_b,memRd_b,memWr_b,regWr_b,destReg_b,dummy2});

endmodule

module EX_MEM_pipeline(input clk, input reset, input pipelineWrite, input [31:0] pcPlus3_in, input [31:0] aluOut1_in, input [31:0] aluOut2_in, 
					   input [31:0] beq_alu_in, input [31:0] cli_alu_in,input branch_in, input memRd_a_in, input memWr_a_in, input regWr_a_in,
					   input [1:0] destReg_a_in, input jump_in,input memRd_b_in , input memWr_b_in, input regWr_b_in, input destReg_b_in, input zeroflag_in,
					   
						output [31:0] pcPlus3, output [31:0] aluOut1, output [31:0] aluOut2, 
					   output [31:0] beq_alu, output [31:0] cli_alu,output branch, output memRd_a, output memWr_a, output regWr_a,
					   output [1:0] destReg_a, output jump,output memRd_b , output memWr_b, output regWr_b, output destReg_b, output zeroflag);
		
		wire [3:0] dummy1;
		
		register32bits_pipe pc_register_EX_MEM(clk, reset, pipelineWrite, pcPlus3_in, pcPlus3);			   
		register32bits_pipe aluOut1_EX_MEM(clk, reset, pipelineWrite, aluOut1_in, aluOut1);		
		register32bits_pipe aluOut2_EX_MEM(clk, reset, pipelineWrite, aluOut2_in, aluOut2);
		register32bits_pipe beq_reg_EX_MEM(clk, reset, pipelineWrite, beq_alu_in, beq_alu);	
		register32bits_pipe cli_reg_EX_MEM(clk, reset, pipelineWrite, cli_alu_in, cli_alu);	
		register16bits_pipe controls_EX_MEM(clk, reset, pipelineWrite, { branch_in,  memRd_a_in,  memWr_a_in,  regWr_a_in,
					    destReg_a_in,  jump_in, memRd_b_in ,  memWr_b_in,  regWr_b_in,  destReg_b_in,  zeroflag_in,4'd0}, 
						 {branch,  memRd_a,  memWr_a,  regWr_a,destReg_a,  jump, memRd_b ,  memWr_b,  regWr_b,  destReg_b,  zeroflag,dummy1});	
						
endmodule					   

module MEM_WB_pipeline(input clk, input reset, input pipelineWrite, input [31:0] pcPlus3_in, input [31:0] aluOut1_in, input [31:0] aluOut2_in, 
					   input [31:0] beq_alu_in, input [31:0] cli_alu_in,input branch_in,input regWr_a_in,
					   input [1:0] destReg_a_in, input jump_in,input regWr_b_in, input destReg_b_in, input zeroflag_in, input [31:0] cacheOut_in,
					   output [31:0] pcPlus3, output [31:0] aluOut1, output [31:0] aluOut2, 
					   output [31:0] beq_alu, output [31:0] cli_alu,output branch,output regWr_a,
					   output [1:0] destReg_a, output jump,output regWr_b, output destReg_b, output zeroflag, output [31:0] cacheOut);
		
		register32bits_pipe pc_register_MEM_WB(clk, reset, pipelineWrite, pcPlus3_in, pcPlus3);			   
		register32bits_pipe aluOut1_MEM_WB(clk, reset, pipelineWrite, aluOut1_in, aluOut1);		
		register32bits_pipe aluOut2_MEM_WB(clk, reset, pipelineWrite, aluOut2_in, aluOut2);
		register32bits_pipe beq_reg_MEM_WB(clk, reset, pipelineWrite, beq_alu_in, beq_alu);	
		register32bits_pipe cli_reg_MEM_WB(clk, reset, pipelineWrite, cli_alu_in, cli_alu);	
		register8bits_pipe controls_MEM_WB(clk, reset, pipelineWrite, { branch_in,regWr_a_in,
					    destReg_a_in,  jump_in,regWr_b_in,  destReg_b_in,  zeroflag_in}, {branch,  memRd_a,  memWr_a,  regWr_a,
					    destReg_a,  jump, memRd_b ,  memWr_b,  regWr_b,  destReg_b,  zeroflag});
		register32bits_pipe cache_MEM_WB(clk, reset, pipelineWrite, cacheOut_in,cacheOut);				
						
endmodule
							 

/*
===========================================
Single Cycle Implementation
===========================================
*/
module singleCycle(input clk, input reset, output [31:0] Result);

	wire regWrite;
	wire decOut1b;
	wire [31:0] pcOutRegister;
	wire [31:0] nextPCAdderOut,nextPC_after_pipeline;
	wire [31:0] muxOutNextPC, beq_add, aluOut1,aluOut2;
	wire [47:0] IR_before_pipeline;
	wire [47:0] IR_after_pipeline;
	wire [1:0] PCSrc;
	wire [31:0] memOut;
	
	// Controls for 32 bit instruction region
	wire [1:0] aluOp1,aluSrcB1,destReg1;
	wire branch1, memRd1, memWr1,regWr1,jump1;
	
	// Controls for 16 bit instruction region
	wire[1:0] aluOp2;
	wire aluSrcB2,memRd2,rd_bSelect2,memWr2,regWr2,destReg2;

	// Register File inputs
	wire[4:0] rs1_a_before_ID_EX, rs2_a_before_ID_EX, rs1_b_before_ID_EX, rs2_b_before_ID_EX, rd_a_before_ID_EX, rd_b_before_ID_EX;

	wire [31:0] wd_a, wd_b,out_rs1_a,out_rs2_a,out_rs2_b,out_rs1_b;

	wire [31:0] branch_address;
	wire [31:0] cli_immediate6bits;
	wire [31:0] immediate_12bits;

	wire [31:0] alu1_inputB;
	wire zeroFlag1;

	wire [31:0] alu2_inputB;
	wire zeroFlag2;
	
	// Pipeline Writes
	wire IF_ID_pipeline_write;
	wire ID_EX_pipelineWrite;
	wire EX_MEM_pipelineWrite;
	wire MEM_WB_pipelineWrite;
	assign IF_ID_pipeline_write = 1'b1;
	assign ID_EX_pipelineWrite = 1'b1;
	assign EX_MEM_pipelineWrite = 1'b1;
	assign MEM_WB_pipelineWrite = 1'b1;	
	
	//Post ID_EX Pipeline Wires
	// ap_ID_EX ==> after_pipeline_ID_EX
	wire [31:0] pcPlus3_ap_ID_EX;
	wire [4:0] rs1_a_ap_ID_EX,rs1_b_ap_ID_EX;
	wire [4:0] rd_a_ap_ID_EX,rd_b_ap_ID_EX,rs2_a_ap_ID_EX,rs2_b_ap_ID_EX;
	wire [31:0] out_rs1_a_ap_ID_EX,out_rs2_a_ap_ID_EX,out_rs1_b_ap_ID_EX;
	wire [31:0] out_rs2_b_ap_ID_EX,jalr_alu_ap_ID_EX,xori_lh_alu_ap_ID_EX;
	wire [31:0] beq_alu_ap_ID_EX,cli_alu_ap_ID_EX,csw_alu_ap_ID_EX;
	wire [1:0] aluOp_a_ap_ID_EX,aluSrcB_a_ap_ID_EX, destReg_a_ap_ID_EX, aluOp_b_ap_ID_EX;
	wire branch_ap_ID_EX,memRd_a_ap_ID_EX,memWr_a_ap_ID_EX, regWr_a_ap_ID_EX;
	wire jump_ap_ID_EX, aluSrcB_b_ap_ID_EX,memRd_b_ap_ID_EX;
	wire memWr_b_ap_ID_EX, regWr_b_ap_ID_EX, destReg_b_ap_ID_EX;
	
	// EX_MEM Pipeline Wires
	wire [31:0] pcPlus3_ap_EX_MEM, aluOut1_ap_EX_MEM, aluOut2_ap_EX_MEM, beq_alu_ap_EX_MEM, cli_alu_ap_EX_MEM;
	wire branch_ap_EX_MEM,memRd_a_ap_EX_MEM, memWr_a_ap_EX_MEM, regWr_a_ap_EX_MEM;
	wire jump_ap_EX_MEM ,memRd_b_ap_EX_MEM;
	wire memWr_b_ap_EX_MEM, regWr_b_ap_EX_MEM, destReg_b_ap_EX_MEM;
	wire [1:0] destReg_a_ap_EX_MEM;
	wire zeroFlag1_ap_EX_MEM;
	
	// MEM_WB Pipeline Wires
	wire[31:0] cacheOut_in, cacheOut;
	wire [31:0] pcPlus3_ap_MEM_WB, aluOut1_ap_MEM_WB, aluOut2_ap_MEM_WB, beq_alu_ap_MEM_WB, cli_alu_ap_MEM_WB;
	wire branch_ap_MEM_WB, regWr_a_ap_MEM_WB;
	wire [1:0] destReg_a_ap_MEM_WB;
	wire zeroFlag1_ap_MEM_WB, regWr_b_ap_MEM_WB, destReg_b_ap_MEM_WB, jump_ap_MEM_WB;

	register32bit_PC pc( clk, reset, 1'b1, 1'b1, muxOutNextPC, pcOutRegister);
	
	// 32'd1 as IM is has 48 bit registers
	adder32 add(32'd1, pcOutRegister, nextPCAdderOut);
	
	// Mux Control needs to be generated
	mux4to1_32bits mux0(nextPCAdderOut,aluOut1,beq_add,32'd0,2'b00, muxOutNextPC);
	
	// Instruction Memory
	IM imem(clk, reset,pcOutRegister[3:0],IR_before_pipeline);
	
	// IF_ID Pipeline
	IF_ID_pipeline if_id_pipeline(clk, reset, IF_ID_pipeline_write, IR_before_pipeline, nextPCAdderOut, IR_after_pipeline, nextPC_after_pipeline);
	
	// Control Signal Generation
	ctrlCkt_a control_a( IR_after_pipeline[22:16], IR_after_pipeline[30:28], aluOp1, aluSrcB1, branch1, memRd1, memWr1, regWr1,  destReg1, jump1);
	ctrlCkt_b control_b(IR_after_pipeline[15:13], IR_after_pipeline[1:0], IR_after_pipeline[6:5], IR_after_pipeline[12:10], aluOp2, aluSrcB2,memRd2,rd_bSelect2, memWr2,regWr2, destReg2);	
					  
	// Branch Address Computation
	signExt12to32 beq_sext( {IR_after_pipeline[47],IR_after_pipeline[23],IR_after_pipeline[46:41], IR_after_pipeline[27:24]}, branch_address);
	signExt6to32 cli_sext({IR_after_pipeline[12], IR_after_pipeline[6:2]}, cli_immediate6bits);

	// Pre Register File Muxes
	mux2to1_5bits select_rd_b(IR_after_pipeline[11:7],{2'b00, IR_after_pipeline[9:7]},rd_bSelect2, rd_b_before_ID_EX);
	mux4to1_32bits select_wd_a(aluOut1,nextPC_after_pipeline,memOut,branch_address, destReg1,wd_a);
	mux2to1_32bits select_wd_b(aluOut2,cli_immediate6bits, destReg2, wd_b);

	assign rs1_a_before_ID_EX = IR_after_pipeline[35:31];
	assign rs2_a_before_ID_EX = IR_after_pipeline[40:36];
	assign rs1_b_before_ID_EX = {2'b00,IR_after_pipeline[9:7]};
	assign rs2_b_before_ID_EX = {2'b00, IR_after_pipeline[4:2]};
	assign rd_a_before_ID_EX = IR_after_pipeline[27:23]; 
	
	registerFile reg_file( clk, reset, regWr1 | regWr2 , rs1_a_before_ID_EX, rs2_a_before_ID_EX, rs1_b_before_ID_EX,rs2_b_before_ID_EX,
							rd_a_before_ID_EX,rd_b_before_ID_EX, wd_a, wd_b, out_rs1_a, out_rs2_a, out_rs1_b, out_rs2_b);
		
	signExt12to32 imm12bits_sext(IR_after_pipeline[47:36], immediate_12bits);
	
	// ID EX Pipeline
	ID_EX_pipeline id_ex_pipeline( clk, reset, ID_EX_pipelineWrite, nextPCAdderOut , rs1_a_before_ID_EX ,rs1_b_before_ID_EX, rd_a_before_ID_EX , 
							 rd_b_before_ID_EX, rs2_a_before_ID_EX, rs2_b_before_ID_EX , out_rs1_a , out_rs2_a ,
							 out_rs1_b, out_rs2_b, {immediate_12bits[30:0],1'b0} , immediate_12bits , 
							 branch_address , cli_immediate6bits , {25'b0,IR_after_pipeline[5],IR_after_pipeline[12:10],IR_after_pipeline[6],2'b0} , 
							 aluOp1, aluSrcB1 , branch1, memRd1, memRd1, regWr1 ,destReg1 , jump1, 
							 aluOp2, aluSrcB2, memRd2 , memWr2, regWr2, destReg2,
							 pcPlus3_ap_ID_EX ,rs1_a_ap_ID_EX,rs1_b_ap_ID_EX,rd_a_ap_ID_EX, rd_b_ap_ID_EX,
							 rs2_a_ap_ID_EX,rs2_b_ap_ID_EX,out_rs1_a_ap_ID_EX,out_rs2_a_ap_ID_EX,out_rs1_b_ap_ID_EX,
							 out_rs2_b_ap_ID_EX,jalr_alu_ap_ID_EX,xori_lh_alu_ap_ID_EX,beq_alu_ap_ID_EX, 
							 cli_alu_ap_ID_EX, csw_alu_ap_ID_EX, aluOp_a_ap_ID_EX, aluSrcB_a_ap_ID_EX, branch_ap_ID_EX, 
							 memRd_a_ap_ID_EX, memWr_a_ap_ID_EX, regWr_a_ap_ID_EX, destReg_a_ap_ID_EX, jump_ap_ID_EX,  aluOp_b_ap_ID_EX,
							 aluSrcB_b_ap_ID_EX, memRd_b_ap_ID_EX, memWr_b_ap_ID_EX, regWr_b_ap_ID_EX, destReg_b_ap_ID_EX);
	
	// Note: From here onwards most wires will have a _ap_ID_EX Suffix
	
	// ALU InputB Muxes
	mux4to1_32bits select_alu_a_inputB(out_rs2_a_ap_ID_EX,{27'd0,rs2_a_ap_ID_EX},xori_lh_alu_ap_ID_EX,jalr_alu_ap_ID_EX, aluSrcB_a_ap_ID_EX,alu1_inputB);
	mux2to1_32bits select_alu_b_inputB(out_rs2_b_ap_ID_EX,csw_alu_ap_ID_EX, aluSrcB_b_ap_ID_EX,alu2_inputB);

	// ALU Section
	ALU alu_a(out_rs1_a_ap_ID_EX, alu1_inputB, aluOp_a_ap_ID_EX, aluOut1, zeroFlag1);
	ALU alu_b(out_rs1_b_ap_ID_EX, alu2_inputB, aluOp_b_ap_ID_EX, aluOut2, zeroFlag2);

	// For testing
	assign Result = aluOut1;
	
	// Insert EX_MEM Pipeline
	EX_MEM_pipeline ex_mem_pipeline(clk,  reset, EX_MEM_pipelineWrite, pcPlus3_ap_ID_EX ,  aluOut1, aluOut2, 
					   beq_alu_ap_ID_EX, cli_alu_ap_ID_EX, branch_ap_ID_EX,  memRd_a_ap_ID_EX, memWr_a_ap_ID_EX, regWr_a_ap_ID_EX,
					   destReg_a_ap_ID_EX, jump_ap_ID_EX, memRd_b_ap_ID_EX ,  memWr_b_ap_ID_EX,regWr_b_ap_ID_EX, destReg_b_ap_ID_EX,zeroFlag1,
					   pcPlus3_ap_EX_MEM, aluOut1_ap_EX_MEM,aluOut2_ap_EX_MEM, 
					   beq_alu_ap_EX_MEM,  cli_alu_ap_EX_MEM, branch_ap_EX_MEM, memRd_a_ap_EX_MEM, memWr_a_ap_EX_MEM, regWr_a_ap_EX_MEM,
					   destReg_a_ap_EX_MEM, jump_ap_EX_MEM, memRd_b_ap_EX_MEM , memWr_b_ap_EX_MEM, regWr_b_ap_EX_MEM, destReg_b_ap_EX_MEM, zeroFlag1_ap_EX_MEM);
	
	// Cache Module
	
	// MEM_WB Pipeline
	MEM_WB_pipeline mem_wb_pipeline( clk,  reset, MEM_WB_pipelineWrite,  pcPlus3_ap_EX_MEM, aluOut1_ap_EX_MEM, aluOut2_ap_EX_MEM, 
					    beq_alu_ap_EX_MEM,  cli_alu_ap_EX_MEM, branch_ap_EX_MEM, regWr_a_ap_EX_MEM,
					    destReg_a_ap_EX_MEM,  jump_ap_EX_MEM, regWr_b_ap_EX_MEM,destReg_b_ap_EX_MEM, zeroFlag1_ap_EX_MEM, cacheOut_in,
					    pcPlus3_ap_MEM_WB, aluOut1_ap_MEM_WB, aluOut2_ap_MEM_WB, 
					    beq_alu_ap_MEM_WB,  cli_alu_ap_MEM_WB, branch_ap_MEM_WB, regWr_a_ap_MEM_WB,
					    destReg_a_ap_MEM_WB,  jump_ap_MEM_WB, regWr_b_ap_MEM_WB,  destReg_b_ap_MEM_WB, zeroFlag1_ap_MEM_WB, cacheOut);
	
	
endmodule	


module singleCycleBench;
	// Input
	reg clk, reset;
	wire [31:0] Result;
	
	singleCycle singleC(clk, reset, Result);
	
	always
		#5 clk=~clk;
	initial
		begin
			clk=0;reset=1;
			#5 reset=0;
			#100 $finish;
			end
endmodule

module counterBench;
	// Input
	reg clk, reset;
	reg counter_write;
	wire [1:0] count;
	reg load;
	reg [1:0] d;
	reg clear;
	FIFOCounter f1(clk,clear,counter_write,d,load,count);
	
	always
		#5 clk=~clk;
	initial
		begin
			clk=0;clear=1; 
			#20 clear = 1'b0;counter_write = 1'b1; 
			#100 $finish;
			end
endmodule
 
module cacheBench;
	   // Input
		reg clk, reset;
		reg [31:0] address;
		reg [127:0] inData;
		reg memRd;
		reg [1:0] status;
		wire cache_miss;
		wire [15:0] outData;
		reg memWr;
		wire earlyMiss;
		wire [15:0] outData0, outData1, outData2, outData3;
		wire [19:0] outTag0, outTag1, outTag2, outTag3;
		wire [3:0] outValid, outDirty;
		reg load;
		reg writeWord;
		reg [15:0] inputData16bits;
		wire [1:0] lineNo;

		cache c1(clk, reset, load,address, inData,inputData16bits,writeWord, memRd, memWr, outData0, outData1, outData2, outData3, 
				 outTag0, outTag1, outTag2, outTag3, outValid, outDirty,
				 cache_miss, outData, earlyMissHalt,lineNo);
				 
		always
			#5 clk=~clk;
		initial
			begin
				clk=0;reset=1; memRd = 1'b0;
				#10 reset=0; load = 1'b1;
				#10 load = 1'b0;
				#20 address=32'hffffff1a; inData=128'hf; memWr = 1'd1; writeWord = 1'b0;
				#20 address=32'hfffffe1a; inData=128'hf;  memWr = 1'd1; writeWord = 1'b0;
				#20 address=32'hfffffd3a; inData=128'hf;  memWr = 1'd1;writeWord = 1'b0;
				#20 address=32'hfffffc4a; inData=128'hf; memWr = 1'd1; writeWord = 1'b0;
				#20 address=32'hffffff0a; memRd = 1'd1; memWr = 1'd0; writeWord = 1'b0;
				#20 address=32'hfffffe0a; memRd = 1'd1; memWr = 1'd0; writeWord = 1'b0;
				#20 address=32'hfffffd0a; memRd = 1'd1; memWr = 1'd0;	writeWord = 1'b0;
				#20 address=32'hfffffc0a; memRd = 1'd1; memWr = 1'd0; writeWord = 1'b0;
				
				// Overwrite data 
				#20 address=32'hffffff00; inputData16bits=16'h1; memRd = 1'd0; memWr=1'd1; writeWord = 1'b1;
				#20 memRd = 1'd1; memWr=1'd1;
				#20 address=32'hffffff02; inputData16bits=16'h2; memRd = 1'd0; memWr=1'd1; writeWord = 1'b1;
				#20 memRd = 1'd1; memWr=1'd1;
				#20 address=32'hffffff04;  inputData16bits=16'h3; memRd = 1'd0; memWr=1'd1; writeWord = 1'b1;
				#20 memRd = 1'd1; memWr=1'd1;
				#20 address=32'hfffffd06;  inputData16bits=16'h4; memRd = 1'd0; memWr=1'd1; writeWord = 1'b1;
				#20 address=32'hfffffd0a; memRd = 1'd1; memWr=1'd0;
				#20 address=32'hfeffff0a;  inData= 128'habcd ;memRd = 1'd0; memWr=1'd1;
				#20 address=32'hfdfffe0a;  inData= 128'h1234 ;memRd = 1'd0; memWr=1'd1;
				#20 address=32'hfafffe0a;  inData= 128'h2345 ;memRd = 1'd0; memWr=1'd1;
				#20 address=32'hfbfffe0a;  inData= 128'h4567 ;memRd = 1'd0; memWr=1'd1;
				#20 address=32'hfbfffe1a;  inData= 128'h4567 ;memRd = 1'd0; memWr=1'd1;

				#100 $finish;
				end
endmodule


