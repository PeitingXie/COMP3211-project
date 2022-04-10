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
           mem_to_reg : out std_logic;
           alu_ctrl   : out std_logic_vector(1 downto 0) );
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
           ctrl      : in  std_logic_vector(1 downto 0);
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

component IF_ID_stage_registers is
    Port ( reset: in std_logic;
           clk:   in std_logic;
           input: in std_logic_vector(15 downto 0);
           output:out std_logic_vector(15 downto 0));
end component;

component ID_EX_stage_register is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           ID_mem_to_reg : in STD_LOGIC;
           ID_mem_write : in STD_LOGIC;
           ID_reg_write : in STD_LOGIC;
           ID_alu_ctrl : in STD_LOGIC_VECTOR(1 downto 0);
           ID_rs_data : in STD_LOGIC_VECTOR (15 downto 0);
           ID_mux_out : in STD_LOGIC_VECTOR (15 downto 0);
           ID_write_data : in STD_LOGIC_VECTOR (15 downto 0);
           ID_write_register : in STD_LOGIC_VECTOR (3 downto 0);
           ID_rs            :in STD_LOGIC_VECTOR(3 downto 0);
           ID_rt           : in STD_LOGIC_VECTOR(3 downto 0);
           EX_mem_to_reg : out STD_LOGIC;
           EX_mem_write : out STD_LOGIC;
           EX_reg_write : out STD_LOGIC;
           EX_alu_ctrl  : out STD_LOGIC_VECTOR(1 downto 0);
           EX_alu_src_a : out STD_LOGIC_VECTOR (15 downto 0);
           EX_alu_src_b : out STD_LOGIC_VECTOR (15 downto 0);
           EX_write_data : out STD_LOGIC_VECTOR (15 downto 0);
           EX_write_register : out STD_LOGIC_VECTOR (3 downto 0);
           EX_rs            : out STD_LOGIC_VECTOR(3 downto 0);
           EX_rt            : out STD_LOGIC_VECTOR(3 downto 0));
end component;

component EX_MEM_stage_registers is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           EX_mem_to_reg : in STD_LOGIC;
           EX_mem_write : in STD_LOGIC;
           EX_reg_write : in STD_LOGIC;
           EX_sum : in STD_LOGIC_VECTOR(15 downto 0);
           EX_write_data : in STD_LOGIC_VECTOR(15 downto 0);
           EX_write_register : in STD_LOGIC_VECTOR(3 downto 0);
           MEM_mem_to_reg : out STD_LOGIC;
           MEM_mem_write : out STD_LOGIC;
           MEM_reg_write : out STD_LOGIC;
           MEM_sum : out STD_LOGIC_VECTOR(15 downto 0);
           MEM_write_data : out STD_LOGIC_VECTOR(15 downto 0);
           MEM_write_register : out STD_LOGIC_VECTOR(3 downto 0));
end component;

component MEM_WB_stage_registers is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           MEM_reg_write : in STD_LOGIC;
           MEM_data_out : in STD_LOGIC_VECTOR(15 downto 0);
           MEM_write_register : in STD_LOGIC_VECTOR(3 downto 0);
           WB_reg_write : out STD_LOGIC;
           WB_data_out : out STD_LOGIC_VECTOR(15 downto 0);
           WB_write_register : out STD_LOGIC_VECTOR(3 downto 0));
end component;

