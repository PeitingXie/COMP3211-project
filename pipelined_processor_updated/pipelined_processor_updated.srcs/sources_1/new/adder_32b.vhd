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

entity adder_32b is
    port ( src_a     : in  std_logic_vector(31 downto 0);
           src_b     : in  std_logic_vector(31 downto 0);
           alu_ctr   : in  std_logic_vector(2 downto 0);
           sum       : out std_logic_vector(31 downto 0);
           carry_out : out std_logic; 
           load_msb  : out std_logic);
end adder_32b;

architecture behavioural of adder_32b is

signal sig_result : std_logic_vector(32 downto 0);
signal add_src_b  : std_logic_vector(31 downto 0);
signal lb_src_b   : std_logic_vector(31 downto 0);
signal slt_src_b  : std_logic_vector(31 downto 0);
signal sig_src_b  : std_logic_vector(31 downto 0);

begin
    -- src_b if the alu must calculate the byte address --
    -- if the immed is odd then the second byte of data needs to be read --
    load_msb <= src_b(0);
    -- divide addr by 2 --
    gen_lb_addr: process (src_b)
    begin
        lb_src_b(31) <= '0';
        for i in 0 to 30 loop
            lb_src_b(i) <= src_b(i+1);
        end loop;
    end process;
    
    -- src_b if the alu must compare a<b --
    -- src_b = -src_b --
    slt_src_b <= (not src_b) + '1';
    
    process(alu_ctr, src_a, src_b, sig_result, lb_src_b, slt_src_b)
    begin
        case alu_ctr is 
            when "000" => -- addition
                sig_result <= ('0' & src_a) + ('0' & src_b);
                carry_out  <= sig_result(32);
                sum <= sig_result(31 downto 0);
            when "001" =>
                sig_result <= ('0' & src_a) + ('0' & lb_src_b);
                carry_out  <= sig_result(32);
                sum <= sig_result(31 downto 0);
            when "010" =>
                sig_result <= ('0' & src_a) + ('0' & slt_src_b);
                carry_out  <= sig_result(32);
                sum <= sig_result(31 downto 0);
            when "100" => -- xor
                sum <= src_a xor src_b;
            when "011" => -- and
                sum <= src_a and src_b;
            when others =>
                sig_result <= ('0' & src_a) + ('0' & src_b);
                carry_out  <= sig_result(32);
                sum <= sig_result(31 downto 0);
        end case;
    end process;
            
end behavioural;
