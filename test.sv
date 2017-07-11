`include "environment.sv"
class test;
   
   Environment env;
   int repc =2;
   
   
   function new(virtual iface viface);
      env=new(viface);
      env.agent.gen.rep=repc;
      env.agent.mon.rep=repc;
      env.scb.rep=repc;
      env.agent.drv.rep=repc;
      
      
   endfunction // new
   
     


  /*initial 
   begin
      env = new(viface);
      env.agent.gen.rep=5;
   end
   */
  
   task run();
      $display("_______ START TEST. SV ________________");
    	env.run();
      $display(" +_______________ AFTER TEST.SV__________");
      
   endtask // run
   

   
endclass