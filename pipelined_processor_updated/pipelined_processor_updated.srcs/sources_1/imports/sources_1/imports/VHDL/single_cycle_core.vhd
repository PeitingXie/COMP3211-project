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
           clk    : in  std_logic;
           send   : in  std_logic;
           D0     : in std_logic_vector(7 downto 0);
           D1     : in std_logic_vector(7 downto 0);
           D2     : in std_logic_vector(7 downto 0);
           D3     : in std_logic_vector(7 downto 0);
           tag    : in std_logic_vector(7 downto 0);
           busy   : out std_logic
);
end single_cycle_core;

architecture structural of single_cycle_core is

component program_counter is
    port ( reset    : in  std_logic;
           clk      : in  std_logic;
           send   : in  std_logic;
           pc_write : in  std_logic;
           addr_in  : in  std_logic_vector(9 downto 0);
           addr_out : out std_logic_vector(9 downto 0);
           busy     : out std_logic );
end component;

component instruction_memory is
    port ( reset    : in  std_logic;
           clk      : in  std_logic;
           addr_in  : in  std_logic_vector(9 downto 0);
           pc_write : in std_logic;
           insn_out : out std_logic_vector(31 downto 0));
end component;

component sign_extend_20to32 is
    port ( data_in  : in  std_logic_vector(19 downto 0);
           data_out : out std_logic_vector(31 downto 0) );
end component;

component mux_2to1_1b is
    Port ( mux_select : in STD_LOGIC;
           data_a : in STD_LOGIC;
           data_b : in STD_LOGIC;
           data_out : out STD_LOGIC);
end component;

component mux_2to1_4b is
    port ( mux_select : in  std_logic;
           data_a     : in  std_logic_vector(3 downto 0);
           data_b     : in  std_logic_vector(3 downto 0);
           data_out   : out std_logic_vector(3 downto 0) );
end component;

component mux_2to1_10b is
    port ( mux_select : in  std_logic;
           data_a     : in  std_logic_vector(9 downto 0);
           data_b     : in  std_logic_vector(9 downto 0);
           data_out   : out std_logic_vector(9 downto 0) );
end component;

component mux_2to1_32b is
    port ( mux_select : in  std_logic;
           data_a     : in  std_logic_vector(31 downto 0);
           data_b     : in  std_logic_vector(31 downto 0);
           data_out   : out std_logic_vector(31 downto 0) );
end component;

component mux_4to1_32b is
    Port ( mux_select : in  std_logic_vector(1 downto 0);
           data_a     : in  std_logic_vector(31 downto 0);
           data_b     : in  std_logic_vector(31 downto 0);
           data_c     : in  std_logic_vector(31 downto 0);
           data_d     : in  std_logic_vector(31 downto 0);
           data_out   : out std_logic_vector(31 downto 0) );
end component;

component control_unit is
    port ( opcode     : in  std_logic_vector(3 downto 0);
           branch_ctrl: in std_logic;
           reg_dst    : out std_logic;
           reg_write  : out std_logic;
           alu_src    : out std_logic;
           mem_write  : out std_logic;
           mem_to_reg : out std_logic_vector(1 downto 0);
           read_byte  : out std_logic;
           alu_ctr    : out std_logic_vector(2 downto 0);
           if_flush   : out std_logic;
           mem_read   : out std_logic;
           beq        : out std_logic;
           ctrl_beq_op: out std_logic);
end component;

component register_file is
    port ( reset           : in  std_logic;
           clk             : in  std_logic;
           send            : in std_logic;
           D0              : in std_logic_vector(7 downto 0);
           D1              : in std_logic_vector(7 downto 0);
           D2              : in std_logic_vector(7 downto 0);
           D3              : in std_logic_vector(7 downto 0);
           tag             : in std_logic_vector(7 downto 0);
           read_register_a : in  std_logic_vector(3 downto 0);
           read_register_b : in  std_logic_vector(3 downto 0);
           write_enable    : in  std_logic;
           write_register  : in  std_logic_vector(3 downto 0);
           write_data      : in  std_logic_vector(31 downto 0);
           read_data_a     : out std_logic_vector(31 downto 0);
           read_data_b     : out std_logic_vector(31 downto 0) );
