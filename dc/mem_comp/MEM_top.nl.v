/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : U-2022.12-SP7
// Date      : Sat Nov 23 22:14:14 2024
/////////////////////////////////////////////////////////////


module MEM_top ( clk, xload, cload, caddr, xaddr, cin, xin, xCurr, coeffCurr
 );
  input [5:0] caddr;
  input [5:0] xaddr;
  input [15:0] cin;
  input [15:0] xin;
  output [15:0] xCurr;
  output [15:0] coeffCurr;
  input clk, xload, cload;
  wire   N4, n1, n2, n3, n40, n5, n6, n7, n8, n9, n10, n11, n12, n13;

  IMEM IMEM ( .Q(xCurr), .A({n7, n6, n5, n40, n3, n2}), .D(xin), .CLK(clk), 
        .CEN(1'b0), .WEN(N4) );
  CMEM CMEM ( .Q(coeffCurr), .A({n13, n12, n11, n10, n9, n8}), .D(cin), .CLK(
        clk), .CEN(1'b0), .WEN(n1) );
  CLKBUFX2TS U5 ( .A(xaddr[4]), .Y(n6) );
  CLKBUFX2TS U6 ( .A(xaddr[1]), .Y(n3) );
  CLKBUFX2TS U7 ( .A(xaddr[5]), .Y(n7) );
  CLKBUFX2TS U8 ( .A(xaddr[2]), .Y(n40) );
  CLKBUFX2TS U9 ( .A(caddr[3]), .Y(n11) );
  CLKBUFX2TS U10 ( .A(caddr[0]), .Y(n8) );
  CLKBUFX2TS U11 ( .A(xaddr[3]), .Y(n5) );
  CLKBUFX2TS U12 ( .A(xaddr[0]), .Y(n2) );
  CLKBUFX2TS U13 ( .A(caddr[1]), .Y(n9) );
  INVX1TS U14 ( .A(cload), .Y(n1) );
  CLKBUFX2TS U15 ( .A(caddr[5]), .Y(n13) );
  CLKBUFX2TS U16 ( .A(caddr[2]), .Y(n10) );
  CLKBUFX2TS U17 ( .A(caddr[4]), .Y(n12) );
  NOR2X1TS U18 ( .A(cload), .B(xload), .Y(N4) );
endmodule

