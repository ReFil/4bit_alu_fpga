module four_bit_multiplexer(input X0, input X1, input X2, input X3, input Y0, input Y1, input Y2, input Y3, input MUX, output OUT0, output OUT1, output OUT2, output OUT3);
    mux_cell m0 (X0, Y0, MUX, OUT0);
    mux_cell m1 (X1, Y1, MUX, OUT1);
    mux_cell m2 (X2, Y2, MUX, OUT2);
    mux_cell m3 (X3, Y3, MUX, OUT3);
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

module single_bit_shifter(input X, input F0, input M_IN, output XMULT, output MOUT);
    wire F0_INV;

    wire N_1;
    wire N_2;

    not_cell not_1(F0, F0_INV);

    nand_cell nand_1(X, F0_INV, N_1);
    nand_cell nand_2(M_IN,F0_INV, N_2);

    not_cell not_2(N_1, MOUT);
    not_cell not_3(N_2, XMULT);


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

module four_bit_shifter(input X0, input X1, input X2, input X3, input F0, output M0, output M1, output M2, output M3);
    wire N_1;
    wire N_2;
    wire N_3;

    single_bit_shifter s0(X0, F0, 0, M0, N_1);
    single_bit_shifter s1(X1, F0, N_1, M1, N_2);    
    single_bit_shifter s2(X2, F0, N_2, M2, N_3);    
    single_bit_shifter s3(.X(X2), .F0(F0), .M_IN(N_3), .XMULT(M3));    
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
    wire M0;
    wire M1;
    wire M2;
    wire M3;


    four_bit_adder_xor fbax0 (X0, X1, X2, X3, Y0, Y1, Y2, Y3, F0, XOR0, XOR1, XOR2, XOR3, XY0, XY1, XY2, XY3);
    four_bit_shifter fbs0 (X0, X1, X2, X3, F0, M0, M1, M2, M3);
    four_bit_multiplexer fbm0 (XY0, XY1, XY2, XY3, M0, M1, M2, M3, F1, OUT0, OUT1, OUT2, OUT3);

endmodule