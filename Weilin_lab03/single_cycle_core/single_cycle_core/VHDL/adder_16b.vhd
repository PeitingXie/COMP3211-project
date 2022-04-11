---------------------------------------------------------------------------
-- adder_16b.vhd - 16-bit Adder Implementation
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

entity adder_16b is
    port ( src_a     : in  std_logic_vector(15 downto 0);
           src_b     : in  std_logic_vector(15 downto 0);
           ctrl      : in  std_logic_vector(1 downto 0);
           sum       : out std_logic_vector(15 downto 0);
           carry_out : out std_logic );
end adder_16b;

architecture behavioural of adder_16b is

signal sig_result : std_logic_vector(16 downto 0);

begin

    process(ctrl, src_a, src_b, sig_result)
    begin
        if ctrl = "00" then                             -- add
            sig_result <= ('0' & src_a) + ('0' & src_b);
            sum        <= sig_result(15 downto 0);
            carry_out  <= sig_result(16);
        elsif ctrl = "10" then                          -- and
            sum <= src_a and src_b;
            --carry_out  <= '0';
        elsif ctrl = "01" then                           -- xor
            --sum <= src_a xor src_b;
            sum <= (src_a and not src_b) or (not src_a and src_b);
            --carry_out  <= '0';
        else
            sig_result <= ('0' & src_a) + ('0' & src_b);
            sum        <= sig_result(15 downto 0);
            carry_out  <= sig_result(16);
        end if;
    end process;
end behavioural;