end component;

component xor_com is
    Port ( data_a : in STD_LOGIC_VECTOR (31 downto 0);
           data_b : in STD_LOGIC_VECTOR (31 downto 0);
           ctrl : out STD_LOGIC);
end component;

component forwarding_branch is
    Port ( if_id_regs : in STD_LOGIC_VECTOR (3 downto 0);
           if_id_regt : in STD_LOGIC_VECTOR (3 downto 0);
           ex_mem_regd : in STD_LOGIC_VECTOR (3 downto 0);
           ex_mem_regWrite : in STD_LOGIC;
           forwarding_br_ctrls : out STD_LOGIC;
           forwarding_br_ctrlt : out STD_LOGIC);
end component;

component adder_4b is
    port ( src_a     : in  std_logic_vector(3 downto 0);
           src_b     : in  std_logic_vector(3 downto 0);
           sum       : out std_logic_vector(3 downto 0);
           carry_out : out std_logic );
end component;

component adder_10b is
    port ( src_a     : in  std_logic_vector(9 downto 0);
           src_b     : in  std_logic_vector(9 downto 0);
           sum       : out std_logic_vector(9 downto 0);
           carry_out : out std_logic );
end component;

component adder_20b is
    port ( src_a     : in  std_logic_vector(19 downto 0);
           src_b     : in  std_logic_vector(19 downto 0);
           sum       : out std_logic_vector(9 downto 0);
           carry_out : out std_logic );
end component;

component adder_32b is
    port ( src_a     : in  std_logic_vector(31 downto 0);
           src_b     : in  std_logic_vector(31 downto 0);
           alu_ctr   : in  std_logic_vector(2 downto 0);
           sum       : out std_logic_vector(31 downto 0);
           carry_out : out std_logic; 
           load_msb  : out std_logic);
end component;

component data_memory is
    port ( reset        : in  std_logic;
           clk          : in  std_logic;
           write_enable : in  std_logic;
           write_data   : in  std_logic_vector(31 downto 0);
           addr_in      : in  std_logic_vector(9 downto 0);
           data_out     : out std_logic_vector(31 downto 0) );
end component;

component slt_result_calc is
    port ( msb : in std_logic;
           slt_result : out std_logic_vector(31 downto 0));
end component;

component rotate_right_shifter_32b is
    Port ( src_a : in STD_LOGIC_VECTOR (31 downto 0);
           result : out STD_LOGIC_VECTOR (31 downto 0);
           rotations : in STD_LOGIC_VECTOR (3 downto 0));
end component;

component load_byte_unit is
    Port (
            data_in      : in std_logic_vector(31 downto 0);
            read_byte    : in std_logic;
            load_msb     : in std_logic;
            data_to_extend     : out std_logic_vector(15 downto 0));
end component;

component mux_data_to_mem_to_reg is
    Port ( 
        word_data : in std_logic_vector(31 downto 0);
        byte_data : in std_logic_vector(31 downto 0);
        read_byte : in std_logic;
        data_out : out std_logic_vector(31 downto 0)
  );
end component;

component sign_extend_16to32 is
    Port ( data_in  : in  std_logic_vector(15 downto 0);
           data_out : out std_logic_vector(31 downto 0) );
end component;

-- pipeline stages --
component if_id_pipeline_stage is
  Port ( clk : in std_logic;
         reset : in std_logic;
         if_flush : in std_logic;
         ifid_write: in std_logic;
         if_curr_pc: in std_logic_vector(9 downto 0);
         ifid_instr_in : in std_logic_vector(31 downto 0);
         id_curr_pc: out std_logic_vector(9 downto 0);
         ifid_instr_out : out std_logic_vector(31 downto 0));
end component;



