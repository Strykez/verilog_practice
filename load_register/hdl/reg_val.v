module reg_val #(
parameter WIDTH                     // latime input
)(
input                     clk     , // ceas
input                     rst_n   , // reset
input                     load    , // load
input       [WIDTH -1:0]  data_in , // input data
output reg  [WIDTH -1:0]  data_out  // output data
);

always @(posedge clk or negedge rst_n)
  if (~rst_n)
    data_out <= 0;
  else if (load)
    data_out <= data_in;

endmodule // reg_val