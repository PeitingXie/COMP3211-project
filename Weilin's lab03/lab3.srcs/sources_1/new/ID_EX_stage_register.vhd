----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/03/23 13:35:39
-- Design Name: 
-- Module Name: ID_EX_stage_register - Behavioral
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

entity ID_EX_stage_register is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           ID_mem_to_reg : in STD_LOGIC;
           ID_mem_write : in STD_LOGIC;
           ID_reg_write : in STD_LOGIC;
           ID_rs_data : in STD_LOGIC_VECTOR (15 downto 0);
           ID_mux_out : in STD_LOGIC_VECTOR (15 downto 0);
           ID_write_data : in STD_LOGIC_VECTOR (15 downto 0);
           ID_write_register : in STD_LOGIC_VECTOR (3 downto 0);
           ID_rs            :in STD_LOGIC_VECTOR(3 downto 0);
           ID_rt           : in STD_LOGIC_VECTOR(3 downto 0);
           EX_mem_to_reg : out STD_LOGIC;
           EX_mem_write : out STD_LOGIC;
           EX_reg_write : out STD_LOGIC;
           EX_alu_src_a : out STD_LOGIC_VECTOR (15 downto 0);
           EX_alu_src_b : out STD_LOGIC_VECTOR (15 downto 0);
           EX_write_data : out STD_LOGIC_VECTOR (15 downto 0);
           EX_write_register : out STD_LOGIC_VECTOR (3 downto 0);
           EX_rs            : out STD_LOGIC_VECTOR(3 downto 0);
           EX_rt            : out STD_LOGIC_VECTOR(3 downto 0));
end ID_EX_stage_register;

architecture Behavioral of ID_EX_stage_register is
    
begin
    process (reset, clk) is 
    begin
        if (reset = '1') then
           EX_mem_to_reg <= '0';
           EX_mem_write <= '0';
           EX_reg_write <= '0';
           EX_alu_src_a <= (OTHERS => '0');
           EX_alu_src_b <= (OTHERS => '0');
           EX_write_data <= (OTHERS => '0');
           EX_write_register <= (OTHERS => '0');
           EX_rs          <= (OTHERS => '0');
           EX_rt          <= (OTHERS => '0');
        elsif (rising_edge(clk)) then
           EX_mem_to_reg <= ID_mem_to_reg;
           EX_mem_write <= ID_mem_write;
           EX_reg_write <=ID_reg_write;
           EX_alu_src_a <= ID_rs_data;
           EX_alu_src_b <= ID_mux_out;
           EX_write_data <= ID_write_data;
           EX_write_register <= ID_write_register;
           EX_rs          <= ID_rs;
           EX_rt          <= ID_rt;
        end if;
    end process;

end Behavioral;
