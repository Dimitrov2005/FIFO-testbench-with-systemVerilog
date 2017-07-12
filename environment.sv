`include "scoreboard.sv"
`include "agent.sv"
class Environment;
   Scoreboard scb;
   Agent agent;
   virtual iface viface;
   mailbox #(Transaction) mtoscb;

   function new(virtual iface viface);
      this.viface=viface;
      mtoscb=new();
      scb=new(mtoscb);
      agent=new(mtoscb,viface);
      
   endfunction; // new- end of build phase
  
 
   task run();
      fork
            scb.run();
	    agent.run();
      join
   endtask //  end run. 
   
endclass // Environment