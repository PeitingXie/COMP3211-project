`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2019 18:06:47
// Design Name: 
// Module Name: register_file
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
//-- register_file.vhd - Implementation of A Dual-Port, 16 x 16-bit
//--                     Collection of Registers.
//-- 
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


module register_file(
           input reset           ,
           input clk             ,
           input[3:0] read_register_a ,
           input[3:0] read_register_b ,
           input write_enable    ,
           input[3:0] write_register  ,
           input[15:0] write_data      ,
           output[15:0] read_data_a     ,
           output[15:0] read_data_b       

    );
    
    
    reg[15:0] reg_file[0:15] ;
    
    always @(negedge clk)
      begin
           if (reset)
             begin
                   reg_file[0] <= 0;
                   reg_file[1] <= 0;
                   reg_file[2] <= 0;
                   reg_file[3] <= 0;
                   reg_file[4] <= 0;
                   reg_file[5] <= 0;
                   reg_file[6] <= 0;
                    reg_file[7] <= 0;
                     reg_file[8] <= 0;
                     reg_file[9] <= 0;
                     reg_file[10] <= 0;
                     reg_file[11] <= 0;
                     reg_file[12] <= 0;
                     reg_file[13] <= 0;
                     reg_file[14] <= 0;
                     reg_file[15] <= 0;                   
             end
           else if (write_enable)
               begin
                    // register write on the falling clock edge
                      reg_file[write_register] <= write_data;
               end
        // enforces value zero for register $0
        reg_file[0] <= 0;
    
    end
    
    // continuous read of the registers at location read_register_a  and read_register_b
      assign      read_data_a = reg_file[read_register_a]; 
      assign      read_data_b = reg_file[read_register_b];
    
endmodule

 