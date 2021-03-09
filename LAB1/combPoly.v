`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:37:57 02/23/2020 
// Design Name: 
// Module Name:    PolyMult 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module PolyMult(A3,A2,A1,A0,B3,B2,B1,B0,C3,C2,C1,C0);

	input [7:0] A3,A2,A1,A0,B3,B2,B1,B0;
	output [7:0] C3,C2,C1,C0;
	
	wire [7:0] T6,T5,T4,T3,T2,T1,T0;	
	
	assign T0 = B0*A0;
	assign T1 = B1*A0 + B0*A1;
	assign T2 = B2*A0 + B1*A1 + B0*A2;
	assign T3 = B3*A0 + B2*A1 + B1*A2 + B0*A3;
	assign T4 = B3*A1 + B2*A2 + B1*A3;
	assign T5 = B3*A2 + B2*A3;
	assign T6 = B3*A3;
	
	assign C0 = T0 - T4;
	assign C1 = T1 - T5;
	assign C2 = T2 - T6;
	assign C3 = T3;
	
	
endmodule
