`ifndef AXI_ATOP_FILTER_SV
`define AXI_ATOP_FILTER_SV

module axi_atop_filter #(
  parameter int unsigned AxiIdWidth = 0,
  parameter int unsigned AxiMaxWriteTxns = 0,
  parameter type axi_req_t  = logic,
  parameter type axi_resp_t = logic
) (
  input  logic      clk_i,
  input  logic      rst_ni,
  input  axi_req_t  slv_req_i,
  output axi_resp_t slv_resp_o,
  output axi_req_t  mst_req_o,
  input  axi_resp_t mst_resp_i
);
  localparam int unsigned COUNTER_WIDTH = (AxiMaxWriteTxns == 1) ? 2 : $clog2(AxiMaxWriteTxns+1);
  typedef struct packed {
    logic                     underflow;
    logic [COUNTER_WIDTH-1:0] cnt;
  } cnt_t;
  cnt_t w_cnt_d;
  cnt_t w_cnt_q;

  typedef enum logic [2:0] {
    W_RESET, W_FEEDTHROUGH, BLOCK_AW, ABSORB_W, HOLD_B, INJECT_B, WAIT_R
  } w_state_e;
  w_state_e w_state_d, w_state_q;

  typedef enum logic [1:0] { R_RESET, R_FEEDTHROUGH, INJECT_R, R_HOLD} r_state_e;
  r_state_e r_state_d, r_state_q;

  typedef logic [AxiIdWidth-1:0] id_t;
  id_t id_d, id_q;

  typedef logic [7:0] len_t;
  len_t r_beats_d, r_beats_q;

  typedef struct packed {
    len_t len;
  } r_resp_cmd_t;
  r_resp_cmd_t r_resp_cmd_push, r_resp_cmd_pop;

  logic aw_without_complete_w_downstream,
        complete_w_downstream,
        r_resp_cmd_push_valid, r_resp_cmd_pop_valid,
        r_resp_cmd_push_ready, r_resp_cmd_pop_ready;

  assign aw_without_complete_w_downstream = !w_cnt_q.underflow && (w_cnt_q.cnt > 0);
  assign complete_w_downstream = !w_cnt_q.underflow && (&w_cnt_q.cnt);

  always_comb begin
    
  end

endmodule

`endif