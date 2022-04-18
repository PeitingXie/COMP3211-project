---------------------------------------------------------------------------
-- register_file.vhd - Implementation of A Dual-Port, 16 x 16-bit
--                     Collection of Registers.
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

entity register_file is
    port ( reset           : in  std_logic;
           clk             : in  std_logic;
           send            : in std_logic;
           D0              : in std_logic_vector(7 downto 0);
           D1              : in std_logic_vector(7 downto 0);
           D2              : in std_logic_vector(7 downto 0);
           D3              : in std_logic_vector(7 downto 0);
           tag             : in std_logic_vector(7 downto 0);
           read_register_a : in  std_logic_vector(3 downto 0);
           read_register_b : in  std_logic_vector(3 downto 0);
           write_enable    : in  std_logic;
           write_register  : in  std_logic_vector(3 downto 0);
           write_data      : in  std_logic_vector(31 downto 0);
           read_data_a     : out std_logic_vector(31 downto 0);
           read_data_b     : out std_logic_vector(31 downto 0) );
end register_file;

architecture behavioral of register_file is

type reg_file is array(0 to 15) of std_logic_vector(31 downto 0);
signal sig_regfile : reg_file;

begin

    mem_process : process ( reset,
                            clk,
                            read_register_a,
                            read_register_b,
                            write_enable,
                            write_register,
                            write_data, send ) is

    variable var_regfile     : reg_file;
    variable var_read_addr_a : integer;
    variable var_read_addr_b : integer;
    variable var_write_addr  : integer;
    variable i               : integer range 1 to 16;
    
    begin
    
        var_read_addr_a := conv_integer(read_register_a);
        var_read_addr_b := conv_integer(read_register_b);
        var_write_addr  := conv_integer(write_register);
        
        if (reset = '1') then
            -- initial values of the registers - reset to zeroes
            var_regfile := (others => X"00000000");
            
        elsif (send = '1') then
            var_regfile(0) := X"000000" & D0;
            var_regfile(1) := X"000000" & D1;
            var_regfile(2) := X"000000" & D2;
            var_regfile(3) := X"000000" & D3;
            var_regfile(4) := X"000000" & tag;
            i := 5;
            while i <= 15 loop
                var_regfile(i) := X"00000000";
                i := i + 1;
            end loop;
            
        elsif (falling_edge(clk) and write_enable = '1') then
            -- register write on the falling clock edge
            var_regfile(var_write_addr) := write_data;
        end if;

        -- enforces value zero for register $0
        --var_regfile(0) := X"00000000";

        -- continuous read of the registers at location read_register_a
        -- and read_register_b
        read_data_a <= var_regfile(var_read_addr_a); 
        read_data_b <= var_regfile(var_read_addr_b);

        -- the following are probe signals (for simulation purpose)
        sig_regfile <= var_regfile;

    end process; 
end behavioral;
