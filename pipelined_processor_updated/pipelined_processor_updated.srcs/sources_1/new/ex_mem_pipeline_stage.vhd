----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.03.2022 22:17:33
-- Design Name: 
-- Module Name: ex_mem_pipeline_stage - Behavioral
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

entity ex_mem_pipeline_stage is
  Port ( reset : in std_logic;
         clk : in std_logic;
         alu_result_in : in std_logic_vector (31 downto 0);
         read_data_b_in : in std_logic_vector(31 downto 0);
         read_data_a_in : in std_logic_vector(31 downto 0);
         carry_in, lmsb_in : in std_logic;
         alu_result_out : out std_logic_vector (31 downto 0);
         read_data_b_out : out std_logic_vector(31 downto 0);
         read_data_a_out : out std_logic_vector(31 downto 0);
         carry_out, lmsb_out : out std_logic;
         ex_result_in : in std_logic_vector(31 downto 0);
         ex_result_out : out std_logic_vector(31 downto 0);
         shift_result_in : in std_logic_vector(31 downto 0);
         shift_result_out : out std_logic_vector(31 downto 0);
         
         -- ctr signals --
         reg_write_in, read_byte_in, mem_write_in, reg_dst_in : in std_logic;
         reg_write_out, read_byte_out, mem_write_out, reg_dst_out : out std_logic;
         mem_to_reg_in : in std_logic_vector(1 downto 0);
         mem_to_reg_out : out std_logic_vector(1 downto 0);
         insn_in : in std_logic_vector(31 downto 0);
         insn_out : out std_logic_vector(31 downto 0);
         forwarded_write_register_in : in std_logic_vector(3 downto 0);
         forwarded_write_register_out : out std_logic_vector(3 downto 0);
         shift_sel_in : in std_logic_vector(1 downto 0);
         shift_sel_out : out std_logic_vector(1 downto 0) );
                  
end ex_mem_pipeline_stage;

architecture Behavioral of ex_mem_pipeline_stage is
    
begin
    stage_registers_proc : process (reset, clk) 
    begin
        if reset = '1' then
            alu_result_out <= X"00000000";
            read_data_b_out <= X"00000000";
            read_data_a_out <= X"00000000";
            lmsb_out <= '0';
            reg_write_out <= '0';
            read_byte_out <= '0';
            mem_write_out <= '0';
            reg_dst_out <= '0';
            mem_to_reg_out <= "00";
            insn_out <= X"00000000";
            forwarded_write_register_out <= "0000";
            shift_sel_out <= "00";
            ex_result_out <= X"00000000";
            shift_result_out <= X"00000000";
        elsif clk'event and clk = '1' then
            alu_result_out <= alu_result_in;
            read_data_b_out <= read_data_b_in;
            read_data_a_out <= read_data_a_in;
            lmsb_out <= lmsb_in;
            reg_write_out <= reg_write_in;
            read_byte_out <= read_byte_in;
            mem_write_out <= mem_write_in;
            reg_dst_out <= reg_dst_in;
            mem_to_reg_out <= mem_to_reg_in;
            insn_out <= insn_in;
            forwarded_write_register_out <= forwarded_write_register_in;
            shift_sel_out <= shift_sel_in;
            ex_result_out <= ex_result_in;
            shift_result_out <= shift_result_in;
        end if;
    end process;
          
end Behavioral;
