module TOP;

localparam WIDTH = 8;     // latime, in numar de biti
localparam MODULO = 17;   // lungime ciclu de numarare

wire clk;
wire rst_n;
wire ce;
wire ld;
wire cu;
wire cd;
wire [WIDTH - 1: 0] data_in;
wire [WIDTH - 1: 0] data_out;

counter #(
  .WIDTH(WIDTH),
  .MODULO(MODULO)
) DUT (
  .clk      (clk     ),
  .rst_n    (rst_n   ),
  .ce       (ce      ),
  .ld       (ld      ),
  .cu       (cu      ),
  .cd       (cd      ),
  .data_in  (data_in ),
  .data_out (data_out)
);

testbench #(
  .WIDTH(WIDTH),
  .MODULO(MODULO)
) tb (
  .clk      (clk     ), 
  .rst_n    (rst_n   ),
  .ce       (ce      ),
  .ld       (ld      ),
  .cu       (cu      ),
  .cd       (cd      ),
  .data_in  (data_in )
);

endmodule // TOP