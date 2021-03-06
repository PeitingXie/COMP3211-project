----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.03.2022 21:54:13
-- Design Name: 
-- Module Name: pipeline_2bit_register - Behavioral
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

entity pipeline_2bit_register is
Port ( data : in std_logic_vector (1 downto 0);
     enable : in std_logic;
     resetn : in std_logic;
     clk : in std_logic;
     Q : out std_logic_vector(1 downto 0));
end pipeline_2bit_register;

architecture Behavioral of pipeline_2bit_register is
    
begin
    process
    begin
        wait until (clk'event and clk = '1');
        if resetn = '1' then
            Q <= "00";
        elsif enable = '1' then
            Q <= data;
        end if;
   end process;
end Behavioral;
