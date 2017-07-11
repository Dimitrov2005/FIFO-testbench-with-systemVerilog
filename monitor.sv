
class Monitor;
   
  Transaction tr;
   virtual iface viface;
   mailbox #(Transaction) mtoscb;
   int 	   rep;
   
 
   function new(mailbox #(Transaction)mtoscb ,virtual iface viface);
// build phase
     this.viface=viface;
      this.mtoscb=mtoscb;
      tr=new();
      
   endfunction //end build phase- new
   
   task run();
     
       repeat(rep) 
	 begin
	  @(posedge viface.clk)
	   begin
	  tr.WREQ=viface.WREQ;
	  tr.WD=viface.WD;
	  tr.f=viface.f;
	  tr.RREQ=viface.RREQ;
	  tr.RD=viface.RD;
	  tr.e=viface.e;
	   end
	  $display ("transaction for scoreboard :\n  WREQ=%b,RREQ=%b,WD=%h,RD=%h,F=%b,e=%b "
		    ,tr.WREQ,tr.RREQ,tr.WD,tr.RD,tr.f,tr.e );
	  
	  mtoscb.put(tr);
     end
      
   endtask // run
  endclass