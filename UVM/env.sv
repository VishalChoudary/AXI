`ifndef ENV_SV
`define ENV_SV

`include "uvm_macros.svh"
import uvm_pkg::*;

`include "agent.sv"

class env extends uvm_env;
`uvm_component_utils(env)
 
function new(input string inst = "env", uvm_component c);
super.new(inst,c);
endfunction
 
agent a;
 
 
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
  a = agent::type_id::create("a",this);
 
endfunction
 
 
endclass

`endif