/***********************************************************************
 Name:           LED_blink_step
 Description:    Blinking LEds step by step. 
 Dev.board:      DK-STAR-GW1N4 V1.1
 Device:         GW1N-9 [LV9LQ144c6/i5]
 Package:        LQFP144
 Author:         jensanf [ source: SUG100-2.2E_Gowin YunYuan Software User Guide ]
 Date:           16/04/2020
************************************************************************/

module LED_blink_step (

    input FPGA_CLK,
    input FPGA_RST_N,

    output[4:1] F_LED
);

reg[4:1]    F_LED;
reg[24:0]   cnt;
reg         clk_led;

always@(posedge FPGA_CLK or negedge FPGA_RST_N) begin
    if (!FPGA_RST_N) begin
        clk_led <= 1'b0;
        cnt <= 25'd0;
    end
    else begin
        if (cnt == 25'd2499_9999) begin
            clk_led <= ~clk_led;
            cnt <= 25'd0;
        end
        else begin
            cnt <= cnt + 25'd1;
        end
    end
end

always@(posedge clk_led or negedge FPGA_RST_N) begin
    if(!FPGA_RST_N) begin
        F_LED <= 4'h1;
    end
    else begin
        F_LED <= {F_LED[3:1],F_LED[4]};
    end
end
endmodule : LED_blink_step