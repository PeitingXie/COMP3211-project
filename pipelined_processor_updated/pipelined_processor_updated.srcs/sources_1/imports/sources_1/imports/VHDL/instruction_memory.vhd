---------------------------------------------------------------------------
-- instruction_memory.vhd - Implementation of A Single-Port, 16 x 16-bit
--                          Instruction Memory.
-- 
-- Notes: refer to headers in single_cycle_core.vhd for the supported ISA.
--
-- Copyright (C) 2006 by Lih Wen Koh (lwkoh@cse.unsw.edu.au)
-- All Rights Reserved. 
--
-- The single-cycle processor core is provided AS IS, with no warranty of 
-- any kind, express or implied. The user of the program accepts full 
-- responsibility for the application of the program and the use of any 
-- results. This work may be downloaded, compiled, executed, copied, and 
-- modified solely for nonprofit, educational, noncommercial research, and 
-- noncommercial scholarship purposes provided that this notice in its 
-- entirety accompanies all copies. Copies of the modified software can be 
-- delivered to persons who use it solely for nonprofit, educational, 
-- noncommercial research, and noncommercial scholarship purposes provided 
-- that this notice in its entirety accompanies all copies.
--
---------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity instruction_memory is
    port ( reset    : in  std_logic;
           clk      : in  std_logic;
           is_flush : in std_logic;
           addr_in  : in  std_logic_vector(3 downto 0);
           insn_out : out std_logic_vector(15 downto 0) );
end instruction_memory;

architecture behavioral of instruction_memory is

type mem_array is array(0 to 15) of std_logic_vector(15 downto 0);
signal sig_insn_mem : mem_array;

begin
    mem_process: process ( reset, clk,
                           addr_in, is_flush ) is
  
    variable var_insn_mem : mem_array;
    variable var_addr     : integer;
  
    begin
        if (reset = '1') then
            -- initial values of the instruction memory :
            --  insn_0 : load  $1, $0, 0   - load data 0($0) into $1
            --  insn_1 : load  $2, $0, 1   - load data 1($0) into $2
            --  insn_2 : add   $3, $0, $1  - $3 <- $0 + $1
            --  insn_3 : add   $4, $1, $2  - $4 <- $1 + $2
            --  insn_4 : store $3, $0, 2   - store data $3 into 2($0)
            --  insn_5 : store $4, $0, 3   - store data $4 into 3($0)
            --  insn_6 - insn_15 : noop    - end of program

--            var_insn_mem(0)  := X"1010";
--            var_insn_mem(1)  := X"1021";
--            var_insn_mem(2)  := X"8013";
--            var_insn_mem(3)  := X"8124";
--            var_insn_mem(4)  := X"3032";
--            var_insn_mem(5)  := X"3043";
--            var_insn_mem(6)  := X"0000";
--            var_insn_mem(7)  := X"0000";
--            var_insn_mem(8)  := X"0000";
--            var_insn_mem(9)  := X"0000";
--            var_insn_mem(10) := X"0000";
--            var_insn_mem(11) := X"0000";
--            var_insn_mem(12) := X"0000";
--            var_insn_mem(13) := X"0000";
--            var_insn_mem(14) := X"0000";
--            var_insn_mem(15) := X"0000";
            
            -- load data elements 0($0) to 4($0) into $1 --
            -- load lower byte from elements 0($0) to 3($0) --
            -- load upper byte from elemnts 0($0) to 3($0) --
            -- slt $3, $2, $1 --
            -- slt $3, $1, $2 --
--            var_insn_mem(0)  := X"1010";
--            var_insn_mem(1)  := X"1011";
--            var_insn_mem(2)  := X"1012";
--            var_insn_mem(3)  := X"1013";
--            var_insn_mem(4)  := X"1014";
--            var_insn_mem(5)  := X"2020";
--            var_insn_mem(6)  := X"2022";
--            var_insn_mem(7)  := X"2024";
--            var_insn_mem(8)  := X"2026";
--            var_insn_mem(9)  := X"2021";
--            var_insn_mem(10) := X"2023";
--            var_insn_mem(11) := X"2025";
--            var_insn_mem(12) := X"2027";
--            var_insn_mem(13) := X"4123";
--            var_insn_mem(14) := X"4213";
--            var_insn_mem(15) := X"0000";

            -- load $1, $0, 8
