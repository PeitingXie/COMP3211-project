
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
W
Loading part %s157*device2$
xc7a100tftg256-32default:defaultZ21-403h px? 
?
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px? 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px? 
_
#Helper process launched with PID %s4824*oasys2
68642default:defaultZ8-7075h px? 
?
%s*synth2?
wStarting RTL Elaboration : Time (s): cpu = 00:00:08 ; elapsed = 00:00:09 . Memory (MB): peak = 1017.906 ; gain = 0.000
2default:defaulth px? 
?
synthesizing module '%s'638*oasys2%
single_cycle_core2default:default2?
xD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/single_cycle_core.vhd2default:default2
552default:default8@Z8-638h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2#
program_counter2default:default2?
vD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/program_counter.vhd2default:default2
282default:default2
pc2default:default2#
program_counter2default:default2?
xD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/single_cycle_core.vhd2default:default2
2672default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2#
program_counter2default:default2?
vD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/program_counter.vhd2default:default2
352default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2#
program_counter2default:default2
12default:default2
12default:default2?
vD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/program_counter.vhd2default:default2
352default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
adder_4b2default:default2?
oD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/adder_4b.vhd2default:default2
252default:default2
next_pc2default:default2
adder_4b2default:default2?
xD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/single_cycle_core.vhd2default:default2
2732default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
adder_4b2default:default2?
oD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/adder_4b.vhd2default:default2
322default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
adder_4b2default:default2
22default:default2
12default:default2?
oD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/adder_4b.vhd2default:default2
322default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2&
instruction_memory2default:default2?
yD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/instruction_memory.vhd2default:default2
272default:default2
insn_mem2default:default2&
instruction_memory2default:default2?
xD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/single_cycle_core.vhd2default:default2
2792default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2&
instruction_memory2default:default2?
yD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/instruction_memory.vhd2default:default2
342default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2&
instruction_memory2default:default2
32default:default2
12default:default2?
yD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/instruction_memory.vhd2default:default2
342default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2)
IF_ID_stage_registers2default:default2?
pD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/lab3/lab3.srcs/sources_1/new/IF_ID_stage_registers.vhd2default:default2
342default:default2
	IF_ID_reg2default:default2)
IF_ID_stage_registers2default:default2?
xD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/single_cycle_core.vhd2default:default2
2862default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2)
IF_ID_stage_registers2default:default2?
pD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/lab3/lab3.srcs/sources_1/new/IF_ID_stage_registers.vhd2default:default2
412default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2)
IF_ID_stage_registers2default:default2
42default:default2
12default:default2?
pD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/lab3/lab3.srcs/sources_1/new/IF_ID_stage_registers.vhd2default:default2
412default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2%
sign_extend_4to162default:default2?
xD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/sign_extend_4to16.vhd2default:default2
252default:default2
sign_extend2default:default2%
sign_extend_4to162default:default2?
xD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/single_cycle_core.vhd2default:default2
2922default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2%
sign_extend_4to162default:default2?
xD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/sign_extend_4to16.vhd2default:default2
302default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2%
sign_extend_4to162default:default2
52default:default2
12default:default2?
xD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/sign_extend_4to16.vhd2default:default2
302default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2 
control_unit2default:default2?
sD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/control_unit.vhd2default:default2
442default:default2
	ctrl_unit2default:default2 
