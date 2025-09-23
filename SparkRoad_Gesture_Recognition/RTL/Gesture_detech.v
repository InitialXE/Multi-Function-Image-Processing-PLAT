module Gesture_detech(
	//时钟
    input       			clk,
    input       			rst_n,
    //预处理图像数据
    input       			per_frame_vsync,  //预图像数据列有效信号  
    input       			per_frame_hsync,   //预图像数据行有效信号  
    input       			per_frame_clken,  //预图像数据输入使能效信号

	input           		per_img_Bit,
	output       			post_frame_vsync, //处理后的图像数据列有效信号   
    output       			post_frame_hsync,  //处理后的图像数据行有效信号   
    output       			post_frame_clken, //处理后的图像数据输出使能效信号
    
    output  reg [11:0]  	x_min,
    output  reg [11:0]  	x_max,
    output  reg [11:0]  	y_min,
    output  reg [11:0]  	y_max,
    output  reg [19:0] 		oDATA_length,//synthesis keep
    output  reg [19:0] 		oDATA_area,//synthesis keep
    output  reg [19:0] 		fingertip_data,//synthesis keep
    output  reg      		en
    
    
 );

parameter   ROW_CNT = 600;
parameter   COL_CNT = 500;
reg     [19:0]  oDATA_length_xmin;
reg     [19:0]  oDATA_length_xmax;
reg     [19:0]  oDATA_length_ymin;
reg     [19:0]  oDATA_length_ymax;
reg     [11:0]  cnt_x;
reg     [11:0]  cnt_y;
wire    row_flag;
reg [11:0]  x_min_r;
reg [11:0]  x_max_r;
reg [11:0]  y_min_r;
reg [11:0]  y_max_r;

wire flag ;//开始本帧数据
assign flag = (cnt_x == 200 && cnt_y == 100)? 1'b1:1'b0;



//行计数
always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        cnt_x <= 0;
    end
    else if(per_frame_clken && cnt_x == ROW_CNT - 1)
        cnt_x <= 0;
    else if(per_frame_clken)begin
        cnt_x <= cnt_x + 1'b1;
    end
    else 
        cnt_x <= cnt_x;
end

assign  row_flag = (per_frame_clken && cnt_x == ROW_CNT - 1'b1)? 1'b1:1'b0;

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

//x_min lag 2clk
always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        x_min_r <= ROW_CNT;
        oDATA_length_xmin<=0;
    end
    else if(flag)
    begin
        x_min_r <= ROW_CNT;
        oDATA_length_xmin<=0;
    end
    else if(per_frame_clken && per_img_Bit == 0 && x_min_r > cnt_x)
    begin
        x_min_r <= cnt_x;
        oDATA_length_xmin<=oDATA_length_xmin+1;
    end
    else 
        x_min_r <= x_min_r;
end


//x_max
always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        x_max_r <= 0;
        oDATA_length_xmax<=0;
    end
    else if(flag)
    begin
        x_max_r <= 0;
        oDATA_length_xmax<=0;
    end
    else if(per_frame_clken && per_img_Bit == 1 && x_max_r < cnt_x)
    begin
        x_max_r <= cnt_x;
        oDATA_length_xmax<=oDATA_length_xmax+1;
    end
    else 
        x_max_r <= x_max_r;
end

//y_min
always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        y_min_r <= COL_CNT;
        oDATA_length_ymin<=0;
    end
    else if(flag)
    begin
        y_min_r <= COL_CNT;
        oDATA_length_ymin<=0;
    end
    else if(per_frame_clken && per_img_Bit == 1 && y_min_r > cnt_y)
    begin
        y_min_r <= cnt_y;
        oDATA_length_ymin<=oDATA_length_ymin+1;
        end
    else 
        y_min_r <= y_min_r;
end
//y_max
always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        y_max_r <= 0;
        oDATA_length_ymax<=0;
    end
    else if(flag)
    begin
        y_max_r <= 0;
        oDATA_length_ymax<=0;
    end
    
    else if(per_frame_clken && per_img_Bit == 1 && y_max_r < cnt_y)
    begin
        y_max_r <= cnt_y;
        oDATA_length_ymax<=oDATA_length_ymax+1;
        end
    else 
        y_max_r <= y_max_r;
end

always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        x_min <= ROW_CNT;
        oDATA_length<=0;
        oDATA_area<=0;
        fingertip_data<=0;
        en<=0;
    end
    else if(per_frame_vsync)
    begin
           x_min<=x_min_r;
           y_min<=y_min_r;
           x_max<=x_max_r;
           y_max<=y_max_r;
           oDATA_length<=oDATA_length_ymin+oDATA_length_ymax+oDATA_length_xmax+oDATA_length_xmin;
           oDATA_area<=(x_max-x_min)*(y_max-y_min);
           fingertip_data<=oDATA_area/oDATA_length;
           en<=1;
    end
    else if (flag)
    begin
            oDATA_length<=0;
            oDATA_area<=0;
            fingertip_data<=0;
            en<=0;
            end    
end


endmodule