component id_ex_pipeline_stage is
  Port ( reset : in std_logic;
         clk : in std_logic;
         read_data_a_in : in std_logic_vector(31 downto 0);
         read_data_a_out : out std_logic_vector(31 downto 0);
         read_data_b_in : in std_logic_vector(31 downto 0);
         read_data_b_out : out std_logic_vector(31 downto 0);
         immed_in : in std_logic_vector(31 downto 0);
         immed_out : out std_logic_vector(31 downto 0);
         reg_write_in, read_byte_in, alu_src_in, mem_to_write_in, reg_dst_in : in std_logic;
         reg_write_out, read_byte_out, alu_src_out, mem_to_write_out, reg_dst_out : out std_logic;
         alu_ctr_in  : in std_logic_vector(2 downto 0);
         mem_to_reg_in : in std_logic_vector(1 downto 0);
         alu_ctr_out : out std_logic_vector(2 downto 0);
         mem_to_reg_out : out std_logic_vector(1 downto 0);
         insn_in : in std_logic_vector(31 downto 0);
         insn_out : out std_logic_vector(31 downto 0);
         forwarded_write_register_in : in std_logic_vector(3 downto 0);
         forwarded_write_register_out : out std_logic_vector(3 downto 0);
         mem_read_in : in std_logic;
         mem_read_out: out std_logic;
         ctrl_beq_op_in : in std_logic;
         ctrl_beq_op_out : out std_logic);

end component;

component ex_mem_pipeline_stage is
  Port ( reset : in std_logic;
         clk : in std_logic;
         alu_result_in : in std_logic_vector (31 downto 0);
         read_data_b_in : in std_logic_vector(31 downto 0);
         read_data_a_in : in std_logic_vector(31 downto 0);
         carry_in, lmsb_in : in std_logic;
         alu_result_out : out std_logic_vector (31 downto 0);
         read_data_b_out : out std_logic_vector(31 downto 0);
         read_data_a_out : out std_logic_vector(31 downto 0);
         carry_out, lmsb_out : out std_logic;
         
         -- ctr signals --
         reg_write_in, read_byte_in, mem_write_in, reg_dst_in : in std_logic;
         reg_write_out, read_byte_out, mem_write_out, reg_dst_out : out std_logic;
         mem_to_reg_in : in std_logic_vector(1 downto 0);
         mem_to_reg_out : out std_logic_vector(1 downto 0);
         insn_in : in std_logic_vector(31 downto 0);
         insn_out : out std_logic_vector(31 downto 0);
         forwarded_write_register_in : in std_logic_vector(3 downto 0);
         forwarded_write_register_out : out std_logic_vector(3 downto 0) );
                  
end component;

component mem_wb_pipeline_stage is
  Port ( reset : in std_logic;
         clk : in std_logic;
         read_data_in : in std_logic_vector (31 downto 0);
         slt_data_in : in std_logic_vector (31 downto 0);
         srr_data_in : in std_logic_vector (31 downto 0);
         alu_result_in : in std_logic_vector (31 downto 0);
         read_data_out : out std_logic_vector (31 downto 0);
         slt_data_out : out std_logic_vector (31 downto 0);
         srr_data_out : out std_logic_vector (31 downto 0);
         alu_result_out : out std_logic_vector (31 downto 0);
         
         -- ctr signals --
         reg_write_in, reg_dst_in : in std_logic;
         reg_write_out, reg_dst_out : out std_logic;
         mem_to_reg_in : in std_logic_vector(1 downto  0);
         mem_to_reg_out : out std_logic_vector(1 downto 0);
         insn_in : in std_logic_vector(31 downto 0);
         insn_out : out std_logic_vector(31 downto 0);
         forwarded_write_register_in : in std_logic_vector(3 downto 0);
         forwarded_write_register_out : out std_logic_vector(3 downto 0));
         
end component;


component hazard_detection_unit is
    Port (  ifid_reg_a : in std_logic_vector(3 downto 0);
            ifid_reg_b : in std_logic_vector(3 downto 0);
            idex_reg_b : in std_logic_vector(3 downto 0);
            idex_reg_d : in std_logic_vector(3 downto 0);
            idex_op  : in std_logic;
            ifid_beq   : in std_logic;
            idex_mem_read : in std_logic;
            ctr_sig_sel : out std_logic;
            ifid_write : out std_logic;
            pc_write : out std_logic
             );
end component;

