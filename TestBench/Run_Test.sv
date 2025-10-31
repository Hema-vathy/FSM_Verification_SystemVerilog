/////////////************RUN TEST BLOCK************/////////////
class run_test;
  virtual signal intf;
  
  // Constructor
  function new(virtual signal intf);
    this.intf = intf;
  endfunction
  
  task run();
    clk_gen clk_gen_h = new(intf);
    rst_gen rst_gen_h = new(intf);
    stimulus stimulus_h = new(intf);
    rst_test rst_test_h = new(intf);
    comparison comparison_h=new(intf);
    fork
      clk_gen_h.clkgen();
      rst_gen_h.rstgen();
      stimulus_h.stimuli();
      rst_test_h.rsttest();
      comparison_h.comparison_tst();
    join
  endtask
endclass
