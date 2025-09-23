module Median_Gray(
    //时钟
    input       clk,  
    input       rst_n,
    
    input		csi_pclk,
    //预处理图像数据
    input       pre_frame_vsync,  //预图像数据列有效信号  
    input       pre_frame_hsync,   //预图像数据行有效信号  
    input       pre_frame_clken,  //预图像数据输入使能效信号
    input [7:0] pre_img_Y,        //灰度数据             
    
    //处理后的图像数据
    output       post_frame_vsync, //处理后的图像数据列有效信号   
    output       post_frame_hsync,  //处理后的图像数据行有效信号   
    output       post_frame_clken, //处理后的图像数据输出使能效信号
    output [7:0] post_img_Y        //处理后的灰度数据        
 );

assign	post_img_Y = mid_value;

wire        matrix_frame_vsync;
wire        matrix_frame_href;
wire        matrix_frame_clken;
wire [7:0]  matrix_p11; //3X3 阵列输出
wire [7:0]  matrix_p12; 
wire [7:0]  matrix_p13;
wire [7:0]  matrix_p21; 
wire [7:0]  matrix_p22; 
wire [7:0]  matrix_p23;
wire [7:0]  matrix_p31; 
wire [7:0]  matrix_p32; 
wire [7:0]  matrix_p33;

three_martix	u_three_martix(
    .clk         	 	(clk),
    .rst_n          	(rst_n),
    .per_frame_vsync    (pre_frame_vsync),
    .per_frame_href     (pre_frame_hsync), 
    .wrreq				(pre_frame_clken),
	.csi_pclk			(csi_pclk),
    .image_input	 	(pre_img_Y),
    
    .matrix_frame_vsync (matrix_frame_vsync),
    .matrix_frame_href  (matrix_frame_href),
    .matrix_frame_clken (matrix_frame_clken),
    .matrix_p11         (matrix_p11),    
    .matrix_p12         (matrix_p12),    
    .matrix_p13         (matrix_p13),
    .matrix_p21         (matrix_p21),    
    .matrix_p22         (matrix_p22),    
    .matrix_p23         (matrix_p23),
    .matrix_p31         (matrix_p31),    
    .matrix_p32         (matrix_p32),    
    .matrix_p33         (matrix_p33)

    
);

wire    [7:0]   mid_value;
Median_Filter_3X3 u_Median_Filter_3X3_8Bit_median(
    .clk        (clk),
    .rst_n      (rst_n),
    
    .median_frame_vsync (matrix_frame_vsync),
    .median_frame_href  (matrix_frame_href),
    .median_frame_clken (matrix_frame_clken),
    
    //第一行
    .data11           (matrix_p11), 
    .data12           (matrix_p12), 
    .data13           (matrix_p13),
    //第二行              
    .data21           (matrix_p21), 
    .data22           (matrix_p22), 
    .data23           (matrix_p23),
    //第三行              
    .data31           (matrix_p31), 
    .data32           (matrix_p32), 
    .data33           (matrix_p33),
    
    .pos_median_vsync (post_frame_vsync),
    .pos_median_href  (post_frame_hsync),
    .pos_median_clken (post_frame_clken),
    .target_data      (mid_value)
);

endmodule