component mux_ctr_unit
    Port ( ctr_sig_sel : in std_logic;
        mem_write_in : in std_logic;
        mem_write_out : out std_logic;
        reg_write_in : in std_logic;
        reg_write_out : out std_logic;
        alu_ctr_in : in std_logic_vector(2 downto 0);
        alu_ctr_out : out std_logic_vector(2 downto 0) );
end component;

-- forwarding unit --
component forwarding_unit is
  Port ( exmem_reg_write : in std_logic;
         exmem_reg_dst_addr : in std_logic_vector(3 downto 0);
         idex_reg_a_addr : in std_logic_vector(3 downto 0);
         idex_reg_b_addr : in std_logic_vector(3 downto 0);
         memwb_reg_write : in std_logic;
         memwb_reg_dst_addr : in std_logic_vector(3 downto 0);
         aluSrc_a_sel : out std_logic_vector(1 downto 0);
         aluSrc_b_sel : out std_logic_vector(1 downto 0)
         );
end component;

signal sig_next_pc              : std_logic_vector(9 downto 0);
signal sig_curr_pc              : std_logic_vector(9 downto 0);
signal sig_one_10b               : std_logic_vector(9 downto 0);
signal sig_pc_carry_out         : std_logic;
signal sig_insn                 : std_logic_vector(31 downto 0);
signal sig_sign_extended_offset : std_logic_vector(31 downto 0);
signal sig_reg_dst              : std_logic;
signal sig_reg_write            : std_logic;
signal sig_alu_src              : std_logic;
signal sig_mem_write            : std_logic;
signal sig_mem_to_reg           : std_logic_vector(1 downto 0);
signal sig_write_register       : std_logic_vector(3 downto 0);
signal sig_write_data           : std_logic_vector(31 downto 0);
signal sig_read_data_a          : std_logic_vector(31 downto 0);
signal sig_read_data_b          : std_logic_vector(31 downto 0);
signal sig_alu_src_b            : std_logic_vector(31 downto 0);
signal sig_alu_result           : std_logic_vector(31 downto 0); 
signal sig_alu_carry_out        : std_logic;
signal sig_data_mem_out         : std_logic_vector(31 downto 0);
signal sig_read_byte            : std_logic;
signal sig_load_msb             : std_logic;
signal sig_alu_ctr              : std_logic_vector(2 downto 0);
signal sig_slt_result           : std_logic_vector(31 downto 0); 
signal sig_srr_result           : std_logic_vector(31 downto 0); 
signal sig_byte_data            : std_logic_vector(31 downto 0);
signal sig_data_out             : std_logic_vector(31 downto 0);
signal sig_data_to_extend       : std_logic_vector(15 downto 0);

-- branch signals --
signal sig_if_flush             : std_logic;
signal sig_xor_com              : std_logic;
signal sig_id_curr_pc           : std_logic_vector(9 downto 0);
signal sig_branch_addr          : std_logic_vector(9 downto 0);
signal sig_branch_carry_out     : std_logic;
signal sig_next_pc_branch       : std_logic_vector(9 downto 0);

-- branch forwarding signals --
signal sig_forwarding_br_ctrls  : std_logic;
signal sig_forwarding_br_ctrlt  : std_logic;
signal sig_forwarded_br_read_data_a: std_logic_vector(31 downto 0);
signal sig_forwarded_br_read_data_b: std_logic_vector(31 downto 0);
signal sig_extended_id_curr_pc: std_logic_vector(19 downto 0);

-- stalling branch --
signal sig_ifid_beq: std_logic;
signal sig_ifid_ctrl_beq_op: std_logic;
signal sig_idex_ctrl_beq_op: std_logic;


-- pipeline signals --
signal sig_ifid_insn            : std_logic_vector(31 downto 0);

signal sig_idex_read_data_a     : std_logic_vector(31 downto 0);
signal sig_idex_read_data_b     : std_logic_vector(31 downto 0);
signal sig_idex_immed           : std_logic_vector(31 downto 0);
signal sig_idex_reg_write       : std_logic;
signal sig_idex_alu_ctr         : std_logic_vector(2 downto 0);
signal sig_idex_read_byte       : std_logic;
signal sig_idex_mem_to_reg      : std_logic_vector(1 downto 0);
signal sig_idex_alu_src         : std_logic;
signal sig_idex_mem_write       : std_logic;
signal sig_idex_reg_dst         : std_logic;
signal sig_idex_insn            : std_logic_vector(31 downto 0);

