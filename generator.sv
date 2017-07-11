class Generator;
   rand Transaction tr;
   mailbox #(Transaction) gentomon;
   int 	   rep;
   
   
   function new(mailbox #(Transaction) gentomon);
      //constructor for the generator class
      this.gentomon=gentomon;// gets handle from agent's mailbox
   endfunction; // new

   task run(); // run phase
	   repeat(rep)
	     begin    
		tr=new();
	if(!tr.randomize())// randomize transaction 
		 $error("Randomization of transaction failed");	
		gentomon.put(tr);	  //send it to driver
	     end

     
   endtask // run


   
endclass  


   
	
