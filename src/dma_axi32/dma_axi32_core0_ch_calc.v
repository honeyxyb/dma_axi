//---------------------------------------------------------
//-- File generated by RobustVerilog parser
//-- Version: 1.0
//-- Invoked Fri Mar 25 23:34:53 2011
//--
//-- Source file: dma_ch_calc.v
//---------------------------------------------------------


 
module dma_axi32_core0_ch_calc(clk,reset,load_in_prog,load_req_in_prog,load_addr,ch_update,ch_end,ch_end_flush,go_next_line,burst_start,incr,wr_cmd_pending,outs_empty,burst_max_size,start_addr,frame_width,x_size,x_remain,fifo_wr_ready,fifo_remain,burst_last,burst_addr,burst_size,burst_ready,single,joint_ready_out,joint_ready_in,joint_line_req_in,joint_line_req_out,joint_burst_req_in,joint_burst_req_out,joint_line_req_clr,joint,page_cross,joint_cross,joint_flush,joint_flush_in);

   parameter                READ = 0;
      
   parameter             SINGLE_SIZE   = 4;
   
   
   input             clk;
   input             reset;

   input             load_in_prog;
   input             load_req_in_prog;
   input [32-1:0]    load_addr;
   
   input             ch_update;
   input             ch_end;
   input             ch_end_flush;
   input             go_next_line;
   input             burst_start;
   input             incr;

   input             wr_cmd_pending;
   input             outs_empty;
   input [7-1:0]   burst_max_size;
   input [32-1:0]    start_addr;
   input [`FRAME_BITS-1:0]  frame_width;
   input [`X_BITS-1:0]         x_size;
   input [10-1:0]    x_remain;
   input             fifo_wr_ready;
   input [5:0]         fifo_remain;

   output             burst_last;
   output [32-1:0]   burst_addr;
   output [7-1:0]  burst_size;
   output             burst_ready;
   output             single;

   output             joint_ready_out;
   input             joint_ready_in;
   input             joint_line_req_in;
   output             joint_line_req_out;
   input             joint_burst_req_in;
   output             joint_burst_req_out;
   input             joint_line_req_clr;
   input             joint;
   input             page_cross;
   input             joint_cross;
   output             joint_flush;
   input             joint_flush_in;
   


   wire             ch_update_d;
   wire             ch_update_d2;
   wire             ch_update_d3;
   
   //outputs of calc_addr
   wire [32-1:0]     burst_addr;
   
   //outputs of calc_size
   wire [7-1:0]    burst_size;
   
   reg                 single;
   

   
   prgen_delay #(1) delay_calc0(.clk(clk), .reset(reset), .din(ch_update), .dout(ch_update_d));
   prgen_delay #(1) delay_calc1(.clk(clk), .reset(reset), .din(ch_update_d), .dout(ch_update_d2));
   prgen_delay #(1) delay_calc2(.clk(clk), .reset(reset), .din(ch_update_d2), .dout(ch_update_d3));

   
   always @(posedge clk or posedge reset)
     if (reset)
       single <= #1 1'b0;
     else if (burst_start)
       single <= #1 (burst_size <= SINGLE_SIZE);

           
   dma_axi32_core0_ch_calc_addr
   dma_axi32_ch_calc_addr (
            .clk(clk),
            .reset(reset),
            .ch_update_d(ch_update_d),
            .load_in_prog(load_in_prog),
            .load_addr(load_addr),
            .go_next_line(go_next_line),
            .burst_start(burst_start),
            .incr(incr),
            .start_addr(start_addr),
            .frame_width(frame_width),
            .x_size(x_size),
            .burst_size(burst_size),
            .burst_addr(burst_addr)
            );

   
   dma_axi32_core0_ch_calc_size #(.READ(READ))
   dma_axi32_ch_calc_size (
            .clk(clk),
            .reset(reset),
            .ch_update(ch_update),
            .ch_update_d(ch_update_d),
            .ch_update_d2(ch_update_d2),
            .ch_update_d3(ch_update_d3),
            .ch_end(ch_end),
            .ch_end_flush(ch_end_flush),
            .joint_line_req_clr(joint_line_req_clr),
            .wr_cmd_pending(wr_cmd_pending),
            .outs_empty(outs_empty),
            .load_in_prog(load_in_prog),
            .load_req_in_prog(load_req_in_prog),
            .burst_start(burst_start),
            .burst_addr(burst_addr),
            .burst_max_size(burst_max_size),
            .x_remain(x_remain),
            .fifo_wr_ready(fifo_wr_ready),
            .fifo_remain(fifo_remain),
            .burst_size(burst_size),
            .burst_ready(burst_ready),
            .burst_last(burst_last),
            .joint_ready_out(joint_ready_out),
            .joint_ready_in(joint_ready_in),
            .joint_line_req_in(joint_line_req_in),
            .joint_line_req_out(joint_line_req_out),
            .joint_burst_req_in(joint_burst_req_in),
            .joint_burst_req_out(joint_burst_req_out),
            .joint(joint),
            .page_cross(page_cross),
            .joint_cross(joint_cross),
            .joint_flush(joint_flush),
            .joint_flush_in(joint_flush_in)
            );

   
   

endmodule


  



