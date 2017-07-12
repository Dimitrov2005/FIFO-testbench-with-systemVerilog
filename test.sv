`include "environment.sv"
class test;
   
   Environment env;
   int repc =1000;
   
   
   function new(virtual iface viface);
      env=new(viface);
      env.agent.gen.rep=repc;
      
      
   endfunction // new
   
     
   // task w8();
   //  wait(env.agent.gen.ended);
   ////   wait(env.agent.drv.count==env.agent.gen.rep);
  //      $finish();
  //  endtask;



  /*initial 
   begin
      env = new(viface);
      env.agent.gen.rep=5;
   end
   */
  
   task run();
      
      $display("_______ START TEST. SV ________________");
    	env.run();
     
      
   endtask // run
   

   
endclass