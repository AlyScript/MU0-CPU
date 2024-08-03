// MU0 datapath design - structural style
// P W Nutter (based on a design by Jeff Pepper)
// Date 20/8/2021
// 

// Do not touch the following line it is required for simulation 
`timescale 1ns/100ps

// for simulation purposes, do not delete
`default_nettype none

module MU0_Datapath(
input  wire        Clk,
input  wire        Reset,
input  wire [15:0] Din,
input  wire        X_sel,
input  wire        Y_sel,
input  wire        Addr_sel,
input  wire        PC_En,
input  wire        IR_En,
input  wire        Acc_En,
input  wire [1:0]  M,
output wire [3:0]  F,			// top 4 bits of the instruction
output wire [11:0] Address,
output wire [15:0] Dout,
output wire        N,
output wire        Z,
output wire [15:0] PC,
output wire [15:0] Acc);


// Define internal signals using names from the datapath schematic
// here I have defined any internal signals which are not defined above
wire [15:0] X;
wire [15:0] Y;
wire [15:0] ALU;
wire [15:0] IR;

// Instantiate Datapath components



//MU0 registers
MU0_Reg12 PCReg(.D(ALU[11:0]), .En(PC_En), .Reset(Reset), .Clk(Clk), .Q(PC[11:0])); // 12bit PCreg
MU0_Reg16 ACCReg(.D(ALU), .En(Acc_En), .Reset(Reset), .Clk(Clk), .Q(Acc)); // 16bit Accumulator reg
MU0_Reg16 IRReg(.D(Din), .En(IR_En), .Reset(Reset), .Clk(Clk), .Q(IR)); // 16bit Instruction reg

// MU0 multiplexors
MU0_Mux12 AddrMux(.S(Addr_sel), .A(PC[11:0]), .B(IR[11:0]), .Q(Address));   // 12bit Address multiplexer
MU0_Mux16 XMux(.S(X_sel), .A(Acc), .B(PC), .Q(X));  // 16bit X multiplexer
MU0_Mux16 YMux(.S(Y_sel), .A(Din), .B(IR), .Q(Y));  // 16bit Y multiplexer


// MU0 ALU
MU0_Alu MU0_ALU(.X(X), .Y(Y), .M(M), .Q(ALU));

// MU0 Flag generation
MU0_Flags FLAGS(.Acc(Acc), .N(N), .Z(Z));

// The following connects X and Dout together, there's no need for you to do so
// use X when defining your datapath structure
assign Dout = X;
// Buffer added F is op 4 bits of the instruction
assign F = IR[15:12];
assign PC[15:12] = 4'b0;
endmodule 

// for simulation purposes, do not delete
`default_nettype wire
