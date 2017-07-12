
`include "interface.sv"
`include "test.sv"
`include "FIFO.v" 


module test_top;
   
   
   bit clk,rst;
   iface iface(clk,rst);
   test t;
  

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
   
initial begin
   clk=0;
   rst=1;
   #1 rst=0;
   end
initial begin 
 t=new(iface);
  t.run();
   end
always #4 clk=~clk;
  

endmodule // test_top
