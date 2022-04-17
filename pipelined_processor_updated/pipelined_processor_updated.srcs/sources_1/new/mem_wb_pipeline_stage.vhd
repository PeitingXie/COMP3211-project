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
         read_data_in : in std_logic_vector (31 downto 0);
         slt_data_in : in std_logic_vector (31 downto 0);
         srr_data_in : in std_logic_vector (31 downto 0);
         alu_result_in : in std_logic_vector (31 downto 0);
         read_data_out : out std_logic_vector (31 downto 0);
         slt_data_out : out std_logic_vector (31 downto 0);
         srr_data_out : out std_logic_vector (31 downto 0);
         alu_result_out : out std_logic_vector (31 downto 0);
         
         -- ctr signals --
         reg_write_in, reg_dst_in : in std_logic;
         reg_write_out, reg_dst_out : out std_logic;
         mem_to_reg_in : in std_logic_vector(1 downto  0);
         mem_to_reg_out : out std_logic_vector(1 downto 0);
         insn_in : in std_logic_vector(31 downto 0);
         insn_out : out std_logic_vector(31 downto 0);
         forwarded_write_register_in : in std_logic_vector(3 downto 0);
         forwarded_write_register_out : out std_logic_vector(3 downto 0));
         
end mem_wb_pipeline_stage;

architecture Behavioral of mem_wb_pipeline_stage is
    component pipeline_register is
        Port ( data : in std_logic_vector (31 downto 0);
             enable : in std_logic;
             resetn : in std_logic;
             clk : in std_logic;
             Q : out std_logic_vector(31 downto 0));
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
             Q : out std_logic_vector(1 downto 0) );
    end component;
    
    component pipeline_4bit_register is
    Port ( data : in std_logic_vector(3 downto 0);
             enable : in std_logic;
             resetn : in std_logic;
             clk : in std_logic;
             Q : out std_logic_vector(3 downto 0));
    end component;
begin
    
    pipe_reg_alu_result : pipeline_register
        port map ( data => alu_result_in,
                   enable => '1',
                   resetn => reset,
                   clk => clk,
                   Q => alu_result_out );
    
    pipe_reg_read_data : pipeline_register
        port map ( data => read_data_in,
                   enable => '1',
                   resetn => reset,
                   clk => clk,
                   Q => read_data_out );
                   
    pipe_reg_slt_data : pipeline_register
        port map ( data => slt_data_in,
                   enable => '1',
                   resetn => reset,
                   clk => clk,
                   Q => slt_data_out );
    
    pipe_reg_srr_data : pipeline_register
        port map ( data => srr_data_in,
                   enable => '1',
                   resetn => reset,
                   clk => clk,
                   Q => srr_data_out );
    
    -- control signals --
    -- reg_write, mem_to_reg --     
    pipe_reg_write : pipeline_bit_register
        port map (
            data => reg_write_in,
            enable => '1',
            resetn => reset,
            clk => clk,
            Q => reg_write_out
        );            
    
    pipe_mem_to_reg : pipeline_2bit_register
        port map ( 
            data => mem_to_reg_in,
            enable => '1',
            resetn => reset,
            clk => clk,
            Q => mem_to_reg_out
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
