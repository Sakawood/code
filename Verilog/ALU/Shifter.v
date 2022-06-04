`timescale 1ns/1ns
module Shifter( dataA, dataB, Signal, dataOut, reset );
input reset ;
input [31:0] dataA ;
input [31:0] dataB ;
input [5:0] Signal ;
output [31:0] dataOut ;

reg [31:0] temp ;

parameter SLL = 6'b000000;

/*
=====================================================
�U���������d�ҡA�{�����g�п�ӦѮv�W�һ�������k�Ӽg
=====================================================
*/
always@( Signal or dataA or dataB or reset )
begin
	if ( reset )
	begin
		temp = 32'b0 ;
	end
/*
reset�T�� �p�G�Oreset�N���k0
*/
	else
	begin
		case ( Signal )
		SLL:
		begin
			// temp = dataA << dataB ;

			temp = dataB[0] ? { dataA[30:0], 1'b0 } : dataA ;
			temp = dataB[1] ? { dataA[29:0], 2'b0 } : temp ;
			temp = dataB[2] ? { dataA[27:0], 4'b0 } : temp ;
			temp = dataB[3] ? { dataA[23:0], 8'b0 } : temp ;
			temp = dataB[4] ? { dataA[15:0], 16'b0 } : temp ;
 
		end
		default: temp = 32'b0 ;	
	
		endcase
	end
/*
���쾹�B��
*/
end
assign dataOut = temp ;
/*
=====================================================
�W���������d�ҡA�{�����g�п�ӦѮv�W�һ�������k�Ӽg
=====================================================
*/

endmodule