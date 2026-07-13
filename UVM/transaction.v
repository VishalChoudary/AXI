`include "uvm_macros.svh"
import uvm_pkg::*;


typedef enum bit [2:0] {wrrdfixed = 0, wrrdincr = 1, wrrderrfix = 3, rstdut =4 } oper_mode;

class transaction extends uvm_sequence_item;
    `uvm_object_utils(transaction)

    function new (string name = "transaction");
        super.new(name);
    endfunction

    
endclass