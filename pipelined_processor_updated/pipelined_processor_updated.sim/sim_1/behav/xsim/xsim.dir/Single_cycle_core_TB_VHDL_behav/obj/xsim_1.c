/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
IKI_DLLESPEC extern void execute_558(char*, char *);
IKI_DLLESPEC extern void execute_559(char*, char *);
IKI_DLLESPEC extern void execute_35(char*, char *);
IKI_DLLESPEC extern void execute_37(char*, char *);
IKI_DLLESPEC extern void execute_39(char*, char *);
IKI_DLLESPEC extern void execute_40(char*, char *);
IKI_DLLESPEC extern void execute_41(char*, char *);
IKI_DLLESPEC extern void execute_43(char*, char *);
IKI_DLLESPEC extern void execute_45(char*, char *);
IKI_DLLESPEC extern void execute_47(char*, char *);
IKI_DLLESPEC extern void execute_48(char*, char *);
IKI_DLLESPEC extern void execute_49(char*, char *);
IKI_DLLESPEC extern void execute_50(char*, char *);
IKI_DLLESPEC extern void execute_51(char*, char *);
IKI_DLLESPEC extern void execute_52(char*, char *);
IKI_DLLESPEC extern void execute_53(char*, char *);
IKI_DLLESPEC extern void execute_54(char*, char *);
IKI_DLLESPEC extern void execute_58(char*, char *);
IKI_DLLESPEC extern void execute_84(char*, char *);
IKI_DLLESPEC extern void execute_138(char*, char *);
IKI_DLLESPEC extern void execute_236(char*, char *);
IKI_DLLESPEC extern void execute_237(char*, char *);
IKI_DLLESPEC extern void execute_238(char*, char *);
IKI_DLLESPEC extern void execute_239(char*, char *);
IKI_DLLESPEC extern void execute_241(char*, char *);
IKI_DLLESPEC extern void execute_293(char*, char *);
IKI_DLLESPEC extern void execute_294(char*, char *);
IKI_DLLESPEC extern void execute_296(char*, char *);
IKI_DLLESPEC extern void execute_297(char*, char *);
IKI_DLLESPEC extern void execute_298(char*, char *);
IKI_DLLESPEC extern void execute_299(char*, char *);
IKI_DLLESPEC extern void execute_500(char*, char *);
IKI_DLLESPEC extern void execute_502(char*, char *);
IKI_DLLESPEC extern void execute_504(char*, char *);
IKI_DLLESPEC extern void execute_506(char*, char *);
IKI_DLLESPEC extern void execute_509(char*, char *);
IKI_DLLESPEC extern void execute_511(char*, char *);
IKI_DLLESPEC extern void execute_520(char*, char *);
IKI_DLLESPEC extern void execute_528(char*, char *);
IKI_DLLESPEC extern void execute_536(char*, char *);
IKI_DLLESPEC extern void execute_557(char*, char *);
IKI_DLLESPEC extern void transaction_0(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[43] = {(funcp)execute_558, (funcp)execute_559, (funcp)execute_35, (funcp)execute_37, (funcp)execute_39, (funcp)execute_40, (funcp)execute_41, (funcp)execute_43, (funcp)execute_45, (funcp)execute_47, (funcp)execute_48, (funcp)execute_49, (funcp)execute_50, (funcp)execute_51, (funcp)execute_52, (funcp)execute_53, (funcp)execute_54, (funcp)execute_58, (funcp)execute_84, (funcp)execute_138, (funcp)execute_236, (funcp)execute_237, (funcp)execute_238, (funcp)execute_239, (funcp)execute_241, (funcp)execute_293, (funcp)execute_294, (funcp)execute_296, (funcp)execute_297, (funcp)execute_298, (funcp)execute_299, (funcp)execute_500, (funcp)execute_502, (funcp)execute_504, (funcp)execute_506, (funcp)execute_509, (funcp)execute_511, (funcp)execute_520, (funcp)execute_528, (funcp)execute_536, (funcp)execute_557, (funcp)transaction_0, (funcp)vhdl_transfunc_eventcallback};
const int NumRelocateId= 43;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/Single_cycle_core_TB_VHDL_behav/xsim.reloc",  (void **)funcTab, 43);
	iki_vhdl_file_variable_register(dp + 33792);
	iki_vhdl_file_variable_register(dp + 33848);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/Single_cycle_core_TB_VHDL_behav/xsim.reloc");
}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/Single_cycle_core_TB_VHDL_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/Single_cycle_core_TB_VHDL_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/Single_cycle_core_TB_VHDL_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/Single_cycle_core_TB_VHDL_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, (void*)0, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
