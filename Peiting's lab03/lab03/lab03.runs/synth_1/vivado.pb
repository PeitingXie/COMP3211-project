

Command: %s
53*	vivadotcl2N
:synth_design -top single_cycle_core -part xc7a100tftg256-32default:defaultZ4-113h px? 
:
Starting synth_design
149*	vivadotclZ4-321h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-349h px? 
?
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px? 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px? 
`
#Helper process launched with PID %s4824*oasys2
231762default:defaultZ8-7075h px? 
?
%s*synth2?
rStarting Synthesize : Time (s): cpu = 00:00:04 ; elapsed = 00:00:05 . Memory (MB): peak = 1015.637 ; gain = 0.000
2default:defaulth px? 
?
synthesizing module '%s'638*oasys2%
single_cycle_core2default:default2f
PF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/single_cycle_core.vhd2default:default2
552default:default8@Z8-638h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2#
program_counter2default:default2b
NF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/program_counter.vhd2default:default2
282default:default2
pc2default:default2#
program_counter2default:default2f
PF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/single_cycle_core.vhd2default:default2
1932default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2#
program_counter2default:default2d
NF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/program_counter.vhd2default:default2
352default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2#
program_counter2default:default2
12default:default2
12default:default2d
NF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/program_counter.vhd2default:default2
352default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
adder_4b2default:default2[
GF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/adder_4b.vhd2default:default2
252default:default2
next_pc2default:default2
adder_4b2default:default2f
PF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/single_cycle_core.vhd2default:default2
1992default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
adder_4b2default:default2]
GF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/adder_4b.vhd2default:default2
322default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
adder_4b2default:default2
22default:default2
12default:default2]
GF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/adder_4b.vhd2default:default2
322default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2&
instruction_memory2default:default2e
QF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/instruction_memory.vhd2default:default2
272default:default2
insn_mem2default:default2&
instruction_memory2default:default2f
PF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/single_cycle_core.vhd2default:default2
2052default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2&
instruction_memory2default:default2g
QF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/instruction_memory.vhd2default:default2
342default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2&
instruction_memory2default:default2
32default:default2
12default:default2g
QF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/instruction_memory.vhd2default:default2
342default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2%
sign_extend_4to162default:default2d
PF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/sign_extend_4to16.vhd2default:default2
252default:default2
sign_extend2default:default2%
sign_extend_4to162default:default2f
PF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/single_cycle_core.vhd2default:default2
2232default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2%
sign_extend_4to162default:default2f
PF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/sign_extend_4to16.vhd2default:default2
302default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2%
sign_extend_4to162default:default2
42default:default2
12default:default2f
PF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/sign_extend_4to16.vhd2default:default2
302default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2 
control_unit2default:default2_
KF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/control_unit.vhd2default:default2
442default:default2
	ctrl_unit2default:default2 
control_unit2default:default2f
PF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/single_cycle_core.vhd2default:default2
2272default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2 
control_unit2default:default2a
KF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/control_unit.vhd2default:default2
532default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2 
control_unit2default:default2
52default:default2
12default:default2a
KF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/control_unit.vhd2default:default2
532default:default8@Z8-256h px? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2)
data_forwarding_mux_a2default:default2f
PF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/single_cycle_core.vhd2default:default2
3092default:default8@Z8-614h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_4b2default:default2^
JF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_4b.vhd2default:default2
252default:default2
mux_reg_dst2default:default2
mux_2to1_4b2default:default2f
PF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/single_cycle_core.vhd2default:default2
3422default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
mux_2to1_4b2default:default2`
JF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_4b.vhd2default:default2
322default:default8@Z8-638h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2^
JF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2`
JF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_4b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
mux_2to1_1b2default:default2`
JF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
322default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
mux_2to1_1b2default:default2
62default:default2
12default:default2`
JF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
322default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2^
JF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2`
JF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_4b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2^
JF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2`
JF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_4b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2^
JF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2`
JF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_4b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
mux_2to1_4b2default:default2
72default:default2
12default:default2`
JF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_4b.vhd2default:default2
322default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2!
register_file2default:default2`
LF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/register_file.vhd2default:default2
262default:default2
reg_file2default:default2!
register_file2default:default2f
PF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/single_cycle_core.vhd2default:default2
3482default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2!
register_file2default:default2b
LF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/register_file.vhd2default:default2
382default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2!
register_file2default:default2
82default:default2
12default:default2b
LF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/register_file.vhd2default:default2
382default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2 
mux_2to1_16b2default:default2_
KF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
252default:default2
mux_alu_src2default:default2 
mux_2to1_16b2default:default2f
PF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/single_cycle_core.vhd2default:default2
3592default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2 
mux_2to1_16b2default:default2a
KF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
322default:default8@Z8-638h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2^
JF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2a
KF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2^
JF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2a
KF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2^
JF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2a
KF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2^
JF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2a
KF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2^
JF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2a
KF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2^
JF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2a
KF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2^
JF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2a
KF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2^
JF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2a
KF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2^
JF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2a
KF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2^
JF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2a
KF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2^
JF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2a
KF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2^
JF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2a
KF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2^
JF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2a
KF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2^
JF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2a
KF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2^
JF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2a
KF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2^
JF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2a
KF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2 
mux_2to1_16b2default:default2
92default:default2
12default:default2a
KF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
322default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	adder_16b2default:default2\
HF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/adder_16b.vhd2default:default2
252default:default2
alu2default:default2
	adder_16b2default:default2f
