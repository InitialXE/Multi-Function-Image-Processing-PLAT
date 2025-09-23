module image_process(
	input 					clk,
    input 					rst_n,
    input					wrreq,
  	input		[3:0]		mode,
    input   	[15:0]  	original_image,
    input					csi_pclk,
    //预处理图像数据
    input        			in_frame_vsync, //预图像数据列有效信号  
    input        			in_frame_href,  //预图像数据行有效信号  
    input        			in_frame_clken,
    
    output  reg [7:0]		out_img_imy, 		//输出灰度图像
    output  reg 			out_frame_clken_imy,
    
    output  reg [7:0]		post_img_Y_median, 		//输出灰度图像
    output  reg 			post_frame_clken_median,

	output  reg [15:0]		post_img_Sobel, 		//输出Sobel
    output  reg 			post_frame_clken_Soebl,
    
    
	output  reg [15:0]		post_img_Sobel_Erosion, 		//输出腐蚀图像
    output  reg 			post_frame_clken_Soebl_Erosion,
    
    output  reg [15:0]		post_img_Sobel_Erosion_Dilation, 		//输出腐蚀图像
    output  reg 			post_frame_clken_Soebl_Erosion_Dilation,
    
    output      [11:0]  	x_min,
    output      [11:0]  	x_max,
    output      [11:0]  	y_min,
    output      [11:0]  	y_max, 
    
    output  reg     [19:0]  	fingertip_data,

    output      [9:0]      centre_x,
    output      [9:0]      centre_y,

    output       [5:0]      data,

    output                  end_flag
 );


wire 			[7:0] 		img_y ;				//灰度图像   8位
wire 			[7:0] 		img_cb ;			//cb图像   8位
wire 			[7:0] 		img_cr ;			//cr图像   8位
wire       					frame_vsync;
wire       					frame_hsync;
wire       					post_frame_de;


//时钟同步
//灰度
always @ (posedge clk or negedge rst_n) begin
    if (!rst_n)begin
       out_frame_clken_imy <= post_frame_de;
       out_img_imy <= post_img_cb;
    end 
    else begin
       out_frame_clken_imy <= post_frame_de;
       out_img_imy <= post_img_cb;
    end 
end
//灰度中值
always @ (posedge clk or negedge rst_n) begin
    if (!rst_n)begin
       post_frame_clken_median <= post_frame_clken;
       post_img_Y_median <= skin_img;
    end 
    else begin
       post_frame_clken_median <= post_frame_clken;
       post_img_Y_median <= skin_img;
    end 
end
//Sobel图像
always @ (posedge clk or negedge rst_n) begin
    if (!rst_n)begin
       post_frame_clken_Soebl <= post3_frame_clken;
       post_img_Sobel <= post1_img_Y; 
    end 
    else begin
       post_frame_clken_Soebl <= post3_frame_clken;
       post_img_Sobel <= post1_img_Y;
    end 
end
//腐蚀图像
always @ (posedge clk or negedge rst_n) begin
    if (!rst_n)begin
       post_frame_clken_Soebl_Erosion <= post1_frame_clken;
       post_img_Sobel_Erosion 			<= post2_img_Y; 
    end 
    else begin
       post_frame_clken_Soebl_Erosion <= post1_frame_clken;
       post_img_Sobel_Erosion 			<= post2_img_Y;
    end 
end
//膨胀图像
always @ (posedge clk or negedge rst_n) begin
    if (!rst_n)begin
       post_frame_clken_Soebl_Erosion_Dilation <=  post2_frame_clken;
       post_img_Sobel_Erosion_Dilation 			<= post3_img_Y; 
    end 
    else begin
       post_frame_clken_Soebl_Erosion_Dilation <=  post2_frame_clken;
       post_img_Sobel_Erosion_Dilation 			<= post3_img_Y;
    end 
end
RGBYCbCr	u_RGBYCbCr(
    .clk         	 (clk),
    .rst_n           (rst_n),
    
    .mode			 (mode),
    //输入数据
    .pre_frame_vsync (in_frame_vsync),
    .pre_frame_hsync (in_frame_href),
    .pre_frame_de    (in_frame_clken),
    
    
    .img_red         (original_image[15:11]),
    .img_green       (original_image[10:5]),
    .img_blue        (original_image[4:0]),
    //同步出来的信号
    .post_frame_vsync(frame_vsync),
    .post_frame_hsync(frame_hsync),
    .post_frame_de   (post_frame_de),	
    
    .img_y           (img_y),			//输出的灰度图像
    .img_cb		     (img_cb),
    .img_cr			 (img_cr)
);

wire [7:0] post_img_Y ;
wire [7:0] post_img_cb ;
wire [7:0] post_img_cr ;
reg [7:0] skin_img;
wire       post_frame_vsync;
wire       post_frame_href;
wire       post_frame_clken;

Median_Gray	u_Median_Gray(
    .clk         	 (clk),
    .rst_n           (rst_n),
    
    .pre_frame_vsync (frame_vsync),
    .pre_frame_hsync (frame_hsync),
    .pre_frame_clken (post_frame_de),
    .pre_img_Y       (img_y),
     
    .csi_pclk(csi_pclk),
    .post_frame_vsync(post_frame_vsync),
    .post_frame_hsync(post_frame_href),
    .post_frame_clken(post_frame_clken),	
    .post_img_Y      (post_img_Y)
        
);

Median_Gray	u_Median_Gray_2(
    .clk         	 (clk),
    .rst_n           (rst_n),
    
    .pre_frame_vsync (frame_vsync),
    .pre_frame_hsync (frame_hsync),
    .pre_frame_clken (post_frame_de),
    .pre_img_Y       (img_cb),
    
    .csi_pclk(csi_pclk),

    .post_img_Y      (post_img_cb)
        
);

