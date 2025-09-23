module image_select(
	input 					clk,
    input 					rst_n,
  	input		[3:0]		mode,

	
    
    input		[15:0]		original_image,
    input               	original_clk,    

    input		[15:0]		Gray_rgb565_img,
    input               	Gary_clk,
    
    
    input		[15:0]		Median_img_gray_565,
    input               	Median_Gray_clk,
    
    input		[15:0]		Sobel_img_565,
    input               	Sobel_clk,
    
    input		[15:0]		Sobel_Erosion_img_565,
    input               	Sobel_Erosion_clk,	
    
    input		[15:0]		Sobel_Erosion_Dilation_img_565,
    input               	Sobel_Erosion_Dilation_clk,	
    
    output	 reg[15:0]		show_data,    
    output	 reg            show_clk
 );

parameter   ROW_CNT = 800;
parameter   COL_CNT = 600;      //800lie  600行
reg     [11:0]  cnt_x;
reg     [11:0]  cnt_y;

wire   flag ;//开始本帧数据
assign flag = (cnt_x == 150 && cnt_y == 50)? 1'b1:1'b0;

wire	display_number_area =	(cnt_x >= 150 && cnt_x <=  450) && (cnt_y >= 50 && cnt_y <= 350); //64
//行计数 
always @(posedge clk or negedge rst_n)begin  
    if(rst_n == 1'b0)begin
        cnt_x <= 0;
    end
    else if(Sobel_Erosion_Dilation_clk && cnt_x == ROW_CNT - 1)
        cnt_x <= 0;
    else if(Sobel_Erosion_Dilation_clk)begin
        cnt_x <= cnt_x + 1'b1;
    end
    else 
        cnt_x <= cnt_x;
end

assign  row_flag = (Sobel_Erosion_Dilation_clk && cnt_x == ROW_CNT - 1'b1)? 1'b1:1'b0;

//cnt_y
always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        cnt_y <= 0;
    end
    else if(row_flag  &&  cnt_y == COL_CNT - 1'b1)
        cnt_y <= 0;
    else if(row_flag)begin
        cnt_y <= cnt_y + 1'b1;
    end
    else 
        cnt_y <= cnt_y;
end


always @ (original_clk or Gary_clk or Median_Gray_clk or Sobel_clk or Sobel_Erosion_clk or Sobel_Erosion_Dilation_clk) begin
    	case(mode)
        	4'd0:begin	
            	show_data = original_image;
                show_clk  = original_clk;
            end	
            4'd1:begin
            	show_data <= Gray_rgb565_img;
                show_clk  <= Gary_clk;
            end	
            4'd2:begin
            	show_data <= Median_img_gray_565;
                show_clk  <= Median_Gray_clk;
            end	
            4'd3:begin
                if(display_number_area)
                begin
                    show_data <= Sobel_img_565;
                    show_clk  <= Sobel_clk;
                end
                else   
                begin
                    show_data <= original_image;
                    show_clk  <= Sobel_clk; 
                end 
            end
            4'd4:begin
            	show_data <= Sobel_Erosion_img_565;
                show_clk  <= Sobel_Erosion_clk;
            end	
    		4'd5:begin
                if(display_number_area)
                begin
                    show_data <= Sobel_Erosion_Dilation_img_565;
                    show_clk  <= Sobel_Erosion_Dilation_clk;
                end
                else   
                begin
                    show_data <= original_image;
                    show_clk  <= Sobel_Erosion_Dilation_clk; 
                end 
            end	
        endcase
end

endmodule
