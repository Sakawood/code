`timescale 1ns/1ns
module Mux_4to1( in0, in1, in2, in3, out, sel ) ;

	output	out ;
	input	in3,in2,in1,in0;
	input	[1:0] sel;

	reg	out;

  always @( in0 or in1 or in2 or in3 or sel )
  begin
    /*
    if ( sel == 2'b00 )
      out = in0;
    else if ( sel == 2'b01 )
      out = in1;
    else if ( sel == 2'b10 )
      out = in2;
    else
      out = in3;
    */
    case (sel)
      2'b00: out = in0 ;
      2'b01: out = in1 ;
      2'b10: out = in2 ;
      2'b11: out = in3 ;
      default: out = in0 ;
    endcase 
  end
	  //assign	out = ( sel == 2'b00 ) ? in0 : ( sel == 2'b01 ) ? in1 : ( sel == 2'b10 ) ? in2 : in3 ;
	 

endmodule