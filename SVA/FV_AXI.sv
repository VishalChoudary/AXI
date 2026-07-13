module fv_axi(
      ////////////////global control signals
  input logic clk,
  input logic resetn,
  
  ///////////////////write address channel
  
  input  logic awvalid,  /// master is sending new address  
  input  logic awready,  /// slave is ready to accept request
  input logic [3:0] awid, ////// unique ID for each transaction
  input logic [3:0] awlen, ////// burst length AXI3 : 1 to 16, AXI4 : 1 to 256
  input logic [2:0] awsize, ////unique transaction size : 1,2,4,8,16 ...128 bytes
  input logic [31:0] awaddr, ////write adress of transaction
  input logic [1:0] awburst, ////burst type : fixed , INCR , WRAP
  
  /////////////////////write data channel
  
  input logic wvalid, //// master is sending new data
  input logic wready, //// slave is ready to accept new data 
  input logic [3:0] wid, /// unique id for transaction
  input logic [31:0] wdata, //// data 
  input logic [3:0] wstrb, //// lane having valid data
  input logic wlast, //// last transfer in write burst
 
  ///////////////write response channel
  
  input logic bready, ///master is ready to accept response
  input logic bvalid, //// slave has valid response
  input logic [3:0] bid, ////unique id for transaction
  input logic [1:0] bresp, /// status of write transaction 
  
  ////////////// read address channel
  
   input logic arready,  //read address ready signal from slave
   input logic [3:0]	arid,      //read address id
   input logic [31:0]	araddr,		//read address signal
   input logic [3:0]	arlen,      //length of the burst
   input logic [2:0]	arsize,		//number of bytes in a transfer
   input logic [1:0]	arburst,	//burst type - fixed, incremental, wrapping
   input logic arvalid,	//address read valid signal
	
 ///////////////////read data channel
   	input logic [3:0] rid,		//read data id
	input logic [31:0]rdata,     //read data from slave
 	input logic [1:0] rresp,		//read response signal
 	input logic rlast,		//read data last signal
	input logic rvalid,		//read data valid signal
 	input logic rready
  
);


endmodule


//////////////////////////////////////////////////////////////
// Bind the assertions module (fv_axi) to the design (axi_slave)
// Place this in the same compilation unit as the design, or
// compile this file together with design/AXI_DESIGN.v
//////////////////////////////////////////////////////////////
bind axi_slave fv_axi fv_axi_inst (
  //////////////// global control signals
  .clk      (clk),
  .resetn   (resetn),

  /////////////////// write address channel
  .awvalid  (awvalid),
  .awready  (awready),
  .awid     (awid),
  .awlen    (awlen),
  .awsize   (awsize),
  .awaddr   (awaddr),
  .awburst  (awburst),

  /////////////////// write data channel
  .wvalid   (wvalid),
  .wready   (wready),
  .wid      (wid),
  .wdata    (wdata),
  .wstrb    (wstrb),
  .wlast    (wlast),

  /////////////// write response channel
  .bready   (bready),
  .bvalid   (bvalid),
  .bid      (bid),
  .bresp    (bresp),

  ////////////// read address channel
  .arready  (arready),
  .arid     (arid),
  .araddr   (araddr),
  .arlen    (arlen),
  .arsize   (arsize),
  .arburst  (arburst),
  .arvalid  (arvalid),

  /////////////////// read data channel
  .rid      (rid),
  .rdata    (rdata),
  .rresp    (rresp),
  .rlast    (rlast),
  .rvalid   (rvalid),
  .rready   (rready)
);
