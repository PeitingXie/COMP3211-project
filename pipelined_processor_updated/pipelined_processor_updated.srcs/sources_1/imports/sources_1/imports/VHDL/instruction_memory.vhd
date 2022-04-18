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
           addr_in  : in  std_logic_vector(9 downto 0);
           pc_write : in std_logic;
           insn_out : out std_logic_vector(31 downto 0) );
end instruction_memory;

architecture behavioral of instruction_memory is

type mem_array is array(0 to 1023) of std_logic_vector(31 downto 0);
signal sig_insn_mem : mem_array;

begin
    mem_process: process ( reset, clk,
                           addr_in, pc_write ) is
  
    variable var_insn_mem : mem_array;
    variable var_addr     : integer;
    variable i            : integer range 1 to 1024;
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
            
            
              -- branch forwarding
--            var_insn_mem(0)  := X"1010"; -- $1 = 15
--            var_insn_mem(1)  := X"1021"; -- $2 = 10
--            var_insn_mem(2)  := X"0000"; 
--            var_insn_mem(3)  := X"0000";
--            var_insn_mem(4)  := X"0000";
--            var_insn_mem(5)  := X"8103"; -- $3 = 15
--            var_insn_mem(6)  := X"0000"; -- need stall
--            var_insn_mem(7)  := X"b134"; -- jump to addr 10
--            var_insn_mem(8)  := X"8127"; -- $7 = 25 (not executed)
--            var_insn_mem(9)  := X"0000";
--            var_insn_mem(10) := X"0000"; 
--            var_insn_mem(11) := X"0000";
--           var_insn_mem(12) := X"0000"; 
--            var_insn_mem(13) := X"8124"; -- $4 = 25
--           var_insn_mem(14) := X"0000";
--            var_insn_mem(15) := X"0000";

--              var_insn_mem(0)  := X"10100000"; -- $1 = 15
--              var_insn_mem(1)  := X"10200001"; -- $2 = 15
--              var_insn_mem(2)  := X"00000000"; 
--              var_insn_mem(3)  := X"00000000"; 
--              var_insn_mem(4)  := X"80100003"; 
--              var_insn_mem(5)  := X"b3100002"; 
--              var_insn_mem(6)  := X"81200006"; 
--              var_insn_mem(7)  := X"00000000"; 
--              var_insn_mem(8)  := X"81200005"; 
--              var_insn_mem(9)  := X"81200004"; 
--              var_insn_mem(10) := X"b31ffffc"; 
--              var_insn_mem(11) := X"00000000"; 
--              var_insn_mem(12) := X"00000000"; 
--              var_insn_mem(13) := X"00000000"; 
--              var_insn_mem(14) := X"00000000";
--              var_insn_mem(15) := X"00000000";
       
--============================== SHIFT TESTS =====================================
            -- load $1, $0, 0
            -- load $2, $0, 1
            -- load $3, $0, 2
            -- srr $1, $1, $3
            -- srr $1, $1, $0     
            -- srr $2, $2, $3
            -- store $2, $0, 3
            
--            var_insn_mem(0)  := X"10100000"; -- $1 = FFFFFF01
--            var_insn_mem(1)  := X"10200001"; -- $2 = FFFFFF27
--            var_insn_mem(2)  := X"10300002"; -- $3 = 00000006
--            var_insn_mem(3)  := X"51300001"; -- $1 = FFFFFF04
--            var_insn_mem(4)  := X"51000001"; -- $1 = FFFFFF04
--            var_insn_mem(5)  := X"52300002"; -- $2 = FFFFFF9c
--            var_insn_mem(6)  := X"30200003"; -- data_mem(3) = FFFFFF9C
--            var_insn_mem(7)  := X"00000000"; 
--            var_insn_mem(8)  := X"00000000"; 
--            var_insn_mem(9)  := X"00000000"; 
--            var_insn_mem(10) := X"00000000"; 
--            var_insn_mem(11) := X"00000000"; 
--            var_insn_mem(12) := X"00000000"; 
--            var_insn_mem(13) := X"00000000"; 
--            var_insn_mem(14) := X"00000000";
--            var_insn_mem(15) := X"00000000";

            -- load $1, $0, 0
            -- load $2, $0, 1
            -- load $3, $0, 2
            -- srl $1, $1, $3
            -- srl $1, $1, $0     
            -- srl $2, $2, $3
            -- store $2, $0, 3
            
