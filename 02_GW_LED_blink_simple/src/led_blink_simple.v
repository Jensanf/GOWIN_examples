/***********************************************************************
 Name:           LED_blink_simple
 Description:    Testing the board's ability to work and blink with LEDs. 
 Dev.board:      DK-STAR-GW1N4 V1.1
 Device:         GW1N-9 [LV9LQ144c6/i5]
 Package:        LQFP144
 Author:         jensanf 
 Date:           15/04/2020
************************************************************************/

module LED_blink_simple (

    input       FPGA_CLK, 
    output[1:1] F_LED

);

reg [31:0] counter;
reg        LED_status;

initial begin
counter <= 32'b0;
LED_status <= 1'b0;
end

always @ (posedge FPGA_CLK) 
begin
counter <= counter + 1'b1;
if (counter > 50000000)
begin
LED_status <= !LED_status;
counter <= 32'b0;
end


end

assign F_LED[1] = LED_status;

endmodule : LED_blink_simple