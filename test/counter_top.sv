module top();

  import counter_pkg::*;

  parameter cycle = 10 ;
 
  reg clock ;

 counter_if DUV_IF(clock);

 counter_base_test base_test_h ;



  counter MO12(.clk(clock),
               .data_in(DUV_IF.data_in),
               .reset(DUV_IF.reset),
               .load(DUV_IF.load),
               .mode(DUV_IF.mode),
               .data_out(DUV_IF.data_out));

   
 initial 
    begin 
      clock = 1'b0;
      forever #(cycle/2) clock = ~clock;
   end 

 initial 
   begin  
     if($test$plusargs("TEST1"))
      begin 
     base_test_h = new(DUV_IF,DUV_IF,DUV_IF);
     number_of_transactions = 1000;
     base_test_h.build();
     base_test_h.run();
   $finish ;
  end 

  end 
endmodule
