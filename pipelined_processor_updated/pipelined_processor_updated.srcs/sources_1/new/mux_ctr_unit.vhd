----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.04.2022 18:09:24
-- Design Name: 
-- Module Name: mux_ctr_unit - Behavioral
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

entity mux_ctr_unit is
  Port ( ctr_sig_sel : in std_logic;
         mem_write_in : in std_logic;
         mem_write_out : out std_logic;
         reg_write_in : in std_logic;
         reg_write_out : out std_logic;
         alu_ctr_in : in std_logic_vector(2 downto 0);
         alu_ctr_out : out std_logic_vector(2 downto 0) );
end mux_ctr_unit;

architecture Behavioral of mux_ctr_unit is

begin
    mux_ctr_proc : process (ctr_sig_sel, mem_write_in, reg_write_in, alu_ctr_in)
    begin
        case ctr_sig_sel is
            when '1' =>
                mem_write_out <= '0';
                reg_write_out <= '0';
                alu_ctr_out <= "101";
            when '0' =>
                mem_write_out <= mem_write_in;
                reg_write_out <= reg_write_in;
                alu_ctr_out <= alu_ctr_in;
            when others =>
        end case;
    end process;

end Behavioral;
