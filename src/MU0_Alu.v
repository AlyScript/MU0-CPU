// MU0 ALU design 
// P W Nutter (based on a design by Jeff Pepper)
// Date 7/7/2021

// Do not touch the following line it is required for simulation 
`timescale 1ns/100ps
`default_nettype none

// module header

module MU0_Alu (
               input  wire [15:0]  X, 
               input  wire [15:0]  Y, 
               input  wire [1:0]   M, 
               output reg  [15:0]  Q
	       );

// behavioural description for the ALU

always @ (*)
begin
    case(M)
        2'b00: Q <= Y;  // if M == 0, output Y
        2'b01: Q <= X + Y; // if M == 01, output X+Y
        2'b10: Q <= X + 1;  // if M == 10, output X+1
        2'b11: Q <= X + (~Y) + 1; // if M == 11, output X-Y
        default: Q <= 16'hxxxx;
    endcase
end





endmodule 

// for simulation purposes, do not delete
`default_nettype wire
