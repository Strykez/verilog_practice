module TOP;

wire clk;
wire rst_n;
wire [4  -1:0] data_out;

lfsr_4 DUT (
  .clk      (clk     ),
  .rst_n    (rst_n   ),
  .data_out (data_out)
);

testbench tb (
  .clk      (clk     ), 
  .rst_n    (rst_n   )
);

endmodule // TOP