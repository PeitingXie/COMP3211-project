`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2019 18:24:16
// Design Name: 
// Module Name: data_memory
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
//-- data_memory.vhd - Implementation of A Single-Port, 16 x 16-bit Data
//--                   Memory.
//-- 
//-- Copyright (C) 2006 
//-- All Rights Reserved. 
//-- Written by Lih Wen Koh (lwkoh@cse.unsw.edu.au) in VHDL
//-- Translated into Verilog by Sajid Hussain (sajid.hussain@unsw.edu.au)
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


module data_memory(
           input reset        ,
           input clk          ,
           input write_enable ,
           input[15:0] write_data   ,
           input[3:0] addr_in      ,
           output[15:0] data_out     
    );
    
    reg[15:0] mem_array [0:15] ;
    
    always @ (negedge clk)
          begin
                if (reset)
                      begin
                        //      initial values of the instruction memory :
                        //      insn_0 : load  $1, $0, 0   - load data 0($0) into $1
                        //      insn_1 : load  $2, $0, 1   - load data 1($0) into $2
                        //      insn_2 : add   $3, $0, $1  - $3 <- $0 + $1
                        //      insn_3 : add   $4, $1, $2  - $4 <- $1 + $2
                        //      insn_4 : store $3, $0, 2   - store data $3 into 2($0)
                        //      insn_5 : store $4, $0, 3   - store data $4 into 3($0)
                        //      insn_6 - insn_15 : noop    - end of program
          
                      mem_array[0]  <= 16'h1010;
                      mem_array[1]  <= 16'h1021;
                      mem_array[2]  <= 16'h8013;
                      mem_array[3]  <= 16'h8124;
                      mem_array[4]  <= 16'h3032;
                      mem_array[5]  <= 16'h3043;
                      mem_array[6]  <= 16'h0000;
                      mem_array[7]  <= 16'h0000;
                      mem_array[8]  <= 16'h0000;
                      mem_array[9]  <= 16'h0000;
                      mem_array[10] <= 16'h0000;
                      mem_array[11] <= 16'h0000;
                      mem_array[12] <= 16'h0000;
                      mem_array[13] <= 16'h0000;
                      mem_array[14] <= 16'h0000;
                      mem_array[15] <= 16'h0000;
                      end
               else if (write_enable)
                           // memory writes on the falling clock edge
                           mem_array[addr_in] <= write_data;                    
                             
          end
          
          // continuous read of the memory location given by var_addr 
          assign   data_out = mem_array[addr_in];  
    
endmodule

 