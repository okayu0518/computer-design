module CLOCK1 (
    input   CLK, RST,
    input       [9:0]   SW,
    input       [1:0]   KEY,
    output      [3:0]    sec1,
    output      [2:0]    sec10,
    output      [3:0]    min1,
    output      [2:0]    min10,
    output   CA
);

	wire en1hz, ca;
	wire secup, minup, clr;

	BTN_IN btn_in (
		.CLK(CLK),
		.RST(RST),
		.nBIN({KEY[1:0], SW[0]}),
		.BOUT({secup, minup, clr})
	);
	CNT1SEC cnt1sec (
		.CLK(CLK),
		.RST(RST),
		.EN1HZ(en1hz)
	);
	CNT60 cntsec (
		.CLK(CLK),
		.RST(RST),
		.CLR(SW[0]),
		.EN(en1hz),
		.INC(SW[1]),
		.QH(sec10),
		.QL(sec1),
		.CA(ca)
	);
	CNT60 cntmin (
		.CLK(CLK),
		.RST(RST),
		.CLR(SW[0]),
		.EN(ca),
		.INC(SW[2]),
		.QH(min10),
		.QL(min1),
		.CA(CA)
	);

endmodule
