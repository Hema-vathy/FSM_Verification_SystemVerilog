////////////***********COMPARISON TEST BLOCK***********////////////
class comparison;
  virtual signal intf;
  function new(virtual signal intf);
    this.intf=intf;
  endfunction
  task comparison_tst();
    forever @(posedge intf.clock,posedge intf.reset) begin
       if(intf.reset==1)begin
         if(intf.detector_out==0 && intf.sequence_q.size() ==0) begin
          $display("1.the test is passed at reset = %d and detector_out=%d @ %d",intf.reset,intf.detector_out,$time);
         end 
         else begin
          $display("2.test is not passed at reset=%d and detector_out=%d @ %d",intf.reset,intf.detector_out,$time);
         end
      end
      else begin
        intf.sequence_q.push_back(intf.sequence_in);
        if (intf.sequence_q.size() > 5) begin
           intf.sequence_q.pop_front();
         end
        else begin
          if(intf.sequence_q.size()<4 && intf.detector_out==0)begin
            $display("3.Test is passed for sequence_q=%p at detector_out =%d",intf.sequence_q,intf.detector_out);
          end
          else begin
            $display("4.Test is not passed for sequence_q=%p at detector_out =%d",intf.sequence_q,intf.detector_out);
          end
        end

         // Check for the pattern 1011
        
        if (intf.sequence_q.size() == 5 &&
           intf.sequence_q[0] == 1 &&
           intf.sequence_q[1] == 0 &&
           intf.sequence_q[2] == 1 &&
            intf.sequence_q[3] == 1)begin
           if(intf.detector_out==1) begin
            $display("5.The test is passed for sequence_q=%p and detector_out=%d",intf.sequence_q,intf.detector_out);
             end
             else begin
            $display("6.The test is not passed for sequence_q=%p and detector_out=%d",intf.sequence_q,intf.detector_out);
             end
          end
        else if (intf.sequence_q.size() == 5 &&
                 (intf.sequence_q[0] != 1 ||
                  intf.sequence_q[1] != 0 ||
                  intf.sequence_q[2] != 1 ||
                  intf.sequence_q[3] != 1))begin
                 if(intf.detector_out==0)begin
                  $display("7.The test is passed for sequence_q=%p and detector_out=%d",intf.sequence_q,intf.detector_out);
                   end
                  else begin
          $display("8.The test is not passed for sequence_q=%p and detector_out=%d",intf.sequence_q,intf.detector_out);
                  end
        end 
      end
    end
  endtask
endclass
