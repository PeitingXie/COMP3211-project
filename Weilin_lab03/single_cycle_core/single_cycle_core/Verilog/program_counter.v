`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2019 16:49:25
// Design Name: 
// Module Name: program_counter
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
//-- Copyright (C) 2006 
//-- All Rights Reserved. 
//-- Written by Lih Wen Koh (lwkoh@cse.unsw.edu.au) in VHDL
//-- Translated into Verilog by Sajid Hussain (sajid.hussain@unsw.edu.au)
//--

//    ---------------------------------------------------------------------------
//    -- program_counter.vhd - Program Counter Implementation 
//    -- 
//    -- Note : The program counter is simply a register that updates its output 
//    -- on the rising clock edge.
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
    
//////////////////////////////////////////////////////////////////////////////////


module program_counter(
    
             input  reset    ,
             input  clk      ,
             input [3:0]  addr_in ,
             output reg [3:0]  addr_out 
              );
    
    
    always @( posedge clk )
       begin
               if (reset==1)
                   addr_out <= 0; 
               else 
                   addr_out <= addr_in;
       end
   
   
    
endmodule
