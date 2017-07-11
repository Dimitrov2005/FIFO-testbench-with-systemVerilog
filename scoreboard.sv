`include "transaction.sv"
class Scoreboard;
   mailbox #(Transaction) mtoscb;
   Transaction tr;
   mailbox #(byte) fifo;
   int 	   count;
   int trno;
   byte tempw,tempr;
   
   
   
   function new(mailbox #(Transaction)mtoscb);
      this.mtoscb=mtoscb;
      fifo=new();
      tr=new();
    
      count=0;
      trno=0;
      
   endfunction; // new
   
   
   task run();
      $display("_____________________IN SCB++++++++++++++++++");
      
      forever 
	begin
	   mtoscb.try_get(tr);
	   trno++;
	   if(tr.WREQ)
	     begin
		tempw=tr.WD;
		
		if(fifo.try_put(tempw))
		  $display("++++++++++ SCB : Write Request : Data recieved %h++++++",tr.WD);
		else $display ("++++++++++++++++++ SCB ::: FULL++++++++++++++++++");
	     end
	   
	   if(tr.RREQ)
	     begin
		
		if(!fifo.try_get(tempr))$display("+++++++++++++++++ SCB ::: EMPTY++++++++++++++++++"); 
		
		if (tempr!=tr.RD)
		  $display("!!!!!!!!!DATA MISMATCH,  Data %d : Recieved %d !!!!!!!!",tempr,tr.RD);
		//	 
	     end
	end

      
      $display("TOTAL TRANSACTIONS TO SCB : %d ",trno);
   endtask // run

endclass