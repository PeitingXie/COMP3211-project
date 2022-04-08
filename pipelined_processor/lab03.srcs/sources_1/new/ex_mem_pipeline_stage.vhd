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
         alu_result_in : in std_logic_vector (15 downto 0);
         read_data_b_in : in std_logic_vector(15 downto 0);
         read_data_a_in : in std_logic_vector(15 downto 0);
         carry_in, lmsb_in : in std_logic;
         alu_result_out : out std_logic_vector (15 downto 0);
         read_data_b_out : out std_logic_vector(15 downto 0);
         read_data_a_out : out std_logic_vector(15 downto 0);
         carry_out, lmsb_out : out std_logic;
         
         -- ctr signals --
         reg_write_in, read_byte_in, mem_write_in, reg_dst_in : in std_logic;
         reg_write_out, read_byte_out, mem_write_out, reg_dst_out : out std_logic;
         mem_to_reg_in : in std_logic_vector(1 downto 0);
         mem_to_reg_out : out std_logic_vector(1 downto 0);
         insn_in : in std_logic_vector(15 downto 0);
         insn_out : out std_logic_vector(15 downto 0);
         forwarded_write_register_in : in std_logic_vector(3 downto 0);
         forwarded_write_register_out : out std_logic_vector(3 downto 0) );
                  
end ex_mem_pipeline_stage;

architecture Behavioral of ex_mem_pipeline_stage is
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
    pipe_reg_alu_result : pipeline_register 
        port map ( data => alu_result_in,
                   enable => '1',
                   resetn => reset,
                   clk => clk,
                   Q => alu_result_out );

    pipe_reg_read_data_b : pipeline_register
        port map ( data => read_data_b_in,
                   enable => '1',
                   resetn => reset,
                   clk => clk,
                   Q => read_data_b_out );
    
    pipe_reg_read_data_a : pipeline_register
        port map ( data => read_data_a_in,
                   enable => '1',
                   resetn => reset,
                   clk => clk,
                   Q => read_data_a_out );
                   
    pipe_reg_carry : pipeline_bit_register
        port map ( data => carry_in,
                   enable => '1',
                   resetn => reset,
                   clk => clk,
                   Q => carry_out );
                   
    pipe_reg_lmsb : pipeline_bit_register
        port map ( data => lmsb_in,
                   enable => '1',
                   resetn => reset,
                   clk => clk,
                   Q => lmsb_out );
                   
                   
    -- control signals --
    -- reg_write, read_byte, mem_to_reg, memWrite --
    pipe_reg_write : pipeline_bit_register
        port map (
            data => reg_write_in,
            enable => '1',
            resetn => reset,
            clk => clk,
            Q => reg_write_out
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
        
    pipe_mem_write : pipeline_bit_register
        port map (
            data => mem_write_in,
            enable => '1',
            resetn => reset,
            clk => clk,
            Q => mem_write_out
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