--            var_insn_mem(0)  := X"10100000"; -- $1 = FFFFFF01
--            var_insn_mem(1)  := X"10200001"; -- $2 = FFFFFF27
--            var_insn_mem(2)  := X"10300002"; -- $3 = 00000006
--            var_insn_mem(3)  := X"61300001"; -- $1 = FFFFFF40
--            var_insn_mem(4)  := X"61000001"; -- $1 = FFFFFF40
--            var_insn_mem(5)  := X"62300002"; -- $2 = FFFFFFd9
--            var_insn_mem(6)  := X"30200003"; -- data_mem(3) = FFFFFFd9
--            var_insn_mem(7)  := X"00000000"; 
--            var_insn_mem(8)  := X"00000000"; 
--            var_insn_mem(9)  := X"00000000"; 
--            var_insn_mem(10) := X"00000000"; 
--            var_insn_mem(11) := X"00000000"; 
--            var_insn_mem(12) := X"00000000"; 
--            var_insn_mem(13) := X"00000000"; 
--            var_insn_mem(14) := X"00000000";
--            var_insn_mem(15) := X"00000000";
            
            -- load $1, $0, 0
            -- load $2, $0, 1
            -- load $3, $0, 2
            -- lsr $1, $1, $3
            -- lsr $1, $1, $0     
            -- lsr $2, $2, $3
            -- store $2, $0, 3
--            var_insn_mem(0)  := X"10100000"; -- $1 = FFFFFF01
--            var_insn_mem(1)  := X"10200001"; -- $2 = FFFFFF27
--            var_insn_mem(2)  := X"10300002"; -- $3 = 00000004
--            var_insn_mem(3)  := X"71300001"; -- $1 = 0FFFFFF0
--            var_insn_mem(4)  := X"71000001"; -- $1 = 0FFFFFF0
--            var_insn_mem(5)  := X"72300002"; -- $2 = 0FFFFFF2
--            var_insn_mem(6)  := X"30200003"; -- data_mem(3) = 0FFFFFF2
--            var_insn_mem(7)  := X"00000000"; 
--            var_insn_mem(8)  := X"00000000"; 
--            var_insn_mem(9)  := X"00000000"; 
--            var_insn_mem(10) := X"00000000"; 
--            var_insn_mem(11) := X"00000000"; 
--            var_insn_mem(12) := X"00000000"; 
--            var_insn_mem(13) := X"00000000"; 
--            var_insn_mem(14) := X"00000000";
--            var_insn_mem(15) := X"00000000";

            -- load $1, $0, 0
            -- load $2, $0, 1
            -- load $3, $0, 2
            -- lsl $1, $1, $3
            -- lsl $1, $1, $0     
            -- lsl $2, $2, $3
            -- store $2, $0, 3
--            var_insn_mem(0)  := X"10100000"; -- $1 = FFFFFF01
--            var_insn_mem(1)  := X"10200001"; -- $2 = FFFFFF27
--            var_insn_mem(2)  := X"10300002"; -- $3 = 00000004
--            var_insn_mem(3)  := X"c1300001"; -- $1 = FFFFF010
--            var_insn_mem(4)  := X"c1000001"; -- $1 = FFFFF010
--            var_insn_mem(5)  := X"c2300002"; -- $2 = FFFFF270
--            var_insn_mem(6)  := X"30200003"; -- data_mem(3) = FFFFF270
--            var_insn_mem(7)  := X"00000000"; 
--            var_insn_mem(8)  := X"00000000"; 
--            var_insn_mem(9)  := X"00000000"; 
--            var_insn_mem(10) := X"00000000"; 
--            var_insn_mem(11) := X"00000000"; 
--            var_insn_mem(12) := X"00000000"; 
--            var_insn_mem(13) := X"00000000"; 
--            var_insn_mem(14) := X"00000000";
--            var_insn_mem(15) := X"00000000";
--============================== SHIFT TESTS =====================================
            
