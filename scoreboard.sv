`include "transaction.sv"
class Scoreboard;
   mailbox #(Transaction) mtoscb;
//fifo;
   Transaction tr;
   logic[7:0] fifo[$];
   int 	   count;
   int trno;
   int qsize;
 
   function new(mailbox #(Transaction)mtoscb);
      this.mtoscb=mtoscb;
      count=0;
      trno=0;
    
   
   endfunction; // new

   task addToQueue(logic[7:0] data);// 8 bit logic
      if(qsize==256)
	 $display("FIFO FULL");
      else begin
	 $display("++++++++++ SCB : Write Request : Data recieved %h ++++++",data);
	 fifo.push_front(data);
	 qsize++;
      end 
      
   endtask // addtoqueue

   task popFromQueue(logic[7:0] data);
      if (qsize==0)
	$display ("FIFO EMPTY");
      else if (data != fifo.pop_back())
	$display("---------DATA MISMATCH ERROR : DATA %h----------", data);
	  else 	$display("---------RREQ : DATA %h----------", data);
	 qsize--;
   endtask // popFromQueue

   
   task run();
      forever begin
	 tr=new();
	 $display("mailbox items :",mtoscb.num());
      	 mtoscb.get(tr);
	 if(tr.WREQ)
	   addToQueue(tr.WD);
	 else if(tr.RREQ)
	   popFromQueue(tr.RD);
	 
	 trno++;
	 $display("TOTAL TRANSACTIONS TO SCB : %d ",trno);
      end
   endtask // run

endclass // Scoreboard



/*
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

























 /*
	      fifo.put(tr);
	      $display("%0t : %b,%b,\n%b%b\n%h%h\n",$time,tr.WREQ,tr.RREQ,tr.e,tr.f,tr.WD,tr.RD);
	      
	     
	 fifo.get(trr);
	   $display("RREQ : %0t : %b,%b,\n%h\n",$time,trr.WREQ,trr.RREQ,trr.e,trr.f,trr.WD,trr.RD); 
	     
	   
// $display()
	*/