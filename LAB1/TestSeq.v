`timescale 1ns / 1ps

module Multiplier;
parameter PERIOD = 10;
parameter HALFPERIOD = PERIOD/2;

	//inputs
	reg clk;
	reg reset;
	reg len_valid;
	reg in_valid;
	reg[2:0] len_in;
	reg[15:0] data_in;
	
	//outputs
	wire busy;
	wire out_valid;
	wire[7:0] C2;
	wire[7:0] C3;

	PolyMult uut(
		.rst(reset)
		.start(start)
		.clk(clk)
		.A0(A0)
		.A1(A1)
		.A2(A2)
		.A3(A3)
		.B0(B0)
		.B1(B1)
		.B2(B2)
		.B3(B3)
		.C0(C0)
		.C1(C1)
		.C2(C2)
		.C3(C3)
		);

reg [7:0] A0_array[0:99];
reg [7:0] A1_array[0:99];
reg [7:0] A2_array[0:99];
reg [7:0] A3_array[0:99];
reg [7:0] B0_array[0:99];
reg [7:0] B1_array[0:99];
reg [7:0] B2_array[0:99];
reg [7:0] B3_array[0:99];
reg [7:0] C0_array[0:99];
reg [7:0] C1_array[0:99];
reg [7:0] C2_array[0:99];
reg [7:0] C3_array[0:99];


	always #HALFPERIOD clk=~clk;
	
	initial begin
		$readmemb("TestA0.txt", A0_array);
		$readmemb("TestA1.txt", A1_array);
		$readmemb("TestA2.txt", A2_array);
		$readmemb("TestA3.txt", A3_array);
		$readmemb("TestB0.txt", B0_array);
		$readmemb("TestB1.txt", B1_array);
		$readmemb("TestB2.txt", B2_array);
		$readmemb("TestB3.txt", B3_array);
		$readmemb("TestC0.txt", C0_array);
		$readmemb("TestC1.txt", C1_array);
		$readmemb("TestC2.txt", C2_array);
		$readmemb("TestC3.txt", C3_array);
	end

	integer k;
	initial begin
		clk=0;
		reset=0;
		start=0;
		A0=0;
		A1=0;
		A2=0;
		A3=0;
		B0=0;
		B1=0;
		B2=0;
		B3=0;

		#100;
		reset=1;
		#HALFPERIOD;
		#100;
		reset=0;
		start=1;

		for(k=0;k<100;k=k+1) begin
			A0 = A0_array[k];
			A1 = A1_array[k];
			A2 = A2_array[k];
			A3 = A3_array[k];
			B0 = B0_array[k];
			B1 = B1_array[k];
			B2 = B2_array[k];
			B3 = B3_array[k];
			#PERIOD;
			#PERIOD;
			#PERIOD;
			#PERIOD;
			if(C0==C0_array[k] && C1==C1_array[k] && C2==C2_array[k] && C3==C3_array[k]) begin
				$display("Test Case#%d is correct.",k);
			end
			else begin
				$display("Test Case#%d is incorrect.",k);
			
			end
		end
		start=0;
		#PERIOD
	end
endmodule