--            var_insn_mem(0)  := X"10100000"; -- $1 = FFFFFF01
--            var_insn_mem(1)  := X"10200002"; -- $2 = 00000004
--            var_insn_mem(2)  := X"10300005"; -- $3 = 0000000b
--            var_insn_mem(3)  := X"12400001"; -- $4 = 0000000b
--            var_insn_mem(4)  := X"00000000"; 
--            var_insn_mem(5)  := X"00000000"; 
--            var_insn_mem(6)  := X"00000000"; 
--            var_insn_mem(7)  := X"00000000"; 
--            var_insn_mem(8)  := X"00000000"; 
--            var_insn_mem(9)  := X"00000000"; 
--            var_insn_mem(10) := X"00000000"; 
--            var_insn_mem(11) := X"00000000"; 
--            var_insn_mem(12) := X"00000000"; 
--            var_insn_mem(13) := X"00000000"; 
--            var_insn_mem(14) := X"00000000";
--            var_insn_mem(15) := X"00000000";
            
            
            
              var_insn_mem(0)  := X"3a000014"; -- sw $10, $0, 20
              var_insn_mem(1)  := X"3a100015"; -- sw $10. $1, 21
              var_insn_mem(2)  := X"3a200016"; -- sw $10. $2, 22
              var_insn_mem(3)  := X"3a300017"; -- sw $10. $3, 23
              var_insn_mem(4)  := X"3a000018"; -- sw $10, $0, 24
              var_insn_mem(5)  := X"3a100019"; -- sw $10. $1, 25
              var_insn_mem(6)  := X"3a20001a"; -- sw $10. $2, 26
              var_insn_mem(7)  := X"3a30001b"; -- sw $10. $3, 27
              
              var_insn_mem(8)  := X"1a500009"; -- lw $5, $10, 9  load secret in $5
              var_insn_mem(9)  := X"1af0006e"; -- lw $10, $15, 110    load 10 into $15 
              var_insn_mem(10)  := X"1ae00003"; -- lw $14, $10, 3     get 0b111, store in $14
              var_insn_mem(11)  := X"55f00006"; -- srr $6, $5, $15
              
              var_insn_mem(12)  := X"96e00006"; --and $6, $6, $14
               var_insn_mem(13) := X"00000000";
               var_insn_mem(14) := X"00000000";
               var_insn_mem(15) := X"00000000";
              var_insn_mem(16)  := X"16600000"; --lw $6, $6, 0
              --var_insn_mem(14)  := X"1af00002"; --lw $15, $10, 2 get 0b11, store in $15
              --var_insn_mem(15)  := X"95f00007"; --and $7, $5, $15    get b1, store in $7
              --var_insn_mem(16)  := X"1af00068"; --lw $15, $10, 104  get 4, store in $15
              --var_insn_mem(17)  := X"55f00008"; --srr $8, $5, $15
              --var_insn_mem(18)  := X"98e00008"; --and $8, $8, $14    get p1, store in $8
              --var_insn_mem(19)  := X"17900014"; --lw $9, $7, 20      get b1 related block, store in $9
              --var_insn_mem(20)  := X"59800009"; --srr $9, $9, $8     shift b1 block for p1 bits
              --var_insn_mem(21)  := X"9960000b"; --and $11, $9, $6    get given size of bits in block b1, ready for swap, store in $11
              --var_insn_mem(22)  := X"1ac00066"; --lw $12, $10, 102    get value 2, store in $7
              --var_insn_mem(23)  := X"55c0000c"; --srr $12, $5, $12
              --var_insn_mem(24)  := X"1af00002"; --lw $15, $10, 2    get 0b11, store in $15
              --var_insn_mem(25)  := X"9cf0000c"; --and $12, $12, $15   get b2, store in $12
              --var_insn_mem(26)  := X"1af0006b"; --lw $15, $10, 107    get 7, store in $15
              --var_insn_mem(27)  := X"55f0000d"; --srr $13, $5, $15 
              --var_insn_mem(28)  := X"9de0000d"; --and $13, $13, $14   get p2, store in  $13
              --var_insn_mem(29)  := X"1ce00014"; --lw $14, $12, 20     get b2 related block, store in $14
              --var_insn_mem(30)  := X"5ed0000e"; --srr $14, $14, $13 
              --var_insn_mem(31)  := X"9e60000f"; --and $15, $14, $6    get given size of bits in block b2, ready for swap, store in $15  
              -- Put mips code here
              i := 17;
              while i <= 1023 loop
                var_insn_mem(i) := X"00000000";
                i := i + 1;
            end loop;
       elsif (rising_edge(clk) and pc_write = '1') then
           -- read instructions on the rising clock edge
            var_addr := conv_integer(addr_in);
            insn_out <= var_insn_mem(var_addr);
        end if;

        -- the following are probe signals (for simulation purpose)
        sig_insn_mem <= var_insn_mem;

    end process;
  
end behavioral;