control_unit2default:default2?
xD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/single_cycle_core.vhd2default:default2
2962default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2 
control_unit2default:default2?
sD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/control_unit.vhd2default:default2
542default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2 
control_unit2default:default2
62default:default2
12default:default2?
sD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/control_unit.vhd2default:default2
542default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_4b2default:default2?
rD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_4b.vhd2default:default2
252default:default2
mux_reg_dst2default:default2
mux_2to1_4b2default:default2?
xD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/single_cycle_core.vhd2default:default2
3052default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
mux_2to1_4b2default:default2?
rD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_4b.vhd2default:default2
322default:default8@Z8-638h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2?
rD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2?
rD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_4b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
mux_2to1_1b2default:default2?
rD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
322default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
mux_2to1_1b2default:default2
72default:default2
12default:default2?
rD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
322default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2?
rD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2?
rD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_4b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2?
rD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2?
rD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_4b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2?
rD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2?
rD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_4b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
mux_2to1_4b2default:default2
82default:default2
12default:default2?
rD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_4b.vhd2default:default2
322default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2!
register_file2default:default2?
tD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/register_file.vhd2default:default2
262default:default2
reg_file2default:default2!
register_file2default:default2?
xD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/single_cycle_core.vhd2default:default2
3112default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2!
register_file2default:default2?
tD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/register_file.vhd2default:default2
382default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2!
register_file2default:default2
92default:default2
12default:default2?
tD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/register_file.vhd2default:default2
382default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2 
mux_2to1_16b2default:default2?
sD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
252default:default2
mux_alu_src2default:default2 
mux_2to1_16b2default:default2?
xD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/single_cycle_core.vhd2default:default2
3222default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2 
mux_2to1_16b2default:default2?
sD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
322default:default8@Z8-638h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2?
rD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2?
sD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2?
rD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2?
sD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2?
rD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2?
sD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2?
rD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2?
sD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2?
rD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2?
sD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2?
rD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2?
sD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2?
rD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2?
sD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2?
rD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2?
sD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2?
rD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2?
sD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2?
rD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2?
sD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2?
rD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2?
sD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2?
rD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2?
sD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2?
rD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2?
sD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2?
rD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2?
sD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2?
rD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2?
sD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_2to1_1b2default:default2?
rD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_1b.vhd2default:default2
252default:default2
bit_mux2default:default2
mux_2to1_1b2default:default2?
sD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
452default:default8@Z8-3491h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2 
mux_2to1_16b2default:default2
102default:default2
12default:default2?
sD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
322default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2(
ID_EX_stage_register2default:default2?
oD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/lab3/lab3.srcs/sources_1/new/ID_EX_stage_register.vhd2default:default2
342default:default2
	ID_EX_reg2default:default2(
ID_EX_stage_register2default:default2?
xD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/single_cycle_core.vhd2default:default2
3292default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2(
ID_EX_stage_register2default:default2?
oD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/lab3/lab3.srcs/sources_1/new/ID_EX_stage_register.vhd2default:default2
592default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2(
ID_EX_stage_register2default:default2
112default:default2
12default:default2?
oD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/lab3/lab3.srcs/sources_1/new/ID_EX_stage_register.vhd2default:default2
592default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2 
mux_3to1_16b2default:default2{
gD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/lab3/lab3.srcs/sources_1/new/mux_3to1_16b.vhd2default:default2
342default:default2%
mux_forwarding_rs2default:default2 
mux_3to1_16b2default:default2?
xD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/single_cycle_core.vhd2default:default2
3542default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2 
mux_3to1_16b2default:default2}
gD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/lab3/lab3.srcs/sources_1/new/mux_3to1_16b.vhd2default:default2
422default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2 
mux_3to1_16b2default:default2
122default:default2
12default:default2}
gD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/lab3/lab3.srcs/sources_1/new/mux_3to1_16b.vhd2default:default2
422default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2 
mux_3to1_16b2default:default2{
gD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/lab3/lab3.srcs/sources_1/new/mux_3to1_16b.vhd2default:default2
342default:default2%
mux_forwarding_rt2default:default2 
mux_3to1_16b2default:default2?
xD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/single_cycle_core.vhd2default:default2
3622default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2&
forwarding_handler2default:default2?
mD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/lab3/lab3.srcs/sources_1/new/forwarding_handler.vhd2default:default2
342default:default2#
forwarding_unit2default:default2&
forwarding_handler2default:default2?
xD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/single_cycle_core.vhd2default:default2
3702default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2&
forwarding_handler2default:default2?
mD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/lab3/lab3.srcs/sources_1/new/forwarding_handler.vhd2default:default2
452default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2&
forwarding_handler2default:default2
132default:default2
12default:default2?
mD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/lab3/lab3.srcs/sources_1/new/forwarding_handler.vhd2default:default2
452default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	adder_16b2default:default2?
pD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/adder_16b.vhd2default:default2
252default:default2
alu2default:default2
	adder_16b2default:default2?
xD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/single_cycle_core.vhd2default:default2
3802default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
	adder_16b2default:default2?
pD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/adder_16b.vhd2default:default2
332default:default8@Z8-638h px? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2

sig_result2default:default2?
pD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/adder_16b.vhd2default:default2
392default:default8@Z8-614h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
	adder_16b2default:default2
142default:default2
12default:default2?
pD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/adder_16b.vhd2default:default2
332default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2*
EX_MEM_stage_registers2default:default2?
qD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/lab3/lab3.srcs/sources_1/new/EX_MEM_stage_registers.vhd2default:default2
342default:default2

EX_MEM_reg2default:default2*
EX_MEM_stage_registers2default:default2?
xD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/single_cycle_core.vhd2default:default2
3882default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2*
EX_MEM_stage_registers2default:default2?
qD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/lab3/lab3.srcs/sources_1/new/EX_MEM_stage_registers.vhd2default:default2
512default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2*
EX_MEM_stage_registers2default:default2
152default:default2
12default:default2?
qD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/lab3/lab3.srcs/sources_1/new/EX_MEM_stage_registers.vhd2default:default2
512default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
data_memory2default:default2?
rD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/data_memory.vhd2default:default2
262default:default2
data_mem2default:default2
data_memory2default:default2?
xD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/single_cycle_core.vhd2default:default2
4042default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
data_memory2default:default2?
rD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/data_memory.vhd2default:default2
352default:default8@Z8-638h px? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
reset2default:default2?
rD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/data_memory.vhd2default:default2
412default:default8@Z8-614h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
data_memory2default:default2
162default:default2
12default:default2?
rD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/data_memory.vhd2default:default2
352default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2 
mux_2to1_16b2default:default2?
sD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/mux_2to1_16b.vhd2default:default2
252default:default2"
mux_mem_to_reg2default:default2 
mux_2to1_16b2default:default2?
xD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/single_cycle_core.vhd2default:default2
4122default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2*
MEM_WB_stage_registers2default:default2?
qD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/lab3/lab3.srcs/sources_1/new/MEM_WB_stage_registers.vhd2default:default2
342default:default2

MEM_WB_reg2default:default2*
MEM_WB_stage_registers2default:default2?
xD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/single_cycle_core.vhd2default:default2
4192default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2*
MEM_WB_stage_registers2default:default2?
qD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/lab3/lab3.srcs/sources_1/new/MEM_WB_stage_registers.vhd2default:default2
452default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2*
MEM_WB_stage_registers2default:default2
172default:default2
12default:default2?
qD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/lab3/lab3.srcs/sources_1/new/MEM_WB_stage_registers.vhd2default:default2
452default:default8@Z8-256h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2%
single_cycle_core2default:default2
182default:default2
12default:default2?
xD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/single_cycle_core.vhd2default:default2
552default:default8@Z8-256h px? 
?
%s*synth2?
wFinished RTL Elaboration : Time (s): cpu = 00:00:10 ; elapsed = 00:00:12 . Memory (MB): peak = 1017.906 ; gain = 0.000
2default:defaulth px? 
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
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:11 ; elapsed = 00:00:13 . Memory (MB): peak = 1017.906 ; gain = 0.000
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
?
%s*synth2?
?Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:11 ; elapsed = 00:00:13 . Memory (MB): peak = 1017.906 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0312default:default2
1017.9062default:default2
0.0002default:defaultZ17-268h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
>

Processing XDC Constraints
244*projectZ1-262h px? 
=
Initializing timing engine
348*projectZ1-569h px? 
?
Parsing XDC File [%s]
179*designutils2w
aD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/lab3/lab3.srcs/constrs_1/new/cons_1.xdc2default:default8Z20-179h px? 
?
Finished Parsing XDC File [%s]
178*designutils2w
aD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/lab3/lab3.srcs/constrs_1/new/cons_1.xdc2default:default8Z20-178h px? 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0012default:default2
1057.8952default:default2
0.0002default:defaultZ17-268h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0242default:default2
1057.8952default:default2
0.0002default:defaultZ17-268h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
~Finished Constraint Validation : Time (s): cpu = 00:00:21 ; elapsed = 00:00:23 . Memory (MB): peak = 1057.895 ; gain = 39.988
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
?Finished Loading Part and Timing Information : Time (s): cpu = 00:00:21 ; elapsed = 00:00:23 . Memory (MB): peak = 1057.895 ; gain = 39.988
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
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
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
?Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:21 ; elapsed = 00:00:23 . Memory (MB): peak = 1057.895 ; gain = 39.988
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
!inferring latch for variable '%s'327*oasys23
mem_process.var_insn_mem_reg[0]2default:default2?
yD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/instruction_memory.vhd2default:default2
572default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys23
mem_process.var_insn_mem_reg[1]2default:default2?
yD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/instruction_memory.vhd2default:default2
572default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys23
mem_process.var_insn_mem_reg[2]2default:default2?
yD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/instruction_memory.vhd2default:default2
572default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2"
sig_result_reg2default:default2?
pD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/adder_16b.vhd2default:default2
422default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2!
carry_out_reg2default:default2?
pD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/single_cycle_core/single_cycle_core/VHDL/adder_16b.vhd2default:default2
442default:default8@Z8-327h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:22 ; elapsed = 00:00:24 . Memory (MB): peak = 1057.895 ; gain = 39.988
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
8
%s
*synth2 
+---XORs : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     16 Bit         XORs := 1     
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
.	                4 Bit    Registers := 6     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                2 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 7     
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
,	   4 Input   16 Bit        Muxes := 3     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    2 Bit        Muxes := 3     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input    2 Bit        Muxes := 1     
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
?Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:25 ; elapsed = 00:00:28 . Memory (MB): peak = 1057.895 ; gain = 39.988
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
R
%s
*synth2:
&Start Applying XDC Timing Constraints
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
?Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:34 ; elapsed = 00:00:37 . Memory (MB): peak = 1057.895 ; gain = 39.988
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
|Finished Timing Optimization : Time (s): cpu = 00:00:34 ; elapsed = 00:00:37 . Memory (MB): peak = 1057.895 ; gain = 39.988
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
{Finished Technology Mapping : Time (s): cpu = 00:00:34 ; elapsed = 00:00:37 . Memory (MB): peak = 1058.027 ; gain = 40.121
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
uFinished IO Insertion : Time (s): cpu = 00:00:40 ; elapsed = 00:00:43 . Memory (MB): peak = 1063.824 ; gain = 45.918
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
?Finished Renaming Generated Instances : Time (s): cpu = 00:00:40 ; elapsed = 00:00:43 . Memory (MB): peak = 1063.824 ; gain = 45.918
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
?Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:40 ; elapsed = 00:00:43 . Memory (MB): peak = 1063.824 ; gain = 45.918
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
?Finished Renaming Generated Ports : Time (s): cpu = 00:00:40 ; elapsed = 00:00:43 . Memory (MB): peak = 1063.824 ; gain = 45.918
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
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:40 ; elapsed = 00:00:43 . Memory (MB): peak = 1063.824 ; gain = 45.918
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
?Finished Renaming Generated Nets : Time (s): cpu = 00:00:40 ; elapsed = 00:00:43 . Memory (MB): peak = 1063.824 ; gain = 45.918
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
B
%s*synth2*
+------+-----+------+
2default:defaulth px? 
B
%s*synth2*
|      |Cell |Count |
2default:defaulth px? 
B
%s*synth2*
+------+-----+------+
2default:defaulth px? 
B
%s*synth2*
|1     |BUFG |     1|
2default:defaulth px? 
B
%s*synth2*
|2     |LUT1 |     5|
2default:defaulth px? 
B
%s*synth2*
|3     |LUT2 |     1|
2default:defaulth px? 
B
%s*synth2*
|4     |LUT3 |     3|
2default:defaulth px? 
B
%s*synth2*
|5     |LUT4 |     5|
2default:defaulth px? 
B
%s*synth2*
|6     |LUT6 |     2|
2default:defaulth px? 
B
%s*synth2*
|7     |FDCE |    20|
2default:defaulth px? 
B
%s*synth2*
|8     |FDRE |    16|
2default:defaulth px? 
B
%s*synth2*
|9     |IBUF |     2|
2default:defaulth px? 
B
%s*synth2*
+------+-----+------+
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
?Finished Writing Synthesis Report : Time (s): cpu = 00:00:40 ; elapsed = 00:00:43 . Memory (MB): peak = 1063.824 ; gain = 45.918
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
FSynthesis finished with 0 errors, 0 critical warnings and 5 warnings.
2default:defaulth p
x
? 
?
%s
*synth2?
}Synthesis Optimization Runtime : Time (s): cpu = 00:00:26 ; elapsed = 00:00:40 . Memory (MB): peak = 1063.824 ; gain = 5.930
2default:defaulth p
x
? 
?
%s
*synth2?
Synthesis Optimization Complete : Time (s): cpu = 00:00:40 ; elapsed = 00:00:43 . Memory (MB): peak = 1063.824 ; gain = 45.918
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
00:00:00.0012default:default2
1063.8242default:default2
0.0002default:defaultZ17-268h px? 
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
1082.7972default:default2
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
862default:default2
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
00:00:482default:default2
00:01:002default:default2
1082.7972default:default2
64.8912default:defaultZ17-268h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2z
fD:/UNSW/2022 term1/COMP3211/COMP3211-project/Weilin_lab03/lab3/lab3.runs/synth_1/single_cycle_core.dcp2default:defaultZ17-1381h px? 
?
%s4*runtcl2?
xExecuting : report_utilization -file single_cycle_core_utilization_synth.rpt -pb single_cycle_core_utilization_synth.pb
2default:defaulth px? 
?
Exiting %s at %s...
206*common2
Vivado2default:default2,
Sun Apr 10 20:47:19 20222default:defaultZ17-206h px? 


End Record