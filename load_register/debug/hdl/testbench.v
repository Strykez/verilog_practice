module testbench#(
parameter WIDTH                 // latime, in numar de biti
)
(
output reg clk,
output reg rst_n,
output reg load,
output reg [WIDTH -1: 0] data_in
);

// initializare semnal ceas
initial begin
clk <= 0;
forever
#10 clk <= ~clk;
end

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
  load <= 1'b0;
  data_in <= 8'bx;
  
  @(negedge rst_n);
  
  load <= 1'b0;
  data_in <= 8'b0;
  
  @(posedge rst_n);
  @(posedge clk);
  
  load <= 1'b1;
  data_in <= {{WIDTH-3{1'b0}}, 3'b111};


  @(posedge clk);
  @(posedge clk);

  load <= 1'b0;
  data_in <= {{WIDTH-4{1'b0}}, 4'b1011};

  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  
  load <= 1'b1;
  data_in <= {{WIDTH-6{1'b0}}, 6'b100111};
  @(posedge clk);
  
  $stop;
end


endmodule // testbench