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
module D_ff_registerFile (input clk, input reset, input regWrite, input decOut1b, input d, output reg q);
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

module mux2to1_4bits(input [3:0] in1,in2, input sel, output reg [3:0] muxOut);
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

/*
=====================================
Register File Design
======================================
*/
module registerFileRegister32bits(input clk, input reset, input regWrite, input decOut1b, input decOut_final,
											 input [31:0] writeData_a,input [31:0] writeData_b, output  [31:0] outR);
	  
	  wire [31:0] writeData;
	  mux2to1_32bits writeDataSelect(writeData_a,writeData_b,decOut1b,writeData);
	  
	  D_ff_registerFile 	d0(clk, reset, regWrite,decOut_final, writeData[0], outR[0]),
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
Utility blocks
======================================
*/
module adder(input [15:0] in1, input [15:0] in2, output reg [15:0] adder_out);
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

module signExt13to32( input [12:0] offset, output reg [15:0] signExtOffset);
	always@(offset)
	begin
			signExtOffset={{19{offset[12]}},offset[12:0]};
	end
endmodule

module signExt12to32( input [11:0] offset, output reg [15:0] signExtOffset);
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

/*
=====================================
ALU Design
======================================
*/
module ALU(input signed [31:0] aluIn1, input signed [31:0] aluIn2, input [2:0] aluOp, output reg [31:0] aluOut, output reg zeroFlag);
	always@(aluIn1 or aluIn2 or aluOp)
	begin
		case(aluOp)
			3'd0: aluOut = aluIn1 << aluIn2;
			3'd1:	aluOut = aluIn1 + aluIn2;
			3'd2: aluOut = aluIn1 ^ aluIn2;
			3'd3: aluOut = aluIn1 & aluIn2;
		endcase
		
		if( aluOut ) 
			zeroFlag = 1'b1;
		else 
			zeroFlag = 1'b0;
	end
endmodule


/*
=====================================
Tag Register of 20 bits
regWrite: Is fixed for all the bits
======================================
*/
module TagRegister20_bit(input clk, input reset, input regWrite, input [19:0] d, output reg [19:0] q);
	D_ff d0 (clk,	reset,	regWrite,	d[0],	q[0]);
	D_ff d1 (clk,	reset,	regWrite,	d[1],	q[1]);
	D_ff d2 (clk,	reset,	regWrite,	d[2],	q[2]);
	D_ff d3 (clk,	reset,	regWrite,	d[3],	q[3]);
	D_ff d4 (clk,	reset,	regWrite,	d[4],	q[4]);
	D_ff d5 (clk,	reset,	regWrite,	d[5],	q[5]);
	D_ff d6 (clk,	reset,	regWrite,	d[6],	q[6]);
	D_ff d7 (clk,	reset,	regWrite,	d[7],	q[7]);
	D_ff d8 (clk,	reset,	regWrite,	d[8],	q[8]);
	D_ff d9 (clk,	reset,	regWrite,	d[9],	q[9]);
	
	D_ff d10(clk,	reset,	regWrite,	d[10],	q[10]);
	D_ff d11(clk,	reset,	regWrite,	d[11],	q[11]);
	D_ff d12(clk,	reset,	regWrite,	d[12],	q[12]);
	D_ff d13(clk,	reset,	regWrite,	d[13],	q[13]);
	D_ff d14(clk,	reset,	regWrite,	d[14],	q[14]);
	D_ff d15(clk,	reset,	regWrite,	d[15],	q[15]);
	D_ff d16(clk,	reset,	regWrite,	d[16],	q[16]);
	D_ff d17(clk,	reset,	regWrite,	d[17],	q[17]);
	D_ff d18(clk,	reset,	regWrite,	d[18],	q[18]);
	D_ff d19(clk,	reset,	regWrite,	d[19],	q[19]);
		
