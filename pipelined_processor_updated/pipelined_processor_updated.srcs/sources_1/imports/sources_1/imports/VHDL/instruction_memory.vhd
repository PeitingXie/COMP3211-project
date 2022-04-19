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
           is_flush : in std_logic;
           pc_write : in std_logic;
           insn_out : out std_logic_vector(31 downto 0));
end instruction_memory;

architecture behavioral of instruction_memory is

type mem_array is array(0 to 1023) of std_logic_vector(31 downto 0);
signal sig_insn_mem : mem_array;

begin
    mem_process: process ( reset, clk,
                           addr_in, pc_write, is_flush ) is
  
    variable var_insn_mem : mem_array;
    variable var_addr     : integer;
    variable i            : integer range 1 to 1024;
    begin
        if (reset = '1') then
           

              
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
              var_insn_mem(11)  := X"75f00006"; -- slr $6, $5, $15
              
              var_insn_mem(12)  := X"96e00006"; --and $6, $6, $14
               
              var_insn_mem(13)  := X"16600000"; --lw $6, $6, 0
              var_insn_mem(14)  := X"1af00002"; --lw $15, $10, 2 get 0b11, store in $15
              var_insn_mem(15)  := X"95f00007"; --and $7, $5, $15    get b1, store in $7
              var_insn_mem(16)  := X"1af00068"; --lw $15, $10, 104  get 4, store in $15
              var_insn_mem(17)  := X"75f00008"; --srr $8, $5, $15
              var_insn_mem(18)  := X"98e00008"; --and $8, $8, $14    get p1, store in $8
              var_insn_mem(19)  := X"17900014"; --lw $9, $7, 20      get b1 related block, store in $9
              var_insn_mem(20)  := X"79800009"; --srr $9, $9, $8     shift b1 block for p1 bits
              var_insn_mem(21)  := X"9960000b"; --and $11, $9, $6    get given size of bits in block b1, ready for swap, store in $11
              var_insn_mem(22)  := X"1ac00066"; --lw $12, $10, 102    get value 2, store in $7
              var_insn_mem(23)  := X"75c0000c"; --srr $12, $5, $12
              var_insn_mem(24)  := X"1af00002"; --lw $15, $10, 2    get 0b11, store in $15
              var_insn_mem(25)  := X"9cf0000c"; --and $12, $12, $15   get b2, store in $12
              var_insn_mem(26)  := X"1af0006b"; --lw $15, $10, 107    get 7, store in $15
              var_insn_mem(27)  := X"75f0000d"; --srr $13, $5, $15 
              var_insn_mem(28)  := X"9de0000d"; --and $13, $13, $14   get p2, store in  $13
              var_insn_mem(29)  := X"1ce00014"; --lw $14, $12, 20     get b2 related block, store in $14
              var_insn_mem(30)  := X"7ed0000e"; --srr $14, $14, $13 
              var_insn_mem(31)  := X"9e60000f"; --and $15, $14, $6    get given size of bits in block b2, ready for swap, store in $15  
              
              var_insn_mem(32)  := X"1ae0006e"; --lw $14, $10, 110
              var_insn_mem(33)  := X"75e0000e"; --srr $14, $5, $14  
              var_insn_mem(34)  := X"1a900003"; --lw $9, $10, 3     get 0b111, store in $9 
              var_insn_mem(35)  := X"9e90000e"; --and $14, $14, $9 ----  get size in decimal
              
              var_insn_mem(36)  := X"17900014"; --lw $9, $7, 20      get b1 related block, store in $9
              var_insn_mem(37)  := X"88e00000"; --add $0, $8, $14
              var_insn_mem(38)  := X"00000000";
              var_insn_mem(39)  := X"00000000";
              var_insn_mem(40)  := X"79000001"; --srr $1, $9, $0
              var_insn_mem(41)  := X"00000000";
              var_insn_mem(42)  := X"00000000";
              var_insn_mem(43)  := X"61000001"; --slr $1, $1, $0       get bits left from p1 + s, shift to right position, store in $1 
              var_insn_mem(44)  := X"18000000"; --lw $0, $8, 0        get transfer p1 as binary, store in $0
              var_insn_mem(45)  := X"00000000";
              var_insn_mem(46)  := X"99000000"; --and $0, $9, $0      get bits right from bit p1, store in $0
              var_insn_mem(47)  := X"6F800002"; --sll $2, $15, $8 shift left
              var_insn_mem(48)  := X"80100003"; --add $3, $0, $1
              var_insn_mem(49)  := X"00000000";
              var_insn_mem(50)  := X"00000000";
              var_insn_mem(51)  := X"83200003"; --add $3, $3, $2
              var_insn_mem(52)  := X"37300014"; --sw $3, $7, 20 
              var_insn_mem(53)  := X"1c900014"; --lw $9, $12, 20
              var_insn_mem(54)  := X"8de00000"; --add $0, $13, $14
              var_insn_mem(55)  := X"00000000";
              var_insn_mem(56)  := X"00000000";
              var_insn_mem(57)  := X"79000001"; --SRL $1, $9, $0
              var_insn_mem(58)  := X"00000000";
              var_insn_mem(59)  := X"00000000";
              var_insn_mem(60)  := X"61000001"; --sll $1, $1, $0      get bits left from p2 + s, shift to right position, store in $1 
              var_insn_mem(61)  := X"1d000000"; --lw $0, $13, 0
              var_insn_mem(62)  := X"00000000";
              var_insn_mem(63)  := X"99000000"; --and $0, $9, $0
              var_insn_mem(64)  := X"6bd00002"; --sll $2, $11, $13
              var_insn_mem(65)  := X"80100003"; --add $3, $0, $1
              var_insn_mem(66)  := X"83200003"; --add $3, $3, $2
              var_insn_mem(67)  := X"3c300014"; -- sw $3, $12, 20
              var_insn_mem(68)  := X"1a000014"; --lw $0, $10, 20   get D0 after swap, store in $0
              var_insn_mem(69)  := X"1a100071"; --lw $1, $10, 113     get 13, store in $1
              var_insn_mem(70)  := X"75100001"; --srr $1, $5, $1
              var_insn_mem(71)  := X"1a200003"; --lw $2, $10, 3       get 0b111, store in $2
              var_insn_mem(72)  := X"92100003"; --and $3, $2, $1      get r0, store in $3
              var_insn_mem(73)  := X"60300000"; --slr $0, $0, $3
              var_insn_mem(74)  := X"3a000014"; --sw $0, $10, 20
              
              var_insn_mem(75)  := X"1a000015"; --lw $0, $10, 21      get D1 after swap, store in $0
              var_insn_mem(76)  := X"1a100074"; --lw $1, $10, 116     get 16, store in $1
              var_insn_mem(77)  := X"75100001"; --srr $1, $5, $1
              var_insn_mem(78)  := X"92100003"; --and $3, $2, $1      get r1, store in $3
              var_insn_mem(79)  := X"60300000"; --slr $0, $0, $3
              var_insn_mem(80)  := X"3a000015"; --sw $0, $10, 21 
              
              var_insn_mem(81)  := X"1a000016"; --lw $0, $10, 22      get D2 after swap, store in $0
              var_insn_mem(82)  := X"1a100077"; --lw $1, $10, 119     get 19, store in $1
              var_insn_mem(83)  := X"75100001"; --srr $1, $5, $1
              var_insn_mem(84)  := X"92100003"; --and $3, $2, $1      get r2, store in $3
              var_insn_mem(85)  := X"60300000"; --slr $0, $0, $3
              var_insn_mem(86)  := X"3a000016"; --sw $0, $10, 22 
              
              var_insn_mem(87)  := X"1a000017"; --lw $0, $10, 23      get D3 after swap, store in $0
              var_insn_mem(88)  := X"1a10007a"; --lw $1, $10, 122     get 22, store in $1
              var_insn_mem(89)  := X"75100001"; --srr $1, $5, $1
              var_insn_mem(90)  := X"92100003"; --and $3, $2, $1      get r3, store in $3
              var_insn_mem(91)  := X"60300000"; --slr $0, $0, $3
              var_insn_mem(92)  := X"3a000017"; --sw $0, $10, 23 
              
              var_insn_mem(93)  := X"1a000014"; --lw $0, $10, 20
              var_insn_mem(94)  := X"1a100015"; --lw $1, $10, 21
              var_insn_mem(95)  := X"1a200016"; --lw $0, $10, 22
              var_insn_mem(96)  := X"1a300017"; --lw $0, $10, 22
              
              var_insn_mem(97)  := X"A0100000"; --xor $0, $0, $1
              var_insn_mem(98)  := X"A0200000"; --xor $0, $0, $2
              var_insn_mem(99)  := X"A0300000"; --xor $0, $0, $3
             
              var_insn_mem(100)  := X"3a000096"; --sw $0, $10, 150
              -------- tag generated
              var_insn_mem(101)  := X"B0400001";--beq $0, $4, 1
              var_insn_mem(102)  := X"B0000064";--beq $0, $0, 100
              var_insn_mem(103)  := X"1a000005";--lw $0, $10, 5    get 0b11111, used for get district number, store in $0
              var_insn_mem(104)  := X"00000000";
              var_insn_mem(105)  := X"1a100067";--lw $1, $10, 103     get 3, store in $1
              var_insn_mem(106)  := X"1a200018";--lw $2, $10, 24      get unchanged D0
              var_insn_mem(107)  := X"7210000d";--lsr $13, $2, $1
              var_insn_mem(108)  := X"9d00000d";--and $13, #13, $0     get district number, store in $13
              
              var_insn_mem(109)  := X"1a000003";--lw $0, $10, 3       get 0b111, store in $0
              var_insn_mem(110)  := X"92000003";--and $3, $2, $0      get last three bits in D0, store in $3
              var_insn_mem(111)  := X"1a200019";--lw $2, $10, 25      get unchanged D1, store in $2
              var_insn_mem(112)  := X"1a000001";--lw $0, 10, 1        get 1, store in $0
              var_insn_mem(113)  := X"1a10006b";--lw $1, $10, 107     get 7, store in $1
              var_insn_mem(114)  := X"72100004";--lsr $4, $2, $1
              var_insn_mem(115)  := X"94000004";--and $4, $4, $0      get first bit in D1, store in $4
              var_insn_mem(116)  := X"63000003";--srl $3, $3, $0
              var_insn_mem(117)  := X"8340000E";--add $14, $3, $4     store candicate number in $14 
              
              var_insn_mem(118)  := X"1a000007";--lw $0, $10, 7
              var_insn_mem(119)  := X"92000000";--and $0, $2, $0
              var_insn_mem(120)  := X"1a10001a";--lw $1, $10, 26      D2 all bits, store in $1
              var_insn_mem(121)  := X"1a20001b";--lw $2, $10, 27      D3 all bits, store in $2
              var_insn_mem(122)  := X"1a300074";--lw $3, $10, 116     get 16, store in $3
              var_insn_mem(123)  := X"c0300000";--sr $0, $0, $3
              var_insn_mem(124)  := X"1a40006c";--lw $4, $10, 108
              var_insn_mem(125)  := X"c1400001";--sr $1, $1, $4
              var_insn_mem(126)  := X"8010000F";--add $15, $0, $1
              var_insn_mem(127)  := X"8F20000F";--add $15, $15, $2
              
              
              var_insn_mem(128)  := X"1F00000c";--lw $0, $10, 12
              var_insn_mem(129)  := X"B0E00004";--beq $0, $14, 4          if same candicate
              var_insn_mem(130)  := X"00000000";
              var_insn_mem(131)  := X"00000000";
              --var_insn_mem(132)  := X"00000000";
              
              var_insn_mem(132)  := X"B000000B";--beq $0, $0, 11          if not same candicate,
              var_insn_mem(133)  := X"00000000";
              var_insn_mem(134)  := X"00000000";
              var_insn_mem(135)  := X"1a00000D";--lw $0, $10, 13
              var_insn_mem(136)  := X"1a10000E";--lw $1, $10, 14
              var_insn_mem(137)  := X"81F00001";--add $1, $1, $15         update total votes
              var_insn_mem(138)  := X"3a10000E";--sw $1, $10, 14          set new total votes to data memory 14
              var_insn_mem(139)  := X"80100000";--add $0, $0, 1           add next position by 1
              var_insn_mem(140)  := X"30F00000";--sw $15, $0, 0           store votes for this district
              var_insn_mem(141)  := X"3a00000D";--sw $0, $10, 13          store next position back
              var_insn_mem(142)  := X"b000001e";--beq $0, $0, 30        to be changed
              var_insn_mem(143)  := X"00000000";
              var_insn_mem(144)  := X"00000000";
              var_insn_mem(145)  := X"1a00000d";--lw $0, $10, 13      get next position, store in $0
              var_insn_mem(145)  := X"1a10000e";--lw $1, $10, 14      get total votes for last candicate, store in $1
              var_insn_mem(147)  := X"80100000";--add $0, $0, 1       add position by 1
              var_insn_mem(148)  := X"30100000";--sw $1, $0, 0        store total count
              var_insn_mem(149)  := X"80100000";--add $0, $0, 1       add position by 1
              var_insn_mem(150)  := X"30E00000";--sw $14, $0, 0       store new candicate name
              var_insn_mem(151)  := X"3aE0000C";--sw $14, $10, 12     update curr candicate number
              var_insn_mem(152)  := X"3aF0000E";--sw $15, $10, 14
              var_insn_mem(153)  := X"3a00000D";--sw $0, $10, 13          store next position back
              -- Put mips code here
              i := 154;
              while i <= 1023 loop
                var_insn_mem(i) := X"00000000";
                i := i + 1;
            end loop;
       
       elsif (rising_edge(clk) and pc_write = '1') then
           -- read instructions on the rising clock edge
            
            if is_flush = '1' then
                insn_out <= x"00000000";
            else
                var_addr := conv_integer(addr_in);
                insn_out <= var_insn_mem(var_addr);
            end if;
        end if;

        -- the following are probe signals (for simulation purpose)
        sig_insn_mem <= var_insn_mem;

    end process;
  
end behavioral;
