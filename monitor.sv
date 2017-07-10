
class Monitor;
   
  Transaction tr;
   virtual iface viface;
   mailbox #(Transaction) mtoscb;
   
 
   function new(mailbox #(Transaction)mtoscb ,virtual iface viface);
// build phase
     this.viface=viface;
      this.mtoscb=mtoscb;
      tr=new();
      
   endfunction //end build phase- new
   
   task run();
     #1
       fork
	  tr.WREQ=viface.WREQ;
	  tr.WD=viface.WD;
	  tr.f=viface.f;
	  tr.RREQ=viface.RREQ;
	  tr.RD=viface.RD;
	  tr.e=viface.e;
	  mtoscb.put(tr);
       join_any
   endtask // run
  endclass