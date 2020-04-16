/***********************************************************************
 Name:           LED_blink_all_test
 Description:    Switch SW4-SW7 to control1 16 grade LED brightness   
 Dev.board:      DK-STAR-GW1N4 V1.1
 Device:         GW1N-9 [LV9LQ144c6/i5]
 Package:        LQFP144
 Author:         jensanf
 Date:           15/04/2020
************************************************************************/

module LED_PWM(
    input FPGA_CLK,
    input [4:1] F_SW,     // 16 intensity levels
    output [1:1] F_LED
);

reg [4:0] PWM;

always @(posedge FPGA_CLK) PWM <= PWM[3:0] + F_SW;

assign F_LED[1] = PWM[4];


endmodule : LED_PWM