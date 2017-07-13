`include "environment.sv"
program test(iface viface);
   
   Environment env;
   int repc =10;
   
   
  initial begin 
     $display("_______ START TEST. SV ________________");
      env=new(viface);
      env.agent.gen.rep=repc;
     env.run(); 
    // wait(env.agent.gen.ended);
    ///// wait(env.agent.drv.count==env.agent.gen.rep);
   //  $finish();
  end // initial begin
   
endprogram
   
     
/*  task w8();
   wait(env.agent.gen.ended);
   wait(env.agent.drv.count==env.agent.gen.rep);
    $finish();
  endtask;*/



  /*initial 
   begin
      env = new(viface);
      env.agent.gen.rep=5;
   end
   */
  
  /* task run();
      
      $display("_______ START TEST. SV ________________");
    	env.run();
     
      
   endtask // run
   */

   
//endclass