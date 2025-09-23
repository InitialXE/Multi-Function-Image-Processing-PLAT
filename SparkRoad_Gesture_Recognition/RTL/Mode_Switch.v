module Mode_Switch( 
	input 		wire			clk,
    input 		wire			rst_n,
    input		wire [15:0]			Switch,
    output 		[15:0]			Led,
    output 	reg [3:0]			mode
);


reg	[15:0]	led_state;

assign  Led = led_state;

always@(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
    	led_state <= 16'hffff;
        mode <= 4'd0;
    end	
	else begin	
    	if(Switch[0] == 1&&Switch[1] == 0&&Switch[2] == 0&&Switch[3] == 0&&Switch[4] == 0&&Switch[5] == 0)	begin	
        	led_state <= 16'hfffe;
            mode  <= 4'd1;
        end	
        else if(Switch[0] == 1&&Switch[1] == 1&&Switch[2] == 0&&Switch[3] == 0&&Switch[4] == 0&&Switch[5] == 0)	begin	
        	led_state <= 16'hfffd;
            mode  <= 4'd2;
        end	
        else if(Switch[0] == 1&&Switch[1] == 1&&Switch[2] == 1&&Switch[3] == 0&&Switch[4] == 0&&Switch[5] == 0)	begin		
        	led_state <= 16'hfffb;
            mode  <= 4'd4;
        end	
        else if(Switch[0] == 1&&Switch[1] == 1&&Switch[2] == 1&&Switch[3] == 1&&Switch[4] == 0&&Switch[5] == 0)	begin	
        	led_state <= 16'hfff7;
            mode  <= 4'd5;
        end	
        else if(Switch[0] == 1&&Switch[1] == 1&&Switch[2] == 1&&Switch[3] == 1&&Switch[4] == 1&&Switch[5] == 0)	begin	
        	led_state <= 16'hffef;
            mode  <= 4'd3;
        end	
        /*else if(Switch[0] == 1&&Switch[1] == 1&&Switch[2] == 1&&Switch[3] == 1&&Switch[4] == 1&&Switch[5] == 1)	begin
        	led_state <= 16'hffdf;
            mode  <= 4'd6;
        end*/	  
        else begin	
           led_state <= 16'hffff;
           mode  <= 4'd0;
        end	
    end	
    
end	

endmodule
