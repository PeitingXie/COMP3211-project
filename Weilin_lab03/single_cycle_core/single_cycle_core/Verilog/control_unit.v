`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2019 17:37:58
// Design Name: 
// Module Name: control_unit
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
//  //---------------------------------------------------------------------------
//-- control_unit.vhd - Control Unit Implementation
//--
//-- Notes: refer to headers in single_cycle_core.vhd for the supported ISA.
//--
//--  control signals:
//--     reg_dst    : asserted for ADD instructions, so that the register
//--                  destination number for the 'write_register' comes from
//--                  the rd field (bits 3-0). 
//--     reg_write  : asserted for ADD and LOAD instructions, so that the
//--                  register on the 'write_register' input is written with
//--                  the value on the 'write_data' port.
//--     alu_src    : asserted for LOAD and STORE instructions, so that the
//--                  second ALU operand is the sign-extended, lower 4 bits
//--                  of the instruction.
//--     mem_write  : asserted for STORE instructions, so that the data 
//--                  memory contents designated by the address input are
//--                  replaced by the value on the 'write_data' input.
//--     mem_to_reg : asserted for LOAD instructions, so that the value fed
//--                  to the register 'write_data' input comes from the
//--                  data memory.
//--
//-- Copyright (C) 2006 
//-- All Rights Reserved. 
//-- Written by Lih Wen Koh (lwkoh@cse.unsw.edu.au) in VHDL
//-- Translated into Verilog by Sajid Hussain (sajid.hussain@unsw.edu.au)
//--
//--
//-- The single-cycle processor core is provided AS IS, with no warranty of 
//-- any kind, express or implied. The user of the program accepts full 
//-- responsibility for the application of the program and the use of any 
//-- results. This work may be downloaded, compiled, executed, copied, and 
//-- modified solely for nonprofit, educational, noncommercial research, and 
//-- noncommercial scholarship purposes provided that this notice in its 
//-- entirety accompanies all copies. Copies of the modified software can be 
//-- delivered to persons who use it solely for nonprofit, educational, 
//-- noncommercial research, and noncommercial scholarship purposes provided 
//-- that this notice in its entirety accompanies all copies.
//--
//---------------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////////////////


module control_unit
  (        input [3:0] opcode     ,
           output reg_dst    ,
           output reg_write  ,
           output alu_src    ,
           output mem_write  ,
           output mem_to_reg 
    );
    
    parameter  OP_LOAD  = 4'b0001;  
    parameter OP_STORE  =4'b0011; 
    parameter OP_ADD   = 4'b1000; 

   assign reg_dst    =  (opcode == OP_ADD)? 1:0;       
   assign reg_write  = (opcode == OP_ADD  || opcode == OP_LOAD)? 1:0; 
   assign alu_src    = (opcode == OP_LOAD || opcode == OP_STORE)? 1:0; //     
                 
   assign mem_write  =  (opcode == OP_STORE)? 1:0; //
                 
   assign mem_to_reg = (opcode == OP_LOAD)? 1:0; //

    
endmodule

 