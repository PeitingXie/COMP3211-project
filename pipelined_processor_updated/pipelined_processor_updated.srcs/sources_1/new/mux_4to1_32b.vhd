----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.03.2022 02:29:33
-- Design Name: 
-- Module Name: mux_4to1_16b - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_4to1_32b is
    Port ( mux_select : in  std_logic_vector(1 downto 0);
           data_a     : in  std_logic_vector(31 downto 0);
           data_b     : in  std_logic_vector(31 downto 0);
           data_c     : in  std_logic_vector(31 downto 0);
           data_d     : in  std_logic_vector(31 downto 0);
           data_out   : out std_logic_vector(31 downto 0) );
end mux_4to1_32b;

architecture Behavioral of mux_4to1_32b is
    component mux_4to1_1b IS 
		PORT(
			   mux_select : in  std_logic_vector(1 downto 0);
               data_a     : in  std_logic;
               data_b     : in  std_logic;
               data_c     : in  std_logic;
               data_d     : in  std_logic;
               data_out   : out std_logic );
    end component;
begin
    -- this for-generate-loop replicates 16 single-bit 4-to-1 mux
    muxes : for i in 31 downto 0 generate
        bit_mux : mux_4to1_1b 
        port map ( mux_select => mux_select,
                   data_a     => data_a(i),
                   data_b     => data_b(i),
                   data_c     => data_c(i),
                   data_d     => data_d(i),
                   data_out   => data_out(i) );
    end generate muxes;
end Behavioral;
