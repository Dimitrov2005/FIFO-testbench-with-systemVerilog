
class Driver;
   
	mailbox #(Transaction) gentomon;
	virtual iface viface;
        Transaction tr;
   
	function new(mailbox #(Transaction) gentomon, 
	       	virtual iface viface);//constructor for driver
		this.gentomon=gentomon;
		this.viface=viface;
	endfunction //end new
   
//run phase
   task run();
     forever begin
	gentomon.get(tr);
	@(posedge viface.clk)
	viface.WREQ<=tr.WREQ;
	viface.WD<=tr.WD;
	viface.f<=tr.f;
        viface.RREQ<=tr.RREQ;
	viface.RD<=tr.RD;
	viface.e<=tr.e;
     end
   endtask //end run
   
endclass
      
