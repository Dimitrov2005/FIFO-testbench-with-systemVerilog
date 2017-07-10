`include "environment.sv"
program test(iface viface);
   
   Environment env;
   initial 
   begin
      env = new(viface);
      env.run();
   end
endprogram 