endmodule

	
/*
=====================================
Halt Tag Register of 4 bits
regWrite: Is fixed for all the bits
======================================
*/
module HaltTagRegister4_bit(input clk, input reset, input regWrite, input [3:0] d, output reg [3:0] q);
	D_ff d0 (clk,	reset,	regWrite,	d[0],	q[0]);
	D_ff d1 (clk,	reset,	regWrite,	d[1],	q[1]);
	D_ff d2 (clk,	reset,	regWrite,	d[2],	q[2]);
	D_ff d3 (clk,	reset,	regWrite,	d[3],	q[3]);
endmodule


/*
=====================================
Byte Register of 8 bits
regWrite: Is fixed for all the bits
======================================
*/
module Byte(input clk, input reset, input regWrite, input [7:0] d, output reg [7:0] q);
	D_ff v0 (clk,	reset,	regWrite,	d[0],	q[0]);
	D_ff v1 (clk,	reset,	regWrite,	d[1],	q[1]);
	D_ff v2 (clk,	reset,	regWrite,	d[2],	q[2]);
	D_ff v3 (clk,	reset,	regWrite,	d[3],	q[3]);
	D_ff v4 (clk,	reset,	regWrite,	d[4],	q[4]);
	D_ff v5 (clk,	reset,	regWrite,	d[5],	q[5]);
	D_ff v6 (clk,	reset,	regWrite,	d[6],	q[6]);
	D_ff v7 (clk,	reset,	regWrite,	d[7],	q[7]);
endmodule

module statusRegister_2Bytes(input clk, input reset, input regWrite, input [7:0] d, output reg [7:0] q);
	Byte b0(clk, reset, regWrite, d[7:0], q[7:0]),
		  b1(clk, reset, regWrite, d[15:8], q[15:8]);
endmodule

/*
=====================================
16 Bytes Data Register Block
regWrite: Is fixed for all the bits
======================================
*/
module Data_16Byte(input clk, input reset, input regWrite, input [127:0] d, output reg [127:0] q);
	Byte b0 ( clk, reset, regWrite, 	d[8:0]	 ,q[8:0] );
	Byte b1 ( clk, reset, regWrite, 	d[15:9]	 ,q[15:9]);
	Byte b2 ( clk, reset, regWrite, 	d[23:16]	 ,q[23:16]);
	Byte b3 ( clk, reset, regWrite, 	d[31:24]	 ,q[31:24]);
	Byte b4 ( clk, reset, regWrite, 	d[39:32]	 ,q[39:32]);
	Byte b5 ( clk, reset, regWrite, 	d[47:40]	 ,q[47:40]);
	Byte b6 ( clk, reset, regWrite, 	d[55:48]	 ,q[55:48]);
	Byte b7 ( clk, reset, regWrite, 	d[63:56]	 ,q[63:56]);
	Byte b8 ( clk, reset, regWrite, 	d[71:64]  ,q[71:64]);
	Byte b9 ( clk, reset, regWrite, 	d[79:72]  ,q[79:72]);
	Byte b10( clk, reset, regWrite, 	d[87:80]  ,q[87:80]);
	Byte b11( clk, reset, regWrite, 	d[95:88]  ,q[95:88]);
	Byte b12( clk, reset, regWrite, 	d[103:96] ,q[103:96]);
	Byte b13( clk, reset, regWrite, 	d[111:104],q[111:104]);
	Byte b14( clk, reset, regWrite, 	d[119:112],q[119:112]);
	Byte b15( clk, reset, regWrite, 	d[127:120],q[127:120]);
endmodule

