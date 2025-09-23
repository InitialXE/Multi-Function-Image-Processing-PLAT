module three_martix( 
	input 				clk,
    input 				rst_n,
	input	[7:0]		image_input,//synthesis keep
    input				csi_pclk,
    input            per_frame_vsync,
    input            per_frame_href,
    input			 wrreq,
    
    
    output           matrix_frame_vsync,
    output           matrix_frame_href,
    output           matrix_frame_clken,
    
    output reg [7:0] matrix_p11,
    output reg [7:0] matrix_p12, 
    output reg [7:0] matrix_p13,
    output reg [7:0] matrix_p21, 
    output reg [7:0] matrix_p22, 
    output reg [7:0] matrix_p23,
    output reg [7:0] matrix_p31, 
    output reg [7:0] matrix_p32, 
    output reg [7:0] matrix_p33,
    
    output	reg		 rd_en_dly2,
    
    output	reg	[15:0]cnt_rd
);	

wire       read_frame_href;
wire       read_frame_clken;

wire		empty_flag;
wire		full_flag;
reg  [1:0]  per_frame_vsync_r;
reg  [1:0]  per_frame_href_r;
reg  [1:0]  per_frame_clken_r;

assign read_frame_href    = per_frame_href_r[0] ;
assign read_frame_clken   = per_frame_clken_r[0];
assign matrix_frame_vsync = per_frame_vsync_r[1];
assign matrix_frame_href  = per_frame_href_r[1] ;
assign matrix_frame_clken = per_frame_clken_r[1];

//将同步信号延迟两拍，用于同步化处理
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        per_frame_vsync_r <= 0;
        per_frame_href_r  <= 0;
        per_frame_clken_r <= 0;
    end
    else begin
        per_frame_vsync_r <= { per_frame_vsync_r[0], per_frame_vsync };
        per_frame_href_r  <= { per_frame_href_r[0],  per_frame_href  };
        per_frame_clken_r <= { per_frame_clken_r[0], wrreq };
    end
end



//parameter define
parameter   LENGTH_P    =   16'd800         ,   //图片长度
            WIDE_P      =   16'd600         ;   //图片宽度
//wire  define
wire    [7:0]   		data_out1   	;   //fifo1数据输出
wire    [7:0]   		data_out2   	;   //fifo2数据输出

reg     [15:0]  		cnt_h       	;//synthesis keep
reg     [15:0]   		cnt_v       	;   //场计数
reg     [7:0]   		Image_input_dly ;   //Gray_Image数据寄存
reg             		wr_en1      	;   //fifo1写使能
reg             		wr_en2      	;   //fifo2写使能
reg     [7:0]   		data_in1    	;//synthesis keep
reg     [7:0]   		data_in2   		;//synthesis keep
reg             		rd_en       	;//synthesis keep
reg     [7:0]   		data_out1_dly   ;   //fifo1数据输出寄存
reg     [7:0]   		data_out2_dly   ;   //fifo2数据输出寄存
reg             		dout_flag   	;   //使能信号
reg             		rd_en_dly1  	;   //输出数据标志信号,延后rd_en一拍


reg     [7:0]   		a1          	;
reg     [7:0]   		a2          	;
reg     [7:0]   		a3          	;
reg     [7:0]   		b1          	;
reg     [7:0]   		b2          	;
reg     [7:0]   		b3          	;
reg     [7:0]  			c1          	;
reg     [7:0]   		c2          	;
reg     [7:0]   		c3          	;   //图像数据


