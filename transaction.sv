class Transaction;
   rand logic WREQ;
   rand logic RREQ;
   rand logic [7:0] WD; // data to write 
   //--------- randomized values ------------------------

   logic [7:0] RD; // data to read
   logic       e;// bit for empty
   logic       f;//bit for full 
   
   constraint rr_wr
     {
      RREQ!=WREQ;
   };
      constraint dist_wr_rr{
			WREQ dist{  1:/70,0:/30 };
	 RREQ dist {1:/30,0/70};
      };
	 
      

   
 /* function void post_randomize();

      $display("POST RANDOMIZATION");
      $display ("WD = %h ",WD);
      $display ("RREQ = %b, WREQ = %b",RREQ,WREQ);
      $display("--------------------------------------");
    endfunction  
  */  

endclass

