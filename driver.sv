
class Driver;
   
   mailbox #(Transaction) gentomon;
   virtual iface viface;
   Transaction tr;
   int 	   count=0;
   
   
   
   function new(mailbox #(Transaction) gentomon, 
	       	virtual iface viface);//constructor for driver
      this.gentomon=gentomon;
      this.viface=viface;
      tr=new();
      
   endfunction //end new
   
   //run phase
   task run();
      
      forever
	begin 
	   @(posedge viface.clk)
	   gentomon.get(tr); 
	   $display ("%0t : DRV TO VIF \n  WREQ=%b,RREQ=%b,WD=%h \n "
				       ,$time,tr.WREQ,tr.RREQ,tr.WD);
	   viface.WREQ<=tr.WREQ;
	   viface.WD<=tr.WD;
	   viface.RREQ<=tr.RREQ;
	   count++;
	   
	end
       

   endtask //end run

   
endclass
      
