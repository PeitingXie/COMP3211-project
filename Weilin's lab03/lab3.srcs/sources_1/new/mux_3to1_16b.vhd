----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/03/24 23:54:01
-- Design Name: 
-- Module Name: mux_3to1_16b - Behavioral
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

entity mux_3to1_16b is
    Port ( forward_ctrl : in STD_LOGIC_VECTOR(1 downto 0);
           data_a : in STD_LOGIC_VECTOR (15 downto 0);
           data_b : in STD_LOGIC_VECTOR (15 downto 0);
           data_c : in STD_LOGIC_VECTOR (15 downto 0);
           data_out : out STD_LOGIC_VECTOR (15 downto 0));
end mux_3to1_16b;

architecture Behavioral of mux_3to1_16b is

begin
    process(forward_ctrl, data_a, data_b, data_c) is 
    begin
        if forward_ctrl = "00" then
            data_out <= data_a;
        elsif forward_ctrl = "01" then
            data_out <= data_b;
        elsif forward_ctrl = "10" then
            data_out <= data_c;
        else
            data_out <= x"0000";
        end if;
    end process;
    --data_out <= data_a;
end Behavioral;
