module testbench
(
output reg clk,
output reg rst_n
);

// initializare semnal ceas
initial begin
clk <= 0;
forever
#10 clk <= ~clk;
end

// initializare semnal reset
initial begin
  rst_n <= 1'b1;    // initial inactiv
  @(posedge clk);
  rst_n <= 1'b0;    // activare sincrona
  @(posedge clk);
  @(posedge clk);
  rst_n <= 1'b1;    // inactivare dupa doua perioade de ceas
  @(posedge clk);   // ramane inactiv pentru totdeauna
end

initial begin
  @(posedge clk); 
  @(posedge rst_n);
  repeat(18) @(posedge clk);
  $stop;
end



endmodule // testbench