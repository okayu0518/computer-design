module CNT60 (CLK, RST, CLR, EN, INC, QH, QL, CA);
input CLK, RST, CLR, EN, INC;
output [2:0] QH;
output [3:0] QL;
output CA;
reg [2:0] QH;
reg [3:0] QL;
wire EN10;

assign EN10 = EN | INC;

// 10 counter
always @(posedge CLK) begin
    if (CLR || RST) begin
        QL <= 4'b0;
	QH <= 3'b0;
    end else if (EN10) begin
        if (QL >= 4'b1001) begin
            QL <= 4'b0;
	    if (QH >= 3'b101) begin
		    QH <= 3'b0;
	    end else begin
		    QH <= QH + 1'b1;
	    end
        end else begin
            QL <= QL + 1'b1;
        end
	end
end

assign CA = (QL==4'd9) & (QH==3'd5) & EN10;
//assign CA = CA10 & CA6 & EN;

endmodule
