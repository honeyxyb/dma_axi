//---------------------------------------------------------
//-- File generated by RobustVerilog parser
//-- Version: 1.0
//-- Invoked Fri Mar 25 23:34:52 2011
//--
//-- Source file: prgen_or.v
//---------------------------------------------------------


  
module prgen_or8(ch_x,x);

   parameter                  WIDTH      = 8;
   
   
   input [8*WIDTH-1:0]     ch_x;
   output [WIDTH-1:0]           x;
   

   assign x = 
        ch_x[WIDTH-1+WIDTH*0:WIDTH*0] |
        ch_x[WIDTH-1+WIDTH*1:WIDTH*1] |
        ch_x[WIDTH-1+WIDTH*2:WIDTH*2] |
        ch_x[WIDTH-1+WIDTH*3:WIDTH*3] |
        ch_x[WIDTH-1+WIDTH*4:WIDTH*4] |
        ch_x[WIDTH-1+WIDTH*5:WIDTH*5] |
        ch_x[WIDTH-1+WIDTH*6:WIDTH*6] |
        ch_x[WIDTH-1+WIDTH*7:WIDTH*7] ;
   
endmodule
   


