module lfsr_4(
input                 clk     , // ceas, activ pe front crescator
input                 rst_n   , // reset activ in zero
                      
output reg  [4  -1:0] data_out  // date de iesire
);

// polinom X^4 + X^3 + 1

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) 
      data_out <= 4'b0001; // resetam la 1 pentru ca resetul la 0 ne duce intr-un loop de valori 0
    else
       data_out <= {data_out[2:0], data_out[3] ^ data_out[2]};
end

endmodule // lfsr_4
