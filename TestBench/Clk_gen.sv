///////////////*************CLOCK GENERATION BLOCK*************///////////////
class clk_gen;
  virtual signal intf;
  function new(virtual signal intf);
    this.intf=intf;
  endfunction
  task clkgen();
    $display("clock is generated");
    forever #5 intf.clock=~intf.clock;
  endtask
endclass
