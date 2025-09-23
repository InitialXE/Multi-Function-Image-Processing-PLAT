module Erosion_Detector(
    //时钟
    input       clk,
    input       rst_n,
    //预处理图像数据
    input       pre_frame_vsync,  //预图像数据列有效信号  
    input       pre_frame_hsync,   //预图像数据行有效信号  
    input       pre_frame_clken,  //预图像数据输入使能效信号
    input [7:0] pre_sobel_img_Y,        //Sobel图像
     
    //处理后的图像数据
    output       post_frame_vsync, //处理后的图像数据列有效信号   
    output       post_frame_hsync,  //处理后的图像数据行有效信号   
    output       post_frame_clken, //处理后的图像数据输出使能效信号
    output [15:0] post_img_Y        //后图像

 );
 


wire			matrix_frame_vsync;	//Prepared Image data vsync valid signal
wire			matrix_frame_href;	//Prepared Image data href vaild  signal
wire			matrix_frame_clken;	//Prepared Image data output/capture enable clock	
wire			matrix_p11, matrix_p12, matrix_p13;	//3X3 Matrix output
wire			matrix_p21, matrix_p22, matrix_p23;
wire			matrix_p31, matrix_p32, matrix_p33;


three_martix	u_three_martix_3(
    .clk         	 	(clk),
    .rst_n          	(rst_n),
    .per_frame_vsync    (pre_frame_vsync),
    .per_frame_href     (pre_frame_hsync), 
    .wrreq				(pre_frame_clken),
    .image_input	 	(pre_sobel_img_Y),
    
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

//Eronsion Parameter
//      Original         Dilation			  Pixel
// [   0  0   0  ]   [   1	1   1 ]     [   P1  P2   P3 ]
// [   0  1   0  ]   [   1  1   1 ]     [   P4  P5   P6 ]
// [   0  0   0  ]   [   1  1	1 ]     [   P7  P8   P9 ]
//P = P1 & P2 & P3 & P4 & P5 & P6 & P7 & 8 & 9;
//---------------------------------------
//Eonsion with or operation
//Step1
reg	post_img_Bit1,	post_img_Bit2,	post_img_Bit3;
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		begin
		post_img_Bit1 <= 1'b0;
		post_img_Bit2 <= 1'b0;
		post_img_Bit3 <= 1'b0;
		end
	else
		begin
		post_img_Bit1 <= matrix_p11 & matrix_p12 & matrix_p13;
		post_img_Bit2 <= matrix_p21 & matrix_p22 & matrix_p23;
		post_img_Bit3 <= matrix_p21 & matrix_p32 & matrix_p33;
		end
end

//Step 2
reg	post_img_Bit4;
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		post_img_Bit4 <= 1'b0;
	else
		post_img_Bit4 <= post_img_Bit1 & post_img_Bit2 & post_img_Bit3;
end

//时序同步
reg	[1:0]	per_frame_vsync_r;
reg	[1:0]	per_frame_href_r;	
reg	[1:0]	per_frame_clken_r;
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		begin
		per_frame_vsync_r <= 0;
		per_frame_href_r <= 0;
		per_frame_clken_r <= 0;
		end
	else
		begin
		per_frame_vsync_r 	<= 	{per_frame_vsync_r[0], 	matrix_frame_vsync};
		per_frame_href_r 	<= 	{per_frame_href_r[0], 	matrix_frame_href};
		per_frame_clken_r 	<= 	{per_frame_clken_r[0], 	matrix_frame_clken};
		end
end

assign	post_frame_vsync 	= 	per_frame_vsync_r[1];
assign	post_frame_hsync 	= 	per_frame_href_r[1];
assign	post_frame_clken 	= 	per_frame_clken_r[1];
assign	post_img_Y			=	post_frame_hsync ? {16{post_img_Bit4}} : 1'b0;


endmodule
