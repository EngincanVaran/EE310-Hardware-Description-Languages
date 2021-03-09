`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:33:39 02/23/2020 
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
module PolyMult(clk, rst, start, A3, A2, A1, A0, B3, B2, B1, B0, finish, C3, C2, C1, C0);
   	 
input clk, rst, start;
input [7:0] A3, A2, A1, A0, B3 , B2 , B1 , B0;
output reg finish ;
output reg [7:0] C3, C2, C1, C0;

reg [5:0] counter;
reg [7:0] T0,T1,T2,T3,T4,T5,T6; 

reg [7:0] mult, sum, sub, m1, m2, s1, s2, sb1, sb2;

always @ (*)
begin
	mult = m1 * m2;
	sum = s1 + s2;
	sub = sb1 - sb2;
end

always @ (posedge clk or posedge rst)
begin
	if(rst == 1)
	begin
		counter <= 0;
		finish <= 0;
		C3 <= 0;
		C2 <= 0;
		C1 <= 0;
		C0 <= 0;
		T0 <= 0;
		T1 <= 0;
		T2 <= 0;
		T3 <= 0;
		T4 <= 0;
		T5 <= 0;
		T6 <= 0;
		m1 <= 0;
		m2 <= 0;
		s1 <= 0;
		s2 <= 0;
		sb1 <= 0;
		sb2 <= 0;
	end
	else if(counter == 0)
	begin
		if(start == 1)
		begin
			counter <= 1;
			start <= 0;
		end
	end
	else if(counter == 1) //T0 = A0*B0
	begin
		m1 <= A0; 
		m2 <= B0;
		counter <= 2;
	end
	else if(counter == 2) //T1 = A1*B0
	begin
		T0 <= mult; //A0B0
		m1 <= A1;
		m2 <= B0;
		counter <= 3;
	end
	else if(counter == 3) //T1 = A0*B1 + A1*B0
	begin
		m1 <= A0;
		m2 <= B1;
		T1 <= mult; //A1B0
		counter <= 4;
	end
	else if(counter == 4)
	begin
		s1 <= mult;
		s2 <= T1;
		m1 <= A0;
		m2 <= B2;
		counter <= 5;
	end
	else if(counter == 5)
	begin
		T1 <= sum; //T1 ended
		T2 <= mult;
		m1 <= A1;
		m2 <= B1;
		counter <= 6;
	end
	else if(counter == 6) //T2 = A0B2 + A1B1
	begin
		m1 <= A2;
		m2 <= B0;
		s1 <= T2;
		s2 <= mult;
		counter <= 7;
	end
	else if(counter == 7)
	begin
		s1 <= sum;
		s2 <= mult;
		m1 <= A0; //T3 started
		m2 <= B3;
		counter <= 8;
	end
	else if(counter == 8)
	begin
		T2 <= sum; //T2 ended
		s1 <= mult;
		m1 <= A1;
		m2 <= B2;
		counter <= 9;
	end
	else if(counter == 9)
	begin
		s2 <= mult;
		m1 <= A2;
		m2 <= B1;
		counter <= 10;
	end
	else if(counter == 10)
	begin
		m1 <= A3;
		m2 <= B0;
		s1 <= sum;
		s2 <= mult;
		counter <= 11;
	end
	else if(counter == 11)
	begin
		m1 <= A1;
		m2 <= B3;
		s1 <= sum;
		s2 <= mult;
		counter <= 12;
	end
	else if(counter == 12)
	begin
		T3 <= sum; //T3 ended
		s1 <= mult;
		m1 <= A2;
		m2 <= B2;
		counter <= 13;
	end
	else if(counter == 13)
	begin
		s2 <= mult;
		m1 <= A3;
		m2 <= B1;
		counter <= 14;
	end
	else if(counter == 14)
	begin
		s1 <= mult;
		s2 <= sum;
		m1 <= A2;
		m2 <= B3;
		counter <= 15;
	end
	else if(counter == 15)
	begin
		T4 <= sum;
		s1 <= mult;
		m1 <= A3;
		m2 <= B2;
		counter <= 16;
	end
	else if(counter == 16)
	begin
		s2 <= mult;
		m1 <= A3;
		m2 <= B3;
		counter <= 17;
	end
	else if(counter == 17)
	begin
		T5 <= sum;
		T6 <= mult;
		sb1 <= T0;
		sb2 <= T4;
		counter <= 18;
	end
	else if(counter == 18)
	begin
		C0 <= sub;
		sb1 <= T1;
		sb2 <= T5;
		counter <= 19;
	end
	else if(counter == 19)
	begin
		C1 <= sub;
		sb1 <= T2;
		sb2 <= T6;
		counter <= 20;
	end
	else if(counter == 20)
	begin
		C2 <= sub;
		C3 <= T3;
		finish <= 1;
		counter <= 0;
	end
	
end

endmodule
