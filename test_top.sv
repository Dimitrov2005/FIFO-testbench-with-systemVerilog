`include "interface.sv"
`include "test.sv"
`include "FIFO.v"
module test_top;
   
   bit clk,rst;
   
initial begin
   clk=1;
   rst=1;
   #5rst=0;  
   end

always #5 clk=~clk;
  
   

   iface iface(clk,reset);
   test t(iface);
  
 fifo DUT(.WREQ(iface.WREQ),
	    .WD(iface.WD),
	    .f(iface.f),
	    .e(iface.e),
	    .RREQ(iface.RREQ),
	    .RD(iface.RD),
	    .rst(iface.rst),
	    .clkw(iface.clk),
	    .clkr(iface.clk)
	    );
   
endmodule; // test_top
