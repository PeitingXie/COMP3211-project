----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.03.2022 13:59:39
-- Design Name: 
-- Module Name: rotate_right_shifter_16b - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rotate_right_shifter_32b8 is
    Port ( src_a : in STD_LOGIC_VECTOR (31 downto 0);
           rotations : in STD_LOGIC_VECTOR (3 downto 0);
           result : out STD_LOGIC_VECTOR (31 downto 0));

end rotate_right_shifter_32b8;

architecture Behavioral of rotate_right_shifter_32b8 is
    component mux_2to1_32b is 
    Port ( mux_select : in  std_logic;
           data_a     : in  std_logic_vector(31 downto 0);
           data_b     : in  std_logic_vector(31 downto 0);
           data_out     : out std_logic_vector(31 downto 0) );
    end component;
    
    signal bit_0_rotate, bit_0_out : std_logic_vector(31 downto 0);
    signal bit_1_rotate, bit_1_out : std_logic_vector(31 downto 0);
    signal bit_2_rotate, bit_2_out : std_logic_vector(31 downto 0);
    
begin
    
    rotate_1_proc: process (src_a)
    begin
        -- rotate shift right 1 --
        for i in 0 to 6 loop
            bit_0_rotate(i) <= src_a(i + 1);
        end loop;
        bit_0_rotate(7) <= src_a(0);
        
        -- keep bits unchanged --
        for i in 8 to 31 loop
            bit_0_rotate(i) <= src_a(i);
        end loop;
               
    end process;
    
    rotate_2_proc: process (bit_0_out)
    begin
        -- rotate shift right 2 --
        for i in 0 to 5 loop
            bit_1_rotate(i) <= bit_0_out(i + 2);
        end loop;
        for i in 6 to 7 loop
            bit_1_rotate(i) <= bit_0_out(i - 6);
        end loop;
        
        -- keep bits unchanged --
        for i in 8 to 31 loop
            bit_1_rotate(i) <= bit_0_out(i);
        end loop;
        
    end process;
    
    rotate_4_proc: process (bit_1_out)
    begin
        -- rotate shift right 4 --
        for i in 0 to 3 loop
            bit_2_rotate(i) <= bit_1_out(i + 4);
        end loop;
        for i in 4 to 7 loop
            bit_2_rotate(i) <= bit_1_out(i - 4);
        end loop;
        
        -- keep bits unchanged --
        for i in 8 to 31 loop
            bit_2_rotate(i) <= bit_1_out(i);
        end loop;
        
    end process;
    
    
    bit_0_mux: mux_2to1_32b 
    port map ( mux_select => rotations(0),
               data_a => src_a,
               data_b => bit_0_rotate,
               data_out => bit_0_out );
    
    bit_1_mux: mux_2to1_32b 
    port map ( mux_select => rotations(1),
               data_a => bit_0_out,
               data_b => bit_1_rotate,
               data_out => bit_1_out );

    bit_2_mux: mux_2to1_32b 
    port map ( mux_select => rotations(2),
               data_a => bit_1_out,
               data_b => bit_2_rotate,
               data_out => bit_2_out );
    
    result <= bit_2_out;
               
end Behavioral;
