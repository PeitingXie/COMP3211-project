----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/03/23 12:57:47
-- Design Name: 
-- Module Name: IF_ID_stage_registers - Behavioral
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

entity IF_ID_stage_registers is
    Port ( reset: in std_logic;
           clk:   in std_logic;
           input: in std_logic_vector(15 downto 0);
           output:out std_logic_vector(15 downto 0));
end IF_ID_stage_registers;

architecture Behavioral of IF_ID_stage_registers is
        
begin
    process (reset, clk, input) is 
    begin
        if (reset = '1') then
            output <= (OTHERS => '0');
        elsif (rising_edge(clk)) then
            output <= input;
        end if;
    end process;

end Behavioral;