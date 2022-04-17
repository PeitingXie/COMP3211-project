----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/04/13 22:24:32
-- Design Name: 
-- Module Name: xor_com - Behavioral
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

entity xor_com is
    Port ( data_a : in STD_LOGIC_VECTOR (31 downto 0);
           data_b : in STD_LOGIC_VECTOR (31 downto 0);
           ctrl : out STD_LOGIC);
end xor_com;

architecture Behavioral of xor_com is

begin
    process(data_a, data_b)
    begin
        if (data_a xor data_b) = x"00000000" then
            ctrl <= '1';
        else
            ctrl <= '0';
        end if;
    end process;
    
end Behavioral;
