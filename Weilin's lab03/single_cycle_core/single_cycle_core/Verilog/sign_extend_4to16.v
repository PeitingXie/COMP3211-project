`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Sajid Hussain
// 
// Create Date: 13.09.2019 17:27:00
// Design Name: 
// Module Name: sign_extend_4to16
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
//-- sign_extend_4to16.vhd - Sign-Extend A 4-bit Value to A 16-bit Value
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


module sign_extend_4to16
 (
   input [3:0] data_in  ,
   output reg [15:0]  data_out 
    );
    
    integer i;
    
   always @ ( data_in )
       begin
              data_out[3 : 0] <= data_in[3 : 0];
       
               // the extended bits take on the value of the most significant
               // bit (MSB) of data_in
               for (i=15; i>3; i=i-1 )
                   begin
                   data_out[i] <= data_in[3];
                   end 
       
       end
    
endmodule


 