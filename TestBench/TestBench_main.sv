//////////////************TOP FILE OF TESTBENCH************//////////////
`include "interface.sv"
`include "files.sv"
import pkg::*;
module Sequence_Detector_MOORE_Verilog_tb_top();
  
  signal intf();
  
  Sequence_Detector_MOORE_Verilog Sequence_Detector_MOORE_Verilog_inst(.clock(intf.clock),.reset(intf.reset),.sequence_in(intf.sequence_in),.detector_out(intf.detector_out));
  
  initial begin
    intf.clock=1'b1;
    intf.reset=1'b1;
    intf.sequence_in=1'b1;
  end
  
  initial begin
    run_test run_test_h=new(intf);
    run_test_h.run();
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
endmodule
