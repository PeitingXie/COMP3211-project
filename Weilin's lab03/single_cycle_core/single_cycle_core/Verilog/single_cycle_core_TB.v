
module single_cycle_core_Test_Bench ();

reg clk, reset;

initial
begin

clk=0;
reset=0;

#10

reset=1;
#4
reset=0;
end

always #2 clk=~clk;


single_cycle_core_v single_cycle_core_inst
 ( .clk(clk),
   .reset(reset)
   
  );


endmodule