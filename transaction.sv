class Transaction;
   rand bit WREQ,RREQ; // bit for write-1 read -0
   rand bit [7:0] WD,RD; // data to write/read
   bit       e;// bit for empty
   bit       f;//bit for full 
endclass
