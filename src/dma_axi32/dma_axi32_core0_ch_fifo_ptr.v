//---------------------------------------------------------
//-- File generated by RobustVerilog parser
//-- Version: 1.0
//-- Invoked Fri Mar 25 23:34:54 2011
//--
//-- Source file: dma_ch_fifo_ptr.v
//---------------------------------------------------------


  
module dma_axi32_core0_ch_fifo_ptr(clk,reset,joint_in_prog,wr_outstanding,ch_update,fifo_rd,fifo_rsize,slice_wr,slice_wr_fifo,slice_wsize,slice_rd,slice_rsize,rd_clr_line,wr_clr_line,wr_next_size,wr_burst_size,rd_ptr,wr_ptr,rd_line_remain,joint_delay,fifo_wr_ready,fifo_overflow,fifo_underflow);
   
   input               clk;
   input               reset;

   input               joint_in_prog;
   input               wr_outstanding;
   input               ch_update;
   input               fifo_rd;
   input [3-1:0]      fifo_rsize;
   input               slice_wr;
   input               slice_wr_fifo;
   input [3-1:0]      slice_wsize;
   input               slice_rd;
   input [3-1:0]      slice_rsize;
   input               rd_clr_line;
   input               wr_clr_line;
   input [3-1:0]      wr_next_size;
   input [7-1:0]     wr_burst_size;

   output [5-1:0]     rd_ptr;
   output [5-1:0]     wr_ptr;
   output [3-1:0]     rd_line_remain;
   output               joint_delay;
   output               fifo_wr_ready;
   output               fifo_overflow;
   output               fifo_underflow;
   

   wire [5-1:0]       rd_ptr_pre;
   wire [5-1:0]       wr_ptr_pre;
   reg [5-1:0]           rd_ptr;
   reg [5-1:0]           wr_ptr;
   wire [5+1:0]       fullness_pre; //signed
   reg [5+1:0]           fullness; //signed
   reg [3-1:0]           rd_line_remain;
   wire               joint_in_prog_d;
   reg                   joint_delay_reg;
   reg                   fifo_wr_ready;
   wire               fifo_overflow_pre;
   wire               fifo_underflow_pre;
   reg                   fifo_overflow;
   reg                   fifo_underflow;
   
   
   
   assign               wr_ptr_pre    = wr_ptr + ({3{slice_wr}} & slice_wsize);
   assign               rd_ptr_pre    = rd_ptr + ({3{slice_rd}} & slice_rsize);

   always @(posedge clk or posedge reset)
     if (reset)
       wr_ptr <= #1 {5{1'b0}};
     else if (ch_update)
       wr_ptr <= #1 {5{1'b0}};
     else if (slice_wr)
       wr_ptr <= #1 wr_ptr_pre;
   
   always @(posedge clk or posedge reset)
     if (reset)
       rd_ptr <= #1 {5{1'b0}};
     else if (ch_update)
       rd_ptr <= #1 {5{1'b0}};
     else if (slice_rd)
       rd_ptr <= #1 rd_ptr_pre;
   
   always @(posedge clk or posedge reset)
     if (reset)
       rd_line_remain <= #1 3'd4;
     else if (ch_update | wr_clr_line)
       rd_line_remain <= #1 3'd4;
     else if (slice_rd & (rd_line_remain == slice_rsize))
       rd_line_remain <= #1 3'd4;
     else if (slice_rd)
       rd_line_remain <= #1 rd_line_remain - slice_rsize;
       
     
   assign               fullness_pre = fullness + 
                  ({3{slice_wr}} & slice_wsize) - 
                ({3{fifo_rd}} & fifo_rsize);

   
   always @(posedge clk or posedge reset)
     if (reset)
       fullness <= #1 {5+2{1'b0}};
     else if (ch_update)
       fullness <= #1 {5+2{1'b0}};
     else if (fifo_rd | slice_wr)
       fullness <= #1 fullness_pre;

   
   
   prgen_delay #(1) delay_joint_in_prog (.clk(clk), .reset(reset), .din(joint_in_prog), .dout(joint_in_prog_d));
   
   always @(posedge clk or posedge reset)
     if (reset)
       joint_delay_reg <= #1 1'b0;
     else if (joint_in_prog & (~joint_in_prog_d))
       joint_delay_reg <= #1 fullness > 32 - 3'd4;
     else if (~joint_in_prog)
       joint_delay_reg <= #1 1'b0;

   assign               joint_delay = joint_delay_reg;
   
   always @(posedge clk or posedge reset)
     if (reset)
       fifo_wr_ready <= #1 1'b0;
     else if (joint_in_prog)
       fifo_wr_ready <= #1 1'b0;
     else if (|wr_next_size)
       fifo_wr_ready <= #1 fullness_pre >= wr_next_size;

   assign               fifo_underflow_pre = 
                              fullness[5+1];
   
   assign               fifo_overflow_pre  = (~fullness[5+1]) & (fullness[5:0] > 32);

   always @(posedge clk or posedge reset)
     if (reset)
       begin
      fifo_overflow  <= #1 1'b0;
      fifo_underflow <= #1 1'b0;
       end
     else if (ch_update)
       begin
      fifo_overflow  <= #1 1'b0;
      fifo_underflow <= #1 1'b0;
       end
     else if ((!fifo_overflow) & (!fifo_underflow))
       begin
      fifo_overflow  <= #1 fifo_overflow_pre;
      fifo_underflow <= #1 fifo_underflow_pre;
       end

          
endmodule
   






