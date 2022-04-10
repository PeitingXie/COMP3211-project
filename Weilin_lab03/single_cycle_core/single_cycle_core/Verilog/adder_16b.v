`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.09.2019 15:56:14
// Design Name: 
// Module Name: adder_16b
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
//  ---------------------------------------------------------------------------
//    -- adder_16b.vhd - 16-bit Adder Implementation
//    --
//    --
//-- Copyright (C) 2006 
//-- All Rights Reserved. 
//-- Written by Lih Wen Koh (lwkoh@cse.unsw.edu.au) in VHDL
//-- Translated into Verilog by Sajid Hussain (sajid.hussain@unsw.edu.au)
//--
//    --
//    -- The single-cycle processor core is provided AS IS, with no warranty of 
//    -- any kind, express or implied. The user of the program accepts full 
//    -- responsibility for the application of the program and the use of any 
//    -- results. This work may be downloaded, compiled, executed, copied, and 
//    -- modified solely for nonprofit, educational, noncommercial research, and 
//    -- noncommercial scholarship purposes provided that this notice in its 
//    -- entirety accompanies all copies. Copies of the modified software can be 
//    -- delivered to persons who use it solely for nonprofit, educational, 
//    -- noncommercial research, and noncommercial scholarship purposes provided 
//    -- that this notice in its entirety accompanies all copies.
//    --
//    ---------------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////////////////


module adder_16b(
               input [15:0] src_a     ,
               input [15:0] src_b     ,
               output [15:0] sum       ,
               output carry_out  

    );
    
    
    wire [16:0]  sig_result;    
     assign sig_result = {1'b0 , src_a} + {1'b0 , src_b};
     assign  sum       = sig_result[15:0];
     assign  carry_out = sig_result[16];
    
    
endmodule


 