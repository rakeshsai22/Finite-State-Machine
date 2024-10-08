`timescale 1ns/1ns


module fsm_tb;
  logic clk;
  logic rst;
  logic in;
  logic out;
  
  examplfsm dut(.clk(clk),
             .rst(rst),
             .X(in),
             .Y(out));
  
  initial begin
    rst <= 1; #10;
    rst <=0; in<=0; #10;
    in <= 1; #10;
    $display(dut.Y);
    in <= 1; #10;
    $display(dut.Y);
    
    in <= 1; #10;
    $display(dut.Y);
    in <= 0; #10;
    $display(out);
  end
  
  always begin
    clk <= 1; #5;
    clk <= 0; #5;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,fsm_tb);
  end
endmodule