PF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/single_cycle_core.vhd2default:default2
3652default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
	adder_16b2default:default2^
HF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/adder_16b.vhd2default:default2
322default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
	adder_16b2default:default2
102default:default2
12default:default2^
HF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/adder_16b.vhd2default:default2
322default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
data_memory2default:default2^
JF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/data_memory.vhd2default:default2
262default:default2
data_mem2default:default2
data_memory2default:default2f
PF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/single_cycle_core.vhd2default:default2
3712default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
data_memory2default:default2`
JF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/data_memory.vhd2default:default2
352default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
data_memory2default:default2
112default:default2
12default:default2`
JF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/data_memory.vhd2default:default2
352default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2 
mux_2to1_16b2default:default2_
KF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
252default:default2"
mux_mem_to_reg2default:default2 
mux_2to1_16b2default:default2f
PF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/single_cycle_core.vhd2default:default2
3792default:default8@Z8-3491h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2%
single_cycle_core2default:default2
122default:default2
12default:default2f
PF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/single_cycle_core.vhd2default:default2
552default:default8@Z8-256h px? 
?
%s*synth2?
rFinished Synthesize : Time (s): cpu = 00:00:05 ; elapsed = 00:00:06 . Memory (MB): peak = 1015.637 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
}Finished Constraint Validation : Time (s): cpu = 00:00:05 ; elapsed = 00:00:07 . Memory (MB): peak = 1015.637 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Loading part: xc7a100tftg256-3
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Loading Part and Timing Information : Time (s): cpu = 00:00:05 ; elapsed = 00:00:07 . Memory (MB): peak = 1015.637 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
Loading part %s157*device2$
xc7a100tftg256-32default:defaultZ21-403h px? 
?
!inferring latch for variable '%s'327*oasys23
mem_process.var_insn_mem_reg[0]2default:default2g
QF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/instruction_memory.vhd2default:default2
572default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys23
mem_process.var_insn_mem_reg[1]2default:default2g
QF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/instruction_memory.vhd2default:default2
572default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys23
mem_process.var_insn_mem_reg[2]2default:default2g
QF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/instruction_memory.vhd2default:default2
572default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys23
mem_process.var_insn_mem_reg[7]2default:default2g
QF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/instruction_memory.vhd2default:default2
572default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys23
mem_process.var_insn_mem_reg[9]2default:default2g
QF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/instruction_memory.vhd2default:default2
572default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys24
 mem_process.var_insn_mem_reg[10]2default:default2g
