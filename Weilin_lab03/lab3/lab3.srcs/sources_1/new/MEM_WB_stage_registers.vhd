----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/03/23 12:57:47
-- Design Name: 
-- Module Name: MEM_WB_stage_registers - Behavioral
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

entity MEM_WB_stage_registers is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           MEM_reg_write : in STD_LOGIC;
           MEM_data_out : in STD_LOGIC_VECTOR(15 downto 0);
           MEM_write_register : in STD_LOGIC_VECTOR(3 downto 0);
           WB_reg_write : out STD_LOGIC;
           WB_data_out : out STD_LOGIC_VECTOR(15 downto 0);
           WB_write_register : out STD_LOGIC_VECTOR(3 downto 0));
end MEM_WB_stage_registers;

architecture Behavioral of MEM_WB_stage_registers is

begin
    process (reset, clk, MEM_reg_write, MEM_data_out, MEM_write_register) is 
    begin
        if (reset = '1') then
            WB_reg_write <= '0';
            WB_data_out <= (OTHERS => '0');
            WB_write_register <= (OTHERS => '0');
        elsif (rising_edge(clk)) then
            WB_reg_write <= MEM_reg_write;
            WB_data_out <= MEM_data_out;
            WB_write_register <= MEM_write_register;
        end if;
    end process;

end Behavioral;
