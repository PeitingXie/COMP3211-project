----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/03/23 12:57:47
-- Design Name: 
-- Module Name: EX_MEM_stage_registers - Behavioral
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

entity EX_MEM_stage_registers is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           EX_mem_to_reg : in STD_LOGIC;
           EX_mem_write : in STD_LOGIC;
           EX_reg_write : in STD_LOGIC;
           EX_sum : in STD_LOGIC_VECTOR(15 downto 0);
           EX_write_data : in STD_LOGIC_VECTOR(15 downto 0);
           EX_write_register : in STD_LOGIC_VECTOR(3 downto 0);
           MEM_mem_to_reg : out STD_LOGIC;
           MEM_mem_write : out STD_LOGIC;
           MEM_reg_write : out STD_LOGIC;
           MEM_sum : out STD_LOGIC_VECTOR(15 downto 0);
           MEM_write_data : out STD_LOGIC_VECTOR(15 downto 0);
           MEM_write_register : out STD_LOGIC_VECTOR(3 downto 0));
end EX_MEM_stage_registers;

architecture Behavioral of EX_MEM_stage_registers is
        
begin
    process (reset, clk, EX_mem_to_reg, EX_mem_write, EX_reg_write,
            EX_sum,  EX_write_data, EX_write_register) is 
    begin
        if (reset = '1') then
           MEM_mem_to_reg <= '0';
           MEM_mem_write <= '0';
           MEM_reg_write <= '0';
           MEM_sum <= (OTHERS => '0');
           MEM_write_data <= (OTHERS => '0');
           MEM_write_register <= (OTHERS =>'0');
        elsif (rising_edge(clk)) then
           MEM_mem_to_reg <= EX_mem_to_reg;
           MEM_mem_write <= EX_mem_write;
           MEM_reg_write <= EX_reg_write;
           MEM_sum <= EX_sum;
           MEM_write_data <= EX_write_data;
           MEM_write_register <= EX_write_register;
        end if;
    end process;

end Behavioral;