--            var_insn_mem(0)  := X"1018";
--            var_insn_mem(1)  := X"1029";
--            var_insn_mem(2)  := X"5123";
--            var_insn_mem(3)  := X"102A";
--            var_insn_mem(4)  := X"5123";
--            var_insn_mem(5)  := X"102B";
--            var_insn_mem(6)  := X"5123";
--            var_insn_mem(7)  := X"0000";
--            var_insn_mem(8)  := X"0000";
--            var_insn_mem(9)  := X"0000";
--            var_insn_mem(10) := X"0000";
--            var_insn_mem(11) := X"0000";
--            var_insn_mem(12) := X"0000";
--            var_insn_mem(13) := X"0000";
--            var_insn_mem(14) := X"0000";
--            var_insn_mem(15) := X"0000";
            
            -- load  $1, $0, 9   # $1 <- 3
            -- load $2, $0, 10   # $2 <- 4
            -- load $3, $0, 11   # $3 <- 5
            -- do nothing
            -- do nothing
            -- do nothing
            -- add $4, $1, $2    # $4 <- 3 + 4 = 7
            -- add $5, $4, $3    # $5 <- 7 + 5 = 12 or c
            -- add $5, $4, $2    # $5 <- 7 + 4 = 11 or b
--            var_insn_mem(0)  := X"1019";
--            var_insn_mem(1)  := X"102a";
--            var_insn_mem(2)  := X"103b";
--            var_insn_mem(3)  := X"0000";
--            var_insn_mem(4)  := X"0000";
--            var_insn_mem(5)  := X"0000";
--            var_insn_mem(6)  := X"8124";
--            var_insn_mem(7)  := X"8435";
--            var_insn_mem(8)  := X"8425";
--            var_insn_mem(9)  := X"0000";
--            var_insn_mem(10) := X"0000";
--            var_insn_mem(11) := X"0000";
--            var_insn_mem(12) := X"0000";
--            var_insn_mem(13) := X"0000";
--            var_insn_mem(14) := X"0000";
--            var_insn_mem(15) := X"0000";

            -- load $1, $0, 8       # $1 <- FFF0
            -- load $2, $0, 15      # $2 <- 000e
            -- srr $3, $1, $2       # $3 <- FFF0 rotated shift right by 11 = FE1F
            
            var_insn_mem(0)  := X"1010"; -- $1 = 15
            var_insn_mem(1)  := X"1021"; -- $2 = 10
            var_insn_mem(2)  := X"0000"; 
            var_insn_mem(3)  := X"0000";
            var_insn_mem(4)  := X"0000";
            var_insn_mem(5)  := X"8103"; -- $3 = 15
            var_insn_mem(6)  := X"0000"; -- need stall
            var_insn_mem(7)  := X"b133"; -- jump 
            var_insn_mem(8)  := X"8127"; -- $7 = 25 
            var_insn_mem(9)  := X"8128"; 
            var_insn_mem(10) := X"8129"; 
            var_insn_mem(11) := X"812a";
            var_insn_mem(12) := X"812b"; 
            var_insn_mem(13) := X"812c"; -- $12 = 25
            var_insn_mem(14) := X"0000";
            var_insn_mem(15) := X"0000";
        
        elsif (rising_edge(clk)) then
            -- read instructions on the rising clock edge
            if is_flush = '1' then
                insn_out <= x"0000";
            else
                var_addr := conv_integer(addr_in);
                insn_out <= var_insn_mem(var_addr);
            end if;
        end if;

        -- the following are probe signals (for simulation purpose)
        sig_insn_mem <= var_insn_mem;

    end process;
  
end behavioral;
