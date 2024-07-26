module counter (clk,data_in,reset,load,mode,data_out);

  input clk ,reset,mode,load ;
  input [3:0] data_in;
  output reg  [3:0] data_out ;



     always@(posedge clk)
        begin
          if(reset)
             data_out <= 4'd0;

           else if(load)
             data_out <= data_in;

         else if (mode==1'b0)
              begin
               
           if(data_out==4'd11)
           data_out <= 4'd0;
             else 
              data_out <= data_out + 1'b1;

                end 

          else if(mode==1'b1)
           begin
                
                 if(data_out == 4'd0)
            data_out <= 4'd11 ;
             else 
               data_out <= data_out-1'b1 ;

      end

        end



endmodule

