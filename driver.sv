
class Driver;
   
   mailbox #(Transaction) gentomon;
   virtual iface viface;
   Transaction tr;
   int 	   rep;
   
   
   
   function new(mailbox #(Transaction) gentomon, 
	       	virtual iface viface);//constructor for driver
      this.gentomon=gentomon;
      this.viface=viface;
   endfunction //end new
   
   //run phase
   task run();
	     repeat(rep) begin 
	     gentomon.get(tr);
	     @(posedge viface.clk)
	       begin
		  viface.WREQ<=tr.WREQ;
		  viface.WD<=tr.WD;
		  viface.f<=tr.f;
		  viface.RREQ<=tr.RREQ;
		  viface.RD<=tr.RD;
		  viface.e<=tr.e;
	       end
	    $display ("transaction for viface :\n  WREQ=%b,RREQ=%b,WD=%h,RD=%h,F=%b,e=%b "
		    ,tr.WREQ,tr.RREQ,tr.WD,tr.RD,tr.f,tr.e );
	end     

   endtask //end run

   
endclass
      