signal sig_exmem_alu_result     : std_logic_vector(31 downto 0);
signal sig_exmem_read_data_b    : std_logic_vector(31 downto 0);
signal sig_exmem_read_data_a    : std_logic_vector(31 downto 0);
signal sig_exmem_carry          : std_logic;
signal sig_exmem_lmsb           : std_logic;
signal sig_exmem_reg_write      : std_logic;
signal sig_exmem_read_byte      : std_logic;
signal sig_exmem_mem_write      : std_logic;
signal sig_exmem_mem_to_reg     : std_logic_vector(1 downto 0);
signal sig_exmem_reg_dst        : std_logic;
signal sig_exmem_insn           : std_logic_vector(31 downto 0);

signal sig_memwb_alu_result     : std_logic_vector(31 downto 0);
signal sig_memwb_read_data      : std_logic_vector(31 downto 0);
signal sig_memwb_slt_data       : std_logic_vector(31 downto 0);
signal sig_memwb_srr_data       : std_logic_vector(31 downto 0);
signal sig_memwb_reg_write      : std_logic;
signal sig_memwb_mem_to_reg     : std_logic_vector(1 downto 0);
signal sig_memwb_reg_dst        : std_logic;
signal sig_memwb_insn           : std_logic_vector(31 downto 0);

-- forwarding signals --
signal sig_forwarded_write_register : std_logic_vector(3 downto 0);
signal sig_idex_forwarded_write_register : std_logic_vector(3 downto 0);
signal sig_exmem_forwarded_write_register : std_logic_vector(3 downto 0);
signal sig_memwb_forwarded_write_register : std_logic_vector(3 downto 0);
signal sig_alu_src_a_forward_sel : std_logic_vector(1 downto 0);
signal sig_alu_src_b_forward_sel : std_logic_vector(1 downto 0);
signal sig_alu_b_src_b : std_logic_vector(31 downto 0);
signal sig_alu_src_a : std_logic_vector(31 downto 0);

-- stalling signals--
signal sig_pc_write: std_logic;
signal sig_ifid_write: std_logic;
signal sig_mem_read: std_logic; 
signal sig_idex_mem_read: std_logic;
signal sig_ctr_sig_sel: std_logic;
signal sig_mux_ctr_mem_write: std_logic; 
signal sig_mux_ctr_reg_write: std_logic;
signal sig_mux_ctr_alu_ctr: std_logic_vector(2 downto 0);


