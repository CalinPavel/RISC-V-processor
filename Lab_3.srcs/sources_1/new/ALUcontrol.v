`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/04/2021 02:03:22 PM
// Design Name: 
// Module Name: ALUcontrol
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


module ALUcontrol(input [1:0] ALUop,
                  input [6:0] funct7,
                  input [2:0] funct3,
                  output reg [3:0] ALUinput);

    always @(*) begin
        case (ALUop) 
            2'b00: 
                case ({funct7, funct3})
                    10'bxxxxxxx011: ALUinput <= 4'b0010; //ld, sd instruction
                endcase
            2'b10: 
                case ({funct7, funct3})
                    10'b0000000000: ALUinput <= 4'b0010; //add(i) instruction
                    10'b0100000000: ALUinput <= 4'b0110; //sub(i) instruction
                    10'b0000000111: ALUinput <= 4'b0000; //and(i) instruction
                    10'b0000000110: ALUinput <= 4'b0001; //or(i) instruction
                    10'b0000000100: ALUinput <= 4'b0011; //xor(i) instruction
                    10'b0000000101: ALUinput <= 4'b0101; //srl(i) instruction
                    10'b0000000001: ALUinput <= 4'b0100; //sll(i) instruction
                    10'b0100000101: ALUinput <= 4'b1001; //sra(i) instruction
                    
                    10'b0000000010: ALUinput <= 4'b0111; //sltu instruction
                    10'b0000000011: ALUinput <= 4'b1000; //slt instruction
                endcase
            2'b11:
               case ({funct7, funct3})
                    10'b0000000000: ALUinput <= 4'b0010; //add(i) instruction
                    10'b0100000000: ALUinput <= 4'b0110; //sub(i) instruction
                    10'b0000000111: ALUinput <= 4'b0000; //and(i) instruction
                    10'b0000000110: ALUinput <= 4'b0001; //or(i) instruction
                    10'b0000000100: ALUinput <= 4'b0011; //xor(i) instruction
                    10'b0000000101: ALUinput <= 4'b0101; //srl(i) instruction
                    10'b0000000001: ALUinput <= 4'b0100; //sll(i) instruction
                    10'b0100000101: ALUinput <= 4'b1001; //sra(i) instruction
                    
                endcase 
                
            2'b01: 
                case ({funct7, funct3})
                    10'bxxxxxxx00x: ALUinput <= 4'b0110; //beq, bne instruction
                    10'bxxxxxxx10x: ALUinput <= 4'b1000; //blt, bge instruction
                    10'bxxxxxxx11x: ALUinput <= 4'b0111; //bltu, bgeu instruction
                endcase
            default: ALUinput <= 4'bxxxx;
        endcase
    end
endmodule
