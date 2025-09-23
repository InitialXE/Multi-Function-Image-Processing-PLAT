module Hu_Invariant_moment( 
    //时钟
    input       clk,
    input       rst_n,

    //预处理图像数据
    input       pre_frame_vsync,  //预图像数据列有效信号  
    input       pre_frame_hsync,   //预图像数据行有效信号  
    input       pre_frame_clken,  //预图像数据输入使能效信号

    input       pre_sobel_img_bit,        //SOBEL图像
    output  reg[9:0]  X_0,
    output  reg[9:0]  Y_0,
    output  reg     [31:0]      Hu_1,
    output  reg     [31:0]      Hu_2,
    output  reg     [23:0]      area
);


parameter   ROW_CNT = 800;
parameter   COL_CNT = 600;      //800lie  600行

reg [11:0]  count_x;
reg [11:0]  count_y;        //屏幕计数

wire	display_number_area =	(count_x >= 150 && count_x <=  450) && (count_y >= 50 && count_y <= 350); //64
//行计数 
always @(posedge clk or negedge rst_n)begin  
    if(rst_n == 1'b0)begin
        count_x <= 0;
    end
    else if(pre_frame_clken && count_x == ROW_CNT - 1)
        count_x <= 0;
    else if(pre_frame_clken)begin
        count_x <= count_x + 1'b1;
    end
    else 
        count_x <= count_x;
end

assign  row_flag = (pre_frame_clken && count_x == 800 - 1'b1)? 1'b1:1'b0;

//cnt_y
always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        count_y <= 0;
    end
    else if(row_flag  &&  count_y == COL_CNT - 1'b1)
        count_y <= 0;
    else if(row_flag)
        count_y <= count_y + 1'b1;
    else 
        count_y <= count_y;
end


always @(posedge clk or negedge rst_n)begin
	if(rst_n == 1'b0)
        area <= 0;
    else begin	
    	if(end_flag)
        	area <= M_00;
    end	
end

wire   flag ;//synthesis keep   
assign flag = (count_x == 150 && count_y == 50)? 1'b1:1'b0;


wire   end_flag ;//synthesis keep   
assign end_flag = (count_x == 450 && count_y == 350)? 1'b1:1'b0;

reg [7:0]   x0_mult_y0;
reg [9:0]   x0_mult_y1;
reg [9:0]   x1_mult_y0;
reg [20:0]  x2_mult_y0;
reg [20:0]  x0_mult_y2;
reg [20:0]  x1_mult_y1;

always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        x0_mult_y0 <= 0;
        x0_mult_y1 <= 0;
        x1_mult_y0 <= 0;
        x2_mult_y0 <= 0;
        x0_mult_y2 <= 0;
        x1_mult_y1 <= 0;
    end
    else    begin
        if(flag)    
        begin
            x0_mult_y0 <= 0;
            x0_mult_y1 <= 0;
            x1_mult_y0 <= 0;
            x2_mult_y0 <= 0;
            x0_mult_y2 <= 0;
            x1_mult_y1 <= 0;
        end
        else if(pre_frame_clken && display_number_area)
        begin
            x0_mult_y0 = 1;
            x0_mult_y1 = 1 * count_y; 
            x1_mult_y0 = count_x * 1;
            x2_mult_y0 = count_x * count_x * 1;
            x0_mult_y2 = count_y * count_y * 1; 
            x1_mult_y1 = count_x * count_y;
        end
    end
end 

reg    [23:0]  M_00;//synthesis keep    
reg    [23:0]  M_10;//synthesis keep
reg    [23:0]  M_01;//synthesis keep
reg    [23:0]  M_11;//synthesis keep
reg    [23:0]  M_20;//synthesis keep
reg    [23:0]  M_02;//synthesis keep

always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        M_00 =   0;
        M_10 =   0;
        M_01 =   0;
        M_11 =   0;
        M_20 =   0;
        M_02 =   0;
    end
    else begin
        if(flag)    
        begin
            M_00 <= 0;
            M_01 <= 0;
            M_10 <= 0;
            M_11 <= 0;
            M_20 <= 0;
            M_02 <= 0;
        end
        else if(pre_frame_clken &&  pre_sobel_img_bit == 1'b1 && display_number_area )  begin
            M_00 = M_00 + x0_mult_y0;
            M_01 = M_01 + x0_mult_y1;
            M_10 = M_10 + x1_mult_y0;
            M_11 = M_11 + x1_mult_y1;
            M_20 = M_20 + x2_mult_y0;
            M_02 = M_02 + x0_mult_y2;
        end
    end
end 

wire        ok_flag_x;
wire        ok_flag_y;

Divider u_Divider_1(
    .clk(clk),
    .rst(~rst_n),

    .numerator(M_10),
    .denominator(M_00),

    .start(end_flag),

    .quotient(X_0),
    .remainder(),
    .done(ok_flag_x)
);

Divider u_Divider_2(
    .clk(clk),
    .rst(~rst_n),

    .numerator(M_01),
    .denominator(M_00),

    .start(end_flag),

    .quotient(Y_0),
    .remainder(),
    .done(ok_flag_y)
);


reg    [63:0]  u_00;

reg    [63:0]  u_11;
reg    [63:0]  u_20;
reg    [63:0]  u_02;

wire    [9:0]   X_0;
wire    [9:0]   Y_0;
always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        u_00 <=   0;
        u_11 <=   0;
        u_20 <=   0;
        u_02 <=   0;
 /*       u_21 <=   0;
        u_12 <=   0;
        u_30 <=   0;
        u_03 <=   0;*/
    end
    else begin
        if(flag)    
        begin
            u_00 <= 0;
            u_11 <= 0;
            u_20 <= 0;
            u_02 <= 0;
        end
        else if(pre_frame_clken &&  pre_sobel_img_bit == 1'b1 && display_number_area )  begin
            u_00    <= u_00 + 1;
            u_11    <= u_11 + (count_x - X_0)*(count_y - Y_0);
            u_20    <= u_20 + (count_x - X_0)*(count_x - X_0);
            u_02    <= u_02 + (count_y - Y_0)*(count_y - Y_0);
        end
    end
end 


wire     [31:0]      n_20;//synthesis keep
wire     [31:0]      n_02;//synthesis keep
wire     [31:0]      n_11;//synthesis keep

//n20


always @(posedge clk or negedge rst_n)begin
	if(rst_n == 1'b0)begin
        Hu_1 <=   0;
        Hu_2 <=   0;
    end
   	else	begin
       	if(ok_flag_n02)begin
            Hu_1 <= n_02 + n_20;
            Hu_2 <= (n_20 - n_02)*(n_20 - n_02) + 5'd4*n_11*n_11;
        end
    end	 
end

wire        ok_flag_n20;//synthesis keep
wire        ok_flag_n02;
wire        ok_flag_n11;
wire        ok_flag_n12;
wire        ok_flag_n21;
wire        ok_flag_n30;
wire        ok_flag_n03;

Diver_64 u_Divider_3(
    .clk(clk),
    .rst(~rst_n),

    .numerator(u_20*100),
    .denominator(u_00*u_00),

    .start(end_flag),

    .quotient(n_20),
    .remainder(),
    .done(ok_flag_n20)
);
//n02
Diver_64 u_Divider_4(
    .clk(clk),
    .rst(~rst_n),

    .numerator(u_02*100),
    .denominator(u_00*u_00), 

    .start(end_flag),

    .quotient(n_02),
    .remainder(),
    .done(ok_flag_n02)
);
//n11
Diver_64 u_Divider_5(
    .clk(clk),
    .rst(~rst_n),

    .numerator(u_11*100),
    .denominator(u_00*u_00),

    .start(end_flag),

    .quotient(n_11),
    .remainder(),
    .done(ok_flag_n11)
);


/*Diver_64 u_Divider_6(
    .clk(clk),
    .rst(~rst_n),

    .numerator(u_30*u_30),
    .denominator(u_00*u_00*u_00),

    .start(end_flag),

    .quotient(n_30),
    .remainder(),
    .done(ok_flag_n30)
);
Diver_64 u_Divider_7(
    .clk(clk),
    .rst(~rst_n),

    .numerator(u_03*u_03),
    .denominator(u_00*u_00*u_00),

    .start(end_flag),

    .quotient(n_03),
    .remainder(),
    .done(ok_flag_n03)
);
Diver_64 u_Divider_8(
    .clk(clk),
    .rst(~rst_n),

    .numerator(u_12*u_12),
    .denominator(u_00*u_00*u_00),

    .start(end_flag),

    .quotient(n_12),
    .remainder(),
    .done(ok_flag_n12)
);
Diver_64 u_Divider_9(
    .clk(clk),
    .rst(~rst_n),

    .numerator(u_21*u_21),
    .denominator(u_00*u_00*u_00),

    .start(end_flag),

    .quotient(n_21),
    .remainder(),
    .done(ok_flag_n21)
);*/



endmodule
