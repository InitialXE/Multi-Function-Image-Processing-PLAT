// Verilog netlist created by Tang Dynasty v5.6.119222
// Sat Oct 19 17:02:49 2024

`timescale 1ns / 1ps
module fifo_1  // fifo_1.v(14)
  (
  clk,
  di,
  re,
  rst,
  we,
  do,
  empty_flag,
  full_flag
  );

  input clk;  // fifo_1.v(24)
  input [7:0] di;  // fifo_1.v(23)
  input re;  // fifo_1.v(25)
  input rst;  // fifo_1.v(22)
  input we;  // fifo_1.v(24)
  output [7:0] do;  // fifo_1.v(27)
  output empty_flag;  // fifo_1.v(28)
  output full_flag;  // fifo_1.v(29)

  wire empty_flag_syn_2;  // fifo_1.v(28)
  wire full_flag_syn_2;  // fifo_1.v(29)

  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  not empty_flag_syn_1 (empty_flag_syn_2, empty_flag);  // fifo_1.v(28)
  EG_PHY_FIFO #(
    .AE(32'b00000000000000000000000000110000),
    .AEP1(32'b00000000000000000000000000111000),
    .AF(32'b00000000000000000001111111010000),
    .AFM1(32'b00000000000000000001111111001000),
    .ASYNC_RESET_RELEASE("SYNC"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .E(32'b00000000000000000000000000000000),
    .EP1(32'b00000000000000000000000000001000),
    .F(32'b00000000000000000010000000000000),
    .FM1(32'b00000000000000000001111111111000),
    .GSR("DISABLE"),
    .MODE("FIFO8K"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"))
    fifo_inst_syn_2 (
    .clkr(clk),
    .clkw(clk),
    .csr({2'b11,empty_flag_syn_2}),
    .csw({2'b11,full_flag_syn_2}),
    .dia({open_n47,di}),
    .orea(1'b0),
    .oreb(1'b0),
    .re(re),
    .rprst(rst),
    .rst(rst),
    .we(we),
    .dob({open_n68,do}),
    .empty_flag(empty_flag),
    .full_flag(full_flag));  // fifo_1.v(41)
  not full_flag_syn_1 (full_flag_syn_2, full_flag);  // fifo_1.v(29)

endmodule 

