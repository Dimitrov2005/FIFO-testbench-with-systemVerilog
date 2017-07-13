module sync_mem(A1,A2,WD1,WD2,WE1,WE2,RD1,RD2,clk1,clk2);

	input [7:0] A1,A2,WD1,WD2;
	input WE1,WE2,clk1,clk2;
	
	output [7:0] RD1,RD2;
	reg [7:0] RD1,RD2;
	reg [7:0] mem[256];
	reg [7:0] Areg1,Areg2;
	reg [7:0] WDreg1,WDreg2;
	reg  WEreg1,WEreg2;
	
	always @(posedge clk1) 
	begin
		Areg1<=A1;
		WDreg1<=WD1;
		WEreg1<=WE1;
	end
	assign RD1=mem[Areg1];

	always @(posedge clk2) 
	begin 
		Areg2<=A2;
		WDreg2<=WD2;
		WEreg2<=WE2;
	end
	assign RD2=mem[Areg2];
	
	always @(*) 
	begin
		if(WEreg1)
		mem[Areg1]=WDreg1;
	end		
	
	
endmodule

/*
module test_mem();

 	
	reg [7:0] A1,A2,WD1,WD2;
	reg WE1,WE2,clk1,clk2;

	wire [7:0] RD1,RD2;
	sync_mem DUT(A1,A2,WD1,WD2,WE1,WE2,RD1,RD2,clk1,clk2);
	 
	initial begin
		clk1=1;
		WE1=1;
		A1=8'b00000010;
		WD1=8'b00000000;
		clk2=1;
		WE2=1;
		A2=8'b00000010;
		WD2=8'b00000000;
	end

	always #5 begin clk1=~clk1;
		  clk2=~clk2;
	end
	always #100 begin
			WE1=~WE1; 
			WE2=~WE2;
			WD1=8'b00000000;
			WD2=8'b00000001;

	end

endmodule
*/	


