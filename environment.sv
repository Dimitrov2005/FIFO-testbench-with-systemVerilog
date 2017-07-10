`include "scoreboard.sv"
`include "agent.sv"
class Environment;
   Scoreboard scb;
   Agent agent;
   virtual iface viface;
   mailbox #(Transaction) mtoscb;

   function new(virtual iface viface);
      mtoscb=new();
      this.viface=viface;
      scb=new(mtoscb);
      agent=new(mtoscb,viface);
      
   endfunction; // new- end of build phase

   task run();
 // start run phase 
     #1
       fork     
	  agent.run();
	  scb.run();
       join_any  
   endtask; //  end run. 
   
endclass