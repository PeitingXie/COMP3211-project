----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.03.2022 20:49:02
-- Design Name: 
-- Module Name: mux_data_to_mem_to_reg - Behavioral
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

entity mux_data_to_mem_to_reg is
  Port ( 
        word_data : in std_logic_vector(31 downto 0);
        byte_data : in std_logic_vector(31 downto 0);
        read_byte : in std_logic;
        data_out : out std_logic_vector(31 downto 0)
  );
end mux_data_to_mem_to_reg;

architecture Behavioral of mux_data_to_mem_to_reg is

begin
    data_out <= word_data when read_byte = '0' else
                byte_data when read_byte = '1';

end Behavioral;
