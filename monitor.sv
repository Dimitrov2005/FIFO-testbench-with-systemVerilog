
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
      rep=0;
      
   endfunction //end build phase- new
   
   task run(); 
   
      forever 
	begin
	  @(posedge viface.clk) 
	  tr.WREQ<=viface.WREQ;
	  tr.WD<=viface.WD;
	  tr.f<=viface.f;
	  tr.RREQ<=viface.RREQ;
	  tr.RD<=viface.RD;
	  tr.e<=viface.e; 
	  mtoscb.put(tr);
	   rep++;
	   
//("%0t : VIF TO SCB \n  WREQ=%b,RREQ=%b,WD=%h,RD=%h,f=%b,e=%b \n  "
		  //  ,$time,tr.WREQ,tr.RREQ,tr.WD,tr.RD,tr.f,tr.e );
           end
   endtask // run
  endclass