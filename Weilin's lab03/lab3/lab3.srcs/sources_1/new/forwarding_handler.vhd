----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/03/25 00:14:12
-- Design Name: 
-- Module Name: forwarding_handler - Behavioral
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

entity forwarding_handler is
    Port ( input_rs : in STD_LOGIC_VECTOR(3 downto 0);
           input_rt : in STD_LOGIC_VECTOR (3 downto 0);
           input_mem_rd : in STD_LOGIC_VECTOR (3 downto 0);
           input_wb_rd : in STD_LOGIC_VECTOR (3 downto 0);
           Mem_reg_write: in STD_LOGIC;
           WB_reg_write: in STD_LOGIC;
           forward_ctrl_rs : out STD_LOGIC_VECTOR (1 downto 0);
           forward_ctrl_rt : out STD_LOGIC_VECTOR(1 downto 0));
end forwarding_handler;

architecture Behavioral of forwarding_handler is

begin
     process(Mem_reg_write, WB_reg_write, input_mem_rd, input_rs, 
        input_wb_rd, input_rt) is
    begin
        -- Forwarding rs
        if Mem_reg_write = '1' and input_mem_rd /= "0000" and input_rs = input_mem_rd then
            forward_ctrl_rs <= "10"; -- from Mem stage
        elsif WB_reg_write = '1' and input_wb_rd /= "0000" and input_rs = input_wb_rd and (Mem_reg_write = '0' or input_mem_rd /= input_rs) then
            forward_ctrl_rs <= "01"; -- form wb stage (notice multiple data dependencies)
        else
            forward_ctrl_rs <= "00";
        end if;
        
        -- Forwarding rt
        if Mem_reg_write = '1' and input_mem_rd /= "0000" and input_rt = input_mem_rd then
            forward_ctrl_rt <= "10"; -- from Mem stage
        elsif WB_reg_write = '1' and input_wb_rd /= "0000" and input_rt = input_wb_rd and (Mem_reg_write = '0' or input_mem_rd /= input_rt) then
            forward_ctrl_rt <= "01"; -- from WB stage (notice multiple data dependencies)
        else
            forward_ctrl_rt <= "00";
        end if;
       
     end process;
     --forward_ctrl_rt <= "00";
     --forward_ctrl_rs <= "00";
end Behavioral;
