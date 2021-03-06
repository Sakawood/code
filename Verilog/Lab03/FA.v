`timescale 1ns/1ns
module FA(a,b,c,cout,sum);

  input a,b,c;
  output cout, sum;

  wire e1,e2,e3;

  assign e1 = a^b;
  assign e2 = a&b;
  assign e3 = e1&c;
  assign cout = e2|e3;
  assign sum = e1^c;
  
endmodule  