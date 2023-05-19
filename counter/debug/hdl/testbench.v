module testbench#(
parameter WIDTH,                 // latime, in numar de biti
parameter MODULO                //  lungime ciclu de numarare
)
(
output reg clk,
output reg rst_n,
output reg ce,
output reg ld,
output reg cu,
output reg cd,
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
    
    // initializare
    ce <= 0;
    ld <= 0;
    cu <= 0;
    cd <= 0;
    data_in <= {WIDTH{1'bx}};

    @(negedge rst_n);
    data_in <= {WIDTH{1'b0}};
    repeat(3)@(posedge clk);
    

    // incarcare date
    ce <= 1;
    ld <= 1;
    data_in <= {{WIDTH-2{1'b0}}, 2'b11};

    repeat(3)@(posedge clk);

    // adunare
    ld <= 0;
    cu <= 1;

    @(posedge clk);

    // pastreaza starea
    cu <= 0;
    ce <= 0;

    repeat(3)@(posedge clk);

    // scadere

    ce <= 1;
    cd <= 1;

    @(posedge clk);

    // incarcare date
    cd <= 0;
    ld <= 1;
    data_in <= {{WIDTH-5{1'b0}}, 5'b10000};

    @(posedge clk);

    // adunare
    ld <= 0;
    cu <= 1;

    @(posedge clk);

    // pastreaza starea
    cu <= 0;
    cd <= 0;

    $stop;
  end


endmodule // testbench