----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.04.2022 18:56:43
-- Design Name: 
-- Module Name: left_shifter - Behavioral
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

entity left_shifter_32b is
    Port ( src_a : in STD_LOGIC_VECTOR (31 downto 0);
           rotations : in STD_LOGIC_VECTOR (4 downto 0);
           result : out STD_LOGIC_VECTOR (31 downto 0));
end left_shifter_32b;

architecture Behavioral of left_shifter_32b is
    component mux_2to1_32b is 
    Port ( mux_select : in  std_logic;
           data_a     : in  std_logic_vector(31 downto 0);
           data_b     : in  std_logic_vector(31 downto 0);
           data_out     : out std_logic_vector(31 downto 0) );
    end component;
    
    signal bit_0_shift, bit_0_out : std_logic_vector(31 downto 0);
    signal bit_1_shift, bit_1_out : std_logic_vector(31 downto 0);
    signal bit_2_shift, bit_2_out : std_logic_vector(31 downto 0);
    signal bit_3_shift, bit_3_out : std_logic_vector(31 downto 0);
    signal bit_4_shift, bit_4_out : std_logic_vector(31 downto 0);

begin
    rotate_1_proc: process (src_a)
    begin
        -- shift left 1 --
        for i in 1 to 31 loop
            bit_0_shift(i) <= src_a(i - 1);
        end loop;
        bit_0_shift(0) <= '0';

               
    end process;
    
    rotate_2_proc: process (bit_0_out)
    begin
        -- shift left 2 --
        for i in 2 to 31 loop
            bit_1_shift(i) <= bit_0_out(i - 2);
        end loop;
        for i in 0 to 1 loop
            bit_1_shift(i) <= '0';
        end loop;

        
    end process;
    
    rotate_4_proc: process (bit_1_out)
    begin
        -- rotate shift left 4 --
        for i in 4 to 31 loop
            bit_2_shift(i) <= bit_1_out(i - 4);
        end loop;
        for i in 0 to 3 loop
            bit_2_shift(i) <= '0';
        end loop;

        
    end process;
    
    rotate_8_proc: process (bit_2_out)
    begin
        -- rotate shift left 4 --
        for i in 8 to 31 loop
            bit_3_shift(i) <= bit_2_out(i - 8);
        end loop;
        for i in 0 to 7 loop
            bit_3_shift(i) <= '0';
        end loop;
    end process;
    
    rotate_16_proc: process (bit_3_out)
    begin
        -- rotate shift left 4 --
        for i in 16 to 31 loop
            bit_4_shift(i) <= bit_3_out(i - 16);
        end loop;
        for i in 0 to 15 loop
            bit_4_shift(i) <= '0';
        end loop;
    end process;
    
    bit_0_mux: mux_2to1_32b 
    port map ( mux_select => rotations(0),
               data_a => src_a,
               data_b => bit_0_shift,
               data_out => bit_0_out );
    
    bit_1_mux: mux_2to1_32b 
    port map ( mux_select => rotations(1),
               data_a => bit_0_out,
               data_b => bit_1_shift,
               data_out => bit_1_out );

    bit_2_mux: mux_2to1_32b 
    port map ( mux_select => rotations(2),
               data_a => bit_1_out,
               data_b => bit_2_shift,
               data_out => bit_2_out );
        
    bit_3_mux : mux_2to1_32b
    port map ( mux_select => rotations(3),
               data_a => bit_2_out,
               data_b => bit_3_shift,
               data_out => bit_3_out );
    
    bit_4_mux : mux_2to1_32b
    port map ( mux_select => rotations(4),
               data_a => bit_3_out,
               data_b => bit_4_shift,
               data_out => bit_4_out );
               
    result <= bit_4_out;

end Behavioral;
