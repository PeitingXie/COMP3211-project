----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/04/15 13:40:06
-- Design Name: 
-- Module Name: forwarding_branch - Behavioral
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

entity forwarding_branch is
    Port ( if_id_regs : in STD_LOGIC_VECTOR (3 downto 0);
           if_id_regt : in STD_LOGIC_VECTOR (3 downto 0);
           ex_mem_regd : in STD_LOGIC_VECTOR (3 downto 0);
           ex_mem_regWrite : in STD_LOGIC;
           forwarding_br_ctrls : out STD_LOGIC;
           forwarding_br_ctrlt : out STD_LOGIC);
end forwarding_branch;

architecture Behavioral of forwarding_branch is

begin
    process(ex_mem_regWrite, ex_mem_regd, if_id_regs, if_id_regt)
    begin
        --if (ex_mem_regWrite = '1' and ex_mem_regd = if_id_regs and ex_mem_regd /= "0000") then
        if (ex_mem_regWrite = '1' and ex_mem_regd = if_id_regs) then
            forwarding_br_ctrls <= '1';
        else
            forwarding_br_ctrls <= '0';
        end if;
        
        --if (ex_mem_regWrite = '1' and ex_mem_regd = if_id_regt and ex_mem_regd /= "0000") then
        if (ex_mem_regWrite = '1' and ex_mem_regd = if_id_regt) then
            forwarding_br_ctrlt <= '1';
        else
            forwarding_br_ctrlt <= '0';
        end if;
    end process;
end Behavioral;
