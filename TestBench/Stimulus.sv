///////////************INPUT GENERATION BLOCK************///////////
class stimulus;
  virtual signal intf;
  function new(virtual signal intf);
    this.intf=intf;
  endfunction
  task stimuli();
    repeat(50) @(posedge intf.clock) begin
      intf.sequence_in=$urandom_range(0,1);
      $display("sequence_in=%d @ %d",intf.sequence_in,$time);
    end
    $finish;
  endtask
endclass
