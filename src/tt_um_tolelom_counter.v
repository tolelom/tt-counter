/*
 * Copyright (c) 2026 tolelom
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_tolelom_counter (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.

  reg [7:0] count;                 // 기억하는 칸: 8비트 숫자 하나를 담아 둠

  always @(posedge clk) begin      // 클록이 올라가는 순간에만 아래를 실행
    if (!rst_n)
      count <= 8'd0;               // 리셋 중이면 0 을 담음
    else
      count <= count + 8'd1;       // 아니면 지금 값에 1 을 더해 담음
  end

  assign uo_out = count;           // 출력 핀은 그 칸의 값을 그대로 내보냄

  assign uio_out = 0;
  assign uio_oe  = 0;

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, ui_in, uio_in, 1'b0};

endmodule
