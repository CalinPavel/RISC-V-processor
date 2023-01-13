`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/04/2021 04:19:33 PM
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU(input [3:0] ALUop,
           input [31:0] ina,inb,
           output zero,
           output reg [31:0] out);
           
            
always@(*) begin
    case(ALUop)
            4'b0010: out = ina + inb; // addition
            4'b0110: out = ina - inb; // subtraction
            4'b0000: out = ina & inb; // bitwise and
            4'b0001: out = ina | inb; // bitwise or
            4'b0011: out = ina ^ inb; // bitwise xor
            4'b0101: out = ina >>> inb; // shift right logical
            4'b0100: out = ina << inb; // shift left logical
            4'b1001: out = ina >> inb; // shift right arithmetic
            4'b0111: out = (ina < inb) ? 1'b1 : 1'b0; // set on less than unsigned
            4'b1000: out = (ina < inb) ? 1'b1 : 1'b0; // set on less than
            4'b0110: out = (ina == inb) ? 1'b1 : 1'b0; // set on equal
            4'b0110: out = (ina != inb) ? 1'b1 : 1'b0; // set on not equal
            4'b1000: out = (ina < inb) ? 1'b1 : 1'b0; // set on less than
            4'b0111: out = (ina < inb) ? 1'b1 : 1'b0; // set on less than unsigned
            default: out = 32'b0;
    endcase
  end
  
assign zero = (out == 32'b0)? 1 : 0;
endmodule
