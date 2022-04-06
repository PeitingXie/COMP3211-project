---------------------------------------------------------------------------
-- single_cycle_core.vhd - A Single-Cycle Processor Implementation
--
-- Notes : 
--
-- See single_cycle_core.pdf for the block diagram of this single
-- cycle processor core.
--
-- Instruction Set Architecture (ISA) for the single-cycle-core:
--   Each instruction is 16-bit wide, with four 4-bit fields.
--
--     noop      
--        # no operation or to signal end of program
--        # format:  | opcode = 0 |  0   |  0   |   0    | 
--
--     load  rt, rs, offset     
--        # load data at memory location (rs + offset) into rt
--        # format:  | opcode = 1 |  rs  |  rt  | offset |
--
--     store rt, rs, offset
--        # store data rt into memory location (rs + offset)
--        # format:  | opcode = 3 |  rs  |  rt  | offset |
--
--     add   rd, rs, rt
--        # rd <- rs + rt
--        # format:  | opcode = 8 |  rs  |  rt  |   rd   |
--
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

entity single_cycle_core is
    port ( reset  : in  std_logic;
           clk    : in  std_logic );
end single_cycle_core;

architecture structural of single_cycle_core is

component program_counter is
    port ( reset    : in  std_logic;
           clk      : in  std_logic;
           addr_in  : in  std_logic_vector(3 downto 0);
           addr_out : out std_logic_vector(3 downto 0) );
end component;

component instruction_memory is
    port ( reset    : in  std_logic;
           clk      : in  std_logic;
           addr_in  : in  std_logic_vector(3 downto 0);
           insn_out : out std_logic_vector(15 downto 0) );
end component;

component sign_extend_4to16 is
    port ( data_in  : in  std_logic_vector(3 downto 0);
           data_out : out std_logic_vector(15 downto 0) );
end component;

component mux_2to1_4b is
    port ( mux_select : in  std_logic;
           data_a     : in  std_logic_vector(3 downto 0);
           data_b     : in  std_logic_vector(3 downto 0);
           data_out   : out std_logic_vector(3 downto 0) );
end component;

component mux_2to1_16b is
    port ( mux_select : in  std_logic;
           data_a     : in  std_logic_vector(15 downto 0);
           data_b     : in  std_logic_vector(15 downto 0);
           data_out   : out std_logic_vector(15 downto 0) );
end component;

component control_unit is
    port ( opcode     : in  std_logic_vector(3 downto 0);
           reg_dst    : out std_logic;
           reg_write  : out std_logic;
           alu_src    : out std_logic;
           mem_write  : out std_logic;
           mem_to_reg : out std_logic );
end component;

component register_file is
    port ( reset           : in  std_logic;
           clk             : in  std_logic;
           read_register_a : in  std_logic_vector(3 downto 0);
           read_register_b : in  std_logic_vector(3 downto 0);
           write_enable    : in  std_logic;
           write_register  : in  std_logic_vector(3 downto 0);
           write_data      : in  std_logic_vector(15 downto 0);
           read_data_a     : out std_logic_vector(15 downto 0);
           read_data_b     : out std_logic_vector(15 downto 0) );
end component;

component adder_4b is
    port ( src_a     : in  std_logic_vector(3 downto 0);
           src_b     : in  std_logic_vector(3 downto 0);
           sum       : out std_logic_vector(3 downto 0);
           carry_out : out std_logic );
end component;

component adder_16b is
    port ( src_a     : in  std_logic_vector(15 downto 0);
           src_b     : in  std_logic_vector(15 downto 0);
           sum       : out std_logic_vector(15 downto 0);
           carry_out : out std_logic );
end component;

component data_memory is
    port ( reset        : in  std_logic;
           clk          : in  std_logic;
           write_enable : in  std_logic;
           write_data   : in  std_logic_vector(15 downto 0);
           addr_in      : in  std_logic_vector(3 downto 0);
           data_out     : out std_logic_vector(15 downto 0) );
end component;

signal sig_next_pc              : std_logic_vector(3 downto 0);
signal sig_curr_pc              : std_logic_vector(3 downto 0);
signal sig_one_4b               : std_logic_vector(3 downto 0);
signal sig_pc_carry_out         : std_logic;
signal sig_insn                 : std_logic_vector(15 downto 0);
signal sig_sign_extended_offset : std_logic_vector(15 downto 0);
signal sig_reg_dst              : std_logic;
signal sig_reg_write            : std_logic;
signal sig_alu_src              : std_logic;
signal sig_mem_write            : std_logic;
signal sig_mem_to_reg           : std_logic;
signal sig_write_register       : std_logic_vector(3 downto 0);
signal sig_write_data           : std_logic_vector(15 downto 0);
signal sig_read_data_a          : std_logic_vector(15 downto 0);
signal sig_read_data_b          : std_logic_vector(15 downto 0);
signal sig_alu_src_b            : std_logic_vector(15 downto 0);
signal sig_alu_result           : std_logic_vector(15 downto 0); 
signal sig_alu_carry_out        : std_logic;
signal sig_data_mem_out         : std_logic_vector(15 downto 0);

