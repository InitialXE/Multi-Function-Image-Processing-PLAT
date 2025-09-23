module Gesture_detch(
    input       clk,
    input       rst_n,

    //预处理图像数据
    input       per_frame_vsync,  //预图像数据列有效信号  
    input       per_frame_hsync,   //预图像数据行有效信号  
    input       per_frame_clken,  //预图像数据输入使能效信号

    input       per_img_Bit,        //SOBEL图像

    output  reg [11:0]  x_min,
    output  reg [11:0]  x_max,
    output  reg [11:0]  y_min,
    output  reg [11:0]  y_max,
    output reg [19:0] length,
    output reg [19:0] area,
    output reg         en,
    output reg [19:0] fingertip_data
 );

parameter   ROW_CNT = 800;
parameter   COL_CNT = 600;
reg     [19:0]  length_xmin;
reg     [19:0]  length_xmax;
reg     [19:0]  length_ymin;
reg     [19:0]  length_ymax;


reg     [11:0]  cnt_x;
reg     [11:0]  cnt_y;

wire        row_flag;
reg [11:0]  x_min_r;
reg [11:0]  x_max_r;
reg [11:0]  y_min_r;
reg [11:0]  y_max_r;

wire flag ;//开始本帧数据
assign flag = (cnt_x == 150 && cnt_y == 50)? 1'b1:1'b0;


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


wire	display_number_area =	(cnt_x >= 150 && cnt_x <=  450) && (cnt_y >= 50 && cnt_y <= 350); //64

wire   end_flag ;//synthesis keep   
assign end_flag = (cnt_x == 450 && cnt_y == 350)? 1'b1:1'b0;

always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        x_min_r <= 450;
        length_xmin<=0;
    end
    else if(flag)
    begin
        x_min_r <= 450;
        length_xmin<=0;
    end
    else if(per_frame_clken && per_img_Bit == 1 && x_min_r > cnt_x && display_number_area)
    begin
        x_min_r <= cnt_x;
        length_xmin<=length_xmin+1;
    end
    else 
        x_min_r <= x_min_r;
end
//x_max
always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        x_max_r <= 0;
        length_xmax<=0;
    end
    else if(flag)
    begin
        x_max_r <= 0;
        length_xmax<=0;
    end
    else if(per_frame_clken && per_img_Bit == 1 && x_max_r < cnt_x && display_number_area)
    begin
        x_max_r <= cnt_x;
        length_xmax <= length_xmax+1;
    end
    else 
        x_max_r <= x_max_r;
end
//y_min
always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        y_min_r <= 350;
        length_ymin<=0;
    end
    else if(flag)
    begin
        y_min_r <= 350;
        length_ymin<=0;
    end
    else if(per_frame_clken && per_img_Bit == 1 && y_min_r > cnt_y && display_number_area)
    begin
        y_min_r <= cnt_y;
        length_ymin <= length_ymin+1;
        end
    else 
        y_min_r <= y_min_r;
end
//y_max
always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        y_max_r <= 0;
        length_ymax<=0;
    end
    else if(flag)
    begin
        y_max_r <= 0;
        length_ymax<=0;
    end
    
    else if(per_frame_clken && per_img_Bit == 1 && y_max_r < cnt_y && display_number_area)
    begin
        y_max_r <= cnt_y;
        length_ymax <= length_ymax+1;
        end
    else 
        y_max_r <= y_max_r;
end
always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        x_min <= 450;
        x_max <= 0;
        y_max <= 0;
        y_min <= 350;
        length<=0;
        area<=0;
        fingertip_data<=0;
        en<=0;
    end
    else if(end_flag)
    begin
           x_min  <= x_min_r;
           y_min  <= y_min_r;
           x_max  <= x_max_r;
           y_max  <= y_max_r;
           length <= length_ymin + length_ymax + length_xmax + length_xmin;
           area<= (x_max-x_min)*(y_max-y_min);
           fingertip_data<= area/length;
           en<=1;
    end
    else if (flag)
    begin
            length<=0;
            area<=0;
            fingertip_data<=0;
            en<=0;
    end  
end



endmodule
