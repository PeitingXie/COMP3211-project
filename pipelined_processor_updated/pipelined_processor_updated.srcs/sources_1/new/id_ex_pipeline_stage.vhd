----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.03.2022 22:17:08
-- Design Name: 
-- Module Name: id_ex_pipeline_stage - Behavioral
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

entity id_ex_pipeline_stage is
  Port ( reset : in std_logic;
         clk : in std_logic;
         read_data_a_in : in std_logic_vector(31 downto 0);
         read_data_a_out : out std_logic_vector(31 downto 0);
         read_data_b_in : in std_logic_vector(31 downto 0);
         read_data_b_out : out std_logic_vector(31 downto 0);
         immed_in : in std_logic_vector(31 downto 0);
         immed_out : out std_logic_vector(31 downto 0);
         reg_write_in, read_byte_in, alu_src_in, mem_to_write_in, reg_dst_in : in std_logic;
         reg_write_out, read_byte_out, alu_src_out, mem_to_write_out, reg_dst_out : out std_logic;
         alu_ctr_in  : in std_logic_vector(2 downto 0);
         mem_to_reg_in : in std_logic_vector(1 downto 0);
         alu_ctr_out : out std_logic_vector(2 downto 0);
         mem_to_reg_out : out std_logic_vector(1 downto 0);
         insn_in : in std_logic_vector(31 downto 0);
         insn_out : out std_logic_vector(31 downto 0);
         forwarded_write_register_in : in std_logic_vector(3 downto 0);
         forwarded_write_register_out : out std_logic_vector(3 downto 0);
         mem_read_in : in std_logic;
         mem_read_out: out std_logic;
         ctrl_beq_op_in : in std_logic;
         ctrl_beq_op_out : out std_logic);

end id_ex_pipeline_stage;

architecture Behavioral of id_ex_pipeline_stage is
begin
    
    stage_registers_proc : process (reset, clk)
    begin
        if reset = '1' then
            read_data_a_out <= X"00000000";
            read_data_b_out <= X"00000000";
            immed_out <= X"00000000";
            reg_write_out <= '0';
            read_byte_out <= '0';
            alu_src_out <= '0';
            mem_to_write_out <= '0';
            reg_dst_out <= '0';
            alu_ctr_out <= "101";
            mem_to_reg_out <= "00";
            insn_out <= X"00000000";
            forwarded_write_register_out <= X"0";
            mem_read_out <= '0';
            ctrl_beq_op_out <= '0';
        elsif (clk'event and clk = '1') then
            read_data_a_out <= read_data_a_in;
            read_data_b_out <= read_data_b_in;
            immed_out <= immed_in;
            reg_write_out <= reg_write_in;
            read_byte_out <= read_byte_in;
            alu_src_out <= alu_src_in;
            mem_to_write_out <= mem_to_write_in;
            reg_dst_out <= reg_dst_in;
            alu_ctr_out <= alu_ctr_in;
            mem_to_reg_out <= mem_to_reg_in;
            insn_out <= insn_in;
            forwarded_write_register_out <= forwarded_write_register_in;
            mem_read_out <= mem_read_in;
            ctrl_beq_op_out <= ctrl_beq_op_in;
        end if;
    
    end process;
    
end Behavioral;
