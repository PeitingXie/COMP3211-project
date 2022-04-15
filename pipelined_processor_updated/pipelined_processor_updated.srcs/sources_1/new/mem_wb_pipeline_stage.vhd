----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.03.2022 22:17:49
-- Design Name: 
-- Module Name: mem_wb_pipeline_stage - Behavioral
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

entity mem_wb_pipeline_stage is
  Port ( reset : in std_logic;
         clk : in std_logic;
         write_data_in : in std_logic_vector(15 downto 0);
         write_data_out : out std_logic_vector(15 downto 0);
         
         -- ctr signals --
         reg_write_in, reg_dst_in : in std_logic;
         reg_write_out, reg_dst_out : out std_logic;
         mem_to_reg_in : in std_logic_vector(1 downto  0);
         mem_to_reg_out : out std_logic_vector(1 downto 0);
         insn_in : in std_logic_vector(15 downto 0);
         insn_out : out std_logic_vector(15 downto 0);
         forwarded_write_register_in : in std_logic_vector(3 downto 0);
         forwarded_write_register_out : out std_logic_vector(3 downto 0));
         
end mem_wb_pipeline_stage;

architecture Behavioral of mem_wb_pipeline_stage is
    
begin
    stage_registers_proc : process (reset, clk)
    begin
        if reset = '1' then
             write_data_out <= X"0000";
             reg_write_out <= '0';
             reg_dst_out <= '0';
             mem_to_reg_out <= "00";
             insn_out <= X"0000";
             forwarded_write_register_out <= "0000";
        elsif (clk'event and clk = '1') then
             write_data_out <= write_data_in;
             reg_write_out <= reg_write_in;
             reg_dst_out <= reg_dst_in;
             mem_to_reg_out <= mem_to_reg_in;
             insn_out <= insn_in;
             forwarded_write_register_out <= forwarded_write_register_in;
        end if;
    end process;
    
end Behavioral;
