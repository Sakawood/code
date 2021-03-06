module TM ;

reg		clk, rst ;
reg[1:0]	sel ;
reg[2:0]	a,b ;
wire[3:0]	dout ;

parameter	t = 200 ;
parameter	th = 100 ;

counter_hold_add	U_cas( .sel(sel), .dout(dout), .rst(rst), .clk(clk), .a(a), .b(b) ) ;

always #th clk = ~clk ;

initial
 begin
	rst = 1 ;
	clk = 0 ;
	sel = 2'b00 ;
	a = 3'b000 ;
	b = 3'b000 ;

	#t rst = 0 ;
	#t rst = 1 ;
	
	#(10*t) sel = 2'b01 ;

	#(2*t) sel = 2'b10 ;
	a = 3'b001 ;
	b = 3'b011 ;

	#t
	a = 3'b101 ;
	b = 3'b100 ;  

	#t 	$stop ;

 end
endmodule