/*
=====================================
16x16B Data Register Block
One such block per set
regWrite: Varies for each line/row
======================================
*/
module DataRegisterSet(input clk, input reset, input [15:0] regWrite, input [127:0] inputData, 
							output [127:0] data0 , output [127:0] data1, output [127:0] data2, output [127:0] data3,
							output [127:0] data4 , output [127:0] data5, output [127:0] data6, output [127:0] data7,
							output [127:0] data8 , output [127:0] data9, output [127:0] data10,output [127:0] data11,
							output [127:0] data12, output [127:0] data13,output [127:0] data14,output [127:0] data15);
		
	Data_16Byte d0( clk,  reset,  regWrite[0]  ,	 inputData , data0);
	Data_16Byte d1( clk,  reset,  regWrite[1]  ,	 inputData , data1);
	Data_16Byte d2( clk,  reset,  regWrite[2]  ,	 inputData , data2);
	Data_16Byte d3( clk,  reset,  regWrite[3]  ,	 inputData , data3);
	Data_16Byte d4( clk,  reset,  regWrite[4]  ,	 inputData , data4);
	Data_16Byte d5( clk,  reset,  regWrite[5]  ,	 inputData , data5);
	Data_16Byte d6( clk,  reset,  regWrite[6]  ,	 inputData , data6);
	Data_16Byte d7( clk,  reset,  regWrite[7]  ,	 inputData , data7);
	Data_16Byte d8( clk,  reset,  regWrite[8]  ,	 inputData , data8);
	Data_16Byte d9( clk,  reset,  regWrite[9]  ,	 inputData , data9);
	Data_16Byte d10( clk,  reset,  regWrite[10] , inputData , data10);
	Data_16Byte d11( clk,  reset,  regWrite[11] , inputData , data11);
	Data_16Byte d12( clk,  reset,  regWrite[12] , inputData , data12);
	Data_16Byte d13( clk,  reset,  regWrite[13] , inputData , data13);
	Data_16Byte d14( clk,  reset,  regWrite[14] , inputData , data14);
	Data_16Byte d15( clk,  reset,  regWrite[15] , inputData , data15);
	
endmodule


/*
=====================================
16x19bits Tag Register Block
One such block per set
regWrite: Varies for each line/row
======================================
*/
module TagRegisterSet(input clk, input reset, input [15:0] regWrite, input [19:0] inputTag, 
							output [19:0] tag0, output [19:0] tag1, output [19:0] tag2, output [19:0] tag3,
							output [19:0] tag4, output [19:0] tag5, output [19:0] tag6, output [19:0] tag7,
							output [19:0] tag8, output [19:0] tag9, output [19:0] tag10, output [19:0] tag11,
							output [19:0] tag12, output [19:0] tag13, output [19:0] tag14, output [19:0] tag15);
	
	TagRegister20_bit t0( clk,  reset, regWrite[0], inputTag, tag0);
	TagRegister20_bit t1( clk,  reset, regWrite[1], inputTag, tag1);
	TagRegister20_bit t2( clk,  reset, regWrite[2], inputTag, tag2);
	TagRegister20_bit t3( clk,  reset, regWrite[3], inputTag, tag3);
	TagRegister20_bit t4( clk,  reset, regWrite[4], inputTag, tag4);
	TagRegister20_bit t5( clk,  reset, regWrite[5], inputTag, tag5);
	TagRegister20_bit t6( clk,  reset, regWrite[6], inputTag, tag6);
	TagRegister20_bit t7( clk,  reset, regWrite[7], inputTag, tag7);
	TagRegister20_bit t8( clk,  reset, regWrite[8], inputTag, tag8);
	TagRegister20_bit t9( clk,  reset, regWrite[9], inputTag, tag9);
	TagRegister20_bit t10(clk,  reset, regWrite[10], inputTag, tag10);
	TagRegister20_bit t11(clk,  reset, regWrite[11], inputTag, tag11);
	TagRegister20_bit t12(clk,  reset, regWrite[12], inputTag, tag12);
	TagRegister20_bit t13(clk,  reset, regWrite[13], inputTag, tag13);
	TagRegister20_bit t14(clk,  reset, regWrite[14], inputTag, tag14);
	TagRegister20_bit t15(clk,  reset, regWrite[15], inputTag, tag15);
	
endmodule


