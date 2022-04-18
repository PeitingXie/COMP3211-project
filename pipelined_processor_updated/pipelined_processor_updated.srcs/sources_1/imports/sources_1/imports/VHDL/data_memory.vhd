---------------------------------------------------------------------------
-- data_memory.vhd - Implementation of A Single-Port, 16 x 16-bit Data
--                   Memory.
-- 
--
-- Copyright (C) 2006 by Lih Wen Koh (lwkoh@cse.unsw.edu.au)
-- All Rights Reserved. 
--
-- The single-cycle processor core is provided AS IS, with no warranty of 
-- any kind, express or implied. The user of the program accepts full 
-- responsibility for the application of the program and the use of any 
-- results. This work may be downloaded, compiled, executed, copied, and 
-- modified solely for nonprofit, educational, noncommercial research, and 
-- noncommercial scholarship purposes provided that this notice in its 
-- entirety accompanies all copies. Copies of the modified software can be 
-- delivered to persons who use it solely for nonprofit, educational, 
-- noncommercial research, and noncommercial scholarship purposes provided 
-- that this notice in its entirety accompanies all copies.
--
---------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity data_memory is
    port ( reset        : in  std_logic;
           clk          : in  std_logic;
           write_enable : in  std_logic;
           write_data   : in  std_logic_vector(31 downto 0);
           addr_in      : in  std_logic_vector(9 downto 0);
           data_out     : out std_logic_vector(31 downto 0) );
end data_memory;

architecture behavioral of data_memory is

type mem_array is array(0 to 1023) of std_logic_vector(31 downto 0);
signal sig_data_mem : mem_array;
begin
    mem_process: process ( clk,
                           write_enable,
                           write_data,
                           addr_in ) is
  
    variable var_data_mem : mem_array;
    variable var_addr     : integer;
    variable i            : integer range 1 to 1024;
    begin
        var_addr := conv_integer(addr_in);
        
        if (reset = '1') then
            -- initial values of the data memory : reset to zero 
            var_data_mem(0)  := X"00000000"; --0
            var_data_mem(1)  := X"00000001"; --1
            var_data_mem(2)  := X"00000011"; --3
            var_data_mem(3)  := X"00000111"; --7
            var_data_mem(4)  := X"00001111"; --15
            var_data_mem(5)  := X"00011111"; --31
            var_data_mem(6)  := X"00111111"; --63
            var_data_mem(7)  := X"01111111"; --127
            var_data_mem(8)  := X"11111111"; --255
            var_data_mem(9)  := X"0124B6CB"; --secret
            
            i := 10;
            while i <= 99 loop
                var_data_mem(i) := X"00000000";
                i := i + 1;
            end loop;
            
            var_data_mem(100)  := X"00000000";
            var_data_mem(101)  := X"00000001"; 
            var_data_mem(102)  := X"00000010";
            var_data_mem(103)  := X"00000011";
            var_data_mem(104)  := X"00000100";
            var_data_mem(105)  := X"00000101";
            var_data_mem(106)  := X"00000110";
            var_data_mem(107)  := X"00000111";
            var_data_mem(108)  := X"00001000";
            var_data_mem(109)  := X"00001001";
            var_data_mem(110)  := X"00001010";
            var_data_mem(111)  := X"00001011";
            var_data_mem(112)  := X"00001100";
            var_data_mem(113)  := X"00001101";
            var_data_mem(114)  := X"00001110";
            var_data_mem(115)  := X"00001111";
            var_data_mem(116)  := X"00010000";
            var_data_mem(117)  := X"00010001";
            var_data_mem(118)  := X"00010010";
            var_data_mem(119)  := X"00010011";
            var_data_mem(120)  := X"00010100";
            var_data_mem(121)  := X"00010101";
            var_data_mem(122)  := X"00010110";
            var_data_mem(123)  := X"00010111";
            var_data_mem(124)  := X"00011000";
            
            i := 125;
            while i <= 1023 loop
                var_data_mem(i) := X"00000000";
                i := i + 1;
            end loop;

        elsif (falling_edge(clk) and write_enable = '1') then
            -- memory writes on the falling clock edge
            var_data_mem(var_addr) := write_data;
        end if;
       
        -- continuous read of the memory location given by var_addr 
        data_out <= var_data_mem(var_addr);
 
        -- the following are probe signals (for simulation purpose) 
        sig_data_mem <= var_data_mem;

    end process;
  
end behavioral;
