/***********************************************************************
 Name:           LED_button
 Description:    Pushing button - LED_D3 is ON, LED_D4 inverted 
 Dev.board:      DK-STAR-GW1N4 V1.1
 Device:         GW1N-9 [LV9LQ144c6/i5]
 Package:        LQFP144
 Author:         jensanf
 Date:           16/04/2020
************************************************************************/

module LED_button(

    output[2:1] F_LED,       

    input[1:1] F_KEY  

);        
 
reg[2:1] F_LED;           

wire[1:1] F_KEY;       

always @ (F_KEY[1])  
begin
    F_LED[1]=F_KEY[1];    
    F_LED[2]=1'b0; //Hold LED D2 off (low)
                   //other states are
                   //1'b1 HIGH 
                   //1'b0 LOW
                   //1'bz HiZ (input)
end

endmodule : LED_button