----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.03.2022 22:16:03
-- Design Name: 
-- Module Name: if_id_pipeline_stage - Behavioral
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

entity if_id_pipeline_stage is
  Port ( clk : in std_logic;
         reset : in std_logic;
         if_flush : in std_logic;
         ifid_write : in std_logic;
         if_curr_pc: in std_logic_vector(3 downto 0);
         ifid_instr_in : in std_logic_vector(15 downto 0);
         id_curr_pc: out std_logic_vector(3 downto 0);
         ifid_instr_out : out std_logic_vector(15 downto 0));
end if_id_pipeline_stage;

architecture Behavioral of if_id_pipeline_stage is
signal tmp1: std_logic_vector(15 downto 0);
signal tmp2: std_logic_vector(3 downto 0);
begin
    process(reset, clk, if_flush, ifid_instr_in, if_curr_pc, ifid_write)
    begin
        if reset = '1' or if_flush = '1' then
            tmp1 <= (OTHERS => '0');
            tmp2 <= (OTHERS => '0');
            --ifid_instr_out <= (OTHERS => '0');
            --id_curr_pc <= (OTHERS => '0');
        else
            tmp1 <= ifid_instr_in;
            tmp2 <= if_curr_pc;
        end if;
        
        if rising_edge(clk) and ifid_write = '1' then
            ifid_instr_out <= tmp1;
            id_curr_pc <= tmp2;
        end if;
    end process;
        
                 
end Behavioral;
