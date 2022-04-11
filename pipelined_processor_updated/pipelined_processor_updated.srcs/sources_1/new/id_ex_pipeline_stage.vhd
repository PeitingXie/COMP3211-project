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
         read_data_a_in : in std_logic_vector(15 downto 0);
         read_data_a_out : out std_logic_vector(15 downto 0);
         read_data_b_in : in std_logic_vector(15 downto 0);
         read_data_b_out : out std_logic_vector(15 downto 0);
         immed_in : in std_logic_vector(15 downto 0);
         immed_out : out std_logic_vector(15 downto 0);
         reg_write_in, read_byte_in, alu_src_in, mem_to_write_in, reg_dst_in : in std_logic;
         reg_write_out, read_byte_out, alu_src_out, mem_to_write_out, reg_dst_out : out std_logic;
         alu_ctr_in, mem_to_reg_in : in std_logic_vector(1 downto 0);
         alu_ctr_out, mem_to_reg_out : out std_logic_vector(1 downto 0);
         insn_in : in std_logic_vector(15 downto 0);
         insn_out : out std_logic_vector(15 downto 0);
         forwarded_write_register_in : in std_logic_vector(3 downto 0);
         forwarded_write_register_out : out std_logic_vector(3 downto 0));

end id_ex_pipeline_stage;

architecture Behavioral of id_ex_pipeline_stage is
    component pipeline_register is
        Port ( data : in std_logic_vector (15 downto 0);
             enable : in std_logic;
             resetn : in std_logic;
             clk : in std_logic;
             Q : out std_logic_vector(15 downto 0));
    end component;
    
    component pipeline_bit_register is
        Port ( data : in std_logic;
             enable : in std_logic;
             resetn : in std_logic;
             clk : in std_logic;
             Q : out std_logic );
    end component;

    component pipeline_2bit_register is
        Port ( data : in std_logic_vector(1 downto 0);
             enable : in std_logic;
             resetn : in std_logic;
             clk : in std_logic;
             Q : out std_logic_vector(1 downto 0));
    end component;
    
    component pipeline_4bit_register is
    Port ( data : in std_logic_vector(3 downto 0);
             enable : in std_logic;
             resetn : in std_logic;
             clk : in std_logic;
             Q : out std_logic_vector(3 downto 0));
    end component;
    
begin
    pipe_reg_data_a : pipeline_register 
        port map ( data => read_data_a_in,
                   enable => '1',
                   resetn => reset,
                   clk => clk,
                   Q => read_data_a_out
        );
    pipe_reg_data_b : pipeline_register 
        port map ( data => read_data_b_in,
                   enable => '1',
                   resetn => reset,
                   clk => clk,
                   Q => read_data_b_out
        );
    
    pipe_reg_immed : pipeline_register 
        port map ( data => immed_in,
                   enable => '1',
                   resetn => reset,
                   clk => clk,
                   Q => immed_out
        );
    
    -- control signals --
    -- regWrite, aluctr, read_byte, memToReg, memWrite, ALUSrc --
    pipe_reg_write : pipeline_bit_register
        port map (
            data => reg_write_in,
            enable => '1',
            resetn => reset,
            clk => clk,
            Q => reg_write_out
        );
   
   pipe_alu_ctr : pipeline_2bit_register
        port map (
            data => alu_ctr_in,
            enable => '1',
            resetn => reset,
            clk => clk,
            Q => alu_ctr_out
        );
   
   pipe_read_byte : pipeline_bit_register
        port map (
            data => read_byte_in,
            enable => '1',
            resetn => reset,
            clk => clk,
            Q => read_byte_out
        );
   
   pipe_mem_to_reg : pipeline_2bit_register
        port map (
            data => mem_to_reg_in,
            enable => '1',
            resetn => reset,
            clk => clk,
            Q => mem_to_reg_out
        );
        
   pipe_alu_src_in : pipeline_bit_register
        port map (
            data => alu_src_in,
            enable => '1',
            resetn => reset,
            clk => clk,
            Q => alu_src_out
        );
        
   pipe_mem_to_write : pipeline_bit_register
        port map (
            data => mem_to_write_in,
            enable => '1',
            resetn => reset,
            clk => clk,
            Q => mem_to_write_out
        );
  
   pipe_reg_dst : pipeline_bit_register
        port map (
            data => reg_dst_in,
            enable => '1',
            resetn => reset,
            clk => clk,
            Q => reg_dst_out
        );
   
   pipe_insn : pipeline_register
        port map (
            data => insn_in,
            enable => '1',
            resetn => reset,
            clk => clk,
            Q => insn_out
        );
   
   pipe_forward_write_reg : pipeline_4bit_register
        port map (
            data => forwarded_write_register_in,
            enable => '1',
            resetn => reset,
            clk => clk,
            Q => forwarded_write_register_out
        );
end Behavioral;
