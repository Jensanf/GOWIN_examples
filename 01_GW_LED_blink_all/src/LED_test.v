/***********************************************************************
 Name:           LED_blink_all_test
 Description:    Testing the board's ability to work and blink with LEDs. 
 Dev.board:      DK-STAR-GW1N4 V1.1
 Device:         GW1N-9 [LV9LQ144c6/i5]
 Package:        LQFP144
 Author:         jensanf [ source: DK-START-GW1N4_LED_blink ]
 Date:           15/04/2020
************************************************************************/

module LED_test(
        //clk / rst
		input FPGA_CLK,
		input FPGA_RST_N,
        //LED
		output[4:1] F_LED
);

reg[31:0] clk_cnt;
reg[4:1]  F_LED;

//LED

//50MHz
always @(posedge FPGA_CLK)
begin
  if(~FPGA_RST_N)
    clk_cnt <= 0;
  else if(clk_cnt < 50000001)
    clk_cnt <= clk_cnt + 1;
  else
    clk_cnt <= 0;
end

//50MHz
always @(posedge FPGA_CLK)
begin
  if(~FPGA_RST_N)
    F_LED[1] <= 1'b0;
  else if(clk_cnt > 50000000)
    F_LED[1] <= ~F_LED[1];
end  

//50MHz
always @(posedge FPGA_CLK)
begin
  if(~FPGA_RST_N)
    F_LED[2] <= 1'b0;
  else if(clk_cnt > 50000000)
    F_LED[2] <= ~F_LED[2];
end  

//50MHz
always @(posedge FPGA_CLK)
begin
  if(~FPGA_RST_N)
    F_LED[3] <= 1'b0;
  else if(clk_cnt > 50000000)
    F_LED[3] <= ~F_LED[3];
end  

//50MHz
always @(posedge FPGA_CLK)
begin
  if(~FPGA_RST_N)
    F_LED[4] <= 1'b0;
  else if(clk_cnt > 50000000)
    F_LED[4] <= ~F_LED[4];
end  


endmodule : LED_test
