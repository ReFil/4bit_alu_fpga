
module top (input [3:0] SW, input P3_1, input P3_2, input P3_3, input P3_4, input P3_9, input P3_10, input P3_11, input P3_12, output P2_1, output P2_2, output P2_3, output P2_4);
    wire F0, F1;
    wire X0, X1, X2, X3, Y0, Y1, Y2, Y3;
    wire OUT0, OUT1, OUT2, OUT3;
    assign F0 = SW[0];
    assign F1 = SW[1];
    assign X3 = P1_1;
    assign X2 = P1_2;
    assign X1 = P1_3;
    assign X0 = P1_4;
    assign Y3 = P1_12;
    assign Y2 = P1_11;
    assign Y1 = P1_10;
    assign Y0 = P1_9;
    assign OUT3 = P2_4;
    assign OUT2 = P2_3;
    assign OUT1 = P2_2;
    assign OUT0 = P2_1;

    four_bit_alu fba0(X0, X1, X2, X3, Y0, Y1, Y2, Y3, F0, F1, OUT0, OUT1, OUT2, OUT3);


endmodule

module single_bit_adder_xor(input X, input Y, input Cin, input Sub, output XY, output Cout, output XOR );

    wire N_1;
    wire N_2;
    wire N_3;

    xor_cell xor_1(Y, Sub, N_1);
    xor_cell xor_2(N_1, X, XOR);
    xor_cell xor_3(XOR, Cin, XY);

    nand_cell nand_1(Cin, XOR, N_2);
    nand_cell nand_2(X, N_1, N_3);
    nand_cell nand_3(N_2, N_3, Cout);

endmodule

module four_bit_adder_xor(input X0, input X1, input X2, input X3, input Y0, input Y1, input Y2, input Y3, input F, output XOR0, output XOR1, output XOR2, output XOR3, output XY0, output XY1, output XY2, output XY3);
    wire N_1;
    wire N_2;
    wire N_3;

    single_bit_adder_xor a0 (X0, Y0, F, F, XY0, N_1, XOR0);
    single_bit_adder_xor a1 (X1, Y1, N_1, F, XY1, N_2, XOR1);
    single_bit_adder_xor a2 (X2, Y2, N_2, F, XY2, N_3, XOR2);
    single_bit_adder_xor a3 (.X(X3), .Y(Y3), .Cin(N_3), .Sub(F), .XY(XY3), .XOR(XOR3));
endmodule

module four_bit_multiplexer(input X0, input X1, input X2, input X3, input Y0, input Y1, input Y2, input Y3, input MUX, output OUT0, output OUT1, output OUT2, output OUT3);
    mux_cell m0 (X0, Y0, MUX, OUT0);
    mux_cell m1 (X1, Y1, MUX, OUT1);
    mux_cell m2 (X2, Y2, MUX, OUT2);
    mux_cell m3 (X3, Y3, MUX, OUT3);
endmodule

module four_bit_alu(input X0, input X1, input X2, input X3, input Y0, input Y1, input Y2, input Y3, input F0, input F1, output OUT0, output OUT1, output OUT2, output OUT3);
    wire XOR0;
    wire XOR1;
    wire XOR2;
    wire XOR3;
    wire XY0;
    wire XY1;
    wire XY2;
    wire XY3;

    four_bit_adder_xor fbax0 (X0, X1, X2, X3, Y0, Y1, Y2, Y3, F0, XOR0, XOR1, XOR2, XOR3, XY0, XY1, XY2, XY3);
    four_bit_multiplexer fbm0 (XY0, XY1, XY2, XY3, XOR0, XOR1, XOR2, XOR3, F1, OUT0, OUT1, OUT2, OUT3);

endmodule