signal IF_sig_ins               : std_logic_vector(15 downto 0);
signal IF_ID_sReg               : std_logic_vector(15 downto 0);
--signal ID_sig_ins               : std_logic_vector(15 downto 0);

signal ID_memToReg              : std_logic;
signal ID_memWrite              : std_logic;
signal ID_AluSrc                : std_logic;
signal ID_regWrite              : std_logic;
signal ID_sig_read_data_a       : std_logic_vector(15 downto 0);
signal ID_sig_read_data_b       : std_logic_vector(15 downto 0);
signal ID_sig_imm               : std_logic_vector(15 downto 0);
signal ID_sig_write_register    : std_logic_vector(3 downto 0);

signal ID_rs_register           : std_logic_vector(3 downto 0);
signal ID_rt_register           : std_logic_vector(3 downto 0);

signal EX_sig_read_data_a       : std_logic_vector(15 downto 0);
signal EX_sig_read_data_b       : std_logic_vector(15 downto 0);

signal MEM_memToReg             : std_logic;
signal MEM_memWrite             : std_logic;
signal MEM_sig_alu_result       : std_logic_vector( 15 downto 0);
signal MEM_sig_read_data_b      : std_logic_vector(15 downto 0);
signal MEM_regWrite             : std_logic;
signal MEM_sig_write_register   : std_logic_vector(3 downto 0);

signal WB_regWrite              : std_logic;
signal WB_sig_write_data        : std_logic_vector(15 downto 0);
signal WB_sig_write_register    : std_logic_vector(3 downto 0);

signal data_forwarding_mux_a    : std_logic_vector(1 downto 0);
signal data_forwarding_mux_b    : std_logic_vector(1 downto 0);