begin

    sig_one_10b <= "0000000001";

    pc : program_counter
    port map ( reset    => reset,
               clk      => clk,
               send     => send,
               pc_write => sig_pc_write,
               addr_in  => sig_next_pc_branch,
               addr_out => sig_curr_pc,
                busy    => busy ); 

    next_pc : adder_10b 
    port map ( src_a     => sig_curr_pc, 
               src_b     => sig_one_10b,
               sum       => sig_next_pc,   
               carry_out => sig_pc_carry_out );
               
    branch_mux: mux_2to1_10b
    port map(mux_select => sig_if_flush,
             data_a => sig_next_pc,
             data_b => sig_branch_addr,
             data_out => sig_next_pc_branch);
    
    insn_mem : instruction_memory 
    port map ( reset    => reset,
               clk      => clk,
               addr_in  => sig_curr_pc,
               pc_write => sig_pc_write,
               insn_out => sig_insn);

    sign_extend : sign_extend_20to32 
    port map ( data_in  => sig_ifid_insn(19 downto 0),
               data_out => sig_sign_extended_offset );

    ctrl_unit : control_unit 
    port map ( opcode     => sig_ifid_insn(31 downto 28),
               branch_ctrl => sig_xor_com,
               reg_dst    => sig_reg_dst,
               reg_write  => sig_reg_write,
               alu_src    => sig_alu_src,
               mem_write  => sig_mem_write,
               mem_to_reg => sig_mem_to_reg,
               read_byte  => sig_read_byte,
               alu_ctr    => sig_alu_ctr,
               if_flush   => sig_if_flush,
               mem_read   => sig_mem_read,
               beq        => sig_ifid_beq,
               ctrl_beq_op => sig_ifid_ctrl_beq_op );
               
    mux_ctr : mux_ctr_unit
        port map( ctr_sig_sel => sig_ctr_sig_sel,
                mem_write_in => sig_mem_write,
                mem_write_out => sig_mux_ctr_mem_write,
                reg_write_in => sig_reg_write,
                reg_write_out => sig_mux_ctr_reg_write,
                alu_ctr_in => sig_alu_ctr,
                alu_ctr_out => sig_mux_ctr_alu_ctr );

    mux_reg_dst : mux_2to1_4b 
    port map ( mux_select => sig_memwb_reg_dst,
               data_a     => sig_memwb_insn(23 downto 20),
               data_b     => sig_memwb_insn(3 downto 0),
               data_out   => sig_write_register );
    
    mux_forward_reg_dst : mux_2to1_4b
    port map ( mux_select => sig_reg_dst,
               data_a => sig_ifid_insn(23 downto 20),
               data_b => sig_ifid_insn(3 downto 0),
               data_out => sig_forwarded_write_register );

    reg_file : register_file 
    port map ( reset           => reset, 
               clk             => clk,
               send            => send,
               D0              => D0,
               D1              => D1,
               D2              => D2,
               D3              => D3,
               tag             => tag,
               read_register_a => sig_ifid_insn(27 downto 24),
               read_register_b => sig_ifid_insn(23 downto 20),
               write_enable    => sig_memwb_reg_write,
               write_register  => sig_write_register,
               write_data      => sig_write_data,
               read_data_a     => sig_read_data_a,
               read_data_b     => sig_read_data_b );

    xor_unit : xor_com
    port map ( data_a    => sig_forwarded_br_read_data_a,
               data_b    => sig_forwarded_br_read_data_b,
               ctrl      => sig_xor_com);

    forwarding_br_unit: forwarding_branch 
    port map ( if_id_regs => sig_ifid_insn(27 downto 24),
           if_id_regt => sig_ifid_insn(23 downto 20),
           ex_mem_regd => sig_exmem_forwarded_write_register,
           ex_mem_regWrite => sig_exmem_reg_write,
           forwarding_br_ctrls => sig_forwarding_br_ctrls,
           forwarding_br_ctrlt => sig_forwarding_br_ctrlt);
    
    forward_br_rs_mux: mux_2to1_32b
    port map ( mux_select => sig_forwarding_br_ctrls,
               data_a     => sig_read_data_a,
               data_b     => sig_exmem_alu_result,
               data_out   => sig_forwarded_br_read_data_a);
    
    forward_br_rt_mux: mux_2to1_32b
    port map ( mux_select => sig_forwarding_br_ctrlt,
               data_a     => sig_read_data_b,
               data_b     => sig_exmem_alu_result,
               data_out   => sig_forwarded_br_read_data_b);

    sig_extended_id_curr_pc <= "0000000000" & sig_id_curr_pc;
    branch_adder: adder_20b
    port map( src_a => sig_extended_id_curr_pc,
              src_b => sig_ifid_insn(19 downto 0),
              sum => sig_branch_addr,
              carry_out => sig_branch_carry_out);
    
    mux_alu_src_b : mux_2to1_32b 
    port map ( mux_select => sig_idex_alu_src,
               data_a     => sig_alu_b_src_b,
               data_b     => sig_idex_immed,
               data_out   => sig_alu_src_b );
    
    mux_alu_src_a : mux_4to1_32b
    port map ( mux_select => sig_alu_src_a_forward_sel,
               data_a     => sig_idex_read_data_a,
               data_b     => sig_write_data,
               data_c     => sig_exmem_alu_result,
               data_d     => sig_idex_read_data_a,
               data_out   => sig_alu_src_a );
    
    mux_alu_b_src_b : mux_4to1_32b
    port map ( mux_select => sig_alu_src_b_forward_sel,
               data_a     => sig_idex_read_data_b,
               data_b     => sig_write_data,
               data_c     => sig_exmem_alu_result,
               data_d     => sig_idex_read_data_b,
               data_out   => sig_alu_b_src_b );
    
    alu : adder_32b 
    port map ( src_a     => sig_alu_src_a,
               src_b     => sig_alu_src_b,
               alu_ctr   => sig_idex_alu_ctr,
               sum       => sig_alu_result,
               carry_out => sig_alu_carry_out,
               load_msb  => sig_load_msb );

    data_mem : data_memory 
    port map ( reset        => reset,
               clk          => clk,
               write_enable => sig_exmem_mem_write,
               write_data   => sig_exmem_read_data_b,
               addr_in      => sig_exmem_alu_result(9 downto 0),
               data_out     => sig_data_mem_out );
               
    mux_mem_to_reg : mux_4to1_32b 
    port map ( mux_select => sig_memwb_mem_to_reg,
               data_a     => sig_memwb_alu_result,
               data_b     => sig_memwb_read_data,
               data_c     => sig_memwb_slt_data,
               data_d     => sig_memwb_srr_data,
               data_out   => sig_write_data );
               
    slt_result_comp : slt_result_calc
    port map ( msb        => sig_exmem_carry,
               slt_result => sig_slt_result);
               
    rotate_right_shifter : rotate_right_shifter_32b
    port map ( src_a      => sig_exmem_read_data_a,
               result     => sig_srr_result,
               rotations  => sig_exmem_read_data_b(3 downto 0));
           
    load_byte : load_byte_unit
    port map ( data_in          => sig_data_mem_out,
               read_byte        => sig_exmem_read_byte,
               load_msb         => sig_exmem_lmsb,
               data_to_extend   => sig_data_to_extend );

    mux_data_to_mux : mux_data_to_mem_to_reg
    port map ( word_data  => sig_data_mem_out,
               byte_data  => sig_byte_data,
               read_byte  => sig_exmem_read_byte,
               data_out   => sig_data_out );

    byte_sign_extend : sign_extend_16to32 
    port map ( data_in => sig_data_to_extend,
               data_out => sig_byte_data );

    -- pipeline stages --
    if_id_stage : if_id_pipeline_stage 
    port map ( clk => clk,
               reset => reset,
               if_flush => sig_if_flush,
               ifid_write => sig_ifid_write,
               if_curr_pc => sig_next_pc,
               --if_curr_pc => sig_curr_pc,
               ifid_instr_in => sig_insn,
               id_curr_pc => sig_id_curr_pc,
               ifid_instr_out => sig_ifid_insn );

    id_ex_stage: id_ex_pipeline_stage
    port map (reset => reset,
              clk => clk,
              read_data_a_in => sig_read_data_a,
              read_data_b_in => sig_read_data_b,
              immed_in => sig_sign_extended_offset,
              read_data_a_out => sig_idex_read_data_a,
              read_data_b_out => sig_idex_read_data_b,
              immed_out => sig_idex_immed,
              reg_write_in => sig_reg_write,
              reg_write_out => sig_idex_reg_write,
              alu_ctr_in => sig_alu_ctr,
              alu_ctr_out => sig_idex_alu_ctr,
              read_byte_in => sig_read_byte,
              read_byte_out => sig_idex_read_byte,
              mem_to_reg_in => sig_mem_to_reg,
              mem_to_reg_out => sig_idex_mem_to_reg,
              alu_src_in => sig_alu_src,
              alu_src_out => sig_idex_alu_src,
              mem_to_write_in => sig_mem_write,
              mem_to_write_out => sig_idex_mem_write,
              reg_dst_in => sig_reg_dst,
              reg_dst_out => sig_idex_reg_dst,
              insn_in => sig_ifid_insn,
              insn_out => sig_idex_insn,
              forwarded_write_register_in => sig_forwarded_write_register,
              forwarded_write_register_out => sig_idex_forwarded_write_register,
              mem_read_in => sig_mem_read,
              mem_read_out => sig_idex_mem_read,
              ctrl_beq_op_in => sig_ifid_ctrl_beq_op,
              ctrl_beq_op_out => sig_idex_ctrl_beq_op);

    ex_mem_stage: ex_mem_pipeline_stage
    port map ( reset => reset,
               clk => clk,
               alu_result_in => sig_alu_result,
               read_data_b_in => sig_idex_read_data_b,
               read_data_a_in => sig_idex_read_data_a,
               carry_in => sig_alu_carry_out,
               lmsb_in => sig_load_msb,
               alu_result_out => sig_exmem_alu_result,
               read_data_b_out => sig_exmem_read_data_b,
               read_data_a_out => sig_exmem_read_data_a,
               carry_out => sig_exmem_carry,
               lmsb_out => sig_exmem_lmsb,
               reg_write_in => sig_idex_reg_write,
               reg_write_out => sig_exmem_reg_write,
               read_byte_in => sig_idex_read_byte,
               read_byte_out => sig_exmem_read_byte,
               mem_write_in => sig_idex_mem_write,
               mem_write_out => sig_exmem_mem_write,
               mem_to_reg_in => sig_idex_mem_to_reg,
               mem_to_reg_out => sig_exmem_mem_to_reg,
               reg_dst_in => sig_idex_reg_dst,
               reg_dst_out => sig_exmem_reg_dst,
               insn_in => sig_idex_insn,
               insn_out => sig_exmem_insn,
               forwarded_write_register_in => sig_idex_forwarded_write_register,
               forwarded_write_register_out => sig_exmem_forwarded_write_register );

    mem_wb_stage: mem_wb_pipeline_stage
    port map ( reset => reset,
               clk => clk,
               read_data_in => sig_data_out,
               slt_data_in => sig_slt_result,
               srr_data_in => sig_srr_result,
               alu_result_in => sig_exmem_alu_result,
               read_data_out => sig_memwb_read_data,
               slt_data_out => sig_memwb_slt_data,
               srr_data_out => sig_memwb_srr_data,
               alu_result_out => sig_memwb_alu_result,
               reg_write_in => sig_exmem_reg_write,
               reg_write_out => sig_memwb_reg_write,
               mem_to_reg_in => sig_exmem_mem_to_reg,
               mem_to_reg_out => sig_memwb_mem_to_reg,
               reg_dst_in => sig_exmem_reg_dst,
               reg_dst_out => sig_memwb_reg_dst,
               insn_in => sig_exmem_insn,
               insn_out => sig_memwb_insn,
               forwarded_write_register_in => sig_exmem_forwarded_write_register,
               forwarded_write_register_out => sig_memwb_forwarded_write_register );
               
