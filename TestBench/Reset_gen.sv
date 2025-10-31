///////////*****************RESET GENERATION BLOCK*****************///////////
class rst_gen;
   virtual signal intf;
  function new(virtual signal intf);
    this.intf=intf;
  endfunction
  task rstgen();
    $display("reset is generated");
    @ (posedge intf.clock) begin
    #20 intf.reset=1'b0;
    end
  endtask
endclass
