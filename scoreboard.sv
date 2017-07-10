`include "transaction.sv"
class Scoreboard;
   mailbox #(Transaction) mtoscb;
   Transaction tr;
   mailbox fifo;
   int 	   count;
   
   function new(mailbox #(Transaction)mtoscb);
      this.mtoscb=mtoscb;
      fifo=new();
      count=0;
      
   endfunction; // new
   
      
   task run();
      #1
	mtoscb.get(tr);
      
      //@(posedge clk)
      if(count==256)
	$display("FULL");
      else if (count==0)
	$display("EMPTY");
      

	  
     // @(posedge clk)
      if(tr.WREQ)
	begin
	   byte temp1=tr.WD;
	   
	   fifo.put(temp1);
	   count=count+1;
	   $display("Write Request : Data recieved %h",tr.WD);
	end
    //  @(posedge clk)
	if(tr.RREQ)
	  begin
	     byte temp;
	     fifo.get(temp);
	     count=count-1;
	       assert(temp==tr.RD)
		 $error("DATA MISMATCH,  Data %d : Recieved %d",temp,tr.RD);
	  end
	 
   endtask // run

   endclass