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
         ifid_write : in std_logic;
         ifid_instr_in : in std_logic_vector(15 downto 0);
         ifid_instr_out : out std_logic_vector(15 downto 0));
end if_id_pipeline_stage;

architecture Behavioral of if_id_pipeline_stage is
    component pipeline_register is
        Port ( data : in std_logic_vector (15 downto 0);
             enable : in std_logic;
             resetn : in std_logic;
             clk : in std_logic;
             Q : out std_logic_vector(15 downto 0));
    end component;
begin
    
    pipe_reg_inst : process (clk, reset, ifid_write)
    begin
        if reset = '1' then
            ifid_instr_out <= X"0000";
        elsif clk'event and clk = '1' and ifid_write = '1' then
            ifid_instr_out <= ifid_instr_in;
        end if;
   end process;
end Behavioral;