attribute dont_touch : string;
attribute dont_touch of sig_curr_pc, IF_ID_sReg, ID_sig_read_data_a, data_forwarding_mux_a, WB_sig_write_register,WB_regWrite, MEM_sig_alu_result: signal is "true";
begin

    sig_one_4b <= "0001";

    pc : program_counter
    port map ( reset    => reset,
               clk      => clk,
               addr_in  => sig_next_pc,
               addr_out => sig_curr_pc ); 

    next_pc : adder_4b 
    port map ( src_a     => sig_curr_pc, 
               src_b     => sig_one_4b,
               sum       => sig_next_pc,   
               carry_out => sig_pc_carry_out );
    
    insn_mem : instruction_memory 
    port map ( reset    => reset,
               clk      => clk,
               addr_in  => sig_curr_pc,
               insn_out => IF_sig_ins);
    
    ID_IF_stage_register : process(clk, IF_sig_ins, reset)
    begin
        if (reset = '1') then
            IF_ID_sReg <= x"0000";
        elsif (rising_edge(clk)) then
            IF_ID_sReg <= IF_sig_ins;
        end if;
    end process;
    
    --ID_sig_ins <= IF_ID_sReg;
    
    
    sign_extend : sign_extend_4to16 
    port map ( data_in  => IF_ID_sReg(3 downto 0),
               data_out => sig_sign_extended_offset );

    ctrl_unit : control_unit 
    port map ( opcode     => IF_ID_sReg(15 downto 12),
               reg_dst    => sig_reg_dst,
               reg_write  => sig_reg_write,
               alu_src    => sig_alu_src,
               mem_write  => sig_mem_write,
               mem_to_reg => sig_mem_to_reg );

    ID_stage_register : process(clk, reset, sig_reg_write, sig_alu_src, sig_mem_write, sig_mem_to_reg, sig_read_data_a, sig_read_data_b, sig_sign_extended_offset, sig_write_register, IF_ID_sReg)
    begin
        if (reset = '1') then 
            ID_regWrite <= '0';
            ID_memToReg <= '0';
            ID_memWrite <= '0';
            ID_aluSrc <= '0';
            ID_sig_read_data_a <= x"0000";
            ID_sig_read_data_b <= x"0000";
            ID_sig_imm <= x"0000";
            ID_sig_write_register <= "0000";
            ID_rs_register <= "0000";
            ID_rt_register <= "0000";
        elsif (rising_edge(clk)) then
            ID_regWrite <= sig_reg_write;
            ID_memToReg <= sig_mem_to_reg;
            ID_memWrite <= sig_mem_write;
            ID_aluSrc <= sig_alu_src;  
            ID_sig_read_data_a <= sig_read_data_a;
            ID_sig_read_data_b <= sig_read_data_b;
            ID_sig_imm <= sig_sign_extended_offset;
            ID_sig_write_register <= sig_write_register;
            ID_rs_register <= IF_ID_sReg(11 downto 8);
            ID_rt_register <= IF_ID_sReg(7 downto 4);
        end if;
    end process;

    mem_stage_register : process(clk, reset, ID_memWrite, ID_memToReg, sig_alu_result, ID_sig_read_data_b, ID_regWrite, ID_sig_write_register)
    begin
        if (reset = '1') then  
            MEM_memWrite <= '0';
            MEM_memToReg <= '0';
            MEM_sig_alu_result <= x"0000";
            MEM_sig_read_data_b <= x"0000";
            MEM_regWrite <= '0';
            MEM_sig_write_register <= "0000";
        elsif (rising_edge(clk)) then
            MEM_memWrite <= ID_memWrite;
            MEM_memToReg <= ID_memToReg;
            MEM_sig_alu_result <= sig_alu_result;
            MEM_sig_read_data_b <= ID_sig_read_data_b;
            MEM_regWrite <= ID_regWrite;
            MEM_sig_write_register <= ID_sig_write_register;
        end if;
    end process;
            
            
    WB_stage_register : process(clk, reset, MEM_regWrite, sig_write_data, MEM_sig_write_register)
    begin
        if (reset = '1') then
            WB_regWrite <= '0';
            WB_sig_write_data <= x"0000";
            WB_sig_write_register <= "0000";
        elsif (rising_edge(clk)) then
            WB_regWrite <= MEM_regWrite;
            WB_sig_write_data <= sig_write_data;
            WB_sig_write_register <= MEM_sig_write_register;
        end if;
    end process;        
    
    
    forwarding_mux_a : process(data_forwarding_mux_a, MEM_sig_alu_result, WB_sig_write_data, ID_sig_read_data_a)
    begin  
        case data_forwarding_mux_a is
        when "00" =>
            EX_sig_read_data_a <= ID_sig_read_data_a;
        when "01" =>
            EX_sig_read_data_a <= MEM_sig_alu_result;
        when "10" =>
            EX_sig_read_data_a <= WB_sig_write_data;
        when others =>
            EX_sig_read_data_a <= x"0000";
        end case;
    end process; 
    forwarding_mux_b : process(data_forwarding_mux_b, MEM_sig_alu_result, WB_sig_write_data, sig_alu_src_b)
    begin  
        case data_forwarding_mux_a is
        when "00" =>
            EX_sig_read_data_b <= sig_alu_src_b;
        when "01" =>
            EX_sig_read_data_b <= MEM_sig_alu_result;
        when "10" =>
            EX_sig_read_data_b <= WB_sig_write_data;
        when others =>
            EX_sig_read_data_b <= x"0000";
        end case;
    end process;             
    
    forwarding_unit : process(MEM_regWrite , MEM_sig_write_register, ID_rs_register, ID_rt_register, WB_regWrite, WB_sig_write_register)
    begin
        if (MEM_regWrite = '1' and MEM_sig_write_register /= 0 and MEM_sig_write_register = ID_rs_register) then
            data_forwarding_mux_a <= "01";
        elsif (WB_regWrite = '1' and WB_sig_write_register /= 0 and WB_sig_write_register = ID_rs_register and (MEM_regWrite = '0' or MEM_sig_write_register /= ID_rs_register)) then
            data_forwarding_mux_a <= "10";
        else
            data_forwarding_mux_a <= "00";
        end if;
        
        if (MEM_regWrite = '1' and MEM_sig_write_register /= 0 and MEM_sig_write_register = ID_rt_register) then
            data_forwarding_mux_b <= "01";
        elsif (WB_regWrite = '1' and WB_sig_write_register /= 0 and WB_sig_write_register = ID_rt_register and (MEM_regWrite = '0' or MEM_sig_write_register /= ID_rt_register)) then
            data_forwarding_mux_b <= "10";
        else
            data_forwarding_mux_b <= "00";
        end if;
    end process;
    
    mux_reg_dst : mux_2to1_4b 
    port map ( mux_select => sig_reg_dst,
               data_a     => IF_ID_sReg(7 downto 4),
               data_b     => IF_ID_sReg(3 downto 0),
               data_out   => sig_write_register );

    reg_file : register_file 
    port map ( reset           => reset, 
               clk             => clk,
               read_register_a => IF_ID_sReg(11 downto 8),
               read_register_b => IF_ID_sReg(7 downto 4),
               write_enable    => WB_regWrite,
               write_register  => WB_sig_write_register,
               write_data      => WB_sig_write_data,
               read_data_a     => sig_read_data_a,
               read_data_b     => sig_read_data_b );
    
    mux_alu_src : mux_2to1_16b 
    port map ( mux_select => ID_aluSrc,
               data_a     => ID_sig_read_data_b,
               data_b     => ID_sig_imm,
               data_out   => sig_alu_src_b );

    alu : adder_16b 
    port map ( src_a     => EX_sig_read_data_a,
               src_b     => EX_sig_read_data_b,
               sum       => sig_alu_result,
               carry_out => sig_alu_carry_out );

    data_mem : data_memory 
    port map ( reset        => reset,
               clk          => clk,
               write_enable => MEM_memWrite,
               write_data   => MEM_sig_read_data_b,
               addr_in      => MEM_sig_alu_result(3 downto 0),
               data_out     => sig_data_mem_out );
               
    mux_mem_to_reg : mux_2to1_16b 
    port map ( mux_select => MEM_memToReg,
               data_a     => MEM_sig_alu_result,
               data_b     => sig_data_mem_out,
               data_out   => sig_write_data );

end structural;
