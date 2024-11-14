module buffer_cell (
    input wire in,
    output wire out
    );
    assign out = in;
endmodule

module and_cell (
    input wire a,
    input wire b,
    output wire out
    );

    assign out = a & b;
endmodule

module or_cell (
    input wire a,
    input wire b,
    output wire out
    );

    assign out = a | b;
endmodule

module xor_cell (
    input wire a,
    input wire b,
    output wire out
    );

    assign out = a ^ b;
endmodule

module xnr_cell (
    input wire a,
    input wire b,
    output wire out
    );

    assign out = !(a ^ b);
endmodule

module nand_cell (
    input wire a,
    input wire b,
    output wire out
    );

    assign out = !(a&b);
endmodule

module nand3_cell (
    input wire a,
    input wire b,
    input wire c,
    output wire out
    );

    assign out = !(a&b&c);
endmodule

module nand4_cell (
    input wire a,
    input wire b,
    input wire c,
    input wire d,
    output wire out
    );

    assign out = !(a&b&c&d);
endmodule

module nor_cell (
    input wire a,
    input wire b,
    output wire out
    );

    assign out = !(a||b);
endmodule

module nor3_cell (
    input wire a,
    input wire b,
    input wire c,
    output wire out
    );

    assign out = !(a||b||c);
endmodule

module nor4_cell (
    input wire a,
    input wire b,
    input wire c,
    input wire d,
    output wire out
    );

    assign out = !(a||b||c||d);
endmodule

module not_cell (
    input wire in,
    output wire out
    );

    assign out = !in;
endmodule

module mux_cell (
    input wire a,
    input wire b,
    input wire sel,
    output wire out
    );

    assign out = sel ? b : a;
endmodule

module dff_cell (
    input wire clk,
    input wire d,
    output reg q,
    output wire notq
    );

    assign notq = !q;
    always @(posedge clk)
        q <= d;

endmodule

module dffr_cell(
    input wire d,
    input wire clk,
    input wire nrst,
    output wire q,
    output wire nq,
);

    reg state;
    always @(posedge clk or negedge nrst)
        if(!nrst)
            state <= 0;
        else
            state <= d;
    
    assign q = state;
    assign nq = ~state;  
endmodule

module dffsr_cell (
    input wire clk,
    input wire d,
    input wire s,
    input wire r,
    output reg q,
    output wire notq
    );

    assign notq = !q;

    always @(posedge clk or posedge s or posedge r) begin
        if (r)
            q <= 0;
        else if (s)
            q <= 1;
        else
            q <= d;
    end
endmodule