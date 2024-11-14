module count_1_12(input clk, input nrst, input cin, output F0, output F1, output F2, output F3);
    wire N_1, N_2, noflow, nF0;
    xor_cell x0(cin, F0, N_1);
    and_cell a0(N_1, noflow, N_2);
    dffr_cell d0(.d(N_2), .clk(clk), .nrst(nrst), .q(F0), .nq(nF0));
    wire N_3, N_4, N_5, nF1;
    and_cell a1(F0, cin, N_3);
    xor_cell x1(N_3, F1, N_4);
    and_cell a2(N_4, noflow, N_5);
    dffr_cell d1(.d(N_5), .clk(clk), .nrst(nrst), .q(F1), .nq(nF1));
    wire N_6, N_7, N_8, iF2, nF2;
    and_cell a3(F1, N_3, N_6);
    xor_cell x2(N_6, iF2, N_7);
    and_cell a4(N_7, noflow, N_8);
    dffr_cell d2(.d(N_8), .clk(clk), .nrst(nrst), .q(iF2), .nq(nF2));
    wire N_9, N_10, N_11, nF3, iF3;
    and_cell a5(iF2, N_6, N_9);
    xor_cell x3(N_9, iF3, N_10);
    and_cell a6(N_10, noflow, N_11);
    dffr_cell d7(.d(N_11), .clk(clk), .nrst(nrst), .q(iF3), .nq(nF3));
    nand4_cell n40(nF0, nF1, iF2, iF3, noflow);

    wire N_12;
    
    nor4_cell n41(F0, F1, iF2, iF3, N_12);

    or_cell o0(N_12, iF2, F2);
    or_cell o1(N_12, iF3, F3);


endmodule

module count_3(input clk, input nrst, input cin, output F0, output F1);
    wire N_1, N_2, N_3;
    xor_cell x0(cin, F0, N_1);
    dffr_cell d0(.d(N_1), .clk(clk), .nrst(nrst), .q(F0));
    and_cell a0(cin, F0, N_2);
    xor_cell x1(N_2, F1, N_3);
    dffr_cell d1(.d(N_3), .clk(clk), .nrst(nrst), .q(F1));
endmodule

module count_5(input clk, input nrst, input cin, output F0, output F1, output F2, output oflow);
    wire N_1, N_2, noflow, nF0;
    xor_cell x0(cin, F0, N_1);
    and_cell a0(N_1, noflow, N_2);
    dffr_cell d0(.d(N_2), .clk(clk), .nrst(nrst), .q(F0), .nq(nF0));
    wire N_3, N_4, N_5, nF1;
    and_cell a1(F0, cin, N_3);
    xor_cell x1(N_3, F1, N_4);
    and_cell a2(N_4, noflow, N_5);
    dffr_cell d1(.d(N_5), .clk(clk), .nrst(nrst), .q(F1), .nq(nF1));
    wire N_6, N_7, N_8;
    and_cell a3(F1, N_3, N_6);
    xor_cell x2(N_6, F2, N_7);
    and_cell a4(N_7, noflow, N_8);
    dffr_cell d2(.d(N_8), .clk(clk), .nrst(nrst), .q(F2));
    nand3_cell n30(nF0, F1, F2, noflow);
    not_cell i0(noflow, oflow);

endmodule

module count_9(input clk, input nrst, input cin, output F0, output F1, output F2, output F3, output oflow);
    wire N_1, N_2, noflow, nF0;
    xor_cell x0(cin, F0, N_1);
    and_cell a0(N_1, noflow, N_2);
    dffr_cell d0(.d(N_2), .clk(clk), .nrst(nrst), .q(F0), .nq(nF0));
    wire N_3, N_4, N_5, nF1;
    and_cell a1(F0, cin, N_3);
    xor_cell x1(N_3, F1, N_4);
    and_cell a2(N_4, noflow, N_5);
    dffr_cell d1(.d(N_5), .clk(clk), .nrst(nrst), .q(F1), .nq(nF1));
    wire N_6, N_7, N_8, nF2;
    and_cell a3(F1, N_3, N_6);
    xor_cell x2(N_6, F2, N_7);
    and_cell a4(N_7, noflow, N_8);
    dffr_cell d2(.d(N_8), .clk(clk), .nrst(nrst), .q(F2), .nq(nF2));
    wire N_9, N_10, N_11, nF3;
    and_cell a5(F2, N_6, N_9);
    xor_cell x3(N_9, F3, N_10);
    and_cell a6(N_10, noflow, N_11);
    dffr_cell d7(.d(N_11), .clk(clk), .nrst(nrst), .q(F3), .nq(nF3));
    nand4_cell n40(nF0, F1, nF2, F3, noflow);
    not_cell i0(noflow, oflow);

endmodule