component mux_3to1_16b is
    Port ( forward_ctrl : in STD_LOGIC_VECTOR(1 downto 0);
           data_a : in STD_LOGIC_VECTOR (15 downto 0);
           data_b : in STD_LOGIC_VECTOR (15 downto 0);
           data_c : in STD_LOGIC_VECTOR (15 downto 0);
           data_out : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component forwarding_handler is
    Port ( input_rs : in STD_LOGIC_VECTOR(3 downto 0);
           input_rt : in STD_LOGIC_VECTOR (3 downto 0);
           input_mem_rd : in STD_LOGIC_VECTOR (3 downto 0);
           input_wb_rd : in STD_LOGIC_VECTOR (3 downto 0);
           Mem_reg_write: in STD_LOGIC;
           WB_reg_write: in STD_LOGIC;
           forward_ctrl_rs : out STD_LOGIC_VECTOR (1 downto 0);
           forward_ctrl_rt : out STD_LOGIC_VECTOR(1 downto 0));
end component;

signal sig_next_pc              : std_logic_vector(3 downto 0);
signal sig_curr_pc              : std_logic_vector(3 downto 0);
signal sig_one_4b               : std_logic_vector(3 downto 0);
signal sig_pc_carry_out         : std_logic;
signal IF_sig_insn              : std_logic_vector(15 downto 0);
signal ID_sig_insn              : std_logic_vector(15 downto 0);
signal ID_sig_sign_extended_offset : std_logic_vector(15 downto 0);
signal ID_sig_reg_dst              : std_logic;
signal ID_sig_reg_write            : std_logic;
signal ID_sig_alu_ctrl             : std_logic_vector(1 downto 0);
signal EX_sig_alu_ctrl             : std_logic_vector(1 downto 0);
signal EX_sig_reg_write            : std_logic;
signal MEM_sig_reg_write            : std_logic;
signal WB_sig_reg_write            : std_logic;
signal ID_sig_alu_src              : std_logic;
signal ID_sig_mem_write            : std_logic;
signal EX_sig_mem_write            : std_logic;
signal MEM_sig_mem_write            : std_logic;
signal ID_sig_mem_to_reg           : std_logic;
signal EX_sig_mem_to_reg           : std_logic;
signal MEM_sig_mem_to_reg           : std_logic;
signal EX_forward_ctrl_rs          : std_logic_vector(1 downto 0);
signal EX_forward_ctrl_rt          : std_logic_vector(1 downto 0);
signal ID_sig_rs                   : std_logic_vector(3 downto 0);
signal EX_sig_rs                   : std_logic_vector(3 downto 0);
signal ID_sig_rt                   : std_logic_vector(3 downto 0);
signal EX_sig_rt                   : std_logic_vector(3 downto 0);
signal ID_sig_write_register       : std_logic_vector(3 downto 0);
signal EX_sig_write_register        : std_logic_vector(3 downto 0);
signal MEM_sig_write_register        : std_logic_vector(3 downto 0);
signal WB_sig_write_register        : std_logic_vector(3 downto 0);
signal MEM_sig_write_data           : std_logic_vector(15 downto 0);
signal WB_sig_write_data           : std_logic_vector(15 downto 0);
signal ID_sig_read_data_a          : std_logic_vector(15 downto 0);
signal EX_sig_read_data_a          : std_logic_vector(15 downto 0);
signal EX_sig_forward_read_data_a  : std_logic_vector(15 downto 0);
signal ID_sig_read_data_b          : std_logic_vector(15 downto 0);
signal EX_sig_read_data_b          : std_logic_vector(15 downto 0);
signal EX_sig_forward_read_data_b  : std_logic_vector(15 downto 0);
signal MEM_sig_read_data_b         : std_logic_vector(15 downto 0);
signal ID_sig_alu_src_b            : std_logic_vector(15 downto 0);
signal EX_sig_alu_src_b            : std_logic_vector(15 downto 0);
signal EX_sig_alu_result           : std_logic_vector(15 downto 0); 
signal MEM_sig_alu_result          : std_logic_vector(15 downto 0);
signal EX_sig_alu_carry_out        : std_logic;
signal MEM_sig_data_mem_out         : std_logic_vector(15 downto 0);
attribute dont_touch : string;
attribute dont_touch of sig_next_pc, sig_curr_pc, sig_one_4b, sig_pc_carry_out, IF_sig_insn, ID_sig_insn: signal is "true";
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
               insn_out => IF_sig_insn );
               
    -- insert IF/ID stage registers
    IF_ID_reg: IF_ID_stage_registers
    port map ( reset     => reset,
               clk       => clk,
               input     => IF_sig_insn,
               output    => ID_sig_insn);

    sign_extend : sign_extend_4to16 
    port map ( data_in  => ID_sig_insn(3 downto 0),
               data_out => ID_sig_sign_extended_offset );

    ctrl_unit : control_unit 
    port map ( opcode     => ID_sig_insn(15 downto 12),
               reg_dst    => ID_sig_reg_dst,
               reg_write  => ID_sig_reg_write,
               alu_src    => ID_sig_alu_src,
               mem_write  => ID_sig_mem_write,
               mem_to_reg => ID_sig_mem_to_reg,
               alu_ctrl   => ID_sig_alu_ctrl);

    mux_reg_dst : mux_2to1_4b 
    port map ( mux_select => ID_sig_reg_dst,
               data_a     => ID_sig_insn(7 downto 4),
               data_b     => ID_sig_insn(3 downto 0),
               data_out   => ID_sig_write_register );

    reg_file : register_file 
    port map ( reset           => reset, 
               clk             => clk,
               read_register_a => ID_sig_insn(11 downto 8),
               read_register_b => ID_sig_insn(7 downto 4),
               write_enable    => WB_sig_reg_write,
               write_register  => WB_sig_write_register,
               write_data      => WB_sig_write_data,
               read_data_a     => ID_sig_read_data_a,
               read_data_b     => ID_sig_read_data_b );
    
    mux_alu_src : mux_2to1_16b 
    port map ( mux_select => ID_sig_alu_src,
               data_a     => ID_sig_read_data_b,
               data_b     => ID_sig_sign_extended_offset,
               data_out   => ID_sig_alu_src_b );
               
    -- insert ID/EX stage registers
    ID_EX_reg: ID_EX_stage_register
    port map ( reset      => reset,
               clk        => clk,
               ID_mem_to_reg => ID_sig_mem_to_reg,
               ID_mem_write => ID_sig_mem_write,
               ID_reg_write => ID_sig_reg_write,
               ID_alu_ctrl => ID_sig_alu_ctrl,
               ID_rs_data         => ID_sig_read_data_a,
               ID_mux_out  => ID_sig_alu_src_b,
               ID_write_data => ID_sig_read_data_b,
               ID_write_register  => ID_sig_write_register,
               ID_rs            => ID_sig_rs,
               ID_rt            => ID_sig_rt,
               EX_mem_to_reg    => EX_sig_mem_to_reg,
               EX_mem_write     => EX_sig_mem_write,
               EX_reg_write     => EX_sig_reg_write,
               EX_alu_ctrl      => EX_sig_alu_ctrl,
               EX_alu_src_a  => EX_sig_read_data_a,
               EX_alu_src_b  => EX_sig_alu_src_b,
               EX_write_data => EX_sig_read_data_b,
               EX_write_register  => EX_sig_write_register,
               EX_rs          => EX_sig_rs,
               EX_rt          => EX_sig_rt );

    -- insert Mux to forwarding $rs
    mux_forwarding_rs: mux_3to1_16b
    port map( forward_ctrl      => EX_forward_ctrl_rs,
              data_a            => EX_sig_read_data_a,
              data_b            => WB_sig_write_data,
              data_c            => Mem_sig_alu_result,
              data_out          => EX_sig_forward_read_data_a);
              
    -- insert Mux to forwarding $rt
    mux_forwarding_rt: mux_3to1_16b
    port map( forward_ctrl      => EX_forward_ctrl_rt,
              data_a            => EX_sig_alu_src_b,
              data_b            => WB_sig_write_data,
              data_c            => Mem_sig_alu_result,
              data_out          => EX_sig_forward_read_data_b);
    
    -- forwarding unit
    forwarding_unit: forwarding_handler
    port map( input_rs          => EX_sig_rs,
              input_rt          => EX_sig_rt,
              input_mem_rd      => MEM_sig_write_register,
              input_wb_rd       => WB_sig_write_register,
              Mem_reg_write     => Mem_sig_reg_write,
              WB_reg_write      => WB_sig_reg_write,
              forward_ctrl_rs   => EX_forward_ctrl_rs,
              forward_ctrl_rt   => EX_forward_ctrl_rt);
    
    alu : adder_16b 
    port map ( src_a     => EX_sig_forward_read_data_a,
               src_b     => EX_sig_forward_read_data_b,
               ctrl      => EX_sig_alu_ctrl,
               sum       => EX_sig_alu_result,
               carry_out => EX_sig_alu_carry_out );
               
    --insert EX/MEM stage registers
    EX_MEM_reg: EX_MEM_stage_registers
    port map ( reset    => reset,
               clk      => clk,
               EX_mem_to_reg    => EX_sig_mem_to_reg,
               EX_mem_write     => EX_sig_mem_write,
               EX_reg_write     => EX_sig_reg_write,
               EX_sum   => EX_sig_alu_result,
               EX_write_data => EX_sig_read_data_b,
               EX_write_register  => EX_sig_write_register,
               MEM_mem_to_reg    => MEM_sig_mem_to_reg,
               MEM_mem_write     => MEM_sig_mem_write,
               MEM_reg_write     => MEM_sig_reg_write,
               MEM_sum  => MEM_sig_alu_result,
               MEM_write_data => MEM_sig_read_data_b,
               MEM_write_register  => MEM_sig_write_register );

    data_mem : data_memory 
    port map ( reset        => reset,
               clk          => clk,
               write_enable => MEM_sig_mem_write,
               write_data   => MEM_sig_read_data_b,
               addr_in      => MEM_sig_alu_result(3 downto 0),
               data_out     => MEM_sig_data_mem_out );
               
    mux_mem_to_reg : mux_2to1_16b 
    port map ( mux_select => MEM_sig_mem_to_reg,
               data_a     => MEM_sig_alu_result,
               data_b     => MEM_sig_data_mem_out,
               data_out   => MEM_sig_write_data );
   
    --insert MEM/WB stage registers
    MEM_WB_reg: MEM_WB_stage_registers
    port map ( reset        => reset,
               clk          => clk,
               MEM_reg_write    => MEM_sig_reg_write,
               MEM_data_out => MEM_sig_write_data,
               MEM_write_register  => MEM_sig_write_register,
               WB_reg_write    => WB_sig_reg_write,
               WB_data_out  => WB_sig_write_data,
               WB_write_register  => WB_sig_write_register);
               
               
   
end structural;
