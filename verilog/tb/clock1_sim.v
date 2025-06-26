`timescale 1 ps/ 1 ps

module clock1_sim();
parameter PERIOD=10;  // (clock period)/2

// constants                                           
// general purpose registers
    reg   clk, rst;
    reg       [9:0]   sw;
    reg       [1:0]   key;
// wires                                               
    wire [3:0] sec1, min1;
    wire [2:0] sec10, min10;
    wire CA;

// assign statements (if any)                          
CLOCK1 u1 (
// port map - connection between master ports and signals/registers   
    .CLK(clk),
    .RST(rst),
    .SW(sw),
    .KEY(key),
    .sec1(sec1),
    .sec10(sec10),
    .min1(min1),
    .min10(min10),
    .CA(CA)
);

// rst, clr
initial begin
  rst =              1'b0;
  rst = #(PERIOD*3)  1'b1;
  rst = #(PERIOD)    1'b0;
  rst = #(PERIOD*20) 1'b1;
  rst = #(PERIOD)    1'b0;
end 

// clk
initial begin
	clk = 1'b0;
end
always #(PERIOD/2) clk = ~clk;

// sw, key


endmodule