module decoder_12_to_2_digit(input F0, input F1, input F2, input F3, output D0, output D1, output D2, output D3, output H10);
    wire N_1, N_2, N_3, nF2, nF1, nF0;

    not_cell n0(F0, nF0);
    not_cell n1(F1, nF1);
    not_cell n2(F2, nF2);
    nand3_cell n30(F3, nF2, F1, N_1);
    nand4_cell n40(F3, F2, nF1, nF0, N_2);
    nand_cell n20(N_1, N_2, H10);

    assign D0 = F0;
    
    and_cell a0(H10, nF1, N_3);
    xor_cell x0(H10, F1, D1);
    xor_cell x1(N_3, F2, D2);
    xor_cell x2(H10, F3, D3);

endmodule

module mux_4(input F0, input F1, input D0, input D1, input D2, input D3, output O);
    wire I0, I1;
    mux_cell m0(D0, D1, F0, I0);
    mux_cell m1(D2, D3, F0, I1);

    mux_cell m2(I0, I1, F1, O);
endmodule

module decoder_2to4(input F0, input F1, output D0, output D1, output D2, output D3);
    wire nF0, nF1;
    not_cell i0(F0, nF0);
    not_cell i1(F1, nF1);

    wire nD0, nD1, nD2, nD3;

    nand_cell n0(nF0, nF1, nD0);
    nand_cell n1(F0, nF1, nD1);
    nand_cell n2(nF0, F1, nD2);
    nand_cell n3(F0, F1, nD3);

    not_cell i2(nD0, D0);
    not_cell i3(nD1, D1);
    not_cell i4(nD2, D2);
    not_cell i5(nD3, D3);

endmodule

module bad_sevenseg_decoder(input D0, input D1, input D2, input D3, output SegA, output SegB, output SegC, output SegD, output SegE, output SegF, output SegG);
    wire nD0, nD1, nD2, nD3;

    
    not_cell n0(D0, nD0);
    not_cell n1(D1, nD1);
    not_cell n2(D2, nD2);
    not_cell n3(D3, nD3);

    wire N_1, N_2, N_3, N_4, N_5, N_6, N_7, N_8, N_9;
    nand_cell na0(D2, D0, N_1);
    nand_cell na1(D1, D0, N_2);
    nand_cell na2(nD2, nD0, N_3);
    nand_cell na3(nD1, nD0, N_4);
    nand3_cell na4(D2, nD1, D0, N_5);
    nand_cell na5(nD2, D1, N_6);
    nand_cell na6(D1, nD0, N_7);
    nand_cell na7(D2, nD0, N_8);
    nand_cell na8(D2, nD1, N_9);

    wire nSegA, nSegB, nSegC, nSegD, nSegE, nSegF, nSegG;

    nand4_cell na9(nD3, N_2, N_1, N_3, nSegA);
    nand3_cell na10(N_2, D2, N_4, nSegB);
    nand3_cell na11(nD0, D1, nD2, nSegC);
    nand4_cell na12(N_3, N_5, N_6, N_7, nSegD);
    nand_cell na13(N_3, N_7, nSegE);
    nand4_cell na14(nD3, N_4, N_8, N_9, nSegF);
    nand4_cell na15(nD3, N_7, N_6, N_9, nSegG);

    not_cell n4(nSegA, SegA);
    not_cell n5(nSegB, SegB);
    not_cell n6(nSegC, SegC);
    not_cell n7(nSegD, SegD);
    not_cell n8(nSegE, SegE);
    not_cell n9(nSegF, SegF);
    not_cell n10(nSegG, SegG);

endmodule

module sevenseg_decoder(input D0, input D1, input D2, input D3, output SegA, output SegB, output SegC, output SegD, output SegE, output SegF, output SegG);
    wire[3:0] indata;
    wire[6:0] outdata;

    assign indata[0] = D0;
    assign indata[1] = D1;
    assign indata[2] = D2;
    assign indata[3] = D3;

    assign outdata[0] = SegA;
    assign outdata[1] = SegB;
    assign outdata[2] = SegC;
    assign outdata[3] = SegD;
    assign outdata[4] = SegE;
    assign outdata[5] = SegF;
    assign outdata[6] = SegG;

always @(indata)
begin
    case (indata)
        4'b0000 : outdata = 7'b1000000; 
        4'b0001 : outdata = 7'b1111001; 
        4'b0010 : outdata = 7'b0100100; 
        4'b0011 : outdata = 7'b0110000; 
        4'b0100 : outdata = 7'b0011001; 
        4'b0101 : outdata = 7'b0010010; 
        4'b0110 : outdata = 7'b0000010; 
        4'b0111 : outdata = 7'b1111000; 
        4'b1000 : outdata = 7'b0000000; 
        4'b1001 : outdata = 7'b0010000;
        default : outdata = 0; 

    endcase
