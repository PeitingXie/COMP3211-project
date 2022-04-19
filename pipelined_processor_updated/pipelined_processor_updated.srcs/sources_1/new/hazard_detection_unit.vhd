----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 12.04.2022 18:02:23
-- Design Name:
-- Module Name: hazard_detection_unit - Behavioral
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



entity hazard_detection_unit is
    Port (  ifid_reg_a : in std_logic_vector(3 downto 0);
            ifid_reg_b : in std_logic_vector(3 downto 0);
            idex_reg_b : in std_logic_vector(3 downto 0);
            idex_reg_d : in std_logic_vector(3 downto 0);
            idex_op  : in std_logic;
            ifid_beq   : in std_logic;
            idex_mem_read : in std_logic;
            ctr_sig_sel : out std_logic;
            ifid_write : out std_logic;
            pc_write : out std_logic);
end hazard_detection_unit;



architecture Behavioral of hazard_detection_unit is



begin
    hazard_detection_proc : process(ifid_reg_a, ifid_reg_b, idex_reg_b, idex_mem_read, ifid_beq, idex_reg_d, idex_op)
    begin
        if (idex_mem_read = '1' and (idex_reg_b = ifid_reg_a or idex_reg_b = ifid_reg_b)) or (ifid_beq = '1' and idex_op = '1' and (idex_reg_d = ifid_reg_a or idex_reg_d = ifid_reg_b)) then
            ctr_sig_sel <= '1';
            ifid_write <= '0';
            pc_write <= '0';
        else
            ctr_sig_sel <= '0';
            ifid_write <= '1';
            pc_write <= '1';
        end if;
       
    end process;



end Behavioral;