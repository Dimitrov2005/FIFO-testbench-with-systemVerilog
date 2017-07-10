class Generator;
   rand Transaction tr;
   mailbox #(Transaction) gentomon;
 
 
	 function new( mailbox #(Transaction) gentomon);
	 //constructor for the generator class
	    this.gentomon=gentomon;// gets handle from evironment
	 endfunction; // new

   task run(int rep); // run phase 
     fork  
	repeat(rep)
	begin    
	   tr=new();
	   a1: assert(tr.randomize())// randomize transaction 
	   else $fatal("Randomization of transaction failed");	
	   gentomon.put(tr);	  //send it to driver
	end
     join_none // so that run doesn't block
   endtask
endclass  
      
   
   
	
