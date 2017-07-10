`include "driver.sv"
`include "generator.sv"
`include "monitor.sv"
  class Agent;
     Generator gen;
     Driver drv;
     Monitor mon;
     mailbox #(Transaction) gentodrv,mtoscb;
     virtual iface viface;
     
     
  
     function new(mailbox #(Transaction)mtoscb,
		  virtual iface viface);// has to know about the mailbox
	//  instantiated in the environment 
	this.viface=viface;
	this.mtoscb=mtoscb;
	gentodrv=new();// istantiating the mailbox for generator to driver
	gen=new(gentodrv);
	drv=new(gentodrv,viface);
	mon=new(mtoscb,viface);
	
     endfunction
     
     //run
     task run();
	#1
	fork
	   gen.run(1);
	   drv.run();
	   mon.run();
	   
	join_any;
	
     endtask
    // end run

     
  endclass