module CacheSet(input clk, input reset, input [15:0] lineWrite, input [19:0] inputTag, input [127:0] inputData,
						input [15:0] validArray , input [15:0] dirtyArray, output reg [19:0] outTag, output reg[127:0] outData,
						output reg outValid, output reg outDirty);

	wire [19:0] tag0,tag1,tag2,tag3,tag4,tag5,tag6,tag7,tag8,tag9,tag10,tag11,tag12,tag13,tag14,tag15;
	wire [127:0] data0,data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12,data13,data14,data15;
	wire [15:0] valid;
	wire [15:0] dirty;
	
	TagRegisterSet tagSet(clk,reset,lineWrite,inputTag,tag0,tag1,tag2,tag3,tag4,tag5,tag6,tag7,tag8,tag9,tag10,
								 tag11,tag12,tag13,tag14,tag15);
	
	mux16to1_20bits tagMux(tag0,tag1,tag2,tag3,tag4,tag5,tag6,tag7,tag8,tag9,tag10,tag11,tag12,tag13,tag14,tag15,index,outTag);

	DataRegisterSet dataSet(clk,reset,lineWrite,inputData,data0,data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,
									data11,data12,data13,data14,data15);
									
	mux16to1_128bits dataMux(data0,data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12,data13,data14,data15,index,outData);
	
	statusRegister_2Bytes validBits(clk, reset, lineWrite, validArray , valid);
	mux16to1_1bit validBitMux(valid[0],valid[1],valid[2],valid[3],valid[4],valid[5],valid[6],valid[7],
									  valid[8],valid[9],valid[10],valid[11],valid[12],valid[13],valid[14],valid[15],
									  index,outValid);
	
	statusRegister_2Bytes dirtyBits(clk, reset, lineWrite, dirtyArray , dirty);
	mux16to1_1bit dirtyBitMux(dirty[0],dirty[1],dirty[2],dirty[3],dirty[4],dirty[5],dirty[6],dirty[7],
									  dirty[8],dirty[9],dirty[10],dirty[11],dirty[12],dirty[13],dirty[14],dirty[15],
									  index,outDirty);
									  
	// Need to have a status register for the FIFO Counter								  

endmodule

module testbench;
	// Input
	reg clk, reset, regWrite;
	reg [4:0] rs1_a, rs2_a,rd_a,rs1_b,rs2_b,rd_b;
	reg [31:0] writeData_a;
	reg [31:0] writeData_b;
	// Output
	wire [31:0] rs1_A, rs1_B, rs2_A, rs2_B;
	
	registerFile r1( clk,  reset,  regWrite,  rs1_a,   rs2_a,  rs1_b,  rs2_b, rd_a, rd_b,writeData_a, writeData_b,  rs1_A,	rs2_A, rs1_B, rs2_B);
	
	always
		#5 clk=~clk;
	initial
		begin
			clk=0;reset=1; rs1_a=5'd0; rs1_b=5'd1; rs2_a=5'd2; rs2_b=5'd3; rd_a=5'd4; rd_b=5'd5; regWrite=1; writeData_a=32'hAAAAAAAA; writeData_b=32'hBBBBBBBB;
			#5 reset=0;
			#10 rs1_a=5'd4; rs1_b=5'd6; rs2_a=5'd18; rs2_b=5'd16; rd_a=5'd13; rd_b=5'd12; regWrite=1; writeData_a=32'hDEADBEEF; writeData_b=32'hFFFFFFFF;
			/*
			#10 rs=4'd15; rt=4'd14; rd=4'd14; regWrite=1; writeData=32'h12345678;
			#10 rs=4'd15; rt=4'd14; rd=4'd1; regWrite=1; writeData=32'hDEADBEEF;
			#10 rs=4'd15; rt=4'd1; rd=4'd1; regWrite=1; writeData=32'h12345678;
			#10 rs=4'd15; rt=4'd1; rd=4'd2; regWrite=1; writeData=32'hBABABABE;
			#10 rs=4'd2; rt=4'd1; rd=4'd2; regWrite=0; writeData=32'h12345678;
			#10 rs=4'd2; rt=4'd1; rd=4'd2; regWrite=0; writeData=32'h12345678;
			*/
			#10 $finish;
		end
endmodule