QF:/COMP3211/lab03/single_cycle_core/single_cycle_core/VHDL/instruction_memory.vhd2default:default2
572default:default8@Z8-327h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:06 ; elapsed = 00:00:07 . Memory (MB): peak = 1015.637 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   17 Bit       Adders := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    5 Bit       Adders := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               16 Bit    Registers := 39    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                4 Bit    Registers := 5     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 8     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
X
%s
*synth2@
,	   6 Input   16 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input   16 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	  16 Input    3 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   3 Input    2 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    1 Bit        Muxes := 67    
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2k
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:11 ; elapsed = 00:00:14 . Memory (MB): peak = 1015.637 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
{Finished Timing Optimization : Time (s): cpu = 00:00:11 ; elapsed = 00:00:14 . Memory (MB): peak = 1015.637 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
zFinished Technology Mapping : Time (s): cpu = 00:00:12 ; elapsed = 00:00:14 . Memory (MB): peak = 1015.637 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
tFinished IO Insertion : Time (s): cpu = 00:00:15 ; elapsed = 00:00:18 . Memory (MB): peak = 1015.637 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Instances : Time (s): cpu = 00:00:15 ; elapsed = 00:00:18 . Memory (MB): peak = 1015.637 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:15 ; elapsed = 00:00:18 . Memory (MB): peak = 1015.637 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Ports : Time (s): cpu = 00:00:15 ; elapsed = 00:00:18 . Memory (MB): peak = 1015.637 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:15 ; elapsed = 00:00:18 . Memory (MB): peak = 1015.637 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
Finished Renaming Generated Nets : Time (s): cpu = 00:00:15 ; elapsed = 00:00:18 . Memory (MB): peak = 1015.637 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
D
%s*synth2,
|      |Cell   |Count |
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
D
%s*synth2,
|1     |BUFG   |     1|
2default:defaulth px? 
D
%s*synth2,
|2     |CARRY4 |     4|
2default:defaulth px? 
D
%s*synth2,
|3     |LUT1   |     2|
2default:defaulth px? 
D
%s*synth2,
|4     |LUT2   |     3|
2default:defaulth px? 
D
%s*synth2,
|5     |LUT3   |     4|
2default:defaulth px? 
D
%s*synth2,
|6     |LUT4   |    13|
2default:defaulth px? 
D
%s*synth2,
|7     |LUT5   |   124|
2default:defaulth px? 
D
%s*synth2,
|8     |LUT6   |   170|
2default:defaulth px? 
D
%s*synth2,
|9     |MUXF7  |    94|
2default:defaulth px? 
D
%s*synth2,
|10    |MUXF8  |    32|
2default:defaulth px? 
D
%s*synth2,
|11    |FDCE   |   633|
2default:defaulth px? 
D
%s*synth2,
|12    |FDPE   |     3|
2default:defaulth px? 
D
%s*synth2,
|13    |FDRE   |    10|
2default:defaulth px? 
D
%s*synth2,
|14    |IBUF   |     2|
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
E
%s
*synth2-

Report Instance Areas: 
2default:defaulth p
x
? 
\
%s
*synth2D
0+------+-----------+-------------------+------+
2default:defaulth p
x
? 
\
%s
*synth2D
0|      |Instance   |Module             |Cells |
2default:defaulth p
x
? 
\
%s
*synth2D
0+------+-----------+-------------------+------+
2default:defaulth p
x
? 
\
%s
*synth2D
0|1     |top        |                   |  1095|
2default:defaulth p
x
? 
\
%s
*synth2D
0|2     |  alu      |adder_16b          |    50|
2default:defaulth p
x
? 
\
%s
*synth2D
0|3     |  data_mem |data_memory        |   382|
2default:defaulth p
x
? 
\
%s
*synth2D
0|4     |  insn_mem |instruction_memory |    21|
2default:defaulth p
x
? 
\
%s
*synth2D
0|5     |  pc       |program_counter    |     8|
2default:defaulth p
x
? 
\
%s
*synth2D
0|6     |  reg_file |register_file      |   479|
2default:defaulth p
x
? 
\
%s
*synth2D
0+------+-----------+-------------------+------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Writing Synthesis Report : Time (s): cpu = 00:00:15 ; elapsed = 00:00:18 . Memory (MB): peak = 1015.637 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
r
%s
*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 7 warnings.
2default:defaulth p
x
? 
?
%s
*synth2?
}Synthesis Optimization Runtime : Time (s): cpu = 00:00:15 ; elapsed = 00:00:18 . Memory (MB): peak = 1015.637 ; gain = 0.000
2default:defaulth p
x
? 
?
%s
*synth2?
~Synthesis Optimization Complete : Time (s): cpu = 00:00:15 ; elapsed = 00:00:18 . Memory (MB): peak = 1015.637 ; gain = 0.000
2default:defaulth p
x
? 
B
 Translating synthesized netlist
350*projectZ1-571h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0182default:default2
1015.6372default:default2
0.0002default:defaultZ17-268h px? 
g
-Analyzing %s Unisim elements for replacement
17*netlist2
1302default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1015.6372default:default2
0.0002default:defaultZ17-268h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
672default:default2
72default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:192default:default2
00:00:232default:default2
1015.6372default:default2
0.0002default:defaultZ17-268h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2T
@F:/COMP3211/lab03/lab03/lab03.runs/synth_1/single_cycle_core.dcp2default:defaultZ17-1381h px? 
?
%s4*runtcl2?
xExecuting : report_utilization -file single_cycle_core_utilization_synth.rpt -pb single_cycle_core_utilization_synth.pb
2default:defaulth px? 
?
Exiting %s at %s...
206*common2
Vivado2default:default2,
Wed Mar 30 14:09:50 20222default:defaultZ17-206h px? 


End Record