/////////***********RESET TEST BLOCK***********/////////
class rst_test;
  virtual signal intf;
  function new(virtual signal intf);
    this.intf=intf;
  endfunction
  task rsttest();
    $display("reset test is generated");
    @ (posedge intf.clock) begin
    #100 intf.reset=1'b1;
    #10 intf.reset=1'b0;
    end
  endtask
endclass