-- forwarding unit --
    forwarding_unit_part: forwarding_unit
    port map (
        exmem_reg_write => sig_exmem_reg_write,
        exmem_reg_dst_addr => sig_exmem_forwarded_write_register,
        idex_reg_a_addr => sig_idex_insn(27 downto 24),
        idex_reg_b_addr => sig_idex_insn(23 downto 20),
        memwb_reg_write => sig_memwb_reg_write,
        memwb_reg_dst_addr => sig_memwb_forwarded_write_register,
        aluSrc_a_sel => sig_alu_src_a_forward_sel,
        aluSrc_b_sel => sig_alu_src_b_forward_sel
    );
    
    -- hazard detection unit --
    hazard_dt_unit : hazard_detection_unit
        port map (  ifid_reg_a => sig_ifid_insn(27 downto 24),
                    ifid_reg_b => sig_ifid_insn(23 downto 20),
                    idex_reg_b => sig_idex_insn(23 downto 20),
                    idex_reg_d => sig_idex_forwarded_write_register,
                    idex_op    => sig_idex_ctrl_beq_op,
                    ifid_beq   => sig_ifid_beq,
                    idex_mem_read => sig_idex_mem_read,
                    ctr_sig_sel => sig_ctr_sig_sel,
                    ifid_write => sig_ifid_write,
                    pc_write => sig_pc_write
                    );

    
end structural;
