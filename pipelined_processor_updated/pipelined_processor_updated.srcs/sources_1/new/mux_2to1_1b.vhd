----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/04/16 14:20:32
-- Design Name: 
-- Module Name: mux_2to1_1b - Behavioral
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

entity mux_2to1_1b is
    Port ( mux_select : in STD_LOGIC;
           data_a : in STD_LOGIC;
           data_b : in STD_LOGIC;
           data_out : out STD_LOGIC);
end mux_2to1_1b;

architecture Behavioral of mux_2to1_1b is

begin
    process(mux_select, data_a, data_b)
    begin
        if mux_select = '0' then
            data_out <= data_a;
        else
            data_out <= data_b;
       end if;
    end process;
        

end Behavioral;