Median_Gray	u_Median_Gray_3(
    .clk         	 (clk),
    .rst_n           (rst_n),
    
    .pre_frame_vsync (frame_vsync),
    .pre_frame_hsync (frame_hsync),
    .pre_frame_clken (post_frame_de),
    .pre_img_Y       (img_cr),
    
    .csi_pclk(csi_pclk),

    .post_img_Y      (post_img_cr)
);

always@(posedge clk or negedge rst_n) begin
    if (!rst_n)begin
		skin_img <= 0;
    end 
 	else begin
       if(post_img_cb > 77 && post_img_cb < 127 && post_img_cr > 133 && post_img_cr < 173)
                skin_img <= 8'hff; 
            else
                skin_img <=0; 
    end	
end	
//SOBEL
wire [15:0] post1_img_Y ;
wire        post_img_Y_bit ;
wire        post1_frame_vsync;
wire        post1_frame_href;
wire        post1_frame_clken;
Sobel_Process	u_Sobel_Process(
    .clk         	 (clk),
    .rst_n           (rst_n),
    
    .pre_frame_vsync (post1_frame_vsync),
    .pre_frame_hsync (post1_frame_href),
    .pre_frame_clken (post1_frame_clken),
    .pre_sobel_img_Y (post3_img_Y),
    
    .post_frame_vsync(post3_frame_vsync),
    .post_frame_hsync(post3_frame_href),
    .post_frame_clken(post3_frame_clken),	
    .post_img_Y      (post1_img_Y),
    .post_img_Y_bit  (post_img_Y_bit)   
);

//对SOBEL图像进行腐蚀
wire [15:0] post2_img_Y ;
wire        post2_frame_vsync;
wire        post2_frame_href;
wire        post2_frame_clken;

Erosion_Detector u_Erosion_Detector(
    .clk         	 (clk),
    .rst_n           (rst_n),
    
    .pre_frame_vsync (post_frame_vsync),
    .pre_frame_hsync (post_frame_href),
    .pre_frame_clken (post_frame_clken),
    .pre_sobel_img_Y (skin_img),
    
    .post_frame_vsync(post1_frame_vsync),
    .post_frame_hsync(post1_frame_href),
    .post_frame_clken(post1_frame_clken),	
    .post_img_Y      (post2_img_Y)

);


//对腐蚀过后的图像进行膨胀

wire [15:0] post3_img_Y;
wire        post3_frame_vsync;
wire        post3_frame_href;
wire        post3_frame_clken;

wire		finger_img;
Dilation_Detector u_Dilation_Detector(
    .clk         	 (clk),
    .rst_n           (rst_n),
    
    .pre_frame_vsync 	(post1_frame_vsync),
    .pre_frame_hsync 	(post1_frame_href),
    .pre_frame_clken 	(post1_frame_clken),
    .pre_Dilation_img_Y (post2_img_Y),
    
    .post_frame_vsync	(post2_frame_vsync),
    .post_frame_hsync	(post2_frame_href),
    .post_frame_clken	(post2_frame_clken),
    .post_img_Y      	(post3_img_Y),
    .post_img_Bit4		(finger_img) 
);
  
wire    [31:0]      Hu_1;	
wire    [31:0]      Hu_2;	
Hu_Invariant_moment u_Hu_Invariant_moment(
    .clk         	    (clk),
    .rst_n              (rst_n),
    .pre_frame_vsync 	(post3_frame_vsync),
    .pre_frame_hsync 	(post3_frame_href),
    .pre_frame_clken 	(post3_frame_clken),
    .pre_sobel_img_bit  (finger_img),
    .X_0                (centre_x),
    .Y_0                (centre_y),
    .area               (),
    .Hu_1               (Hu_1),
    .Hu_2               (Hu_2)
);

wire	[23:0]	Perimeter;
wire	[23:0]	Aera;

wire    [23:0]  Perimeter_Aera;
Perimeter_aera	u_Perimeter_aera(
 	.clk(clk),
    .rst_n(rst_n),

	.Sobel_clk(post3_frame_clken),
	.Dilation_clk(post2_frame_clken),

	.Sobel_img(post1_img_Y[0]),
	.Dilation_img(post3_img_Y[0]),

	.Perimeter(Perimeter),
	.Aera(Aera),
    .Perimeter_Aera(Perimeter_Aera),
    .end_flag           (end_flag)
);

wire    end_flag;
Gesture_recognition u_Gesture_recognition(
 	.clk(clk),
    .rst_n(rst_n),   
    .Hu_1               (Hu_1),
    .Hu_2               (Hu_2),
    .Perimeter_Aera     (Perimeter_Aera),
    .sdata               (data)
);  
wire    [11:0]  x_min;
wire    [11:0]  x_max;
wire    [11:0]  y_min;
wire    [11:0]  y_max;

wire    [23:0]  finger_data_Aera;     
wire    [19:0]  fingertip_area;
wire    [19:0]  fingertip_data;
Gesture_detch u_Gesture_detch(
 	.clk(clk),
    .rst_n(rst_n),

    .per_frame_vsync 	(post3_frame_vsync),
    .per_frame_hsync 	(post3_frame_href),
    .per_frame_clken 	(post3_frame_clken),
    .per_img_Bit        (post_img_Y_bit),

    .x_min              (x_min),
    .x_max              (x_max),
    .y_min              (y_min),
    .y_max              (y_max),
    .area               (fingertip_area), //无用？
    .fingertip_data     (fingertip_data)
);


Divider_32 u_Divider_1(
    .clk(clk),
    .rst(~rst_n),

    .numerator(Aera*100),
    .denominator(300*300), 

    .start(post3_frame_clken),

    .quotient(finger_data_Aera),
    .remainder(),
    .done()
);


endmodule
