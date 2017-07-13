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
      

   
 /* function void post_randomize();

      $display("POST RANDOMIZATION");
      $display ("WD = %h ",WD);
      $display ("RREQ = %b, WREQ = %b",RREQ,WREQ);
      $display("--------------------------------------");
    endfunction  
  */  

endclass

