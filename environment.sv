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
      // start run phase 
    //  $display("_________ before fork join in env.run _______");
      
	fork     
	   agent.run();
	   //   $display("_________ after agent. in  env.run _______");
	   scb.run();
	  // $display("_________ after scb.run in env.run _______");
	join
     
      
//$display("_________ after fork join in env.run _______");
      
   endtask //  end run. 
   
endclass