----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.03.2022 20:35:57
-- Design Name: 
-- Module Name: load_byte_unit - Behavioral
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

entity load_byte_unit is
  Port ( 
        data_in      : in std_logic_vector(15 downto 0);
        read_byte    : in std_logic;
        load_msb     : in std_logic;
        data_to_extend  : out std_logic_vector(7 downto 0));
end load_byte_unit;

architecture Behavioral of load_byte_unit is
signal byte_mask    : std_logic_vector (15 downto 0);
begin
    select_bits : process ( data_in, load_msb ) is
    begin
        -- shift bits if the most significant byte was loaded --
        case load_msb is
            when '1' => 
                for i in 0 to 7 loop
                        data_to_extend(i) <= data_in(i + 8);
                end loop;
            when others =>
                for i in 0 to 7 loop
                        data_to_extend(i) <= data_in(i);
                end loop;
        end case;

    end process;
    
end Behavioral;
