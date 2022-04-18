----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/04/18 11:23:28
-- Design Name: 
-- Module Name: Testbench - Behavioral
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
use std.textio.all;
use ieee.std_logic_textio.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Testbench is
end Testbench;

architecture Behavioral of Testbench is
    component single_cycle_core is
        port ( reset  : in  std_logic;
               clk    : in  std_logic;
               send   : in  std_logic;
               D0     : in std_logic_vector(7 downto 0);
               D1     : in std_logic_vector(7 downto 0);
               D2     : in std_logic_vector(7 downto 0);
               D3     : in std_logic_vector(7 downto 0);
               tag    : in std_logic_vector(7 downto 0);
               busy   : out std_logic
);
    end component ;
    
    constant c_CLOCK_PERIOD : time := 2 ns; 
    signal r_CLOCK    : std_logic := '0';
    signal r_reset    : std_logic := '0';
    signal r_send     : std_logic;
    signal r_D0       : std_logic_vector(7 downto 0);
    signal r_D1       : std_logic_vector(7 downto 0);
    signal r_D2       : std_logic_vector(7 downto 0);
    signal r_D3       : std_logic_vector(7 downto 0);
    signal r_tag      : std_logic_vector(7 downto 0);
    signal r_busy     : std_logic;
    file file_txt     : text;
begin
    -- Instantiate the Unit Under Test (UUT)
    UUT : single_cycle_core
          port map (
 reset    => r_reset,
                     clk     => r_CLOCK,
                     send    => r_send,
                     D0      => r_D0,
                     D1      => r_D1,
                     D2      => r_D2,
                     D3      => r_D3,
                     tag     => r_tag,
                     busy    => r_busy);
    
    -- Generate clock cycles
    p_CLK_GEN : process is
        begin
            wait for c_CLOCK_PERIOD/2;
            r_CLOCK <= not r_CLOCK;
        end process p_CLK_GEN;
    
    process
        variable test_line  : line;
        variable record_data: std_logic_vector(31 downto 0);
        variable tag_data   : std_logic_vector(7 downto 0);
        variable space      : character;
    begin
        r_reset <= '0';
        wait for 2*c_CLOCK_PERIOD ;
        r_reset <= '1';
        wait for 2*c_CLOCK_PERIOD ;
        r_reset <= '0';         
          
        --wait for 2 ns;
        -- Open test file
        file_open(file_txt, "name.txt", read_mode);
    
        -- Read line by line and extract records & tags
        while not endfile(file_txt) loop
            if (r_busy = '1') then
                wait for c_CLOCK_PERIOD;
                next;
            else
                readline(file_txt, test_line);
                read(test_line, record_data);
                read(test_line, space);
                read(test_line, tag_data);
                
                r_D0 <= record_data(31 downto 24);
                r_D1 <= record_data(23 downto 16);
                r_D2 <= record_data(15 downto 8);
                r_D3 <= record_data(7 downto 0);
                r_tag <= tag_data;
                
                r_send <= '1';
                wait for 10 ns;
                r_send <= '0';
            end if;
        end loop;
         
        file_close(file_txt);
    end process;
end Behavioral;
