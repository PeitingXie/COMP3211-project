----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.03.2022 01:31:12
-- Design Name: 
-- Module Name: forwarding_unit - Behavioral
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

entity forwarding_unit is
  Port ( exmem_reg_write : in std_logic;
         exmem_reg_dst_addr : in std_logic_vector(3 downto 0);
         idex_reg_a_addr : in std_logic_vector(3 downto 0);
         idex_reg_b_addr : in std_logic_vector(3 downto 0);
         memwb_reg_write : in std_logic;
         memwb_reg_dst_addr : in std_logic_vector(3 downto 0);
         aluSrc_a_sel : out std_logic_vector(1 downto 0);
         aluSrc_b_sel : out std_logic_vector(1 downto 0)
         );
end forwarding_unit;

architecture Behavioral of forwarding_unit is

begin
    mem_stage_proc : process ( exmem_reg_write, exmem_reg_dst_addr, idex_reg_a_addr, idex_reg_b_addr )
    begin
        aluSrc_a_sel <= "00";
        aluSrc_b_sel <= "00";


        if (exmem_reg_write = '1') and (exmem_reg_dst_addr /= X"0") and (exmem_reg_dst_addr = idex_reg_a_addr) then
            aluSrc_a_sel <= "10";
        elsif (memwb_reg_write = '1') and (memwb_reg_dst_addr /= X"0") and (memwb_reg_dst_addr = idex_reg_a_addr) then
            aluSrc_a_sel <= "01";
        end if;
        
        if (exmem_reg_write = '1') and (exmem_reg_dst_addr /= X"0") and (exmem_reg_dst_addr = idex_reg_b_addr) then
            aluSrc_b_sel <= "10";
        elsif (memwb_reg_write = '1') and (memwb_reg_dst_addr /= X"0") and (memwb_reg_dst_addr = idex_reg_b_addr) then
            aluSrc_b_sel <= "01";
        end if;
    end process;

end Behavioral;
