/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : U-2022.12-SP7
// Date      : Wed Dec  4 14:49:42 2024
/////////////////////////////////////////////////////////////


module FIFO ( clk_wr, clk_rd, wr_en, rd_en, rst, wr_data, full, empty, rd_data
 );
  input [15:0] wr_data;
  output [15:0] rd_data;
  input clk_wr, clk_rd, wr_en, rd_en, rst;
  output full, empty;
  wire   n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209,
         n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n253,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265, n266, n267, n268, n269, n270, n271, n272, n273, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n284, n285, n286,
         n287, n288, n289, n290, n291, n292, n293, n294, n295, n296;
  wire   [1:0] wr_ptr;
  wire   [2:0] count;
  wire   [63:0] FIFO_MEM;
  wire   [1:0] rd_ptr;

  DFFRXLTS count_reg_0_ ( .D(n127), .CK(clk_wr), .RN(n279), .Q(count[0]), .QN(
        n202) );
  DFFRXLTS count_reg_1_ ( .D(n125), .CK(clk_wr), .RN(n279), .Q(count[1]), .QN(
        n278) );
  DFFRXLTS count_reg_2_ ( .D(n126), .CK(clk_wr), .RN(n279), .Q(count[2]) );
  DFFRXLTS FIFO_MEM_reg_1__0_ ( .D(n108), .CK(clk_wr), .RN(n279), .Q(
        FIFO_MEM[16]) );
  DFFRXLTS FIFO_MEM_reg_1__15_ ( .D(n107), .CK(clk_wr), .RN(n280), .Q(
        FIFO_MEM[31]) );
  DFFRXLTS FIFO_MEM_reg_1__14_ ( .D(n106), .CK(clk_wr), .RN(n280), .Q(
        FIFO_MEM[30]) );
  DFFRXLTS FIFO_MEM_reg_1__13_ ( .D(n105), .CK(clk_wr), .RN(n280), .Q(
        FIFO_MEM[29]) );
  DFFRXLTS FIFO_MEM_reg_1__12_ ( .D(n104), .CK(clk_wr), .RN(n280), .Q(
        FIFO_MEM[28]) );
  DFFRXLTS FIFO_MEM_reg_1__11_ ( .D(n103), .CK(clk_wr), .RN(n281), .Q(
        FIFO_MEM[27]) );
  DFFRXLTS FIFO_MEM_reg_1__10_ ( .D(n102), .CK(clk_wr), .RN(n281), .Q(
        FIFO_MEM[26]) );
  DFFRXLTS FIFO_MEM_reg_1__9_ ( .D(n101), .CK(clk_wr), .RN(n281), .Q(
        FIFO_MEM[25]) );
  DFFRXLTS FIFO_MEM_reg_1__8_ ( .D(n100), .CK(clk_wr), .RN(n281), .Q(
        FIFO_MEM[24]) );
  DFFRXLTS FIFO_MEM_reg_1__7_ ( .D(n99), .CK(clk_wr), .RN(n282), .Q(
        FIFO_MEM[23]) );
  DFFRXLTS FIFO_MEM_reg_1__6_ ( .D(n98), .CK(clk_wr), .RN(n282), .Q(
        FIFO_MEM[22]) );
  DFFRXLTS FIFO_MEM_reg_1__5_ ( .D(n97), .CK(clk_wr), .RN(n282), .Q(
        FIFO_MEM[21]) );
  DFFRXLTS FIFO_MEM_reg_1__4_ ( .D(n96), .CK(clk_wr), .RN(n282), .Q(
        FIFO_MEM[20]) );
  DFFRXLTS FIFO_MEM_reg_1__3_ ( .D(n95), .CK(clk_wr), .RN(n283), .Q(
        FIFO_MEM[19]) );
  DFFRXLTS FIFO_MEM_reg_1__2_ ( .D(n94), .CK(clk_wr), .RN(n283), .Q(
        FIFO_MEM[18]) );
  DFFRXLTS FIFO_MEM_reg_1__1_ ( .D(n93), .CK(clk_wr), .RN(n283), .Q(
        FIFO_MEM[17]) );
  DFFRXLTS FIFO_MEM_reg_0__0_ ( .D(n124), .CK(clk_wr), .RN(n283), .Q(
        FIFO_MEM[0]) );
  DFFRXLTS FIFO_MEM_reg_0__15_ ( .D(n123), .CK(clk_wr), .RN(n284), .Q(
        FIFO_MEM[15]) );
  DFFRXLTS FIFO_MEM_reg_0__14_ ( .D(n122), .CK(clk_wr), .RN(n284), .Q(
        FIFO_MEM[14]) );
  DFFRXLTS FIFO_MEM_reg_0__13_ ( .D(n121), .CK(clk_wr), .RN(n284), .Q(
        FIFO_MEM[13]) );
  DFFRXLTS FIFO_MEM_reg_0__12_ ( .D(n120), .CK(clk_wr), .RN(n284), .Q(
        FIFO_MEM[12]) );
  DFFRXLTS FIFO_MEM_reg_0__11_ ( .D(n119), .CK(clk_wr), .RN(n285), .Q(
        FIFO_MEM[11]) );
  DFFRXLTS FIFO_MEM_reg_0__10_ ( .D(n118), .CK(clk_wr), .RN(n285), .Q(
        FIFO_MEM[10]) );
  DFFRXLTS FIFO_MEM_reg_0__9_ ( .D(n117), .CK(clk_wr), .RN(n285), .Q(
        FIFO_MEM[9]) );
  DFFRXLTS FIFO_MEM_reg_0__8_ ( .D(n116), .CK(clk_wr), .RN(n285), .Q(
        FIFO_MEM[8]) );
  DFFRXLTS FIFO_MEM_reg_0__7_ ( .D(n115), .CK(clk_wr), .RN(n286), .Q(
        FIFO_MEM[7]) );
  DFFRXLTS FIFO_MEM_reg_0__6_ ( .D(n114), .CK(clk_wr), .RN(n286), .Q(
        FIFO_MEM[6]) );
  DFFRXLTS FIFO_MEM_reg_0__5_ ( .D(n113), .CK(clk_wr), .RN(n286), .Q(
        FIFO_MEM[5]) );
  DFFRXLTS FIFO_MEM_reg_0__4_ ( .D(n112), .CK(clk_wr), .RN(n286), .Q(
        FIFO_MEM[4]) );
  DFFRXLTS FIFO_MEM_reg_0__3_ ( .D(n111), .CK(clk_wr), .RN(n287), .Q(
        FIFO_MEM[3]) );
  DFFRXLTS FIFO_MEM_reg_0__2_ ( .D(n110), .CK(clk_wr), .RN(n287), .Q(
        FIFO_MEM[2]) );
  DFFRXLTS FIFO_MEM_reg_0__1_ ( .D(n109), .CK(clk_wr), .RN(n287), .Q(
        FIFO_MEM[1]) );
  DFFRXLTS FIFO_MEM_reg_2__0_ ( .D(n92), .CK(clk_wr), .RN(n287), .Q(
        FIFO_MEM[32]) );
  DFFRXLTS FIFO_MEM_reg_2__15_ ( .D(n91), .CK(clk_wr), .RN(n288), .Q(
        FIFO_MEM[47]) );
  DFFRXLTS FIFO_MEM_reg_2__14_ ( .D(n90), .CK(clk_wr), .RN(n288), .Q(
        FIFO_MEM[46]) );
  DFFRXLTS FIFO_MEM_reg_2__13_ ( .D(n89), .CK(clk_wr), .RN(n288), .Q(
        FIFO_MEM[45]) );
  DFFRXLTS FIFO_MEM_reg_2__12_ ( .D(n88), .CK(clk_wr), .RN(n288), .Q(
        FIFO_MEM[44]) );
  DFFRXLTS FIFO_MEM_reg_2__11_ ( .D(n87), .CK(clk_wr), .RN(n289), .Q(
        FIFO_MEM[43]) );
  DFFRXLTS FIFO_MEM_reg_2__10_ ( .D(n86), .CK(clk_wr), .RN(n289), .Q(
        FIFO_MEM[42]) );
  DFFRXLTS FIFO_MEM_reg_2__9_ ( .D(n85), .CK(clk_wr), .RN(n289), .Q(
        FIFO_MEM[41]) );
  DFFRXLTS FIFO_MEM_reg_2__8_ ( .D(n84), .CK(clk_wr), .RN(n289), .Q(
        FIFO_MEM[40]) );
  DFFRXLTS FIFO_MEM_reg_2__7_ ( .D(n83), .CK(clk_wr), .RN(n290), .Q(
        FIFO_MEM[39]) );
  DFFRXLTS FIFO_MEM_reg_2__6_ ( .D(n82), .CK(clk_wr), .RN(n290), .Q(
        FIFO_MEM[38]) );
  DFFRXLTS FIFO_MEM_reg_2__5_ ( .D(n81), .CK(clk_wr), .RN(n290), .Q(
        FIFO_MEM[37]) );
  DFFRXLTS FIFO_MEM_reg_2__4_ ( .D(n80), .CK(clk_wr), .RN(n290), .Q(
        FIFO_MEM[36]) );
  DFFRXLTS FIFO_MEM_reg_2__3_ ( .D(n79), .CK(clk_wr), .RN(n291), .Q(
        FIFO_MEM[35]) );
  DFFRXLTS FIFO_MEM_reg_2__2_ ( .D(n78), .CK(clk_wr), .RN(n291), .Q(
        FIFO_MEM[34]) );
  DFFRXLTS FIFO_MEM_reg_2__1_ ( .D(n77), .CK(clk_wr), .RN(n291), .Q(
        FIFO_MEM[33]) );
  DFFRXLTS FIFO_MEM_reg_3__0_ ( .D(n76), .CK(clk_wr), .RN(n291), .Q(
        FIFO_MEM[48]) );
  DFFRXLTS FIFO_MEM_reg_3__15_ ( .D(n75), .CK(clk_wr), .RN(n292), .Q(
        FIFO_MEM[63]) );
  DFFRXLTS FIFO_MEM_reg_3__14_ ( .D(n74), .CK(clk_wr), .RN(n292), .Q(
        FIFO_MEM[62]) );
  DFFRXLTS FIFO_MEM_reg_3__13_ ( .D(n73), .CK(clk_wr), .RN(n292), .Q(
        FIFO_MEM[61]) );
  DFFRXLTS FIFO_MEM_reg_3__12_ ( .D(n72), .CK(clk_wr), .RN(n292), .Q(
        FIFO_MEM[60]) );
  DFFRXLTS FIFO_MEM_reg_3__11_ ( .D(n71), .CK(clk_wr), .RN(n293), .Q(
        FIFO_MEM[59]) );
  DFFRXLTS FIFO_MEM_reg_3__10_ ( .D(n70), .CK(clk_wr), .RN(n293), .Q(
        FIFO_MEM[58]) );
  DFFRXLTS FIFO_MEM_reg_3__9_ ( .D(n69), .CK(clk_wr), .RN(n293), .Q(
        FIFO_MEM[57]) );
  DFFRXLTS FIFO_MEM_reg_3__8_ ( .D(n68), .CK(clk_wr), .RN(n293), .Q(
        FIFO_MEM[56]) );
  DFFRXLTS FIFO_MEM_reg_3__7_ ( .D(n67), .CK(clk_wr), .RN(n294), .Q(
        FIFO_MEM[55]) );
  DFFRXLTS FIFO_MEM_reg_3__6_ ( .D(n66), .CK(clk_wr), .RN(n294), .Q(
        FIFO_MEM[54]) );
  DFFRXLTS FIFO_MEM_reg_3__5_ ( .D(n65), .CK(clk_wr), .RN(n294), .Q(
        FIFO_MEM[53]) );
  DFFRXLTS FIFO_MEM_reg_3__4_ ( .D(n64), .CK(clk_wr), .RN(n294), .Q(
        FIFO_MEM[52]) );
  DFFRXLTS FIFO_MEM_reg_3__3_ ( .D(n63), .CK(clk_wr), .RN(n295), .Q(
        FIFO_MEM[51]) );
  DFFRXLTS FIFO_MEM_reg_3__2_ ( .D(n62), .CK(clk_wr), .RN(n295), .Q(
        FIFO_MEM[50]) );
  DFFRXLTS FIFO_MEM_reg_3__1_ ( .D(n61), .CK(clk_wr), .RN(n295), .Q(
        FIFO_MEM[49]) );
  DFFRXLTS wr_ptr_reg_0_ ( .D(n60), .CK(clk_wr), .RN(n295), .Q(wr_ptr[0]) );
  DFFRXLTS wr_ptr_reg_1_ ( .D(n59), .CK(clk_wr), .RN(n296), .Q(wr_ptr[1]), 
        .QN(n277) );
  DFFRX2TS rd_ptr_reg_0_ ( .D(n58), .CK(clk_rd), .RN(n296), .Q(rd_ptr[0]), 
        .QN(n275) );
  DFFRX2TS rd_ptr_reg_1_ ( .D(n57), .CK(clk_rd), .RN(n296), .Q(rd_ptr[1]), 
        .QN(n276) );
  OR2X1TS U148 ( .A(n275), .B(n276), .Y(n128) );
  OR2X1TS U149 ( .A(rd_ptr[0]), .B(n276), .Y(n129) );
  OR2X1TS U150 ( .A(rd_ptr[0]), .B(rd_ptr[1]), .Y(n130) );
  INVX2TS U151 ( .A(n153), .Y(n131) );
  INVX2TS U152 ( .A(n131), .Y(n132) );
  INVX2TS U153 ( .A(n131), .Y(n133) );
  INVX2TS U154 ( .A(n269), .Y(n134) );
  INVX2TS U155 ( .A(n134), .Y(n135) );
  INVX2TS U156 ( .A(n134), .Y(n136) );
  INVX2TS U157 ( .A(n266), .Y(n137) );
  INVX2TS U158 ( .A(n137), .Y(n138) );
  INVX2TS U159 ( .A(n137), .Y(n139) );
  INVX2TS U160 ( .A(n215), .Y(n140) );
  INVX2TS U161 ( .A(n140), .Y(n141) );
  INVX2TS U162 ( .A(n140), .Y(n142) );
  INVX2TS U163 ( .A(n130), .Y(n143) );
  INVX2TS U164 ( .A(n130), .Y(n144) );
  INVX2TS U165 ( .A(n130), .Y(n145) );
  INVX2TS U166 ( .A(n130), .Y(n146) );
  INVX2TS U167 ( .A(n140), .Y(n147) );
  INVX2TS U168 ( .A(n147), .Y(n148) );
  INVX2TS U169 ( .A(n147), .Y(n149) );
  INVX2TS U170 ( .A(n147), .Y(n150) );
  INVX2TS U171 ( .A(n147), .Y(n151) );
  INVX2TS U172 ( .A(n264), .Y(n152) );
  INVX2TS U173 ( .A(n152), .Y(n153) );
  INVX2TS U174 ( .A(n152), .Y(n154) );
  INVX2TS U175 ( .A(n134), .Y(n155) );
  INVX2TS U176 ( .A(n134), .Y(n156) );
  INVX2TS U177 ( .A(n137), .Y(n157) );
  INVX2TS U178 ( .A(n137), .Y(n158) );
  INVX2TS U179 ( .A(n128), .Y(n159) );
  INVX2TS U180 ( .A(n128), .Y(n160) );
  INVX2TS U181 ( .A(n128), .Y(n161) );
  INVX2TS U182 ( .A(n128), .Y(n162) );
  INVX2TS U183 ( .A(n129), .Y(n163) );
  INVX2TS U184 ( .A(n129), .Y(n164) );
  INVX2TS U185 ( .A(n129), .Y(n165) );
  INVX2TS U186 ( .A(n129), .Y(n166) );
  INVX2TS U187 ( .A(wr_data[0]), .Y(n167) );
  INVX2TS U188 ( .A(n167), .Y(n168) );
  INVX2TS U189 ( .A(wr_data[1]), .Y(n169) );
  INVX2TS U190 ( .A(n169), .Y(n170) );
  INVX2TS U191 ( .A(wr_data[2]), .Y(n171) );
  INVX2TS U192 ( .A(n171), .Y(n172) );
  INVX2TS U193 ( .A(wr_data[3]), .Y(n173) );
  INVX2TS U194 ( .A(n173), .Y(n174) );
  INVX2TS U195 ( .A(wr_data[4]), .Y(n175) );
  INVX2TS U196 ( .A(n175), .Y(n176) );
  INVX2TS U197 ( .A(wr_data[5]), .Y(n177) );
  INVX2TS U198 ( .A(n177), .Y(n178) );
  INVX2TS U199 ( .A(wr_data[6]), .Y(n179) );
  INVX2TS U200 ( .A(n179), .Y(n180) );
  INVX2TS U201 ( .A(wr_data[7]), .Y(n181) );
  INVX2TS U202 ( .A(n181), .Y(n182) );
  INVX2TS U203 ( .A(wr_data[8]), .Y(n183) );
  INVX2TS U204 ( .A(n183), .Y(n184) );
  INVX2TS U205 ( .A(wr_data[9]), .Y(n185) );
  INVX2TS U206 ( .A(n185), .Y(n186) );
  INVX2TS U207 ( .A(wr_data[10]), .Y(n187) );
  INVX2TS U208 ( .A(n187), .Y(n188) );
  INVX2TS U209 ( .A(wr_data[11]), .Y(n189) );
  INVX2TS U210 ( .A(n189), .Y(n190) );
  INVX2TS U211 ( .A(wr_data[12]), .Y(n191) );
  INVX2TS U212 ( .A(n191), .Y(n192) );
  INVX2TS U213 ( .A(wr_data[13]), .Y(n193) );
  INVX2TS U214 ( .A(n193), .Y(n194) );
  INVX2TS U215 ( .A(wr_data[14]), .Y(n195) );
  INVX2TS U216 ( .A(n195), .Y(n196) );
  INVX2TS U217 ( .A(wr_data[15]), .Y(n197) );
  INVX2TS U218 ( .A(n197), .Y(n198) );
  INVX2TS U219 ( .A(wr_en), .Y(n199) );
  INVX2TS U220 ( .A(n199), .Y(n200) );
  INVX2TS U221 ( .A(n199), .Y(n201) );
  INVX2TS U222 ( .A(n202), .Y(n203) );
  AOI32X1TS U223 ( .A0(n203), .A1(count[1]), .A2(n200), .B0(n278), .B1(n262), 
        .Y(n125) );
  CLKBUFX2TS U224 ( .A(n138), .Y(n265) );
  INVX2TS U225 ( .A(n265), .Y(n204) );
  INVX2TS U226 ( .A(n265), .Y(n205) );
  INVX2TS U227 ( .A(n265), .Y(n206) );
  INVX2TS U228 ( .A(n265), .Y(n207) );
  CLKBUFX2TS U229 ( .A(n132), .Y(n263) );
  INVX2TS U230 ( .A(n263), .Y(n208) );
  INVX2TS U231 ( .A(n263), .Y(n209) );
  INVX2TS U232 ( .A(n263), .Y(n210) );
  CLKBUFX2TS U233 ( .A(n135), .Y(n268) );
  INVX2TS U234 ( .A(n268), .Y(n211) );
  INVX2TS U235 ( .A(n268), .Y(n212) );
  INVX2TS U236 ( .A(n268), .Y(n213) );
  INVX2TS U237 ( .A(n268), .Y(n214) );
  OR2X1TS U238 ( .A(n272), .B(n277), .Y(n271) );
  INVX2TS U239 ( .A(n271), .Y(n215) );
  INVX2TS U240 ( .A(n271), .Y(n216) );
  INVX2TS U241 ( .A(n271), .Y(n217) );
  OR2X1TS U242 ( .A(rd_ptr[1]), .B(n275), .Y(n258) );
  INVX2TS U243 ( .A(n258), .Y(n218) );
  INVX2TS U244 ( .A(n258), .Y(n219) );
  INVX2TS U245 ( .A(n258), .Y(n220) );
  INVX2TS U246 ( .A(n258), .Y(n221) );
  INVX2TS U247 ( .A(rst), .Y(n227) );
  CLKBUFX2TS U248 ( .A(n227), .Y(n223) );
  CLKBUFX2TS U249 ( .A(n223), .Y(n222) );
  CLKBUFX2TS U250 ( .A(n222), .Y(n296) );
  CLKBUFX2TS U251 ( .A(n222), .Y(n295) );
  CLKBUFX2TS U252 ( .A(n227), .Y(n226) );
  CLKBUFX2TS U253 ( .A(n226), .Y(n224) );
  CLKBUFX2TS U254 ( .A(n224), .Y(n279) );
  CLKBUFX2TS U255 ( .A(n222), .Y(n294) );
  CLKBUFX2TS U256 ( .A(n224), .Y(n280) );
  CLKBUFX2TS U257 ( .A(n223), .Y(n293) );
  CLKBUFX2TS U258 ( .A(n224), .Y(n281) );
  CLKBUFX2TS U259 ( .A(n223), .Y(n225) );
  CLKBUFX2TS U260 ( .A(n225), .Y(n292) );
  CLKBUFX2TS U261 ( .A(n226), .Y(n282) );
  CLKBUFX2TS U262 ( .A(n223), .Y(n291) );
  CLKBUFX2TS U263 ( .A(n225), .Y(n290) );
  CLKBUFX2TS U264 ( .A(n224), .Y(n284) );
  CLKBUFX2TS U265 ( .A(n225), .Y(n289) );
  CLKBUFX2TS U266 ( .A(n226), .Y(n285) );
  CLKBUFX2TS U267 ( .A(n225), .Y(n288) );
  CLKBUFX2TS U268 ( .A(n226), .Y(n287) );
  NOR3BX1TS U269 ( .AN(count[2]), .B(count[0]), .C(count[1]), .Y(full) );
  NOR3XLTS U270 ( .A(count[0]), .B(count[1]), .C(count[2]), .Y(empty) );
  CLKBUFX2TS U271 ( .A(n227), .Y(n283) );
  CLKBUFX2TS U272 ( .A(n227), .Y(n286) );
  AOI22X1TS U273 ( .A0(FIFO_MEM[31]), .A1(n218), .B0(FIFO_MEM[63]), .B1(n159), 
        .Y(n229) );
  AOI22X1TS U274 ( .A0(FIFO_MEM[15]), .A1(n143), .B0(FIFO_MEM[47]), .B1(n163), 
        .Y(n228) );
  NAND2X1TS U275 ( .A(n229), .B(n228), .Y(rd_data[15]) );
  AOI22X1TS U276 ( .A0(FIFO_MEM[30]), .A1(n219), .B0(FIFO_MEM[62]), .B1(n160), 
        .Y(n231) );
  AOI22X1TS U277 ( .A0(FIFO_MEM[14]), .A1(n144), .B0(FIFO_MEM[46]), .B1(n164), 
        .Y(n230) );
  NAND2X1TS U278 ( .A(n231), .B(n230), .Y(rd_data[14]) );
  AOI22X1TS U279 ( .A0(FIFO_MEM[29]), .A1(n220), .B0(FIFO_MEM[61]), .B1(n161), 
        .Y(n233) );
  AOI22X1TS U280 ( .A0(FIFO_MEM[13]), .A1(n145), .B0(FIFO_MEM[45]), .B1(n165), 
        .Y(n232) );
  NAND2X1TS U281 ( .A(n233), .B(n232), .Y(rd_data[13]) );
  AOI22X1TS U282 ( .A0(FIFO_MEM[28]), .A1(n221), .B0(FIFO_MEM[60]), .B1(n162), 
        .Y(n235) );
  AOI22X1TS U283 ( .A0(FIFO_MEM[12]), .A1(n146), .B0(FIFO_MEM[44]), .B1(n166), 
        .Y(n234) );
  NAND2X1TS U284 ( .A(n235), .B(n234), .Y(rd_data[12]) );
  AOI22X1TS U285 ( .A0(FIFO_MEM[27]), .A1(n218), .B0(FIFO_MEM[59]), .B1(n159), 
        .Y(n237) );
  AOI22X1TS U286 ( .A0(FIFO_MEM[11]), .A1(n143), .B0(FIFO_MEM[43]), .B1(n163), 
        .Y(n236) );
  NAND2X1TS U287 ( .A(n237), .B(n236), .Y(rd_data[11]) );
  AOI22X1TS U288 ( .A0(FIFO_MEM[26]), .A1(n219), .B0(FIFO_MEM[58]), .B1(n160), 
        .Y(n239) );
  AOI22X1TS U289 ( .A0(FIFO_MEM[10]), .A1(n144), .B0(FIFO_MEM[42]), .B1(n164), 
        .Y(n238) );
  NAND2X1TS U290 ( .A(n239), .B(n238), .Y(rd_data[10]) );
  AOI22X1TS U291 ( .A0(FIFO_MEM[25]), .A1(n220), .B0(FIFO_MEM[57]), .B1(n161), 
        .Y(n241) );
  AOI22X1TS U292 ( .A0(FIFO_MEM[9]), .A1(n145), .B0(FIFO_MEM[41]), .B1(n165), 
        .Y(n240) );
  NAND2X1TS U293 ( .A(n241), .B(n240), .Y(rd_data[9]) );
  AOI22X1TS U294 ( .A0(FIFO_MEM[24]), .A1(n221), .B0(FIFO_MEM[56]), .B1(n162), 
        .Y(n243) );
  AOI22X1TS U295 ( .A0(FIFO_MEM[8]), .A1(n146), .B0(FIFO_MEM[40]), .B1(n166), 
        .Y(n242) );
  NAND2X1TS U296 ( .A(n243), .B(n242), .Y(rd_data[8]) );
  AOI22X1TS U297 ( .A0(FIFO_MEM[23]), .A1(n218), .B0(FIFO_MEM[55]), .B1(n159), 
        .Y(n245) );
  AOI22X1TS U298 ( .A0(FIFO_MEM[7]), .A1(n143), .B0(FIFO_MEM[39]), .B1(n163), 
        .Y(n244) );
  NAND2X1TS U299 ( .A(n245), .B(n244), .Y(rd_data[7]) );
  AOI22X1TS U300 ( .A0(FIFO_MEM[22]), .A1(n219), .B0(FIFO_MEM[54]), .B1(n160), 
        .Y(n247) );
  AOI22X1TS U301 ( .A0(FIFO_MEM[6]), .A1(n144), .B0(FIFO_MEM[38]), .B1(n164), 
        .Y(n246) );
  NAND2X1TS U302 ( .A(n247), .B(n246), .Y(rd_data[6]) );
  AOI22X1TS U303 ( .A0(FIFO_MEM[21]), .A1(n220), .B0(FIFO_MEM[53]), .B1(n161), 
        .Y(n249) );
  AOI22X1TS U304 ( .A0(FIFO_MEM[5]), .A1(n145), .B0(FIFO_MEM[37]), .B1(n165), 
        .Y(n248) );
  NAND2X1TS U305 ( .A(n249), .B(n248), .Y(rd_data[5]) );
  AOI22X1TS U306 ( .A0(FIFO_MEM[20]), .A1(n221), .B0(FIFO_MEM[52]), .B1(n162), 
        .Y(n251) );
  AOI22X1TS U307 ( .A0(FIFO_MEM[4]), .A1(n146), .B0(FIFO_MEM[36]), .B1(n166), 
        .Y(n250) );
  NAND2X1TS U308 ( .A(n251), .B(n250), .Y(rd_data[4]) );
  AOI22X1TS U309 ( .A0(FIFO_MEM[19]), .A1(n218), .B0(FIFO_MEM[51]), .B1(n159), 
        .Y(n253) );
  AOI22X1TS U310 ( .A0(FIFO_MEM[3]), .A1(n143), .B0(FIFO_MEM[35]), .B1(n163), 
        .Y(n252) );
  NAND2X1TS U311 ( .A(n253), .B(n252), .Y(rd_data[3]) );
  AOI22X1TS U312 ( .A0(FIFO_MEM[18]), .A1(n219), .B0(FIFO_MEM[50]), .B1(n160), 
        .Y(n255) );
  AOI22X1TS U313 ( .A0(FIFO_MEM[2]), .A1(n144), .B0(FIFO_MEM[34]), .B1(n164), 
        .Y(n254) );
  NAND2X1TS U314 ( .A(n255), .B(n254), .Y(rd_data[2]) );
  AOI22X1TS U315 ( .A0(FIFO_MEM[17]), .A1(n220), .B0(FIFO_MEM[49]), .B1(n161), 
        .Y(n257) );
  AOI22X1TS U316 ( .A0(FIFO_MEM[1]), .A1(n145), .B0(FIFO_MEM[33]), .B1(n165), 
        .Y(n256) );
  NAND2X1TS U317 ( .A(n257), .B(n256), .Y(rd_data[1]) );
  AOI22X1TS U318 ( .A0(FIFO_MEM[16]), .A1(n221), .B0(FIFO_MEM[48]), .B1(n162), 
        .Y(n260) );
  AOI22X1TS U319 ( .A0(FIFO_MEM[0]), .A1(n146), .B0(FIFO_MEM[32]), .B1(n166), 
        .Y(n259) );
  NAND2X1TS U320 ( .A(n260), .B(n259), .Y(rd_data[0]) );
  NOR2BX1TS U321 ( .AN(n200), .B(full), .Y(n270) );
  AOI2BB2XLTS U322 ( .B0(n203), .B1(n200), .A0N(n270), .A1N(n203), .Y(n127) );
  NAND3XLTS U323 ( .A(count[0]), .B(count[1]), .C(n201), .Y(n261) );
  XNOR2X1TS U324 ( .A(count[2]), .B(n261), .Y(n126) );
  NAND2X1TS U325 ( .A(count[0]), .B(n201), .Y(n262) );
  INVX2TS U326 ( .A(n270), .Y(n267) );
  NOR3XLTS U327 ( .A(wr_ptr[0]), .B(wr_ptr[1]), .C(n267), .Y(n264) );
  AO22XLTS U328 ( .A0(n154), .A1(n168), .B0(n152), .B1(FIFO_MEM[0]), .Y(n124)
         );
  AO22XLTS U329 ( .A0(n132), .A1(n198), .B0(n208), .B1(FIFO_MEM[15]), .Y(n123)
         );
  AO22XLTS U330 ( .A0(n264), .A1(n196), .B0(n209), .B1(FIFO_MEM[14]), .Y(n122)
         );
  AO22XLTS U331 ( .A0(n133), .A1(n194), .B0(n210), .B1(FIFO_MEM[13]), .Y(n121)
         );
  AO22XLTS U332 ( .A0(n154), .A1(n192), .B0(n131), .B1(FIFO_MEM[12]), .Y(n120)
         );
  AO22XLTS U333 ( .A0(n153), .A1(n190), .B0(n208), .B1(FIFO_MEM[11]), .Y(n119)
         );
  AO22XLTS U334 ( .A0(n264), .A1(n188), .B0(n209), .B1(FIFO_MEM[10]), .Y(n118)
         );
  AO22XLTS U335 ( .A0(n132), .A1(n186), .B0(n210), .B1(FIFO_MEM[9]), .Y(n117)
         );
  AO22XLTS U336 ( .A0(n154), .A1(n184), .B0(n131), .B1(FIFO_MEM[8]), .Y(n116)
         );
  AO22XLTS U337 ( .A0(n133), .A1(n182), .B0(n208), .B1(FIFO_MEM[7]), .Y(n115)
         );
  AO22XLTS U338 ( .A0(n153), .A1(n180), .B0(n209), .B1(FIFO_MEM[6]), .Y(n114)
         );
  AO22XLTS U339 ( .A0(n133), .A1(n178), .B0(n210), .B1(FIFO_MEM[5]), .Y(n113)
         );
  AO22XLTS U340 ( .A0(n154), .A1(n176), .B0(n152), .B1(FIFO_MEM[4]), .Y(n112)
         );
  AO22XLTS U341 ( .A0(n133), .A1(n174), .B0(n208), .B1(FIFO_MEM[3]), .Y(n111)
         );
  AO22XLTS U342 ( .A0(n153), .A1(n172), .B0(n209), .B1(FIFO_MEM[2]), .Y(n110)
         );
  AO22XLTS U343 ( .A0(n132), .A1(n170), .B0(n210), .B1(FIFO_MEM[1]), .Y(n109)
         );
  NAND2X1TS U344 ( .A(n270), .B(wr_ptr[0]), .Y(n272) );
  NOR2XLTS U345 ( .A(wr_ptr[1]), .B(n272), .Y(n266) );
  AO22XLTS U346 ( .A0(n138), .A1(n168), .B0(n204), .B1(FIFO_MEM[16]), .Y(n108)
         );
  AO22XLTS U347 ( .A0(n157), .A1(n198), .B0(n205), .B1(FIFO_MEM[31]), .Y(n107)
         );
  AO22XLTS U348 ( .A0(n158), .A1(n196), .B0(n206), .B1(FIFO_MEM[30]), .Y(n106)
         );
  AO22XLTS U349 ( .A0(n139), .A1(n194), .B0(n207), .B1(FIFO_MEM[29]), .Y(n105)
         );
  AO22XLTS U350 ( .A0(n266), .A1(n192), .B0(n204), .B1(FIFO_MEM[28]), .Y(n104)
         );
  AO22XLTS U351 ( .A0(n157), .A1(n190), .B0(n205), .B1(FIFO_MEM[27]), .Y(n103)
         );
  AO22XLTS U352 ( .A0(n158), .A1(n188), .B0(n206), .B1(FIFO_MEM[26]), .Y(n102)
         );
  AO22XLTS U353 ( .A0(n138), .A1(n186), .B0(n207), .B1(FIFO_MEM[25]), .Y(n101)
         );
  AO22XLTS U354 ( .A0(n139), .A1(n184), .B0(n204), .B1(FIFO_MEM[24]), .Y(n100)
         );
  AO22XLTS U355 ( .A0(n157), .A1(n182), .B0(n205), .B1(FIFO_MEM[23]), .Y(n99)
         );
  AO22XLTS U356 ( .A0(n158), .A1(n180), .B0(n206), .B1(FIFO_MEM[22]), .Y(n98)
         );
  AO22XLTS U357 ( .A0(n139), .A1(n178), .B0(n207), .B1(FIFO_MEM[21]), .Y(n97)
         );
  AO22XLTS U358 ( .A0(n139), .A1(n176), .B0(n204), .B1(FIFO_MEM[20]), .Y(n96)
         );
  AO22XLTS U359 ( .A0(n157), .A1(n174), .B0(n205), .B1(FIFO_MEM[19]), .Y(n95)
         );
  AO22XLTS U360 ( .A0(n158), .A1(n172), .B0(n206), .B1(FIFO_MEM[18]), .Y(n94)
         );
  AO22XLTS U361 ( .A0(n138), .A1(n170), .B0(n207), .B1(FIFO_MEM[17]), .Y(n93)
         );
  NOR3XLTS U362 ( .A(wr_ptr[0]), .B(n267), .C(n277), .Y(n269) );
  AO22XLTS U363 ( .A0(n135), .A1(n168), .B0(n211), .B1(FIFO_MEM[32]), .Y(n92)
         );
  AO22XLTS U364 ( .A0(n155), .A1(n198), .B0(n212), .B1(FIFO_MEM[47]), .Y(n91)
         );
  AO22XLTS U365 ( .A0(n156), .A1(n196), .B0(n213), .B1(FIFO_MEM[46]), .Y(n90)
         );
  AO22XLTS U366 ( .A0(n136), .A1(n194), .B0(n214), .B1(FIFO_MEM[45]), .Y(n89)
         );
  AO22XLTS U367 ( .A0(n269), .A1(n192), .B0(n211), .B1(FIFO_MEM[44]), .Y(n88)
         );
  AO22XLTS U368 ( .A0(n155), .A1(n190), .B0(n212), .B1(FIFO_MEM[43]), .Y(n87)
         );
  AO22XLTS U369 ( .A0(n156), .A1(n188), .B0(n213), .B1(FIFO_MEM[42]), .Y(n86)
         );
  AO22XLTS U370 ( .A0(n135), .A1(n186), .B0(n214), .B1(FIFO_MEM[41]), .Y(n85)
         );
  AO22XLTS U371 ( .A0(n136), .A1(n184), .B0(n211), .B1(FIFO_MEM[40]), .Y(n84)
         );
  AO22XLTS U372 ( .A0(n155), .A1(n182), .B0(n212), .B1(FIFO_MEM[39]), .Y(n83)
         );
  AO22XLTS U373 ( .A0(n156), .A1(n180), .B0(n213), .B1(FIFO_MEM[38]), .Y(n82)
         );
  AO22XLTS U374 ( .A0(n136), .A1(n178), .B0(n214), .B1(FIFO_MEM[37]), .Y(n81)
         );
  AO22XLTS U375 ( .A0(n136), .A1(n176), .B0(n211), .B1(FIFO_MEM[36]), .Y(n80)
         );
  AO22XLTS U376 ( .A0(n155), .A1(n174), .B0(n212), .B1(FIFO_MEM[35]), .Y(n79)
         );
  AO22XLTS U377 ( .A0(n156), .A1(n172), .B0(n213), .B1(FIFO_MEM[34]), .Y(n78)
         );
  AO22XLTS U378 ( .A0(n135), .A1(n170), .B0(n214), .B1(FIFO_MEM[33]), .Y(n77)
         );
  AO22XLTS U379 ( .A0(n142), .A1(n168), .B0(n148), .B1(FIFO_MEM[48]), .Y(n76)
         );
  AO22XLTS U380 ( .A0(n215), .A1(n198), .B0(n149), .B1(FIFO_MEM[63]), .Y(n75)
         );
  AO22XLTS U381 ( .A0(n215), .A1(n196), .B0(n150), .B1(FIFO_MEM[62]), .Y(n74)
         );
  AO22XLTS U382 ( .A0(n215), .A1(n194), .B0(n151), .B1(FIFO_MEM[61]), .Y(n73)
         );
  AO22XLTS U383 ( .A0(n141), .A1(n192), .B0(n148), .B1(FIFO_MEM[60]), .Y(n72)
         );
  AO22XLTS U384 ( .A0(n216), .A1(n190), .B0(n149), .B1(FIFO_MEM[59]), .Y(n71)
         );
  AO22XLTS U385 ( .A0(n217), .A1(n188), .B0(n150), .B1(FIFO_MEM[58]), .Y(n70)
         );
  AO22XLTS U386 ( .A0(n142), .A1(n186), .B0(n151), .B1(FIFO_MEM[57]), .Y(n69)
         );
  AO22XLTS U387 ( .A0(n142), .A1(n184), .B0(n148), .B1(FIFO_MEM[56]), .Y(n68)
         );
  AO22XLTS U388 ( .A0(n216), .A1(n182), .B0(n149), .B1(FIFO_MEM[55]), .Y(n67)
         );
  AO22XLTS U389 ( .A0(n216), .A1(n180), .B0(n150), .B1(FIFO_MEM[54]), .Y(n66)
         );
  AO22XLTS U390 ( .A0(n216), .A1(n178), .B0(n151), .B1(FIFO_MEM[53]), .Y(n65)
         );
  AO22XLTS U391 ( .A0(n141), .A1(n176), .B0(n148), .B1(FIFO_MEM[52]), .Y(n64)
         );
  AO22XLTS U392 ( .A0(n217), .A1(n174), .B0(n149), .B1(FIFO_MEM[51]), .Y(n63)
         );
  AO22XLTS U393 ( .A0(n217), .A1(n172), .B0(n150), .B1(FIFO_MEM[50]), .Y(n62)
         );
  AO22XLTS U394 ( .A0(n217), .A1(n170), .B0(n151), .B1(FIFO_MEM[49]), .Y(n61)
         );
  OA21XLTS U395 ( .A0(n270), .A1(wr_ptr[0]), .B0(n272), .Y(n60) );
  AOI21X1TS U396 ( .A0(n272), .A1(n277), .B0(n141), .Y(n59) );
  NAND2BXLTS U397 ( .AN(empty), .B(rd_en), .Y(n273) );
  XNOR2X1TS U398 ( .A(rd_ptr[0]), .B(n273), .Y(n58) );
  NAND3BXLTS U399 ( .AN(empty), .B(rd_en), .C(rd_ptr[0]), .Y(n274) );
  XNOR2X1TS U400 ( .A(rd_ptr[1]), .B(n274), .Y(n57) );
endmodule

