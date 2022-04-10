`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2019 17:49:50
// Design Name: 
// Module Name: mux_2to1_4b
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
//---------------------------------------------------------------------------
//-- mux_2to1_4b.vhd - 4-bit 2-to-1 Multiplexer Implementation
//--
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


module mux_2to1_4b(
           input mux_select ,
           input[3:0] data_a     ,
           input[3:0] data_b     ,
           output[3:0] data_out   
    );
    
    genvar i;
    
    generate 
       begin 
             for (i=0; i<4; i=i+1)
                begin
                     mux_2to1_1b  bit_mux
                             (      .mux_select (mux_select),
                                    .data_a ( data_a[i] ),
                                    .data_b ( data_b[i] ),
                                    .data_out ( data_out[i] )
                                )  ;
                 end
       end 
    endgenerate
endmodule

 