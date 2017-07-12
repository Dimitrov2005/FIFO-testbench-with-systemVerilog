`include "transaction.sv"
class Scoreboard;
   mailbox #(Transaction) mtoscb;
   Transaction tr,trr;
   Transaction fifo[$];
   int 	   count;
   int trno;
 
   
   
   
   function new(mailbox #(Transaction)mtoscb);
      this.mtoscb=mtoscb;
      tr=new();
      count=0;
      trno=0;
      
   endfunction; // new
   
   
   task run();
      forever 
	begin
	   if(mtoscb.try_get(tr))
	     begin 
		// trno++;
		if(tr.WREQ)
		  begin trno++;
		     $display("++++++++++ SCB : Write Request : Data recieved %h trNO:%d ++++++",tr.WD,trno);
		     fifo.push_front(tr);
		     // if(!fifo.try_put(tempw))
		     // $display ("++++++++++++++++++ SCB ::: FULL++++++++++++++++++");
		  end
		
		else if(tr.RREQ)
		  begin
		     trr=new();
		     trr=fifo.pop_back();
		     $display("++++++++++ SCB : RREQ OK  +++++++++++ "); 
		     if (trr.RD!=tr.RD)
		       $display("!!!!!!!!!DATA MISMATCH,  Data %d : Recieved %d !!!!!!!!",trr.RD,tr.RD);
		  end
		else $fatal("ERROR 01 -[SCBMBE]-Empty mailbox in scoreboard");
	     end // while (mtoscb.try_get(tr))
	end

      
      $display("TOTAL TRANSACTIONS TO SCB : %d ",trno);
   endtask // run

endclass