//cnt_h：行数据个数计数器
always@(posedge clk or  negedge rst_n)
    if(rst_n == 1'b0)
        cnt_h   <=  8'd0;
    else    if((cnt_h == (LENGTH_P - 1'b1)) && (wrreq == 1'b1))
        cnt_h   <=  8'd0;
    else    if(wrreq == 1'b1)
        cnt_h   <=  cnt_h + 1'b1;

//cnt_v：场计数器
always@(posedge clk or  negedge rst_n)
    if(rst_n == 1'b0)
        cnt_v   <=  8'd0;
    else    if((cnt_v == (WIDE_P - 1'b1)) && (wrreq == 1'b1)
            && (cnt_h == (LENGTH_P - 1'b1)))
        cnt_v   <=  8'd0;
    else    if((cnt_h == (LENGTH_P - 1'b1)) && (wrreq == 1'b1))
        cnt_v   <=  cnt_v + 1'b1;
        
//cnt_rd：fifo数据读出个数计数,用来判断何时对gx,gy进行运算
always@(posedge clk or  negedge rst_n)
    if(rst_n == 1'b0)
        cnt_rd   <=  8'd0;
    else    if((cnt_rd == (LENGTH_P - 1'b1)) && (rd_en == 1'b1))
        cnt_rd   <=  8'd0;
    else    if(rd_en == 1'b1)
        cnt_rd   <=  cnt_rd + 1'b1;

//wr_en1：fifo1写使能,高电平有效
always@(posedge clk or  negedge rst_n)
    if(rst_n == 1'b0)
        wr_en1  <=  1'b0;
    else  if((cnt_v == 8'd0) && (wrreq == 1'b1))
        wr_en1  <=  1'b1;      //第0行写入fifo1
    else
        wr_en1  <=  dout_flag;  //2-198行写入fifo1
        
//wr_en2,fifo2的写使能,高电平有效
always@(posedge clk or  negedge rst_n)
    if(rst_n == 1'b0)
        wr_en2  <=  1'b0;
    else    if((cnt_v >= 8'd1)&&(cnt_v <= ((WIDE_P - 1'b1) - 1'b1))&& (wrreq == 1'b1))
        wr_en2  <=  1'b1;      //2-199行写入fifo2
    else
        wr_en2  <=  1'b0;

//data_in1：fifo1的数据写入
always@(posedge clk or  negedge rst_n)
    if(rst_n == 1'b0)
        data_in1    <=  8'b0;
    else    if((wrreq == 1'b1) && (cnt_v == 8'b0))
        data_in1    <=  image_input;
    else    if(dout_flag == 1'b1)
        data_in1    <=  data_out2;
    else
        data_in1    <=  data_in1;
        
//data_in2：fifo2的数据写入
always@(posedge clk or  negedge rst_n)
    if(rst_n == 1'b0)
        data_in2    <=  8'b0;
    else    if((wrreq == 1'b1) && (cnt_v >= 8'd1)
            && (cnt_v <= ((WIDE_P - 1'b1) - 1'b1)))
        data_in2    <=  image_input;
    else
        data_in2    <=  data_in2;
        
//rd_en：fifo1和fifo2的共用读使能,高电平有效
always@(posedge clk or  negedge rst_n)
    if(rst_n == 1'b0)
        rd_en   <=  1'b0;
    else    if((wrreq == 1'b1)	 && (cnt_v >= 8'd2)
            && (cnt_v <= (WIDE_P - 1'b1)))
        rd_en   <=  1'b1;  
    else
        rd_en   <=  1'b0;
        
//dout_flag：控制fifo1写使能wr_en1
always@(posedge clk or  negedge rst_n)
    if(rst_n == 1'b0)
        dout_flag   <=  1'b0;
    else    if((wr_en2 == 1'b1) && (rd_en == 1'b1))
        dout_flag   <=  1'b1;
    else
        dout_flag   <=  1'b0;
 
//rd_en_dly1：输出数据标志信号
always@(posedge clk or  negedge rst_n)
    if(rst_n == 1'b0)
        rd_en_dly1  <=  1'b0;
    else    if(rd_en == 1'b1)
        rd_en_dly1  <=  1'b1;
    else
        rd_en_dly1  <=  1'b0;

//data_out1_dly：data_out1数据寄存
always@(posedge clk or  negedge rst_n)
    if(rst_n == 1'b0)
        data_out1_dly   <=  8'b0;
    else    if(rd_en_dly1 == 1'b1)
        data_out1_dly   <=  data_out1;   
          

//data_out2_dly：data_out2数据寄存
always@(posedge clk or  negedge rst_n)
    if(rst_n == 1'b0)
        data_out2_dly   <=  8'b0;
    else    if(rd_en_dly1 == 1'b1)
        data_out2_dly   <=  data_out2;

//Gray_Image_dly：输入数据Gray_Image寄存
always@(posedge clk or  negedge rst_n)
    if(rst_n == 1'b0)
        Image_input_dly <=  8'b0;
    else    if(rd_en_dly1 == 1'b1)
        Image_input_dly <=  image_input;    

//rd_en_dly2：a,b,c赋值标志信号
always@(posedge clk or  negedge rst_n)
    if(rst_n == 1'b0)
        rd_en_dly2  <=  1'b0;
    else    if(rd_en_dly1 == 1'b1)
        rd_en_dly2  <=  1'b1;
    else
        rd_en_dly2  <=  1'b0;  

//a,b,c赋值
always@(posedge clk or  negedge rst_n)
    if(rst_n == 1'b0)
    begin
        matrix_p11  <=  8'd0;
        matrix_p12  <=  8'd0;
        matrix_p13  <=  8'd0;
        matrix_p21  <=  8'd0;
        matrix_p22  <=  8'd0;
        matrix_p23  <=  8'd0;
        matrix_p31  <=  8'd0;
        matrix_p32  <=  8'd0;
        matrix_p33  <=  8'd0;
    end
    else if(read_frame_href) begin
        	if(read_frame_clken)begin
            	if(rd_en_dly2==1) begin	
        			matrix_p11  <=  data_out1_dly;			//第一行第一个
       	 			matrix_p21  <=  data_out2_dly;
       	 			matrix_p31  <=  Image_input_dly;
        			matrix_p12  <=  matrix_p11;
        			matrix_p22  <=  matrix_p21;
        			matrix_p32  <=  matrix_p31;
        			matrix_p13  <=  matrix_p12;
        			matrix_p23  <=  matrix_p22;
        			matrix_p33  <=  matrix_p32;
            	end;
        	end
            else begin
            		matrix_p11  <=  matrix_p11;			//第一行第一个
       	 			matrix_p21  <=  matrix_p21;
       	 			matrix_p31  <=  matrix_p31;
        			matrix_p12  <=  matrix_p12;
        			matrix_p22  <=  matrix_p22;
        			matrix_p32  <=  matrix_p32;
        			matrix_p13  <=  matrix_p13;
        			matrix_p23  <=  matrix_p23;
        			matrix_p33  <=  matrix_p33;	
          	end;
    end
                                 
fifo_1	u_fifo_1(
    .clk	(clk),
	.rst		(~rst_n),
    .di  	(data_in1   ),  // input [7 : 0] din
    .we  	(wr_en1     ),  // input wr_en
    .re  	(rd_en      ),  // input rd_en
    .empty_flag	(empty_flag),
    .full_flag(full_flag),
    .do   	(data_out1  )   // output [7 : 0] dout
);
fifo_2	u_fifo_2(
    .clk	(clk),
	.rst		(~rst_n),
    .di    	(data_in2   ),  // input [7 : 0] din
    .we  	(wr_en2     ),  // input wr_en
    .re  	(rd_en      ),  // input rd_en
     
    .do   	(data_out2  )   // output [7 : 0] dout
);
endmodule
