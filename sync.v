module single_retimer(input clk, input nrst, input A, output O);
    wire N_1, N_2, N_3, N_4, N_5, F0_N, F1_N, F1;


    nand3_cell nand30(A, N_1, N_2, N_3);
    not_cell not0(N_3, F0_N);

    dffr_cell d0(F0_N, clk, nrst, O, N_1);

    nand3_cell nand31(A, F1, N_1, N_4);
    nand_cell nand20(O, N_2, N_5);
    nand_cell nand21(N_4, N_5, F1_N);
    dffr_cell d1(F1_N, clk, nrst, F1, N_2);
endmodule

module button_syncroniser(input clk, input nrst, input buttonmin, input buttonhour, output syncmin, output synchour);
    single_retimer s0(clk, nrst, buttonmin, syncmin);
    single_retimer s1(clk, nrst, buttonhour, synchour);
endmodule