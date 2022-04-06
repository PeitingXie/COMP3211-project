`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2019 15:31:52
// Design Name: 
// Module Name: single_cycle_core
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

//---------------------------------------------------------------------------
//-- single_cycle_core.vhd - A Single-Cycle Processor Implementation 
//-- adapted from the VHDL model developed by Lih Wen Koh with the infromation as copied below.
//--
//-- Notes : 
//--
//-- See single_cycle_core.pdf for the block diagram of this 
//-- single cycle processor core.
//--
//-- Instruction Set Architecture (ISA) for the single-cycle-core:
//--   Each instruction is 16-bit wide, with four 4-bit fields.
//--
//--     noop      
//--        # no operation or to signal end of program
//--        # format:  | opcode = 0 |  0   |  0   |   0    | 
//--
//--     load  rt, rs, offset     
//--        # load data at memory location (rs + offset) into rt
//--        # format:  | opcode = 1 |  rs  |  rt  | offset |
//--
//--     store rt, rs, offset
//--        # store data rt into memory location (rs + offset)
//--        # format:  | opcode = 3 |  rs  |  rt  | offset |
//--
//--     add   rd, rs, rt
//--        # rd <- rs + rt
//--        # format:  | opcode = 8 |  rs  |  rt  |   rd   |
//--
//--
//-- Copyright (C) 2006 by Lih Wen Koh (lwkoh@cse.unsw.edu.au)
//-- All Rights Reserved. 
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

//library IEEE;
//use IEEE.STD_LOGIC_1164.ALL;
//use IEEE.STD_LOGIC_ARITH.ALL;
//use IEEE.STD_LOGIC_UNSIGNED.ALL;

module single_cycle_core_v 
       (
         input clk,
         input reset 
         );
         
 
//----------program counter signal --------------
wire [3:0] sig_next_pc             ;
wire [3:0] sig_curr_pc             ;
//------------ Next PC -----------------
wire [3:0] sig_one_4b  = "0001"    ;
wire sig_pc_carry_out         ;
//---------------instruction memroy signal ---------------
wire [15:0] sig_insn              ;
//-------------- sign extention ---------------------
wire[15:0] sig_sign_extended_offset ;
//----------------- Resigter destination -----------
wire sig_reg_dst              ;
wire[3:0] sig_write_register       ;
wire  sig_reg_write     ; 
//----------- register file signal ----------------
wire sig_mem_write            ;
wire sig_mem_to_reg           ;
wire[15:0] sig_write_data     ;
wire[15:0] sig_read_data_a    ;
wire[15:0] sig_read_data_b    ;   
//------------------- ALU signals ----------------------
wire sig_alu_src              ;
wire[15:0] sig_alu_src_b            ;
wire[15:0] sig_alu_result           ; 
wire sig_alu_carry_out              ;
//---------------Data memory -----------------------
wire[15:0] sig_data_mem_out         ;
//--------------------------------------------------

program_counter PC
        ( .clk(clk),
          .reset(reset),
          .addr_in(sig_next_pc),
          .addr_out(sig_curr_pc)        
        );
 

adder_4b next_PC 
         ( .src_a ( sig_curr_pc )    ,
           .src_b ( sig_one_4b)   ,
           .sum    ( sig_next_pc )   ,
           .carry_out ( sig_pc_carry_out )
         );

 

 instruction_memory ins_mem
       (
         .clk(clk),
         .reset(reset),
         .addr_in(sig_curr_pc),
         .insn_out(sig_insn)
       ) ;
 
 sign_extend_4to16 sign_extend
     (
       .data_in ( sig_insn[3:0] ),
       .data_out( sig_sign_extended_offset)
     ) ;
          
  
 
control_unit ctrl_unit 
         ( .opcode    ( sig_insn[15:12] ) ,
           .reg_dst   ( sig_reg_dst ) ,
           .reg_write ( sig_reg_write ),
           .alu_src   ( sig_alu_src ) ,
           .mem_write ( sig_mem_write ) ,
           .mem_to_reg ( sig_mem_to_reg)
         );
 

 mux_2to1_4b mux_reg_dst
            ( .mux_select(sig_reg_dst)     ,
              .data_a  ( sig_insn[7:4] )   ,
              .data_b  ( sig_insn[3:0] )  ,
              .data_out( sig_write_register)  
               );
 


register_file register_file_inst
         ( .reset(reset)          ,
           .clk  (clk)            ,
           .read_register_a ( sig_insn[11:8] ) ,
           .read_register_b ( sig_insn[7:4] ),
           .write_enable    ( sig_reg_write ),
           .write_register  ( sig_write_register ),
           .write_data      ( sig_write_data ) ,
           .read_data_a     ( sig_read_data_a ),
           .read_data_b     ( sig_read_data_b ) 
         );
 

mux_2to1_16b mux_alu_src 
         ( .mux_select (sig_alu_src) ,
           .data_a     (sig_read_data_b) ,
           .data_b     (sig_sign_extended_offset),
           .data_out   (sig_alu_src_b)
          ) ;
 


adder_16b ALU 
         ( .src_a  ( sig_read_data_a )   ,
           .src_b  ( sig_alu_src_b )  ,
           .sum    ( sig_alu_result )  ,
           .carry_out (sig_alu_carry_out) 
         );
 

data_memory data_mem
         ( .reset(reset)        ,
           .clk  (clk)    ,
           .write_enable ( sig_mem_write ),
           .write_data   ( sig_read_data_b ),
           .addr_in      ( sig_alu_result[3:0] ),
           .data_out     ( sig_data_mem_out )
         );

 

 mux_2to1_16b mux_mem_to_reg  
             ( 
               .mux_select (sig_mem_to_reg),
               .data_a     ( sig_alu_result),
               .data_b     ( sig_data_mem_out),
               .data_out   ( sig_write_data )               
              );

endmodule 
 