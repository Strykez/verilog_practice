module TOP;

localparam WIDTH = 8; // latime input

wire clk;
wire rst_n;
wire load;
wire [WIDTH - 1: 0] data_in;
wire [WIDTH - 1: 0] data_out;

reg_val #(.WIDTH(WIDTH)) DUT (
  .clk      (clk     ),
  .rst_n    (rst_n   ),
  .load     (load    ),
  .data_in  (data_in ),
  .data_out (data_out)
);

testbench #(.WIDTH(WIDTH)) tb (
  .clk      (clk     ), 
  .rst_n    (rst_n   ),
  .load     (load    ),
  .data_in  (data_in )
);

endmodule // TOP