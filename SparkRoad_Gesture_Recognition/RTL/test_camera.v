`timescale 1ns/ 1ps
// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// 
// Author: Anlogic
// 
// Description: 
//
//		dvp_ov2640,摄像头VGA显示
// 
// Web: www.anlogic.com
// --------------------------------------------------------------------
module test_camera 

(
	input 	wire 		clk_24m,	//系统时钟
	input 	wire 		rst_n,		//复位
    
    input	wire [15:0]	Switch,		//拨码开关
    output  wire [15:0] Led,
	//camera	
	input 	wire 		cam_pclk,	//像素时钟
	output 	wire 		cam_xclk,	//系统时钟
	input 	wire 		cam_href,	//行同
	input 	wire 		cam_vsync,	//帧同
	output 	wire 		cam_pwdn,	//模式
	output 	wire 		cam_rst,	//复位
	output 	wire 		cam_soic,	//SCCB
	inout 	wire 		cam_soid,	//SCCB
	input 	wire [7:0]	cam_data,	//摄像头数据
	//vga
	output 	wire [7:0] 	vga_r,      //VGA_R数据
	output 	wire [7:0] 	vga_g,		//VGA_G数据
	output 	wire [7:0] 	vga_b,		//VGA_B数据
	output 	wire 		vga_clk,	//VGA时钟
	output 	wire 		vga_hsync,	//VGA行同
	output 	wire 		vga_vsync,	//VGA帧同
    
    output	wire [7:0]  sm_seg,
    output	wire [3:0]  sm_bit,

	output	wire		tx
 );	
 

 localparam IMG_W = 800;  //图片行像素点个数
 localparam IMG_H = 600;  //图片场像素点个数
 localparam IMG_X = 0;    //图像显示的开始位置
 localparam IMG_Y = 0;
 
//时钟	 
wire 		clk_lcd;   
wire 		clk_cam;
wire 		clk_sccb;
wire 		clk_sdr_ctrl;
wire 		clk_sdram;
//摄像头连线
wire        camera_wrreq;
wire        camera_wclk;
wire [15:0] camera_wrdat;

wire [15:0] camera_addr;

reg 		init_state;
wire 		init_ready;
wire 		sda_oe;
wire 		sda;
wire 		sda_in;
wire 		scl;

//VGA 显示连线
wire 	[23:0] 	vga_data;
reg				vga_rden;
wire 	[15:0]	vga_rddat;	
reg  	[15:0]	vga_rdaddr;
wire vga_data_req;

//图像处理部分
wire 	     [15:0]			display_data;
wire 	     [15:0]			show_data;
wire    					show_clk;
wire	     [7:0]    		Gray_img;
wire         [15:0] 		img_gray_565 = {Gray_img[7:3],Gray_img[7:2],Gray_img[7:3]}; 
wire    					img_gray_clk;	//灰度图像时钟 
wire		 [7:0]			Median_img;
wire						Median_gray_clk;
wire         [15:0] 		Median_img_gray_565 = {Median_img[7:3],Median_img[7:2],Median_img[7:3]}; 

wire		 [15:0]			Sobel_img;
wire						Sobel_clk;

wire		 [15:0]			Sobel_Erosion_img;		//腐蚀图像
wire						Sobel_Erosion_clk;		//腐蚀时钟

wire		 [15:0]			Sobel_Erosion_Dilation_img;		//腐蚀图像
wire						Sobel_Erosion_Dilation_clk;		//腐蚀时钟

wire		 [19:0]			figuredata;
//按键处理部分
wire [3:0]	mode;


assign cam_soid = (sda_oe == 1'b1) ? sda : 1'bz;
assign sda_in 	= cam_soid;
assign cam_soic = scl;
assign cam_pwdn = 1'b0;
assign cam_rst 	= rst_n;

//vga rgb565 模式转换 rgb888 
assign 	vga_data [23:0] = vga_rden ? {display_data[15:11],3'h0,display_data[10:5],2'h0,display_data[4:0],3'h0} : 24'h0;

wire 	vga_den;
//assign 	vga_data [23:0] = vga_den ? {vga_rddat[15:11],3'h0,vga_rddat[10:5],2'h0,vga_rddat[4:0],3'h0} : 24'h0;


wire	[11:0]	lcd_xpos;
wire 	[11:0]	lcd_ypos;

wire			end_flag;
wire	[9:0]	centre_x;
wire 	[9:0]	centre_y;
wire	[9:0]	x_min_locate;	
wire 	[9:0]	x_max_locate;	
wire	[9:0]	y_min_locate;
wire 	[9:0]	y_max_locate;
wire	[5:0]		display_num;
wire    [23:0]  pre_vga_data;
//摄像头图像处理
image_process u_image_process(
    .clk				(cam_pclk),
    .rst_n				(rst_n),	
    .csi_pclk			(cam_pclk		),
    .mode				(mode),						//模式选择
      
    //原始图像信息输入
    .wrreq				(camera_wrreq	),			//写输入使能		高电平有效
    .in_frame_vsync  	(cam_vsync),
    .in_frame_href   	(cam_href),
    .in_frame_clken  	(camera_wrreq),			
    .original_image	 	(camera_wrdat),				//原始图像
    
  
    .out_img_imy	 	(Gray_img),					//输出的灰度图像
    .out_frame_clken_imy(img_gray_clk),				//输出的灰度时钟
    
    .post_img_Y_median	(Median_img),
    .post_frame_clken_median	(Median_gray_clk),
    
    .post_img_Sobel		(Sobel_img),
    .post_frame_clken_Soebl(Sobel_clk),
    
    .post_img_Sobel_Erosion(Sobel_Erosion_img),
    .post_frame_clken_Soebl_Erosion(Sobel_Erosion_clk),
    
    .post_img_Sobel_Erosion_Dilation(Sobel_Erosion_Dilation_img),
    .post_frame_clken_Soebl_Erosion_Dilation(Sobel_Erosion_Dilation_clk),
    
    .fingertip_data(figuredata),

	.centre_x(centre_x),
	.centre_y(centre_y),

	.x_min(x_min_locate),
	.x_max(x_max_locate),
	.y_min(y_min_locate),
	.y_max(y_max_locate),
	.data(display_num),
	.end_flag(end_flag)
);
Mode_Switch u_Mode_Switch(
    .clk(clk_24m),
    .rst_n(rst_n),
     
    .Switch(Switch),
    .Led(Led),
    .mode(mode)
);
image_select u_image_select(
    .clk(cam_pclk),
    .rst_n(rst_n),
    
    .mode(mode),
    .show_data(show_data),
    .show_clk (show_clk),         
    .original_clk(camera_wrreq),
    .original_image(camera_wrdat),
    
    .Gary_clk(img_gray_clk),
    .Gray_rgb565_img(img_gray_565),
    
    .Median_img_gray_565(Median_img_gray_565),
    .Median_Gray_clk	(Median_gray_clk),
    
    .Sobel_img_565(Sobel_img),
    .Sobel_clk(Sobel_clk),
    
    .Sobel_Erosion_img_565(Sobel_Erosion_img),
    .Sobel_Erosion_clk(Sobel_Erosion_clk),
    
    .Sobel_Erosion_Dilation_img_565(Sobel_Erosion_Dilation_img),
    .Sobel_Erosion_Dilation_clk(Sobel_Erosion_Dilation_clk)
);

result_display u_result_display(
    .pixel_clk(vga_clk),
    .sys_rst_n(rst_n),
    .rom_clk(vga_clk),
    .Switch(Switch),
    .pixel_xpos(lcd_xpos),
    .pixel_ypos(lcd_ypos),
    .lcd_data(pre_vga_data),
    .sdata(display_num),
    .pixel_data({vga_r,vga_g,vga_b})
);

vga_display 
 #(
    .y_min         (12'd50),       //参数传递
    .y_max         (12'd350),              
    .x_min         (12'd150),       //参数传递
    .x_max         (12'd450)                 
 )   
u_vga_display(
    .clk(clk_lcd),
    .rst_n(rst_n),
    
    .lcd_data(vga_rddat),
    .lcd_x(lcd_xpos),
    .lcd_y(lcd_ypos),
    
    .boom_img(Sobel_Erosion_Dilation_img),
    .cam_img(camera_wrdat),
    .display_data(display_data),
    
    .display_en(vga_den),

	.centre_x(centre_x),
	.centre_y(centre_y),

	.x_min_locate(x_min_locate),
	.x_max_locate(x_max_locate),
	.y_min_locate(y_min_locate),
	.y_max_locate(y_max_locate)
);


Uart_Send	u_Uart_Send(
	.clk(clk_24m),
    .rst_n(rst_n),


	.pi_data({6'b000000,centre_x[9:8],centre_x[7:0],6'b000000,centre_y[9:8],centre_y[7:0],2'b00,display_num,8'h0x0a}),
	.pi_flag(end_flag),
	.tx	(tx)
);
seg_4   u_seg_4(
    .clk_24m         (clk_cam),
    .rst_n           (rst_n),

	.data			 (display_num),
	.sm_seg			 (sm_seg),
	.sm_bit			 (sm_bit)
);

ip_pll u_pll(
	.refclk(clk_24m),		//24M
	.reset(!rst_n),
	.clk0_out(clk_sdr_ctrl),
	.clk1_out(clk_sdram),
	.clk2_out(clk_lcd),		//lcd clk
	.clk3_out(clk_cam),		//12m,for cam xclk
	.clk4_out(clk_sccb)		//4m,for sccb init
	
);

camera_init u_camera_init
(
	.clk(clk_sccb),
	.reset_n(rst_n),
	.ready(init_ready),
	.sda_oe(sda_oe),
	.sda(sda),
	.sda_in(sda_in),
	.scl(scl)
);
	

Driver u_cam_vga_out
(
	.clk(clk_lcd),			
	.rst_n(rst_n),     		//sync reset
	.lcd_data(vga_data),		//lcd data
	
	//lcd interface
	.lcd_dclk(vga_clk),   	//lcd pixel clock
	.lcd_hs(vga_hsync),	    	//lcd horizontal sync
	.lcd_vs(vga_vsync),	    	//lcd vertical sync
	.lcd_en(vga_den),			//lcd display enable
	.lcd_rgb(pre_vga_data),		//lcd display data

	//user interface
	.lcd_xpos(lcd_xpos),		//lcd horizontal coordinate
	.lcd_ypos(lcd_ypos)
);


camera_reader u_camera_reader
(
	.clk		(clk_cam		),
	.reset_n	(rst_n			),
	.csi_xclk	(cam_xclk		),
	.csi_pclk	(cam_pclk		),
	.csi_data	(cam_data		),
	.csi_vsync	(cam_vsync		),
	.csi_hsync	(cam_href		),
	.data_out	(camera_wrdat	),
	.wrreq		(camera_wrreq	),
	.wrclk		(camera_wclk	),
	.wraddr		(camera_addr	)
);


Sdram_Control_4Port Sdram_Control_4Port(
		//	HOST Side
		.CTRL_CLK(clk_sdr_ctrl),	//输入参考时钟，默认100M，如果为其他频率，请修改pll设置
		.SDRAM_CLK(clk_sdram),		//SDRAM时钟，默认100M(90°)，如果为其他频率，请修改pll设置
		.RESET_N(rst_n),			//复位输入，低电平复位

		//	FIFO Write Side 1
		.WR1_DATA(show_data),	//写入端口1的数据输入端16bit			关键标注   修改此处为修改图像
		.WR1(show_clk),		//写入端口1的写使能端，高电平写入
		.WR1_ADDR(21'b0),				//写入端口1的写起始地址
		.WR1_MAX_ADDR(800*600),		//写入端口1的写入最大地址
		.WR1_LENGTH(10'd256),			//一次性写入数据长度
		.WR1_LOAD((~rst_n) &(init_ready) ),
									//写入端口1清零请求，高电平清零写入地址和fifo
		.WR1_CLK(camera_wclk),		//写入端口1 fifo写入时钟
		.WR1_FULL(),				//写入端口1 fifo写满信号
		.WR1_USE(),					//写入端口1 fifo已经写入的数据长度
		//	FIFO Write Side 2
		.WR2_DATA(16'b0),			//写入端口2的数据输入端16bit
		.WR2(1'b0),					//写入端口2的写使能端，高电平写入
		.WR2_ADDR(21'b0),				//写入端口2的写起始地址
		.WR2_MAX_ADDR(200*200),		//写入端口2的写入最大地址
		.WR2_LENGTH(9'd0),				//一次性写入数据长度	
		.WR2_LOAD(1'b0),			//写入端口2清零请求，高电平清零写入地址和fifo
		.WR2_CLK(1'b0),				//写入端口2 fifo写入时钟
		.WR2_FULL(),				//写入端口2 fifo写满信号
		.WR2_USE(),					//写入端口2 fifo已经写入的数据长度
		//	FIFO Read Side 1
		.RD1_DATA(vga_rddat),		//读出端口1的数据输出端16bit
		.RD1(vga_den),			//读出端口1的读使能端，高电平读出
		.RD1_ADDR(21'b0),				//读出端口1的读起始地址
		.RD1_MAX_ADDR(800*600),		//读出端口1的读出最大地址
		.RD1_LENGTH(10'd256),			//一次性读出数据长度
		.RD1_LOAD((~rst_n) & (init_ready)),
									//读出端口1 清零请求，高电平清零读出地址和fifo
		.RD1_CLK(clk_lcd),			//读出端口1 fifo读取时钟
		.RD1_EMPTY(),				//读出端口1 fifo读空信号
		.RD1_USE(),					//读出端口1 fifo已经还可以读取的数据长度

		//	FIFO Read Side 2
		.RD2_DATA(),				//读出端口2的数据输出端16bit
		.RD2(1'b0),					//读出端口2的读使能端，高电平读出
		.RD2_ADDR(21'b0),				//读出端口2的读起始地址
		.RD2_MAX_ADDR(0),			//读出端口2的读出最大地址
		.RD2_LENGTH(9'd0),				//一次性读出数据长度	
		.RD2_LOAD(1'b0),			//读出端口2清零请求，高电平清零读出地址和fifo
		.RD2_CLK(1'b0),				//读出端口2 fifo读取时钟
		.RD2_EMPTY(),				//读出端口2 fifo读空信号
		.RD2_USE()					//读出端口2 fifo已经还可以读取的数据长度
	);	



always @(negedge clk_lcd)
begin
	if(!rst_n)
	begin
		vga_rden <= 1'b0;
		//vga_rdaddr <= 16'd0; 
	end
	else 
	begin
	if (vga_den) 
			begin
			if(lcd_xpos > IMG_X && lcd_xpos < (IMG_X + IMG_W) && lcd_ypos > IMG_Y && lcd_ypos < (IMG_Y + IMG_H))
				begin
				vga_rden <= 1'b1;
				//vga_rdaddr <= (lcd_xpos-IMG_X)+(lcd_ypos-IMG_Y)*IMG_W;
				end
			else
				begin
					vga_rden <= 1'b0;
					//vga_rdaddr <= 16'd0; 
				end
			end
		else 
			begin
				vga_rden <= 1'b0;
				//vga_rdaddr <= 16'd0;  
			end	
	end 
end



	
endmodule
