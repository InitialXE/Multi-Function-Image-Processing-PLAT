// Verilog netlist created by Tang Dynasty v5.6.119222
// Sat Oct 19 17:06:48 2024

`timescale 1ns / 1ps
module ss
  (
  clk,
  rst_n,
  rxd,
  tx_data,
  tx_en,
  rx_data,
  rx_err,
  rx_vld,
  tx_rdy,
  txd
  );

  input clk;
  input rst_n;
  input rxd;
  input [7:0] tx_data;
  input tx_en;
  output [7:0] rx_data;
  output rx_err;
  output rx_vld;
  output tx_rdy;
  output txd;

  parameter CLK_DIV_NUM = 27;
  parameter DATA_BIT = 8;
  parameter PARITY_BIT = "None";
  parameter STOP_BIT = "1";
  wire [7:0] al_90ec5389;
  wire [7:0] al_f45e6b02;
  wire [7:0] al_817569c7;
  wire [4:0] al_6a9e51a6;
  wire [4:0] al_7969b083;
  wire [7:0] al_b9239e2f;
  wire [7:0] al_a4b303d;
  wire [7:0] al_d0c3ff20;
  wire [2:0] al_868bc035;
  wire [5:0] al_255c21cc;
  wire [5:0] al_d122a757;
  wire [5:0] al_df0b60fc;
  wire [2:0] al_64cda68c;
  wire [2:0] al_51453453;
  wire  al_922a4f67;
  wire  al_e27cb87a;
  wire  al_ce65502c;
  wire  al_33eb1ced;
  wire  al_b9fec681;
  wire  al_a3d9dae8;
  wire  al_149ae289;
  wire  al_f87d97e5;
  wire [2:0] al_82156b0c;
  wire [3:0] al_ab9d8a6b;
  wire [3:0] al_5394316e;
  wire [3:0] al_486f2586;
  wire [7:0] al_66ac1e2c;
  wire [7:0] al_bbbd5217;
  wire al_86956b0e;
  wire al_21bd847a;
  wire al_d93c39e1;
  wire al_2d005ce9;
  wire al_5cdabfc7;
  wire al_7fa67d8;
  wire al_ef41e23f;
  wire al_e18ead92;
  wire al_deb74b51;
  wire al_f601b422;
  wire al_8b279010;
  wire al_e7ae8cc0;
  wire al_c21e2a6;
  wire al_bf2598b;
  wire al_fe9385a;
  wire al_64b5b209;
  wire al_b33be59d;
  wire al_5a5485dd;
  wire al_3a564c0b;
  wire al_9465fdb9;
  wire al_84d3e6ab;
  wire al_a55c112;
  wire al_d68af30c;
  wire al_699d25e6;
  wire al_a3a9743a;
  wire al_8f690a86;
  wire al_2c0650af;
  wire al_e127dcdf;
  wire al_c6d050a0;
  wire al_eadf504e;
  wire al_9cbfbb1e;
  wire al_ca6d3979;
  wire al_40c500fc;
  wire al_ec6cd7d3;
  wire al_aa3fb0d5;
  wire al_fdfcedb;
  wire al_47b98870;
  wire al_9aff3327;
  wire al_9d1ca9f5;
  wire al_72ec379c;
  wire al_1b634103;
  wire al_fb6ca26f;
  wire al_2f615027;
  wire al_2170d534;
  wire al_796f58da;
  wire al_f89cadd9;
  wire al_9c4c2090;
  wire al_423c9d73;
  wire al_423be2a7;
  wire al_bffee095;
  wire al_d522fb91;
  wire al_6df681ba;
  wire al_97593e28;
  wire al_aa3ca6e8;
  wire al_35df3ed5;
  wire al_f8442531;
  wire al_3da26498;
  wire al_8767dea3;
  wire al_d7374510;
  wire al_5e3aa3d9;
  wire al_5af87b6c;
  wire al_c189624b;
  wire al_93e35230;
  wire al_ab71339f;
  wire al_7b0a6f6c;
  wire al_3a1453b1;
  wire al_9212666f;
  wire al_a7cc788f;
  wire al_e9a83439;
  wire al_1590c198;
  wire al_29d2da79;
  wire al_87548dd3;
  wire al_94a79ee1;
  wire al_66b29cce;
  wire al_8e61e858;
  wire al_bb49be63;
  wire al_aa8f67aa;
  wire al_2987377d;
  wire al_e5947718;
  wire al_52820846;
  wire al_61c2c7;
  wire al_864a5aea;
  wire al_da1c411f;
  wire al_b3825293;
  wire al_728261cd;
  wire al_10c8d026;
  wire al_9ebf6313;
  wire al_102a42e0;
  wire al_5ea12a83;
  wire al_33e838fd;
  wire al_c17df76;
  wire al_3719ec71;
  wire al_815e6d01;
  wire al_ceb07ff6;
  wire al_7a41626d;
  wire al_ce8dc8c6;
  wire al_1b288f5f;
  wire al_9d8d5066;
  wire al_726b0e37;
  wire al_f957882;
  wire al_31ebf4e6;
  wire al_742955f5;
  wire al_4ee01277;
  wire al_1810ff50;
  wire al_4240b8f4;
  wire al_92a6b6c5;
  wire al_46e816d3;
  wire al_cac3f349;
  wire al_3e90220e;
  wire al_da7ff39c;
  wire al_adf78afa;
  wire al_ccf0619;
  wire al_afca84e;
  wire al_a0a16067;
  wire al_10b43969;
  wire al_c27cadcf;
  wire al_151387f2;
  wire al_7e8b6626;
  wire al_660a0fdc;
  wire al_b1e4d128;
  wire al_a576c55c;
  wire al_64f775d;
  wire al_d8cf5c0e;
  wire al_309f6fd1;

  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    al_1bbba5ea (
    .a(al_90ec5389[2]),
    .b(1'b0),
    .c(al_d93c39e1),
    .o({al_2d005ce9,al_817569c7[2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    al_3b7f5de0 (
    .a(al_90ec5389[3]),
    .b(1'b0),
    .c(al_2d005ce9),
    .o({al_5cdabfc7,al_817569c7[3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    al_599c934a (
    .a(al_90ec5389[4]),
    .b(1'b0),
    .c(al_5cdabfc7),
    .o({al_7fa67d8,al_817569c7[4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    al_6b1d4b79 (
    .a(al_90ec5389[5]),
    .b(1'b0),
    .c(al_7fa67d8),
    .o({al_ef41e23f,al_817569c7[5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    al_43f8f596 (
    .a(al_90ec5389[6]),
    .b(1'b0),
    .c(al_ef41e23f),
    .o({al_e18ead92,al_817569c7[6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    al_73b08a82 (
    .a(al_90ec5389[7]),
    .b(1'b0),
    .c(al_e18ead92),
    .o({open_n0,al_817569c7[7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    al_ae48c8b9 (
    .a(1'b0),
    .o({al_86956b0e,open_n3}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    al_45353b4 (
    .a(al_90ec5389[0]),
    .b(1'b1),
    .c(al_86956b0e),
    .o({al_21bd847a,al_817569c7[0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    al_ccc0d0f8 (
    .a(al_90ec5389[1]),
    .b(1'b0),
    .c(al_21bd847a),
    .o({al_d93c39e1,al_817569c7[1]}));
  AL_MAP_LUT3 #(
    .EQN("(~C*B*~A)"),
    .INIT(8'h04))
    al_599ce9e1 (
    .a(al_5ea12a83),
    .b(al_817569c7[0]),
    .c(tx_rdy),
    .o(al_f45e6b02[0]));
  AL_MAP_LUT2 #(
    .EQN("(~B*A)"),
    .INIT(4'h2))
    al_90d37ae6 (
    .a(al_817569c7[1]),
    .b(tx_rdy),
    .o(al_f45e6b02[1]));
  AL_MAP_LUT2 #(
    .EQN("(~B*A)"),
    .INIT(4'h2))
    al_1f39bb44 (
    .a(al_817569c7[2]),
    .b(tx_rdy),
    .o(al_f45e6b02[2]));
  AL_MAP_LUT3 #(
    .EQN("(~C*B*~A)"),
    .INIT(8'h04))
    al_d154da3a (
    .a(al_5ea12a83),
    .b(al_817569c7[3]),
    .c(tx_rdy),
    .o(al_f45e6b02[3]));
  AL_MAP_LUT3 #(
    .EQN("(~C*B*~A)"),
    .INIT(8'h04))
    al_6ea790 (
    .a(al_5ea12a83),
    .b(al_817569c7[4]),
    .c(tx_rdy),
    .o(al_f45e6b02[4]));
  AL_MAP_LUT2 #(
    .EQN("(~B*A)"),
    .INIT(4'h2))
    al_142d39f3 (
    .a(al_817569c7[5]),
    .b(tx_rdy),
    .o(al_f45e6b02[5]));
  AL_MAP_LUT3 #(
    .EQN("(~C*B*~A)"),
    .INIT(8'h04))
    al_c3024d53 (
    .a(al_5ea12a83),
    .b(al_817569c7[6]),
    .c(tx_rdy),
    .o(al_f45e6b02[6]));
  AL_MAP_LUT3 #(
    .EQN("(~C*B*~A)"),
    .INIT(8'h04))
    al_280cf27c (
    .a(al_5ea12a83),
    .b(al_817569c7[7]),
    .c(tx_rdy),
    .o(al_f45e6b02[7]));
  AL_MAP_LUT2 #(
    .EQN("(~B*~A)"),
    .INIT(4'h1))
    al_bdbcbd54 (
    .a(al_deb74b51),
    .b(al_6a9e51a6[0]),
    .o(al_7969b083[0]));
  AL_MAP_LUT3 #(
    .EQN("(A*~(~C*~B))"),
    .INIT(8'ha8))
    al_eb31a531 (
    .a(al_9aff3327),
    .b(al_6a9e51a6[1]),
    .c(al_6a9e51a6[2]),
    .o(al_deb74b51));
  AL_MAP_LUT3 #(
    .EQN("(~A*(C@B))"),
    .INIT(8'h14))
    al_389a459d (
    .a(al_deb74b51),
    .b(al_6a9e51a6[0]),
    .c(al_6a9e51a6[1]),
    .o(al_7969b083[1]));
  AL_MAP_LUT4 #(
    .EQN("(~A*(D@(C*B)))"),
    .INIT(16'h1540))
    al_4a83b285 (
    .a(al_9aff3327),
    .b(al_6a9e51a6[0]),
    .c(al_6a9e51a6[1]),
    .d(al_6a9e51a6[2]),
    .o(al_7969b083[2]));
  AL_MAP_LUT5 #(
    .EQN("(A*B*C*~(D)*~(E)+~(A)*~(B)*~(C)*D*~(E)+A*~(B)*~(C)*D*~(E)+~(A)*B*~(C)*D*~(E)+A*B*~(C)*D*~(E)+~(A)*~(B)*C*D*~(E)+A*~(B)*C*D*~(E)+~(A)*B*C*D*~(E)+A*B*C*~(D)*E+~(A)*~(B)*~(C)*D*E+A*~(B)*~(C)*D*E)"),
    .INIT(32'h03807f80))
    al_1b7d5ce3 (
    .a(al_6a9e51a6[0]),
    .b(al_6a9e51a6[1]),
    .c(al_6a9e51a6[2]),
    .d(al_6a9e51a6[3]),
    .e(al_6a9e51a6[4]),
    .o(al_7969b083[3]));
  AL_MAP_LUT5 #(
    .EQN("(A*B*C*D*~(E)+~(A)*~(B)*~(C)*~(D)*E+A*~(B)*~(C)*~(D)*E+~(A)*B*~(C)*~(D)*E+A*B*~(C)*~(D)*E+~(A)*~(B)*C*~(D)*E+A*~(B)*C*~(D)*E+~(A)*B*C*~(D)*E+A*B*C*~(D)*E+~(A)*~(B)*~(C)*D*E+A*~(B)*~(C)*D*E)"),
    .INIT(32'h03ff8000))
    al_5eed1d2f (
    .a(al_6a9e51a6[0]),
    .b(al_6a9e51a6[1]),
    .c(al_6a9e51a6[2]),
    .d(al_6a9e51a6[3]),
    .e(al_6a9e51a6[4]),
    .o(al_7969b083[4]));
  AL_DFF_X al_6acfb5b0 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_f45e6b02[0]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_90ec5389[0]));
  AL_DFF_X al_54eca49e (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_f45e6b02[1]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_90ec5389[1]));
  AL_DFF_X al_a536c0f1 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_f45e6b02[2]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_90ec5389[2]));
  AL_DFF_X al_598c756f (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_f45e6b02[3]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_90ec5389[3]));
  AL_DFF_X al_d6afee92 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_f45e6b02[4]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_90ec5389[4]));
  AL_DFF_X al_bd94d54 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_f45e6b02[5]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_90ec5389[5]));
  AL_DFF_X al_62cf55a1 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_f45e6b02[6]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_90ec5389[6]));
  AL_DFF_X al_1da609da (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_f45e6b02[7]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_90ec5389[7]));
  AL_DFF_X al_b35f341d (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_7969b083[0]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_6a9e51a6[0]));
  AL_DFF_X al_2856fab4 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_7969b083[1]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_6a9e51a6[1]));
  AL_DFF_X al_147a8704 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_7969b083[2]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_6a9e51a6[2]));
  AL_DFF_X al_9cce25f7 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_7969b083[3]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_6a9e51a6[3]));
  AL_DFF_X al_abd7f12c (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_7969b083[4]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_6a9e51a6[4]));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    al_c4f1f4a1 (
    .a(al_b9239e2f[2]),
    .b(1'b0),
    .c(al_e7ae8cc0),
    .o({al_c21e2a6,al_d0c3ff20[2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    al_a7a05058 (
    .a(al_b9239e2f[3]),
    .b(1'b0),
    .c(al_c21e2a6),
    .o({al_bf2598b,al_d0c3ff20[3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    al_23e14cd4 (
    .a(al_b9239e2f[4]),
    .b(1'b0),
    .c(al_bf2598b),
    .o({al_fe9385a,al_d0c3ff20[4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    al_64c27de (
    .a(al_b9239e2f[5]),
    .b(1'b0),
    .c(al_fe9385a),
    .o({al_64b5b209,al_d0c3ff20[5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    al_942b4e36 (
    .a(al_b9239e2f[6]),
    .b(1'b0),
    .c(al_64b5b209),
    .o({al_b33be59d,al_d0c3ff20[6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    al_c0f4ce0c (
    .a(al_b9239e2f[7]),
    .b(1'b0),
    .c(al_b33be59d),
    .o({open_n4,al_d0c3ff20[7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    al_d6480af5 (
    .a(1'b0),
    .o({al_f601b422,open_n7}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    al_2f6664d2 (
    .a(al_b9239e2f[0]),
    .b(1'b1),
    .c(al_f601b422),
    .o({al_8b279010,al_d0c3ff20[0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    al_5dd25ec (
    .a(al_b9239e2f[1]),
    .b(1'b0),
    .c(al_8b279010),
    .o({al_e7ae8cc0,al_d0c3ff20[1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    al_4977e051 (
    .a(al_255c21cc[4]),
    .b(1'b0),
    .c(al_a55c112),
    .o({al_d68af30c,al_df0b60fc[4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    al_f4c43437 (
    .a(al_255c21cc[5]),
    .b(1'b0),
    .c(al_d68af30c),
    .o({open_n8,al_df0b60fc[5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    al_1b665cd1 (
    .a(1'b0),
    .o({al_5a5485dd,open_n11}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    al_80ce9aea (
    .a(al_255c21cc[0]),
    .b(al_8e61e858),
    .c(al_5a5485dd),
    .o({al_3a564c0b,al_df0b60fc[0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    al_4193802b (
    .a(al_255c21cc[1]),
    .b(1'b0),
    .c(al_3a564c0b),
    .o({al_9465fdb9,al_df0b60fc[1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    al_422473ac (
    .a(al_255c21cc[2]),
    .b(1'b0),
    .c(al_9465fdb9),
    .o({al_84d3e6ab,al_df0b60fc[2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    al_5c94e655 (
    .a(al_255c21cc[3]),
    .b(1'b0),
    .c(al_84d3e6ab),
    .o({al_a55c112,al_df0b60fc[3]}));
  AL_MAP_LUT3 #(
    .EQN("~(C*~(B)*~(A)+C*B*~(A)+~(C)*B*A+C*B*A)"),
    .INIT(8'h27))
    al_7e502f12 (
    .a(al_97593e28),
    .b(al_d0c3ff20[0]),
    .c(al_b9239e2f[0]),
    .o(al_423be2a7));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(C*~B*A))"),
    .INIT(16'h00df))
    al_f104c4fc (
    .a(al_2170d534),
    .b(al_796f58da),
    .c(al_1b634103),
    .d(al_423be2a7),
    .o(al_a4b303d[0]));
  AL_MAP_LUT3 #(
    .EQN("~(C*~(B)*~(A)+C*B*~(A)+~(C)*B*A+C*B*A)"),
    .INIT(8'h27))
    al_a343731d (
    .a(al_97593e28),
    .b(al_d0c3ff20[1]),
    .c(al_b9239e2f[1]),
    .o(al_423c9d73));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(C*~B*A))"),
    .INIT(16'h00df))
    al_529f71c (
    .a(al_2170d534),
    .b(al_796f58da),
    .c(al_1b634103),
    .d(al_423c9d73),
    .o(al_a4b303d[1]));
  AL_MAP_LUT3 #(
    .EQN("~(C*~(B)*~(A)+C*B*~(A)+~(C)*B*A+C*B*A)"),
    .INIT(8'h27))
    al_a0719375 (
    .a(al_97593e28),
    .b(al_d0c3ff20[2]),
    .c(al_b9239e2f[2]),
    .o(al_9c4c2090));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(C*~B*A))"),
    .INIT(16'h00df))
    al_6930c7f6 (
    .a(al_2170d534),
    .b(al_796f58da),
    .c(al_1b634103),
    .d(al_9c4c2090),
    .o(al_a4b303d[2]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    al_c93481d7 (
    .a(al_6a9e51a6[3]),
    .b(al_6a9e51a6[4]),
    .o(al_9aff3327));
  AL_MAP_LUT2 #(
    .EQN("(~B*~A)"),
    .INIT(4'h1))
    al_b302e5d (
    .a(al_868bc035[1]),
    .b(al_868bc035[2]),
    .o(al_fb6ca26f));
  AL_MAP_LUT5 #(
    .EQN("(D*~(~A*~((C*B))*~(E)+~A*(C*B)*~(E)+~(~A)*(C*B)*E+~A*(C*B)*E))"),
    .INIT(32'h3f00aa00))
    al_d018065e (
    .a(al_7b0a6f6c),
    .b(al_c189624b),
    .c(al_9d1ca9f5),
    .d(al_fb6ca26f),
    .e(al_868bc035[0]),
    .o(al_2f615027));
  AL_MAP_LUT2 #(
    .EQN("(~B*~A)"),
    .INIT(4'h1))
    al_b7b41437 (
    .a(al_2f615027),
    .b(al_72ec379c),
    .o(al_2170d534));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    al_b90ecf92 (
    .a(al_9212666f),
    .b(al_35df3ed5),
    .o(al_796f58da));
  AL_MAP_LUT3 #(
    .EQN("~(C*~(B)*~(A)+C*B*~(A)+~(C)*B*A+C*B*A)"),
    .INIT(8'h27))
    al_6d05bc77 (
    .a(al_97593e28),
    .b(al_d0c3ff20[3]),
    .c(al_b9239e2f[3]),
    .o(al_f89cadd9));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(C*~B*A))"),
    .INIT(16'h00df))
    al_a512557d (
    .a(al_2170d534),
    .b(al_796f58da),
    .c(al_1b634103),
    .d(al_f89cadd9),
    .o(al_a4b303d[3]));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*A)"),
    .INIT(16'h0002))
    al_c9b6be5e (
    .a(al_b9239e2f[4]),
    .b(al_b9239e2f[5]),
    .c(al_b9239e2f[6]),
    .d(al_b9239e2f[7]),
    .o(al_9d1ca9f5));
  AL_MAP_LUT5 #(
    .EQN("(~E*~(~D*~(C*B*A)))"),
    .INIT(32'h0000ff80))
    al_dfd975c6 (
    .a(al_c189624b),
    .b(al_9d1ca9f5),
    .c(al_868bc035[0]),
    .d(al_868bc035[1]),
    .e(al_868bc035[2]),
    .o(al_72ec379c));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*~B*A)"),
    .INIT(16'h0020))
    al_6d074c26 (
    .a(al_9aff3327),
    .b(al_6a9e51a6[0]),
    .c(al_6a9e51a6[1]),
    .d(al_6a9e51a6[2]),
    .o(al_97593e28));
  AL_MAP_LUT3 #(
    .EQN("(~C*B*A)"),
    .INIT(8'h08))
    al_cacaf5d0 (
    .a(al_868bc035[0]),
    .b(al_868bc035[1]),
    .c(al_868bc035[2]),
    .o(al_aa3ca6e8));
  AL_MAP_LUT5 #(
    .EQN("(~(A)*~((C*B))*~(D)*~(E)+A*~((C*B))*~(D)*~(E)+~(A)*(C*B)*~(D)*~(E)+A*~((C*B))*D*~(E)+~(A)*~((C*B))*~(D)*E+A*~((C*B))*~(D)*E+A*~((C*B))*D*E)"),
    .INIT(32'h2a3f2a7f))
    al_bc099efe (
    .a(al_9212666f),
    .b(al_7b0a6f6c),
    .c(al_35df3ed5),
    .d(al_aa3ca6e8),
    .e(al_93e35230),
    .o(al_1b634103));
  AL_MAP_LUT3 #(
    .EQN("~(C*~(B)*~(A)+C*B*~(A)+~(C)*B*A+C*B*A)"),
    .INIT(8'h27))
    al_f59fc3f (
    .a(al_97593e28),
    .b(al_d0c3ff20[4]),
    .c(al_b9239e2f[4]),
    .o(al_47b98870));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(C*~B*A))"),
    .INIT(16'h00df))
    al_ff45ba21 (
    .a(al_2170d534),
    .b(al_796f58da),
    .c(al_1b634103),
    .d(al_47b98870),
    .o(al_a4b303d[4]));
  AL_MAP_LUT3 #(
    .EQN("~(C*~(B)*~(A)+C*B*~(A)+~(C)*B*A+C*B*A)"),
    .INIT(8'h27))
    al_89be10f8 (
    .a(al_97593e28),
    .b(al_d0c3ff20[5]),
    .c(al_b9239e2f[5]),
    .o(al_fdfcedb));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(C*~B*A))"),
    .INIT(16'h00df))
    al_e6a6255a (
    .a(al_2170d534),
    .b(al_796f58da),
    .c(al_1b634103),
    .d(al_fdfcedb),
    .o(al_a4b303d[5]));
  AL_MAP_LUT3 #(
    .EQN("~(C*~(B)*~(A)+C*B*~(A)+~(C)*B*A+C*B*A)"),
    .INIT(8'h27))
    al_2706a3d3 (
    .a(al_97593e28),
    .b(al_d0c3ff20[6]),
    .c(al_b9239e2f[6]),
    .o(al_aa3fb0d5));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(C*~B*A))"),
    .INIT(16'h00df))
    al_1f875745 (
    .a(al_2170d534),
    .b(al_796f58da),
    .c(al_1b634103),
    .d(al_aa3fb0d5),
    .o(al_a4b303d[6]));
  AL_MAP_LUT3 #(
    .EQN("~(C*~(B)*~(A)+C*B*~(A)+~(C)*B*A+C*B*A)"),
    .INIT(8'h27))
    al_4eb8476c (
    .a(al_97593e28),
    .b(al_d0c3ff20[7]),
    .c(al_b9239e2f[7]),
    .o(al_ec6cd7d3));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(C*~B*A))"),
    .INIT(16'h00df))
    al_9455f1b9 (
    .a(al_2170d534),
    .b(al_796f58da),
    .c(al_1b634103),
    .d(al_ec6cd7d3),
    .o(al_a4b303d[7]));
  AL_MAP_LUT5 #(
    .EQN("(~E*(D*~((C*~B))*~(A)+D*(C*~B)*~(A)+~(D)*(C*~B)*A+D*(C*~B)*A))"),
    .INIT(32'h00007520))
    al_a4f61d71 (
    .a(al_bffee095),
    .b(al_d522fb91),
    .c(al_df0b60fc[0]),
    .d(al_255c21cc[0]),
    .e(rx_vld),
    .o(al_d122a757[0]));
  AL_MAP_LUT5 #(
    .EQN("(~E*(D*~((C*~B))*~(A)+D*(C*~B)*~(A)+~(D)*(C*~B)*A+D*(C*~B)*A))"),
    .INIT(32'h00007520))
    al_82341d38 (
    .a(al_bffee095),
    .b(al_d522fb91),
    .c(al_df0b60fc[1]),
    .d(al_255c21cc[1]),
    .e(rx_vld),
    .o(al_d122a757[1]));
  AL_MAP_LUT5 #(
    .EQN("(~E*(D*~((C*~B))*~(A)+D*(C*~B)*~(A)+~(D)*(C*~B)*A+D*(C*~B)*A))"),
    .INIT(32'h00007520))
    al_77405609 (
    .a(al_bffee095),
    .b(al_d522fb91),
    .c(al_df0b60fc[2]),
    .d(al_255c21cc[2]),
    .e(rx_vld),
    .o(al_d122a757[2]));
  AL_MAP_LUT5 #(
    .EQN("(~E*(D*~((C*~B))*~(A)+D*(C*~B)*~(A)+~(D)*(C*~B)*A+D*(C*~B)*A))"),
    .INIT(32'h00007520))
    al_e4d50e45 (
    .a(al_bffee095),
    .b(al_d522fb91),
    .c(al_df0b60fc[3]),
    .d(al_255c21cc[3]),
    .e(rx_vld),
    .o(al_d122a757[3]));
  AL_MAP_LUT4 #(
    .EQN("(A*~(D@(~C*~B)))"),
    .INIT(16'h02a8))
    al_404020c9 (
    .a(al_97593e28),
    .b(al_868bc035[0]),
    .c(al_868bc035[1]),
    .d(al_868bc035[2]),
    .o(al_bffee095));
  AL_MAP_LUT2 #(
    .EQN("(~B*A)"),
    .INIT(4'h2))
    al_fa01af58 (
    .a(al_f8442531),
    .b(al_35df3ed5),
    .o(al_d522fb91));
  AL_MAP_LUT5 #(
    .EQN("(~E*(D*~((C*~B))*~(A)+D*(C*~B)*~(A)+~(D)*(C*~B)*A+D*(C*~B)*A))"),
    .INIT(32'h00007520))
    al_864277d6 (
    .a(al_bffee095),
    .b(al_d522fb91),
    .c(al_df0b60fc[4]),
    .d(al_255c21cc[4]),
    .e(rx_vld),
    .o(al_d122a757[4]));
  AL_MAP_LUT5 #(
    .EQN("(~E*(D*~((C*~B))*~(A)+D*(C*~B)*~(A)+~(D)*(C*~B)*A+D*(C*~B)*A))"),
    .INIT(32'h00007520))
    al_aacd9ba9 (
    .a(al_bffee095),
    .b(al_d522fb91),
    .c(al_df0b60fc[5]),
    .d(al_255c21cc[5]),
    .e(rx_vld),
    .o(al_d122a757[5]));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*~A)"),
    .INIT(8'h01))
    al_832e59ab (
    .a(al_255c21cc[0]),
    .b(al_255c21cc[1]),
    .c(al_255c21cc[2]),
    .o(al_d7374510));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    al_2aec8b8 (
    .a(al_d7374510),
    .b(al_868bc035[2]),
    .c(al_255c21cc[3]),
    .o(al_5e3aa3d9));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*B*A)"),
    .INIT(16'h0008))
    al_2b002e95 (
    .a(al_5e3aa3d9),
    .b(al_c189624b),
    .c(al_255c21cc[4]),
    .d(al_255c21cc[5]),
    .o(al_5af87b6c));
  AL_MAP_LUT5 #(
    .EQN("(~E*~(~B*~(A*~(~D*~C))))"),
    .INIT(32'h0000eeec))
    al_a728bf56 (
    .a(al_5af87b6c),
    .b(al_3da26498),
    .c(al_868bc035[0]),
    .d(al_868bc035[1]),
    .e(rx_vld),
    .o(al_8767dea3));
  AL_DFF_X al_b974c8e4 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_8767dea3),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_3da26498));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_e6fff0c7 (
    .a(1'b1),
    .b(al_b9239e2f[4]),
    .c(al_e127dcdf),
    .o({al_c6d050a0,open_n12}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_65f3b84d (
    .a(1'b0),
    .b(al_b9239e2f[5]),
    .c(al_c6d050a0),
    .o({al_eadf504e,open_n13}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_e7ea334c (
    .a(1'b0),
    .b(al_b9239e2f[6]),
    .c(al_eadf504e),
    .o({al_9cbfbb1e,open_n14}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_4df9a179 (
    .a(1'b1),
    .b(al_b9239e2f[7]),
    .c(al_9cbfbb1e),
    .o({al_ca6d3979,open_n15}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_eaaf74a6 (
    .a(1'b0),
    .b(1'b1),
    .c(al_ca6d3979),
    .o({open_n16,al_93e35230}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    al_ddcf065c (
    .a(1'b0),
    .o({al_699d25e6,open_n19}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_503f152 (
    .a(1'b0),
    .b(al_b9239e2f[0]),
    .c(al_699d25e6),
    .o({al_a3a9743a,open_n20}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_ae6b4095 (
    .a(1'b0),
    .b(al_b9239e2f[1]),
    .c(al_a3a9743a),
    .o({al_8f690a86,open_n21}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_9e0ec77c (
    .a(1'b0),
    .b(al_b9239e2f[2]),
    .c(al_8f690a86),
    .o({al_2c0650af,open_n22}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_9db64e11 (
    .a(1'b1),
    .b(al_b9239e2f[3]),
    .c(al_2c0650af),
    .o({al_e127dcdf,open_n23}));
  AL_MAP_LUT2 #(
    .EQN("~(~B*A)"),
    .INIT(4'hd))
    al_453d09e7 (
    .a(al_1b634103),
    .b(al_2f615027),
    .o(al_64cda68c[0]));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*A)"),
    .INIT(16'h0200))
    al_e1d06922 (
    .a(al_c189624b),
    .b(al_3a1453b1),
    .c(al_b9239e2f[6]),
    .d(al_b9239e2f[7]),
    .o(al_6df681ba));
  AL_MAP_LUT2 #(
    .EQN("(~B*A)"),
    .INIT(4'h2))
    al_8d8b90ec (
    .a(al_72ec379c),
    .b(al_6df681ba),
    .o(al_64cda68c[1]));
  AL_DFF_X al_2236f770 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_a4b303d[0]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_b9239e2f[0]));
  AL_DFF_X al_102f945a (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_a4b303d[1]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_b9239e2f[1]));
  AL_DFF_X al_bb0bd698 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_a4b303d[2]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_b9239e2f[2]));
  AL_DFF_X al_71e05574 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_a4b303d[3]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_b9239e2f[3]));
  AL_DFF_X al_2d428278 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_a4b303d[4]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_b9239e2f[4]));
  AL_DFF_X al_a2f7cc08 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_a4b303d[5]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_b9239e2f[5]));
  AL_DFF_X al_93ae9732 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_a4b303d[6]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_b9239e2f[6]));
  AL_DFF_X al_9b6bcac0 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_a4b303d[7]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_b9239e2f[7]));
  AL_DFF_X al_175f0a38 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_64cda68c[0]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_868bc035[0]));
  AL_DFF_X al_48627e7b (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_64cda68c[1]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_868bc035[1]));
  AL_DFF_X al_af197da6 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_64cda68c[2]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_868bc035[2]));
  AL_DFF_X al_8b9e175c (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_d122a757[0]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_255c21cc[0]));
  AL_DFF_X al_1f50c02b (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_d122a757[1]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_255c21cc[1]));
  AL_DFF_X al_fbda7685 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_d122a757[2]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_255c21cc[2]));
  AL_DFF_X al_44bd86e0 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_d122a757[3]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_255c21cc[3]));
  AL_DFF_X al_436ac4 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_d122a757[4]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_255c21cc[4]));
  AL_DFF_X al_f9bfdb16 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_d122a757[5]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_255c21cc[5]));
  AL_DFF_X al_843a39fe (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(rx_data[1]),
    .en(al_40c500fc),
    .sr(1'b0),
    .ss(1'b0),
    .q(rx_data[0]));
  AL_DFF_X al_8c2e424e (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(rx_data[2]),
    .en(al_40c500fc),
    .sr(1'b0),
    .ss(1'b0),
    .q(rx_data[1]));
  AL_DFF_X al_565780d6 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(rx_data[3]),
    .en(al_40c500fc),
    .sr(1'b0),
    .ss(1'b0),
    .q(rx_data[2]));
  AL_DFF_X al_184bb457 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(rx_data[4]),
    .en(al_40c500fc),
    .sr(1'b0),
    .ss(1'b0),
    .q(rx_data[3]));
  AL_DFF_X al_b1854c60 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(rx_data[5]),
    .en(al_40c500fc),
    .sr(1'b0),
    .ss(1'b0),
    .q(rx_data[4]));
  AL_DFF_X al_218d40ea (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(rx_data[6]),
    .en(al_40c500fc),
    .sr(1'b0),
    .ss(1'b0),
    .q(rx_data[5]));
  AL_DFF_X al_eb1ad0ee (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(rx_data[7]),
    .en(al_40c500fc),
    .sr(1'b0),
    .ss(1'b0),
    .q(rx_data[6]));
  AL_DFF_X al_8e7cd6db (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_29d2da79),
    .en(al_40c500fc),
    .sr(1'b0),
    .ss(1'b0),
    .q(rx_data[7]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    al_95912772 (
    .a(al_64cda68c[2]),
    .b(al_35df3ed5),
    .o(al_1590c198));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*~A)"),
    .INIT(16'h0100))
    al_ab0c1e3b (
    .a(al_94a79ee1),
    .b(al_66b29cce),
    .c(al_8e61e858),
    .d(al_bb49be63),
    .o(al_7b0a6f6c));
  AL_MAP_LUT5 #(
    .EQN("(E*~D*C*~B*A)"),
    .INIT(32'h00200000))
    al_4fd196c4 (
    .a(al_c189624b),
    .b(al_3a1453b1),
    .c(al_a7cc788f),
    .d(al_b9239e2f[6]),
    .e(al_b9239e2f[7]),
    .o(al_e9a83439));
  AL_MAP_LUT5 #(
    .EQN("~(~B*~(D*~A*~(E*C)))"),
    .INIT(32'hcdccddcc))
    al_62d0279b (
    .a(al_9212666f),
    .b(al_e9a83439),
    .c(al_7b0a6f6c),
    .d(al_35df3ed5),
    .e(al_93e35230),
    .o(al_64cda68c[2]));
  AL_MAP_LUT4 #(
    .EQN("(B*~A*~(~D*~C))"),
    .INIT(16'h4440))
    al_284c4286 (
    .a(al_64cda68c[2]),
    .b(al_35df3ed5),
    .c(al_3da26498),
    .d(al_aa8f67aa),
    .o(al_ab71339f));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*~A)"),
    .INIT(8'h10))
    al_2c7bc9e6 (
    .a(al_868bc035[0]),
    .b(al_868bc035[1]),
    .c(al_868bc035[2]),
    .o(al_35df3ed5));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    al_4d6e6ef4 (
    .a(al_b9239e2f[0]),
    .b(al_b9239e2f[1]),
    .c(al_b9239e2f[2]),
    .d(al_b9239e2f[3]),
    .o(al_c189624b));
  AL_MAP_LUT3 #(
    .EQN("(~(A)*~(B)*~(C)+~(A)*B*~(C)+A*B*~(C)+~(A)*~(B)*C+A*~(B)*C+A*B*C)"),
    .INIT(8'hbd))
    al_a4430ec5 (
    .a(al_b9239e2f[4]),
    .b(al_b9239e2f[5]),
    .c(al_868bc035[0]),
    .o(al_3a1453b1));
  AL_MAP_LUT5 #(
    .EQN("(E*~D*C*~B*A)"),
    .INIT(32'h00200000))
    al_f7a03072 (
    .a(al_c189624b),
    .b(al_b9239e2f[4]),
    .c(al_b9239e2f[5]),
    .d(al_b9239e2f[6]),
    .e(al_b9239e2f[7]),
    .o(al_9212666f));
  AL_MAP_LUT2 #(
    .EQN("(~B*A)"),
    .INIT(4'h2))
    al_e89e58de (
    .a(al_868bc035[1]),
    .b(al_868bc035[2]),
    .o(al_a7cc788f));
  AL_DFF_X al_81b1a854 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_ab71339f),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(rx_err));
  AL_DFF_X al_f840877c (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_1590c198),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(rx_vld));
  AL_DFF_X al_bc20f4c7 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_87548dd3),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_94a79ee1));
  AL_DFF_X al_b554c6ad (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_94a79ee1),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_66b29cce));
  AL_DFF_X al_5553d6a2 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_66b29cce),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_8e61e858));
  AL_DFF_X al_9a777e60 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_8e61e858),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_bb49be63));
  AL_DFF_X al_d7522e2e (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(rxd),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_87548dd3));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    al_80db3411 (
    .a(al_b9239e2f[0]),
    .b(al_b9239e2f[1]),
    .c(al_b9239e2f[2]),
    .d(al_b9239e2f[3]),
    .o(al_f8442531));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    al_87b860e7 (
    .a(al_1b634103),
    .b(al_97593e28),
    .c(al_f8442531),
    .d(al_72ec379c),
    .o(al_40c500fc));
  AL_MAP_LUT3 #(
    .EQN("~(~C*~B*~A)"),
    .INIT(8'hfe))
    al_7197194c (
    .a(al_255c21cc[3]),
    .b(al_255c21cc[4]),
    .c(al_255c21cc[5]),
    .o(al_29d2da79));
  AL_MAP_LUT5 #(
    .EQN("(E*~(~D*~C*~(B*A)))"),
    .INIT(32'hfff80000))
    al_cab6ba85 (
    .a(al_b9239e2f[3]),
    .b(al_b9239e2f[4]),
    .c(al_b9239e2f[5]),
    .d(al_b9239e2f[6]),
    .e(al_b9239e2f[7]),
    .o(al_e5947718));
  AL_MAP_LUT4 #(
    .EQN("~(B*~((D*~C))*~(A)+B*(D*~C)*~(A)+~(B)*(D*~C)*A+B*(D*~C)*A)"),
    .INIT(16'hb1bb))
    al_17fce842 (
    .a(al_e5947718),
    .b(al_7b0a6f6c),
    .c(al_29d2da79),
    .d(al_d7374510),
    .o(al_52820846));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(~D*~(B*~A)))"),
    .INIT(16'h0f04))
    al_c9266484 (
    .a(al_52820846),
    .b(al_35df3ed5),
    .c(rx_vld),
    .d(al_aa8f67aa),
    .o(al_2987377d));
  AL_DFF_X al_e67d1776 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_2987377d),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_aa8f67aa));
  AL_MAP_LUT4 #(
    .EQN("~(~B*~(~D*C*~A))"),
    .INIT(16'hccdc))
    al_aea0cca9 (
    .a(al_309f6fd1),
    .b(al_da1c411f),
    .c(al_51453453[0]),
    .d(al_51453453[2]),
    .o(al_82156b0c[0]));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    al_7a5ee64e (
    .a(al_a576c55c),
    .b(al_64f775d),
    .c(al_d8cf5c0e),
    .o(al_5ea12a83));
  AL_MAP_LUT4 #(
    .EQN("(A*~(~C*~(B)*~(D)+~C*B*~(D)+~(~C)*B*D+~C*B*D))"),
    .INIT(16'h22a0))
    al_9305430a (
    .a(al_5ea12a83),
    .b(al_486f2586[0]),
    .c(al_ccf0619),
    .d(al_51453453[0]),
    .o(al_33e838fd));
  AL_MAP_LUT4 #(
    .EQN("(~D*(A*B*~(C)+~(A)*~(B)*C+~(A)*B*C))"),
    .INIT(16'h0058))
    al_6c381b8b (
    .a(al_33e838fd),
    .b(al_51453453[0]),
    .c(al_51453453[1]),
    .d(al_51453453[2]),
    .o(al_82156b0c[1]));
  AL_MAP_LUT5 #(
    .EQN("(A*~((~C*~B))*D*~(E)+A*(~C*~B)*D*~(E)+~(A)*(~C*~B)*~(D)*E+A*(~C*~B)*~(D)*E)"),
    .INIT(32'h0003aa00))
    al_d457fe39 (
    .a(al_33e838fd),
    .b(al_309f6fd1),
    .c(al_51453453[0]),
    .d(al_51453453[1]),
    .e(al_51453453[2]),
    .o(al_82156b0c[2]));
  AL_DFF_X al_b9976181 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_82156b0c[0]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_51453453[0]));
  AL_DFF_X al_2d4e59e9 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_82156b0c[1]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_51453453[1]));
  AL_DFF_X al_9317e830 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_82156b0c[2]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_51453453[2]));
  AL_DFF_X al_b58d9df0 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_5394316e[0]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_ab9d8a6b[0]));
  AL_DFF_X al_ec299de1 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_5394316e[1]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_ab9d8a6b[1]));
  AL_DFF_X al_ceac5162 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_5394316e[2]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_ab9d8a6b[2]));
  AL_DFF_X al_6a2a4f54 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_5394316e[3]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_ab9d8a6b[3]));
  AL_DFF_X al_8ca2cbad (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_bbbd5217[0]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_66ac1e2c[0]));
  AL_DFF_X al_45714151 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_bbbd5217[1]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_66ac1e2c[1]));
  AL_DFF_X al_4c18300b (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_bbbd5217[2]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_66ac1e2c[2]));
  AL_DFF_X al_cea83c51 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_bbbd5217[3]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_66ac1e2c[3]));
  AL_DFF_X al_f5ac1211 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_bbbd5217[4]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_66ac1e2c[4]));
  AL_DFF_X al_93985aa0 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_bbbd5217[5]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_66ac1e2c[5]));
  AL_DFF_X al_9b1e179 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_bbbd5217[6]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_66ac1e2c[6]));
  AL_DFF_X al_c76ef8bc (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_bbbd5217[7]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_66ac1e2c[7]));
  AL_MAP_LUT3 #(
    .EQN("(~C*B*A)"),
    .INIT(8'h08))
    al_b9d11bc7 (
    .a(al_7a41626d),
    .b(al_b1e4d128),
    .c(al_51453453[2]),
    .o(al_da1c411f));
  AL_MAP_LUT4 #(
    .EQN("(C*~(D*~(B)*~(A)+D*B*~(A)+~(D)*B*A+D*B*A))"),
    .INIT(16'h2070))
    al_d8083449 (
    .a(al_9d8d5066),
    .b(al_a0a16067),
    .c(al_742955f5),
    .d(txd),
    .o(al_10b43969));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*A)"),
    .INIT(8'h02))
    al_9f92eb22 (
    .a(al_51453453[0]),
    .b(al_51453453[1]),
    .c(al_51453453[2]),
    .o(al_c27cadcf));
  AL_MAP_LUT4 #(
    .EQN("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .INIT(16'h084c))
    al_22be8084 (
    .a(al_309f6fd1),
    .b(al_c27cadcf),
    .c(al_66ac1e2c[0]),
    .d(txd),
    .o(al_151387f2));
  AL_MAP_LUT5 #(
    .EQN("(~D*~B*~A*~(~E*C))"),
    .INIT(32'h00110001))
    al_9c48e923 (
    .a(al_10b43969),
    .b(al_151387f2),
    .c(al_adf78afa),
    .d(al_da1c411f),
    .e(txd),
    .o(al_da7ff39c));
  AL_MAP_LUT4 #(
    .EQN("(D*~(C*B*A))"),
    .INIT(16'h7f00))
    al_67a176fc (
    .a(al_ce8dc8c6),
    .b(al_1b288f5f),
    .c(al_b1e4d128),
    .d(al_51453453[2]),
    .o(al_adf78afa));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    al_b9b57107 (
    .a(al_ab9d8a6b[0]),
    .b(al_ab9d8a6b[1]),
    .c(al_ab9d8a6b[2]),
    .d(al_ab9d8a6b[3]),
    .o(al_ccf0619));
  AL_MAP_LUT3 #(
    .EQN("~(C*~(B)*~(A)+C*B*~(A)+~(C)*B*A+C*B*A)"),
    .INIT(8'h27))
    al_e777be33 (
    .a(al_ab9d8a6b[0]),
    .b(al_66ac1e2c[0]),
    .c(txd),
    .o(al_afca84e));
  AL_MAP_LUT5 #(
    .EQN("~((C*~B)*~((~E*A))*~(D)+(C*~B)*(~E*A)*~(D)+~((C*~B))*(~E*A)*D+(C*~B)*(~E*A)*D)"),
    .INIT(32'hffcf55cf))
    al_f6e602c0 (
    .a(al_486f2586[0]),
    .b(al_ccf0619),
    .c(al_afca84e),
    .d(al_51453453[0]),
    .e(al_7e8b6626),
    .o(al_a0a16067));
  AL_DFF_X al_7bd115f1 (
    .ar(1'b0),
    .as(~rst_n),
    .clk(clk),
    .d(al_da7ff39c),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(txd));
  AL_MAP_LUT4 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)+A*~(B)*~(C)*~(D)+~(A)*B*~(C)*~(D)+~(A)*B*C*~(D)+~(A)*~(B)*~(C)*D+~(A)*B*~(C)*D+A*B*~(C)*D+~(A)*~(B)*C*D+A*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hfd47))
    al_52ec989f (
    .a(al_486f2586[0]),
    .b(al_51453453[0]),
    .c(al_51453453[1]),
    .d(al_51453453[2]),
    .o(al_ceb07ff6));
  AL_MAP_LUT5 #(
    .EQN("(~(A)*B*~(C)*~(D)*~(E)+~(A)*B*C*~(D)*~(E)+~(A)*B*~(C)*D*~(E)+~(A)*B*C*D*~(E)+~(A)*~(B)*~(C)*~(D)*E+A*~(B)*~(C)*~(D)*E+~(A)*~(B)*~(C)*D*E+A*~(B)*~(C)*D*E+~(A)*B*~(C)*D*E+A*B*~(C)*D*E+~(A)*~(B)*C*D*E+A*~(B)*C*D*E)"),
    .INIT(32'h3f034444))
    al_e7bba8c8 (
    .a(al_ceb07ff6),
    .b(al_5ea12a83),
    .c(al_b1e4d128),
    .d(al_51453453[2]),
    .e(al_ab9d8a6b[0]),
    .o(al_5394316e[0]));
  AL_MAP_LUT5 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)*~(E)+A*~(B)*~(C)*~(D)*~(E)+~(A)*B*~(C)*~(D)*~(E)+A*B*~(C)*~(D)*~(E)+~(A)*~(B)*C*~(D)*~(E)+A*~(B)*C*~(D)*~(E)+~(A)*B*C*~(D)*~(E)+A*B*C*~(D)*~(E)+~(A)*~(B)*~(C)*D*~(E)+A*~(B)*~(C)*D*~(E)+~(A)*B*~(C)*D*~(E)+A*B*~(C)*D*~(E)+~(A)*~(B)*C*D*~(E)+~(A)*B*C*D*~(E)+A*B*C*D*~(E)+~(A)*~(B)*~(C)*~(D)*E+A*~(B)*~(C)*~(D)*E+A*B*~(C)*~(D)*E+A*B*C*~(D)*E+~(A)*~(B)*~(C)*D*E+A*~(B)*~(C)*D*E+A*B*~(C)*D*E+A*~(B)*C*D*E+A*B*C*D*E)"),
    .INIT(32'hab8bdfff))
    al_7b1b9346 (
    .a(al_5ea12a83),
    .b(al_51453453[0]),
    .c(al_51453453[1]),
    .d(al_ab9d8a6b[0]),
    .e(al_ab9d8a6b[1]),
    .o(al_815e6d01));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C)*~(B)+~A*C*~(B)+~(~A)*C*B+~A*C*B)"),
    .INIT(8'hd1))
    al_5e002537 (
    .a(al_815e6d01),
    .b(al_adf78afa),
    .c(al_ab9d8a6b[1]),
    .o(al_5394316e[1]));
  AL_MAP_LUT5 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)*~(E)+A*~(B)*~(C)*~(D)*~(E)+~(A)*B*~(C)*~(D)*~(E)+A*B*~(C)*~(D)*~(E)+~(A)*~(B)*C*~(D)*~(E)+A*~(B)*C*~(D)*~(E)+~(A)*B*C*~(D)*~(E)+A*B*C*~(D)*~(E)+~(A)*~(B)*~(C)*D*~(E)+A*~(B)*~(C)*D*~(E)+~(A)*B*~(C)*D*~(E)+~(A)*~(B)*C*D*~(E)+A*~(B)*C*D*~(E)+~(A)*B*C*D*~(E)+A*B*C*D*~(E)+~(A)*~(B)*~(C)*~(D)*E+A*~(B)*~(C)*~(D)*E+~(A)*B*~(C)*~(D)*E+A*B*~(C)*~(D)*E+A*~(B)*C*~(D)*E+A*B*C*~(D)*E+A*B*~(C)*D*E+A*~(B)*C*D*E+A*B*C*D*E)"),
    .INIT(32'ha8aff7ff))
    al_b9ff4cc2 (
    .a(al_5ea12a83),
    .b(al_61c2c7),
    .c(al_51453453[0]),
    .d(al_51453453[1]),
    .e(al_ab9d8a6b[2]),
    .o(al_3719ec71));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C)*~(B)+~A*C*~(B)+~(~A)*C*B+~A*C*B)"),
    .INIT(8'hd1))
    al_604a0188 (
    .a(al_3719ec71),
    .b(al_adf78afa),
    .c(al_ab9d8a6b[2]),
    .o(al_5394316e[2]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    al_5cda2ac (
    .a(al_ab9d8a6b[0]),
    .b(al_ab9d8a6b[1]),
    .o(al_61c2c7));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    al_f637f1aa (
    .a(al_61c2c7),
    .b(al_ab9d8a6b[2]),
    .o(al_864a5aea));
  AL_MAP_LUT5 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)*~(E)+A*~(B)*~(C)*~(D)*~(E)+~(A)*B*~(C)*~(D)*~(E)+A*B*~(C)*~(D)*~(E)+~(A)*~(B)*C*~(D)*~(E)+A*~(B)*C*~(D)*~(E)+~(A)*B*C*~(D)*~(E)+A*B*C*~(D)*~(E)+~(A)*~(B)*~(C)*D*~(E)+A*~(B)*~(C)*D*~(E)+~(A)*B*~(C)*D*~(E)+~(A)*~(B)*C*D*~(E)+A*~(B)*C*D*~(E)+~(A)*B*C*D*~(E)+A*B*C*D*~(E)+~(A)*~(B)*~(C)*~(D)*E+A*~(B)*~(C)*~(D)*E+~(A)*B*~(C)*~(D)*E+A*B*~(C)*~(D)*E+A*~(B)*C*~(D)*E+A*B*C*~(D)*E+A*B*~(C)*D*E+A*~(B)*C*D*E+A*B*C*D*E)"),
    .INIT(32'ha8aff7ff))
    al_5584057c (
    .a(al_5ea12a83),
    .b(al_864a5aea),
    .c(al_51453453[0]),
    .d(al_51453453[1]),
    .e(al_ab9d8a6b[3]),
    .o(al_c17df76));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C)*~(B)+~A*C*~(B)+~(~A)*C*B+~A*C*B)"),
    .INIT(8'hd1))
    al_3f54c3c1 (
    .a(al_c17df76),
    .b(al_adf78afa),
    .c(al_ab9d8a6b[3]),
    .o(al_5394316e[3]));
  AL_DFF_X al_22f253c2 (
    .ar(~rst_n),
    .as(1'b0),
    .clk(clk),
    .d(al_10c8d026),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_7e8b6626));
  AL_MAP_LUT4 #(
    .EQN("~(D@C@B@A)"),
    .INIT(16'h9669))
    al_45a1ea7a (
    .a(tx_data[3]),
    .b(tx_data[2]),
    .c(tx_data[1]),
    .d(tx_data[0]),
    .o(al_9ebf6313));
  AL_MAP_LUT5 #(
    .EQN("(E@D@C@B@A)"),
    .INIT(32'h96696996))
    al_8632841b (
    .a(al_9ebf6313),
    .b(tx_data[7]),
    .c(tx_data[6]),
    .d(tx_data[5]),
    .e(tx_data[4]),
    .o(al_102a42e0));
  AL_MAP_LUT3 #(
    .EQN("~(~C*~(A)*~(B)+~C*A*~(B)+~(~C)*A*B+~C*A*B)"),
    .INIT(8'h74))
    al_624250da (
    .a(al_102a42e0),
    .b(al_da1c411f),
    .c(al_7e8b6626),
    .o(al_10c8d026));
  AL_MAP_LUT2 #(
    .EQN("(~B*~A)"),
    .INIT(4'h1))
    al_b063a97 (
    .a(al_51453453[0]),
    .b(al_51453453[1]),
    .o(al_b1e4d128));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~B*A)"),
    .INIT(16'h2000))
    al_af8433 (
    .a(al_a576c55c),
    .b(al_486f2586[0]),
    .c(al_64f775d),
    .d(al_d8cf5c0e),
    .o(al_309f6fd1));
  AL_MAP_LUT5 #(
    .EQN("~(~(E*~C)*~(D*B*A))"),
    .INIT(32'h8f0f8800))
    al_ba147cc1 (
    .a(al_309f6fd1),
    .b(al_b1e4d128),
    .c(tx_en),
    .d(al_51453453[2]),
    .e(tx_rdy),
    .o(al_660a0fdc));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~B*A)"),
    .INIT(16'h2000))
    al_6d1e5996 (
    .a(al_90ec5389[2]),
    .b(al_90ec5389[3]),
    .c(al_90ec5389[4]),
    .d(al_90ec5389[7]),
    .o(al_a576c55c));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    al_d6757692 (
    .a(al_90ec5389[5]),
    .b(al_90ec5389[6]),
    .o(al_64f775d));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    al_923815f9 (
    .a(al_90ec5389[0]),
    .b(al_90ec5389[1]),
    .o(al_d8cf5c0e));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    al_a6850353 (
    .a(al_ab9d8a6b[0]),
    .b(al_ab9d8a6b[1]),
    .c(al_ab9d8a6b[2]),
    .d(al_ab9d8a6b[3]),
    .o(al_486f2586[0]));
  AL_DFF_X al_56dde5cc (
    .ar(1'b0),
    .as(~rst_n),
    .clk(clk),
    .d(al_660a0fdc),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(tx_rdy));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(D*~(B)*~(A)+D*B*~(A)+~(D)*B*A+D*B*A))"),
    .INIT(16'h0207))
    al_5c430df1 (
    .a(al_7a41626d),
    .b(tx_data[0]),
    .c(al_51453453[0]),
    .d(al_66ac1e2c[0]),
    .o(al_3e90220e));
  AL_MAP_LUT5 #(
    .EQN("(~B*~(C*~(D*~(E)*~(A)+D*E*~(A)+~(D)*E*A+D*E*A)))"),
    .INIT(32'h33231303))
    al_79438ec0 (
    .a(al_309f6fd1),
    .b(al_3e90220e),
    .c(al_51453453[0]),
    .d(al_66ac1e2c[0]),
    .e(al_66ac1e2c[1]),
    .o(al_b9fec681));
  AL_MAP_LUT5 #(
    .EQN("(A*B*~(C)*~(D)*~(E)+~(A)*~(B)*~(C)*D*~(E)+~(A)*B*~(C)*D*~(E)+A*B*~(C)*D*~(E)+A*~(B)*C*D*~(E)+A*B*C*D*~(E)+A*B*~(C)*~(D)*E+~(A)*~(B)*C*~(D)*E+~(A)*B*C*~(D)*E+~(A)*~(B)*~(C)*D*E+~(A)*B*~(C)*D*E+A*B*~(C)*D*E+~(A)*~(B)*C*D*E+A*~(B)*C*D*E+~(A)*B*C*D*E+A*B*C*D*E)"),
    .INIT(32'hfd58ad08))
    al_a3c1f6ff (
    .a(al_f957882),
    .b(al_b9fec681),
    .c(al_742955f5),
    .d(al_66ac1e2c[0]),
    .e(al_66ac1e2c[1]),
    .o(al_bbbd5217[0]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(D*~(B)*~(A)+D*B*~(A)+~(D)*B*A+D*B*A))"),
    .INIT(16'h0207))
    al_6b16e0a9 (
    .a(al_7a41626d),
    .b(tx_data[1]),
    .c(al_51453453[0]),
    .d(al_66ac1e2c[1]),
    .o(al_cac3f349));
  AL_MAP_LUT5 #(
    .EQN("(~B*~(C*~(D*~(E)*~(A)+D*E*~(A)+~(D)*E*A+D*E*A)))"),
    .INIT(32'h33231303))
    al_f4307f76 (
    .a(al_309f6fd1),
    .b(al_cac3f349),
    .c(al_51453453[0]),
    .d(al_66ac1e2c[1]),
    .e(al_66ac1e2c[2]),
    .o(al_149ae289));
  AL_MAP_LUT5 #(
    .EQN("(A*B*~(C)*~(D)*~(E)+~(A)*~(B)*~(C)*D*~(E)+~(A)*B*~(C)*D*~(E)+A*B*~(C)*D*~(E)+A*~(B)*C*D*~(E)+A*B*C*D*~(E)+A*B*~(C)*~(D)*E+~(A)*~(B)*C*~(D)*E+~(A)*B*C*~(D)*E+~(A)*~(B)*~(C)*D*E+~(A)*B*~(C)*D*E+A*B*~(C)*D*E+~(A)*~(B)*C*D*E+A*~(B)*C*D*E+~(A)*B*C*D*E+A*B*C*D*E)"),
    .INIT(32'hfd58ad08))
    al_d810d43f (
    .a(al_f957882),
    .b(al_149ae289),
    .c(al_742955f5),
    .d(al_66ac1e2c[1]),
    .e(al_66ac1e2c[2]),
    .o(al_bbbd5217[1]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(D*~(B)*~(A)+D*B*~(A)+~(D)*B*A+D*B*A))"),
    .INIT(16'h0207))
    al_183d9181 (
    .a(al_7a41626d),
    .b(tx_data[2]),
    .c(al_51453453[0]),
    .d(al_66ac1e2c[2]),
    .o(al_46e816d3));
  AL_MAP_LUT5 #(
    .EQN("(~B*~(C*~(D*~(E)*~(A)+D*E*~(A)+~(D)*E*A+D*E*A)))"),
    .INIT(32'h33231303))
    al_6e1eccd6 (
    .a(al_309f6fd1),
    .b(al_46e816d3),
    .c(al_51453453[0]),
    .d(al_66ac1e2c[2]),
    .e(al_66ac1e2c[3]),
    .o(al_f87d97e5));
  AL_MAP_LUT5 #(
    .EQN("(A*B*~(C)*~(D)*~(E)+~(A)*~(B)*~(C)*D*~(E)+~(A)*B*~(C)*D*~(E)+A*B*~(C)*D*~(E)+A*~(B)*C*D*~(E)+A*B*C*D*~(E)+A*B*~(C)*~(D)*E+~(A)*~(B)*C*~(D)*E+~(A)*B*C*~(D)*E+~(A)*~(B)*~(C)*D*E+~(A)*B*~(C)*D*E+A*B*~(C)*D*E+~(A)*~(B)*C*D*E+A*~(B)*C*D*E+~(A)*B*C*D*E+A*B*C*D*E)"),
    .INIT(32'hfd58ad08))
    al_f9b1284 (
    .a(al_f957882),
    .b(al_f87d97e5),
    .c(al_742955f5),
    .d(al_66ac1e2c[2]),
    .e(al_66ac1e2c[3]),
    .o(al_bbbd5217[2]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(D*~(B)*~(A)+D*B*~(A)+~(D)*B*A+D*B*A))"),
    .INIT(16'h0207))
    al_d9343e79 (
    .a(al_7a41626d),
    .b(tx_data[3]),
    .c(al_51453453[0]),
    .d(al_66ac1e2c[3]),
    .o(al_92a6b6c5));
  AL_MAP_LUT5 #(
    .EQN("(~B*~(C*~(D*~(E)*~(A)+D*E*~(A)+~(D)*E*A+D*E*A)))"),
    .INIT(32'h33231303))
    al_1306aeaf (
    .a(al_309f6fd1),
    .b(al_92a6b6c5),
    .c(al_51453453[0]),
    .d(al_66ac1e2c[3]),
    .e(al_66ac1e2c[4]),
    .o(al_922a4f67));
  AL_MAP_LUT5 #(
    .EQN("(A*B*~(C)*~(D)*~(E)+~(A)*~(B)*~(C)*D*~(E)+~(A)*B*~(C)*D*~(E)+A*B*~(C)*D*~(E)+A*~(B)*C*D*~(E)+A*B*C*D*~(E)+A*B*~(C)*~(D)*E+~(A)*~(B)*C*~(D)*E+~(A)*B*C*~(D)*E+~(A)*~(B)*~(C)*D*E+~(A)*B*~(C)*D*E+A*B*~(C)*D*E+~(A)*~(B)*C*D*E+A*~(B)*C*D*E+~(A)*B*C*D*E+A*B*C*D*E)"),
    .INIT(32'hfd58ad08))
    al_35999b29 (
    .a(al_f957882),
    .b(al_922a4f67),
    .c(al_742955f5),
    .d(al_66ac1e2c[3]),
    .e(al_66ac1e2c[4]),
    .o(al_bbbd5217[3]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(D*~(B)*~(A)+D*B*~(A)+~(D)*B*A+D*B*A))"),
    .INIT(16'h0207))
    al_d2322acb (
    .a(al_7a41626d),
    .b(tx_data[4]),
    .c(al_51453453[0]),
    .d(al_66ac1e2c[4]),
    .o(al_4240b8f4));
  AL_MAP_LUT5 #(
    .EQN("(~B*~(C*~(D*~(E)*~(A)+D*E*~(A)+~(D)*E*A+D*E*A)))"),
    .INIT(32'h33231303))
    al_ba052234 (
    .a(al_309f6fd1),
    .b(al_4240b8f4),
    .c(al_51453453[0]),
    .d(al_66ac1e2c[4]),
    .e(al_66ac1e2c[5]),
    .o(al_e27cb87a));
  AL_MAP_LUT5 #(
    .EQN("(A*B*~(C)*~(D)*~(E)+~(A)*~(B)*~(C)*D*~(E)+~(A)*B*~(C)*D*~(E)+A*B*~(C)*D*~(E)+A*~(B)*C*D*~(E)+A*B*C*D*~(E)+A*B*~(C)*~(D)*E+~(A)*~(B)*C*~(D)*E+~(A)*B*C*~(D)*E+~(A)*~(B)*~(C)*D*E+~(A)*B*~(C)*D*E+A*B*~(C)*D*E+~(A)*~(B)*C*D*E+A*~(B)*C*D*E+~(A)*B*C*D*E+A*B*C*D*E)"),
    .INIT(32'hfd58ad08))
    al_dcba48b3 (
    .a(al_f957882),
    .b(al_e27cb87a),
    .c(al_742955f5),
    .d(al_66ac1e2c[4]),
    .e(al_66ac1e2c[5]),
    .o(al_bbbd5217[4]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(D*~(B)*~(A)+D*B*~(A)+~(D)*B*A+D*B*A))"),
    .INIT(16'h0207))
    al_71ccb7f1 (
    .a(al_7a41626d),
    .b(tx_data[5]),
    .c(al_51453453[0]),
    .d(al_66ac1e2c[5]),
    .o(al_1810ff50));
  AL_MAP_LUT5 #(
    .EQN("(~B*~(C*~(D*~(E)*~(A)+D*E*~(A)+~(D)*E*A+D*E*A)))"),
    .INIT(32'h33231303))
    al_312c0da1 (
    .a(al_309f6fd1),
    .b(al_1810ff50),
    .c(al_51453453[0]),
    .d(al_66ac1e2c[5]),
    .e(al_66ac1e2c[6]),
    .o(al_ce65502c));
  AL_MAP_LUT5 #(
    .EQN("(A*B*~(C)*~(D)*~(E)+~(A)*~(B)*~(C)*D*~(E)+~(A)*B*~(C)*D*~(E)+A*B*~(C)*D*~(E)+A*~(B)*C*D*~(E)+A*B*C*D*~(E)+A*B*~(C)*~(D)*E+~(A)*~(B)*C*~(D)*E+~(A)*B*C*~(D)*E+~(A)*~(B)*~(C)*D*E+~(A)*B*~(C)*D*E+A*B*~(C)*D*E+~(A)*~(B)*C*D*E+A*~(B)*C*D*E+~(A)*B*C*D*E+A*B*C*D*E)"),
    .INIT(32'hfd58ad08))
    al_7596702c (
    .a(al_f957882),
    .b(al_ce65502c),
    .c(al_742955f5),
    .d(al_66ac1e2c[5]),
    .e(al_66ac1e2c[6]),
    .o(al_bbbd5217[5]));
  AL_MAP_LUT2 #(
    .EQN("(~B*A)"),
    .INIT(4'h2))
    al_8556a0f1 (
    .a(al_51453453[1]),
    .b(al_51453453[2]),
    .o(al_742955f5));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(D*~(B)*~(A)+D*B*~(A)+~(D)*B*A+D*B*A))"),
    .INIT(16'h0207))
    al_6d0a1b7b (
    .a(al_7a41626d),
    .b(tx_data[6]),
    .c(al_51453453[0]),
    .d(al_66ac1e2c[6]),
    .o(al_4ee01277));
  AL_MAP_LUT5 #(
    .EQN("(~B*~(C*~(D*~(E)*~(A)+D*E*~(A)+~(D)*E*A+D*E*A)))"),
    .INIT(32'h33231303))
    al_8a5bb64b (
    .a(al_309f6fd1),
    .b(al_4ee01277),
    .c(al_51453453[0]),
    .d(al_66ac1e2c[6]),
    .e(al_66ac1e2c[7]),
    .o(al_33eb1ced));
  AL_MAP_LUT5 #(
    .EQN("(A*B*~(C)*~(D)*~(E)+~(A)*~(B)*~(C)*D*~(E)+~(A)*B*~(C)*D*~(E)+A*B*~(C)*D*~(E)+A*~(B)*C*D*~(E)+A*B*C*D*~(E)+A*B*~(C)*~(D)*E+~(A)*~(B)*C*~(D)*E+~(A)*B*C*~(D)*E+~(A)*~(B)*~(C)*D*E+~(A)*B*~(C)*D*E+A*B*~(C)*D*E+~(A)*~(B)*C*D*E+A*~(B)*C*D*E+~(A)*B*C*D*E+A*B*C*D*E)"),
    .INIT(32'hfd58ad08))
    al_63696015 (
    .a(al_f957882),
    .b(al_33eb1ced),
    .c(al_742955f5),
    .d(al_66ac1e2c[6]),
    .e(al_66ac1e2c[7]),
    .o(al_bbbd5217[6]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    al_9c922cb0 (
    .a(tx_en),
    .b(tx_rdy),
    .o(al_7a41626d));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*~B*A)"),
    .INIT(16'h0020))
    al_6b9aadef (
    .a(al_90ec5389[2]),
    .b(al_90ec5389[3]),
    .c(al_90ec5389[4]),
    .d(al_90ec5389[5]),
    .o(al_726b0e37));
  AL_MAP_LUT5 #(
    .EQN("(E*D*C*B*A)"),
    .INIT(32'h80000000))
    al_b2c9285 (
    .a(al_728261cd),
    .b(al_726b0e37),
    .c(al_d8cf5c0e),
    .d(al_90ec5389[6]),
    .e(al_90ec5389[7]),
    .o(al_b3825293));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(C*~B*A))"),
    .INIT(16'h00df))
    al_dfe0166f (
    .a(al_b3825293),
    .b(al_51453453[0]),
    .c(al_51453453[1]),
    .d(al_51453453[2]),
    .o(al_f957882));
  AL_MAP_LUT3 #(
    .EQN("~(C*~(B)*~(A)+C*B*~(A)+~(C)*B*A+C*B*A)"),
    .INIT(8'h27))
    al_b72dc195 (
    .a(al_7a41626d),
    .b(tx_data[7]),
    .c(al_66ac1e2c[7]),
    .o(al_31ebf4e6));
  AL_MAP_LUT5 #(
    .EQN("(~B*~((E*~(~C*A)))*~(D)+~B*(E*~(~C*A))*~(D)+~(~B)*(E*~(~C*A))*D+~B*(E*~(~C*A))*D)"),
    .INIT(32'hf5330033))
    al_8accb875 (
    .a(al_9d8d5066),
    .b(al_31ebf4e6),
    .c(al_486f2586[0]),
    .d(al_51453453[0]),
    .e(al_66ac1e2c[7]),
    .o(al_a3d9dae8));
  AL_MAP_LUT5 #(
    .EQN("(A*~(B)*~(C)*~(D)*~(E)+A*~(B)*~(C)*D*~(E)+~(A)*~(B)*C*D*~(E)+A*~(B)*C*D*~(E)+~(A)*B*C*D*~(E)+A*B*C*D*~(E)+A*~(B)*~(C)*~(D)*E+A*~(B)*~(C)*D*E+~(A)*B*~(C)*D*E+A*B*~(C)*D*E+~(A)*~(B)*C*D*E+A*~(B)*C*D*E+~(A)*B*C*D*E+A*B*C*D*E)"),
    .INIT(32'hfe02f202))
    al_49c23180 (
    .a(al_a3d9dae8),
    .b(al_51453453[1]),
    .c(al_51453453[2]),
    .d(al_66ac1e2c[7]),
    .e(al_f957882),
    .o(al_bbbd5217[7]));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    al_5f26eaca (
    .a(al_90ec5389[1]),
    .b(al_90ec5389[2]),
    .c(al_90ec5389[4]),
    .d(al_90ec5389[7]),
    .o(al_ce8dc8c6));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*A)"),
    .INIT(16'h0200))
    al_10a416fe (
    .a(al_90ec5389[0]),
    .b(al_90ec5389[3]),
    .c(al_90ec5389[5]),
    .d(al_90ec5389[6]),
    .o(al_1b288f5f));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    al_8f3d7bde (
    .a(al_ce8dc8c6),
    .b(al_1b288f5f),
    .o(al_9d8d5066));
  AL_MAP_LUT4 #(
    .EQN("(A*~(D*C*B))"),
    .INIT(16'h2aaa))
    al_45136871 (
    .a(al_ab9d8a6b[0]),
    .b(al_ab9d8a6b[1]),
    .c(al_ab9d8a6b[2]),
    .d(al_ab9d8a6b[3]),
    .o(al_728261cd));

endmodule 

