----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.03.2022 02:17:59
-- Design Name: 
-- Module Name: pipeline_4bit_register - Behavioral
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

entity pipeline_4bit_register is
      Port ( data : in std_logic_vector (3 downto 0);
             enable : in std_logic;
             resetn : in std_logic;
             clk : in std_logic;
             Q : out std_logic_vector(3 downto 0));
end pipeline_4bit_register;

architecture Behavioral of pipeline_4bit_register is

begin
    process
    begin
        wait until (clk'event and clk = '1');
        if resetn = '1' then
            Q <= X"0";
        elsif enable = '1' then
            Q <= data;
        end if;
   end process;

end Behavioral;
