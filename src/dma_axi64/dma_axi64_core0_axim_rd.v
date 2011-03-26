//---------------------------------------------------------
//-- File generated by RobustVerilog parser
//-- Version: 1.0
//-- Invoked Fri Mar 25 23:36:54 2011
//--
//-- Source file: dma_core_axim_rd.v
//---------------------------------------------------------



module dma_axi64_core0_axim_rd(clk,reset,load_wr,load_wr_num,load_wr_cycle,load_wdata,joint_stall,joint_req,rd_line_cmd,load_req_in_prog,rd_cmd_port,rd_ch_num,rd_burst_start,rd_burst_addr,rd_burst_size,rd_cmd_pending,rd_cmd_split,rd_cmd_line,rd_cmd_num,rd_cmd_full,ch_fifo_wr,ch_fifo_wdata,ch_fifo_wsize,ch_fifo_wr_num,rd_transfer_num,rd_transfer,rd_transfer_size,rd_burst_cmd,rd_clr_line,rd_clr_line_num,rd_slverr,rd_decerr,rd_clr,rd_clr_load,rd_clr_last,rd_ch_num_resp,page_cross,ARADDR,ARPORT,ARLEN,ARSIZE,ARVALID,ARREADY,AWVALID,RDATA,RRESP,RLAST,RVALID,RREADY_out,axim_timeout_ar,axim_timeout_num_ar);

   input               clk;
   input               reset;
   
   output               load_wr;
   output [2:0]           load_wr_num;
   output [1:0]           load_wr_cycle;
   output [64-1:0]     load_wdata;

   input               joint_stall;
   input               joint_req;
   
   //command
   input               rd_line_cmd;
   input               load_req_in_prog;
   input               rd_cmd_port;
   input [2:0]               rd_ch_num;
   input               rd_burst_start;
   input [32-1:0]      rd_burst_addr;
   input [8-1:0]     rd_burst_size;
   output               rd_cmd_pending;
   output               rd_cmd_split;
   output               rd_cmd_line;
   output [2:0]           rd_cmd_num;
   output               rd_cmd_full;
   
   //data
   output               ch_fifo_wr;
   output [64-1:0]     ch_fifo_wdata;
   output [4-1:0]     ch_fifo_wsize;
   output [2:0]           ch_fifo_wr_num;
   output [2:0]           rd_transfer_num;
   output               rd_transfer;
   output [4-1:0]     rd_transfer_size;
   output               rd_burst_cmd;
   output               rd_clr_line;
   output [2:0]           rd_clr_line_num;

   //resp
   output               rd_slverr;
   output               rd_decerr;
   output               rd_clr;
   output               rd_clr_load;
   output               rd_clr_last;
   output [2:0]           rd_ch_num_resp;

   output               page_cross;
   
   output [32-1:0]     ARADDR;
   output               ARPORT;
   output [`LEN_BITS-1:0]     ARLEN;
   output [1:0]           ARSIZE;
   output               ARVALID;
   input               ARREADY;
   input               AWVALID;
   
   input [64-1:0]      RDATA;
   input [1:0]               RRESP;
   input               RLAST;
   input               RVALID;
   output               RREADY_out;
   
   output               axim_timeout_ar;
   output [2:0]           axim_timeout_num_ar;


   wire [`CMD_BITS-1:0]       ARID;
   wire               RVALID_d;
   wire [`CMD_BITS-1:0]          RID;
   reg [64-1:0]           RDATA_d;
   reg [1:0]               RRESP_d;
   reg                   RLAST_d;
   reg [4-1:0]           rd_transfer_size;

   wire               rd_clr_pre;
   wire               RREADY;
   
   
              
   //don't give peripheral clr on cmd read
   assign               rd_clr      = rd_clr_pre & (~rd_clr_last);
   assign               rd_clr_load = rd_clr_pre & rd_clr_last;
   
   prgen_delay #(1) delay_ready(.clk(clk), .reset(reset), .din(RREADY_out), .dout(RREADY));
   
   prgen_delay #(1) delay_rvalid(.clk(clk), .reset(reset), .din(RVALID), .dout(RVALID_d));
   
   always @(posedge clk or posedge reset)
     if (reset)
       begin
      RRESP_d <= #1 2'b00;
      RDATA_d <= #1 {64{1'b0}};
      RLAST_d <= #1 1'b0;
       end
     else if (RVALID)
       begin
      RRESP_d <= #1 RRESP;
      RDATA_d <= #1 RDATA;
      RLAST_d <= #1 RLAST;
       end
   
   always @(/*AUTOSENSE*/RID)
     begin
    case (RID[5:4])
      2'b00 : rd_transfer_size = 4'd1;
      2'b01 : rd_transfer_size = 4'd2;
      2'b10 : rd_transfer_size = 4'd4;
      2'b11 : rd_transfer_size = 4'd8;
    endcase
     end
   
   
   dma_axi64_core0_axim_cmd
   dma_axi64_axim_rcmd (
             .clk(clk),
             .reset(reset),
             .end_line_cmd(rd_line_cmd),
             .extra_bit(load_req_in_prog),
             .cmd_port(rd_cmd_port),
             .ch_num(rd_ch_num),
             .joint_req(joint_req),
             .burst_start(rd_burst_start),
             .burst_addr(rd_burst_addr),
             .burst_size(rd_burst_size),
             .cmd_pending(rd_cmd_pending),
             .cmd_full(rd_cmd_full),
             .cmd_split(rd_cmd_split),
             .cmd_num(rd_cmd_num),
             .cmd_line(rd_cmd_line),
             .page_cross(page_cross),
             .AID(ARID),
             .AADDR(ARADDR),
             .APORT(ARPORT),
             .ALEN(ARLEN),
             .ASIZE(ARSIZE),
             .AVALID(ARVALID),
             .AREADY(ARREADY),
             .AWVALID(AWVALID),
             .AJOINT(),
             .axim_timeout_num(axim_timeout_num_ar),
             .axim_timeout(axim_timeout_ar)
             );
   
   
   dma_axi64_core0_axim_rdata
   dma_axi64_axim_rdata (
              .clk(clk),
              .reset(reset),
              .load_wr(load_wr),
              .load_wr_num(load_wr_num),
              .load_wr_cycle(load_wr_cycle),
              .load_wdata(load_wdata),
              .joint_stall(joint_stall),
              .ch_fifo_wr(ch_fifo_wr),
              .ch_fifo_wdata(ch_fifo_wdata),
              .ch_fifo_wsize(ch_fifo_wsize),
              .ch_fifo_wr_num(ch_fifo_wr_num),
              .rd_transfer_num(rd_transfer_num),
              .rd_transfer(rd_transfer),
              .rd_transfer_size(rd_transfer_size),
              .rd_clr_line(rd_clr_line),
              .rd_clr_line_num(rd_clr_line_num),
              .rd_burst_cmd(rd_burst_cmd),
              .ARVALID(ARVALID),
              .ARREADY(ARREADY),
              .ARID(ARID),
              .RID(RID),
              .RDATA(RDATA_d),
              .RLAST(RLAST_d),
              .RVALID(RVALID_d),
              .RREADY(RREADY),
              .RREADY_out(RREADY_out)
              );

   
   dma_axi64_core0_axim_resp #(.CMD_DEPTH(4))
   dma_axi64_axim_rresp (
              .clk(clk),
              .reset(reset),
              .slverr(rd_slverr),
              .decerr(rd_decerr),
              .clr(rd_clr_pre),
              .clr_last(rd_clr_last),
              .ch_num_resp(rd_ch_num_resp),
              .resp_full(rd_cmd_full),
              .AID(ARID),
              .AVALID(ARVALID),
              .AREADY(ARREADY),
              .ID(RID),
              .RESP(RRESP_d),
              .VALID(RVALID_d),
              .READY(RREADY),
              .LAST(RLAST_d)
              );

   
endmodule

   



