----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.03.2022 01:56:35
-- Design Name: 
-- Module Name: mux_alu_src_b_forwarding - Behavioral
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

entity mux_alu_src_b_forwarding is
    Port (   data_b : in std_logic_vector(15 downto 0);
             data_wb : in std_logic_vector(15 downto 0);
             data_mem : in std_logic_vector(15 downto 0);
             alu_src_b_sel : in std_logic_vector(1 downto 0);
             alu_src_b : out std_logic_vector(15 downto 0) );
end mux_alu_src_b_forwarding;

architecture Behavioral of mux_alu_src_b_forwarding is
    component mux_4to1_16b is
    port ( mux_select : in  std_logic_vector(1 downto 0);
           data_a     : in  std_logic_vector(15 downto 0);
           data_b     : in  std_logic_vector(15 downto 0);
           data_c     : in  std_logic_vector(15 downto 0);
           data_d     : in  std_logic_vector(15 downto 0);
           data_out   : out std_logic_vector(15 downto 0) );
    end component;
begin
    alu_src_a_mux : mux_4to1_16b
        port map (
            mux_select => alu_src_b_sel,
            data_a => data_b,
            data_b => data_wb,
            data_c => data_mem,
            data_d => data_b,
            data_out => alu_src_b
        );

end Behavioral;
