//---------------------------------------------------------
//-- File generated by RobustVerilog parser
//-- Version: 1.0
//-- Invoked Fri Mar 25 23:36:55 2011
//--
//-- Source file: dma_core_channels_mux.v
//---------------------------------------------------------



module dma_axi64_core0_channels_mux(ch_fifo_rd_valid,fifo_rd_valid,ch_fifo_rdata,fifo_rdata,ch_periph_rx_clr,periph_rx_clr,ch_periph_tx_clr,periph_tx_clr,ch_rd_page_cross,ch_wr_page_cross,rd_page_cross,wr_page_cross,timeout_aw,timeout_w,timeout_ar,timeout_num_aw,timeout_num_w,timeout_num_ar,wdt_timeout,wdt_ch_num,ch_timeout_aw,ch_timeout_w,ch_timeout_ar,ch_wdt_timeout,joint_in_prog,joint_not_in_prog,joint_mux_in_prog,ch_joint_in_prog,ch_joint_not_in_prog,ch_joint_mux_in_prog,wr_cmd_pending,ch_wr_cmd_pending,rd_ch_num,rd_cmd_num,load_req_in_prog,rd_line_cmd,rd_go_next_line,rd_burst_start,rd_burst_addr,rd_burst_size,rd_tokens,rd_cmd_port,rd_periph_delay,rd_clr_valid,rd_cmd_split,rd_cmd_line,rd_clr_stall,ch_load_req_in_prog,ch_rd_line_cmd,ch_rd_go_next_line,ch_rd_burst_start,ch_rd_burst_addr,ch_rd_burst_size,ch_rd_tokens,ch_rd_port_num,ch_rd_periph_delay,ch_rd_clr_valid,ch_rd_cmd_split,ch_rd_cmd_line,ch_rd_clr_stall,load_wr_num,load_wr,ch_load_wr,ch_fifo_wr_num,rd_transfer_num,rd_clr_line_num,rd_transfer,rd_clr_line,fifo_wr,ch_rd_transfer,ch_rd_clr_line,ch_fifo_wr,rd_ch_num_resp,rd_slverr,rd_decerr,rd_clr,rd_clr_load,ch_rd_slverr,ch_rd_decerr,ch_rd_clr,ch_rd_clr_load,wr_ch_num,wr_cmd_num,wr_last_cmd,wr_line_cmd,wr_go_next_line,wr_burst_start,wr_burst_addr,wr_burst_size,wr_tokens,wr_cmd_port,wr_periph_delay,wr_clr_valid,wr_cmd_split,wr_clr_stall,ch_wr_last_cmd,ch_wr_line_cmd,ch_wr_go_next_line,ch_wr_burst_start,ch_wr_burst_addr,ch_wr_burst_size,ch_wr_tokens,ch_wr_port_num,ch_wr_periph_delay,ch_wr_clr_valid,ch_wr_cmd_split,ch_wr_clr_stall,ch_fifo_rd_num,wr_transfer_num,wr_clr_line_num,wr_transfer,wr_clr_line,fifo_rd,ch_fifo_wr_ready,ch_wr_transfer,ch_wr_clr_line,ch_fifo_rd,fifo_wr_ready,wr_ch_num_resp,wr_slverr,wr_decerr,wr_clr,wr_clr_last,ch_wr_slverr,ch_wr_decerr,ch_wr_clr_last,ch_wr_clr);

   //data
   input [7:0]               ch_fifo_rd_valid;
   output               fifo_rd_valid;
   input [8*64-1:0]    ch_fifo_rdata;
   output [64-1:0]     fifo_rdata;
   
   //periph
   input [8*31-1:0]           ch_periph_rx_clr;
   output [30:0]           periph_rx_clr;
   input [8*31-1:0]           ch_periph_tx_clr;
   output [30:0]           periph_tx_clr;

   output [7:0]           ch_rd_page_cross;
   output [7:0]           ch_wr_page_cross;
   input               rd_page_cross;
   input               wr_page_cross;
   
   //axim timeout
   input               timeout_aw;
   input               timeout_w;
   input               timeout_ar;
   input [2:0]               timeout_num_aw;
   input [2:0]               timeout_num_w;
   input [2:0]               timeout_num_ar;
   input               wdt_timeout;
   input [2:0]               wdt_ch_num;

   output [7:0]           ch_timeout_aw;
   output [7:0]           ch_timeout_w;
   output [7:0]           ch_timeout_ar;
   output [7:0]           ch_wdt_timeout;

   output               joint_in_prog;
   output               joint_not_in_prog;
   output               joint_mux_in_prog;
   input [7:0]               ch_joint_in_prog;
   input [7:0]               ch_joint_not_in_prog;
   input [7:0]               ch_joint_mux_in_prog;

   input               wr_cmd_pending;
   output [7:0]           ch_wr_cmd_pending;
   
   //rd cmd
   input [2:0]               rd_ch_num;
   input [2:0]               rd_cmd_num;
   
   output               load_req_in_prog;
   output               rd_line_cmd;
   output               rd_go_next_line;
   input               rd_burst_start;
   output [32-1:0]     rd_burst_addr;
   output [8-1:0]    rd_burst_size;
   output [`TOKEN_BITS-1:0]   rd_tokens;
   output               rd_cmd_port;
   output [`DELAY_BITS-1:0]   rd_periph_delay;    
   output               rd_clr_valid;
   input               rd_cmd_split;
   input               rd_cmd_line;
   output               rd_clr_stall; 
   
   input [7:0]               ch_load_req_in_prog;
   input [7:0]               ch_rd_line_cmd;
   input [7:0]               ch_rd_go_next_line;
   output [7:0]           ch_rd_burst_start;
   input [8*32-1:0]    ch_rd_burst_addr;
   input [8*8-1:0]   ch_rd_burst_size;
   input [8*`TOKEN_BITS-1:0]  ch_rd_tokens;
   input [7:0]               ch_rd_port_num;
   input [8*`DELAY_BITS-1:0]  ch_rd_periph_delay;
   input [7:0]               ch_rd_clr_valid;
   output [7:0]           ch_rd_cmd_split;
   output [7:0]           ch_rd_cmd_line;
   input [7:0]               ch_rd_clr_stall; 
   
   //rd data - load cmd
   input [2:0]               load_wr_num;
   
   input               load_wr;
   
   output [7:0]           ch_load_wr;
   
   //rd data
   input [2:0]               ch_fifo_wr_num;
   input [2:0]               rd_transfer_num;
   input [2:0]               rd_clr_line_num;
   
   input               rd_transfer;
   input               rd_clr_line;
   input               fifo_wr;
   
   output [7:0]           ch_rd_transfer;
   output [7:0]           ch_rd_clr_line;
   output [7:0]           ch_fifo_wr;
   
   //rd resp
   input [2:0]               rd_ch_num_resp;
   
   input               rd_slverr;
   input               rd_decerr;
   input               rd_clr;
   input               rd_clr_load;
   
   output [7:0]           ch_rd_slverr;
   output [7:0]           ch_rd_decerr;
   output [7:0]           ch_rd_clr;
   output [7:0]           ch_rd_clr_load;

   //wr cmd
   input [2:0]               wr_ch_num;
   input [2:0]               wr_cmd_num;
   
   output               wr_last_cmd;
   output               wr_line_cmd;
   output               wr_go_next_line;
   input               wr_burst_start;
   output [32-1:0]     wr_burst_addr;
   output [8-1:0]    wr_burst_size;
   output [`TOKEN_BITS-1:0]   wr_tokens;
   output               wr_cmd_port;    
   output [`DELAY_BITS-1:0]   wr_periph_delay;    
   output               wr_clr_valid;
   input               wr_cmd_split;
   output               wr_clr_stall; 
   
   input [7:0]               ch_wr_last_cmd;
   input [7:0]               ch_wr_line_cmd;
   input [7:0]               ch_wr_go_next_line;
   output [7:0]           ch_wr_burst_start;
   input [8*32-1:0]    ch_wr_burst_addr;
   input [8*8-1:0]   ch_wr_burst_size;
   input [8*`TOKEN_BITS-1:0]  ch_wr_tokens;
   input [7:0]               ch_wr_port_num;
   input [8*`DELAY_BITS-1:0]  ch_wr_periph_delay;
   input [7:0]               ch_wr_clr_valid;
   output [7:0]           ch_wr_cmd_split;
   input [7:0]               ch_wr_clr_stall; 
   
   //wr data
   input [2:0]               ch_fifo_rd_num;
   input [2:0]               wr_transfer_num;
   input [2:0]               wr_clr_line_num;
   
   input               wr_transfer;
   input               wr_clr_line;
   input               fifo_rd;
   input [7:0]               ch_fifo_wr_ready;
   
   output [7:0]           ch_wr_transfer;
   output [7:0]           ch_wr_clr_line;
   output [7:0]           ch_fifo_rd;
   output               fifo_wr_ready;
   
   //wr resp
   input [2:0]               wr_ch_num_resp;
   
   input               wr_slverr;
   input               wr_decerr;
   input               wr_clr;
   input               wr_clr_last;

   output [7:0]           ch_wr_slverr;
   output [7:0]           ch_wr_decerr;
   output [7:0]           ch_wr_clr_last;
   output [7:0]           ch_wr_clr;

   
   
   
   prgen_or8 #(1) 
   mux_2(.ch_x(ch_fifo_rd_valid),
     .x(fifo_rd_valid)
     );
   
   prgen_or8 #(64) 
   mux_3(.ch_x(ch_fifo_rdata),
     .x(fifo_rdata)
     );

   prgen_or8 #(31) 
   mux_4(.ch_x(ch_periph_rx_clr),
     .x(periph_rx_clr)
     );
   
   prgen_or8 #(31) 
   mux_5(.ch_x(ch_periph_tx_clr),
     .x(periph_tx_clr)
     );
   
   prgen_mux8 #(`DELAY_BITS) 
   mux_30(.sel(rd_ch_num),
      .ch_x(ch_rd_periph_delay),
      .x(rd_periph_delay)
      );
   
   prgen_mux8 #(`DELAY_BITS) 
   mux_51(.sel(wr_ch_num),
      .ch_x(ch_wr_periph_delay),
      .x(wr_periph_delay)
      );
   
   
   prgen_demux8 #(1) 
   mux_6(.sel(timeout_num_aw),
     .x(timeout_aw),
     .ch_x(ch_timeout_aw)
     );
   
   prgen_demux8 #(1) 
   mux_7(.sel(timeout_num_w),
     .x(timeout_w),
     .ch_x(ch_timeout_w)
     );
   
   prgen_demux8 #(1) 
   mux_8(.sel(timeout_num_ar),
     .x(timeout_ar),
     .ch_x(ch_timeout_ar)
     );
   
   prgen_demux8 #(1) 
   mux_9(.sel(wdt_ch_num),
     .x(wdt_timeout),
     .ch_x(ch_wdt_timeout)
     );

   prgen_or8 #(1) 
   mux_55(.ch_x(ch_joint_in_prog),
      .x(joint_in_prog)
      );
   
   prgen_or8 #(1) 
   mux_56(.ch_x(ch_joint_not_in_prog),
      .x(joint_not_in_prog)
      );
   
   prgen_or8 #(1) 
   mux_57(.ch_x(ch_joint_mux_in_prog),
      .x(joint_mux_in_prog)
      );
   
   prgen_demux8 #(1) 
   mux_60(.sel(wr_ch_num),
      .x(wr_cmd_pending),
      .ch_x(ch_wr_cmd_pending)
      );

   
   prgen_demux8 #(1) 
   mux_11(.sel(rd_ch_num),
      .x(rd_burst_start),
      .ch_x(ch_rd_burst_start)
      );
  
   prgen_demux8 #(1) 
   mux_13(.sel(load_wr_num),
      .x(load_wr),
      .ch_x(ch_load_wr)
      );
   
   assign               ch_rd_clr_line  = 'd0;
   assign               ch_rd_cmd_line  = 'd0;
   assign               rd_line_cmd     = 'd0;
   assign               rd_go_next_line = 'd0;
   assign               rd_clr_stall    = 'd0;
   assign               wr_clr_stall    = 'd0;
   assign               ch_wr_clr_line  = 'd0;
   assign               wr_line_cmd     = 'd0;
   assign               wr_go_next_line = 'd0;
   
   prgen_mux8 #(1) 
   mux_33(.sel(rd_ch_num),
      .ch_x(ch_rd_clr_valid),
      .x(rd_clr_valid)
      );

   prgen_mux8 #(1) 
   mux_53(.sel(wr_ch_num),
      .ch_x(ch_wr_clr_valid),
      .x(wr_clr_valid)
      );
   
   prgen_demux8 #(1) 
   mux_15(.sel(rd_transfer_num),
      .x(rd_transfer),
      .ch_x(ch_rd_transfer)
      );
   
   prgen_demux8 #(1) 
   mux_16(.sel(rd_ch_num_resp),
      .x(rd_slverr),
      .ch_x(ch_rd_slverr)
      );
   
   prgen_demux8 #(1) 
   mux_17(.sel(rd_ch_num_resp),
      .x(rd_decerr),
      .ch_x(ch_rd_decerr)
      );
   
   prgen_demux8 #(1) 
   mux_39(.sel(wr_ch_num_resp),
      .x(wr_decerr),
      .ch_x(ch_wr_decerr)
      );
   
   prgen_demux8 #(1) 
   mux_20(.sel(rd_cmd_num),
      .x(rd_cmd_split),
      .ch_x(ch_rd_cmd_split)
      );
   
   prgen_demux8 #(1) 
   mux_42(.sel(wr_cmd_num),
      .x(wr_cmd_split),
      .ch_x(ch_wr_cmd_split)
      );
   
   prgen_demux8 #(1) 
   mux_58(.sel(rd_ch_num),
      .x(rd_page_cross),
      .ch_x(ch_rd_page_cross)
      );
   
   prgen_demux8 #(1) 
   mux_59(.sel(wr_ch_num),
      .x(wr_page_cross),
      .ch_x(ch_wr_page_cross)
      );
   
   
   prgen_demux8 #(1) 
   mux_18(.sel(rd_ch_num_resp),
      .x(rd_clr),
      .ch_x(ch_rd_clr)
      );
   
   prgen_demux8 #(1) 
   mux_19(.sel(rd_ch_num_resp),
      .x(rd_clr_load),
      .ch_x(ch_rd_clr_load)
      );
   
   prgen_demux8 #(1) 
   mux_21(.sel(ch_fifo_rd_num),
      .x(fifo_rd),
      .ch_x(ch_fifo_rd)
      );
   
   prgen_mux8 #(1) 
   mux_23(.sel(rd_ch_num),
      .ch_x(ch_load_req_in_prog),
      .x(load_req_in_prog)
      );
   
   prgen_mux8 #(32) 
   mux_26(.sel(rd_ch_num),
      .ch_x(ch_rd_burst_addr),
      .x(rd_burst_addr)
      );
   
   prgen_mux8 #(8) 
   mux_27(.sel(rd_ch_num),
      .ch_x(ch_rd_burst_size),
      .x(rd_burst_size)
      );
   
   prgen_mux8 #(`TOKEN_BITS) 
   mux_28(.sel(rd_ch_num),
      .ch_x(ch_rd_tokens),
      .x(rd_tokens)
      );
   
   prgen_mux8 #(`TOKEN_BITS) 
   mux_49(.sel(wr_ch_num),
      .ch_x(ch_wr_tokens),
      .x(wr_tokens)
      );

   assign               rd_cmd_port = 'd0;
   assign               wr_cmd_port = 'd0;
   
   
   prgen_mux8 #(1) 
   mux_31(.sel(ch_fifo_rd_num),
      .ch_x(ch_fifo_wr_ready),
      .x(fifo_wr_ready)
      );
   
   prgen_demux8 #(1) 
   mux_34(.sel(wr_ch_num),
      .x(wr_burst_start),
      .ch_x(ch_wr_burst_start)
      );
   
   prgen_demux8 #(1) 
   mux_37(.sel(wr_transfer_num),
      .x(wr_transfer),
      .ch_x(ch_wr_transfer)
      );
   
   prgen_demux8 #(1) 
   mux_38(.sel(wr_ch_num_resp),
      .x(wr_slverr),
      .ch_x(ch_wr_slverr)
      );
   
   prgen_demux8 #(1) 
   mux_40(.sel(wr_ch_num_resp),
      .x(wr_clr),
      .ch_x(ch_wr_clr)
      );
   
   prgen_demux8 #(1) 
   mux_41(.sel(wr_ch_num_resp),
      .x(wr_clr_last),
      .ch_x(ch_wr_clr_last)
      );
      
   prgen_demux8 #(1) 
   mux_43(.sel(ch_fifo_wr_num),
      .x(fifo_wr),
      .ch_x(ch_fifo_wr)
      );
   
   prgen_mux8 #(1) 
   mux_44(.sel(wr_ch_num),
      .ch_x(ch_wr_last_cmd),
      .x(wr_last_cmd)
      );
      
   prgen_mux8 #(32) 
   mux_47(.sel(wr_ch_num),
      .ch_x(ch_wr_burst_addr),
      .x(wr_burst_addr)
      );
   
   prgen_mux8 #(8) 
   mux_48(.sel(wr_ch_num),
      .ch_x(ch_wr_burst_size),
      .x(wr_burst_size)
      );
        
   
   
endmodule



