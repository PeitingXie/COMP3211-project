---------------------------------------------------------------------------
-- mux_2to1_16b.vhd - 16-bit 2-to-1 Multiplexer Implementation
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

entity mux_4to1_16b is
    port ( mux_select : in  std_logic_vector(1 downto 0);
           data_a     : in  std_logic_vector(15 downto 0);
           data_b     : in  std_logic_vector(15 downto 0);
           data_c     : in  std_logic_vector(15 downto 0);
           data_d     : in  std_logic_vector(15 downto 0);
           data_out   : out std_logic_vector(15 downto 0) );
end mux_4to1_16b;

architecture structural of mux_4to1_16b is

component mux_4to1_1b is
    port ( mux_select : in  std_logic_vector(1 downto 0);
           data_a     : in  std_logic;
           data_b     : in  std_logic;
           data_c     : in  std_logic;
           data_d     : in  std_logic;
           data_out   : out std_logic );
end component;

begin

    -- this for-generate-loop replicates 16 single-bit 2-to-1 mux
    muxes : for i in 15 downto 0 generate
        bit_mux : mux_4to1_1b 
        port map ( mux_select => mux_select,
                   data_a     => data_a(i),
                   data_b     => data_b(i),
                   data_c     => data_c(i),
                   data_d     => data_d(i),
                   data_out   => data_out(i) );
    end generate muxes;
    
end structural;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY mux_4to1_1b IS 
		PORT(
			   mux_select : in  std_logic_vector(1 downto 0);
               data_a     : in  std_logic;
               data_b     : in  std_logic;
               data_c     : in  std_logic;
               data_d     : in  std_logic;
               data_out   : out std_logic );
END mux_4to1_1b;

ARCHITECTURE behaviour OF mux_4to1_1b IS
BEGIN
	data_out <= data_a when mux_select = "00" else
                data_b when mux_select = "01" else
                data_c when mux_select = "10" else
                data_d when mux_select = "11" else
                'X';
END behaviour;