end
endmodule

module clock #(parameter DIVIDE=24000) (input inclk, output clkdiv);
    reg	[(32-1):0]	counter;
    always @(posedge inclk)
    begin
        counter <= (counter == DIVIDE) ? 0 : (counter + 1'b1);
	    clkdiv <= (counter > DIVIDE/2);
    end
endmodule

module tick #(parameter DIVIDE=15640) (input inclk, output clkdiv);
    reg	[(32-1):0]	counter;
    always @(posedge inclk)
    begin
        counter <= (counter == DIVIDE) ? 0 : (counter + 1'b1);
	    clkdiv <= (counter == DIVIDE-1);
    end
endmodule


(* top *)
module top (input [3:0] SW, input clk, input P3_1, input P3_2, input P3_3, input P3_4, input P3_9, input P3_10, input P3_11, input P3_12, output P2_1, output P2_2, output P2_3, output P2_4, output P2_9, output P2_10, output P2_11, output P2_12, output P1_10, output P1_3, output P1_4, output P1_9, output LED_R);

    wire X0, X1, X2, X3, Y0, Y1, Y2, Y3;
    wire OUT0, OUT1, OUT2, OUT3, OUT4, OUT5, OUT6, OUT7, OUT8;
    wire clk_divided, tick;
    //assign F0 = ~SW[0];
    //assign F1 = ~SW[1];
    assign X3 = P3_1;
    assign X2 = P3_2;
    assign X1 = P3_3;
    assign X0 = P3_4;
    assign Y3 = P3_12;
    assign Y2 = P3_11;
    assign Y1 = P3_10;
    assign Y0 = P3_9;
    assign P2_1 = OUT4;
    assign P2_2 = OUT5;
    assign P2_3 = OUT6;
    assign P2_4 = OUT7;
    assign P2_12 = OUT0;
    assign P2_11 = OUT1;
    assign P2_10 = OUT2;
    assign P2_9 = OUT3;
    assign LED_R = ~OUT8;
    assign OUT8 = clk_divided;

    wire tick, syncmin, synchour, nsyncmin, mintick, hourtick;
    wire min0, min1, min2, min3, mino;
    wire min10, min11, min12, min1o, houri;
    wire hmid0, hmid1, hmid2, hmid3;
    wire hour0, hour1, hour2, hour3;
    wire hour10;

    wire F0, F1;
    wire digit1, digit2, digit3, digit4;
    wire D0, D1, D2, D3, DP;
    wire nF0;


    clock #(.DIVIDE(46000)) cl0 (clk, clk_divided);
    tick cl1 (clk_divided, tick);

    //Button Synchroniser

    button_syncroniser bs0(clk_divided, X0, ~Y1, ~Y0, syncmin, synchour);
    not_cell not1(syncmin, nsyncmin);
    
    //Digit and DP driver

    not_cell not0(F0, nF0);
    nand_cell n0(nF0, F1, DP);
    count_3 c30(clk_divided, X0, 1, F0, F1);
    wire digit1int;
    decoder_2to4 dec0(F0, F1, digit4, digit3, digit2, digit1int);
    and_cell and1(digit1int, hour10, digit1);

    //Minute counter
    or_cell or0(tick, syncmin, mintick);
    count_9 c90(clk_divided, X0, mintick, min0, min1, min2, min3, mino);
    count_5 c50(clk_divided, X0, mino, min10, min11, min12, min1o);
    and_cell and0(~syncmin, min1o, houri);

    //Hour counter
    or_cell or1(houri, synchour, hourtick);
    count_1_12 co0(clk_divided, X0, hourtick, hmid0, hmid1, hmid2, hmid3);
    decoder_12_to_2_digit dec1(hmid0, hmid1, hmid2, hmid3, hour0, hour1, hour2, hour3, hour10);


    mux_4 m0(F0, F1, min0, min10, hour0, hour10, D0);
    mux_4 m1(F0, F1, min1, min11, hour1,      0, D1);
    mux_4 m2(F0, F1, min2, min12, hour2,      0, D2);
    mux_4 m4(F0, F1, min3,     0, hour3,      0, D3);


    //Sevenseg output
    sevenseg_decoder dec2(D0, D1, D2, D3, OUT5, OUT4, OUT0, OUT1, OUT2, OUT7, OUT6);
    assign OUT3 = DP;

    //assign OUT5 = 0;
    assign P1_10 = digit3;
    assign P1_3 = digit4;
    assign P1_4 = digit1;
    assign P1_9 = digit2;

//four_bit_alu fba0(X0, X1, X2, X3, Y0, Y1, Y2, Y3, F0, F1, OUT0, OUT1, OUT2, OUT3);
endmodule