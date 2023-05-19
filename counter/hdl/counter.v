module counter #(
  parameter WIDTH,                  // latime, in numar de biti
  parameter MODULO                  // lungime ciclu de numarare
)(
  input clk,                        // ceas, activ pe front crescator
  input rst_n,                      // reset activ in zero
  input ce,                         // chip enable
  input ld,                         // load
  input cu,                         // count up
  input cd,                         // count down
  input [WIDTH-1:0] data_in,        // date de intrare
  output reg [WIDTH-1:0] data_out   // date de iesire
);

// ce  ld cu cd | data_out+   functie
// -------------+----------------------
//  0   -  -  - | data_out    pastreaza starea (circuit neselectat)
//  1   1  -  - | data_in     presetare
//  1   0  1  - | data_out+1  numara in sens crescator MODULO
//  1   0  0  1 | data_out-1  numara in sens descrescator MODULO
//  1   0  0  0 | data_out    pastreaza starea


  always @(posedge clk or negedge rst_n) begin
    if (~rst_n) data_out <= {WIDTH{1'b0}};
    else if (ce) 
    begin
      if (ld) data_out <= data_in;          // Presetare
      else if (cu) 
      begin                                // Numara in sens crescator MODULO
        if (data_out == MODULO - 1) data_out <= 0;
        else data_out <= data_out + 1;
      end
      else if (cd) 
      begin                               // Numara in sens descrescator MODULO
        if (data_out == 0) data_out <= MODULO - 1;
        else data_out <= data_out - 1;
      end
      else data_out <= data_out;          // Pastreaza starea
    end
  end
  
endmodule // counter
