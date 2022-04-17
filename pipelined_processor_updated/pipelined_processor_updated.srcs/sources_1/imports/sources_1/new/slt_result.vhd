----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.03.2022 13:44:36
-- Design Name: 
-- Module Name: slt_result - Behavioral
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

entity slt_result_calc is
    Port ( msb : in std_logic;
           slt_result : out STD_LOGIC_VECTOR (31 downto 0));
end slt_result_calc;

architecture Behavioral of slt_result_calc is

begin
    slt_result(31 downto 1) <= "0000000000000000000000000000000";
    slt_result(0) <= msb;
end Behavioral;
