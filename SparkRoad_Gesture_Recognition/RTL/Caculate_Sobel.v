module Caculate_Sobel(
	//时钟
    input       clk,
    input       rst_n,
    
    input		cnt_rd,
    input		rd_en_dly2,
    
    input       matrix_frame_vsync,
    input       matrix_frame_href,
    input       matrix_frame_clken,
    
    
    input [7:0]  data11, 
    input [7:0]  data12, 
    input [7:0]  data13,
    input [7:0]  data21, 
    input [7:0]  data22, 
    input [7:0]  data23,
    input [7:0]  data31, 
    input [7:0]  data32, 
    input [7:0]  data33,
    
    
    output reg [15:0] target_data,
    
    output       pos_median_vsync,
    output       pos_median_href,
    output       pos_median_clken
 );
 
reg             compare_flag;
reg             gx_gy_flag  ;
reg             gxy_flag    ;
reg     [8:0]   gx          ;
reg     [8:0]   gy          ;
reg     [7:0]   gxy         ;


always@(posedge clk or  negedge rst_n)
    if(rst_n == 1'b0)
        gx_gy_flag  <=  1'b0;
    else    if((rd_en_dly2 == 1'b1) && ((cnt_rd >= 8'd3) || (cnt_rd == 8'd0)))
        gx_gy_flag  <=  1'b1;
    else
        gx_gy_flag  <=  1'b0;

//gxy_flag：gxy计算标准信号
always@(posedge clk or  negedge rst_n)
    if(rst_n == 1'b0)
        gxy_flag    <=  1'b0;
    else    if(gx_gy_flag == 1'b1)
        gxy_flag    <=  1'b1;
    else
        gxy_flag    <=  1'b0;


//compare_flag,阈值比较标志信号
always@(posedge clk or  negedge rst_n)
    if(rst_n == 1'b0)
        compare_flag    <=  1'b0;
    else    if(gxy_flag == 1'b1)
        compare_flag    <=  1'b1;
    else
        compare_flag    <=  1'b0;
               
//gx：计算gx
always@(posedge clk or  negedge rst_n)
    if(rst_n == 1'b0)
        gx  <=  9'd0;
    else    if(gx_gy_flag == 1'b1)
        gx  <=  data13 - data11 + ((data23 - data21) << 1) + data33 - data31;
    else
        gx  <=  gx;
//gy：计算gy
always@(posedge clk or  negedge rst_n)
    if(rst_n == 1'b0)
        gy  <=  9'd0;
    else    if(gx_gy_flag == 1'b1)
        gy  <=  data11 - data31 + ((data12 - data32) << 1) + data13 - data33;
    else
        gy  <=  gy;     
        
        
//gxy：gxy计算
always@(posedge clk or  negedge rst_n)
    if(rst_n == 1'b0)
        gxy <=  0;
    else    if((gx[8] == 1'b1) && (gy[8] == 1'b1) && (gxy_flag == 1'b1))
        gxy <=  (~gx[7:0] + 1'b1) + (~gy[7:0] + 1'b1);
    else    if((gx[8] == 1'b1) && (gy[8] == 1'b0) && (gxy_flag == 1'b1))
        gxy <=  (~gx[7:0] + 1'b1) + (gy[7:0]);
    else    if((gx[8] == 1'b0) && (gy[8] == 1'b1) && (gxy_flag == 1'b1))
        gxy <=  (gx[7:0]) + (~gy[7:0] + 1'b1);
    else    if((gx[8] == 1'b0) && (gy[8] == 1'b0) && (gxy_flag == 1'b1))
        gxy <=  (gx[7:0]) + (gy[7:0]);  
        
        
        
reg  [7:0]  THRESHOLD   =   8'd2   ;   //比较阈值    
//Sobel_Image：通过gxy与阈值比较,赋值Sobel_Image
always@(posedge clk or  negedge rst_n)
    if(rst_n == 1'b0)
        target_data <=  16'b0;
    else    if((gxy >= THRESHOLD) && (compare_flag == 1'b1))
        target_data <=  16'hffff;
    else    if(compare_flag == 1'b1)
        target_data <=  16'b0;
 
assign pos_median_vsync = matrix_frame_vsync_r[2];
assign pos_median_href  = matrix_frame_href_r[2];
assign pos_median_clken = matrix_frame_clken_r[2];
 
reg [2:0]   matrix_frame_vsync_r;
reg [2:0]   matrix_frame_href_r;
reg [2:0]   matrix_frame_clken_r; 
 //延迟三个周期进行同步
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        matrix_frame_vsync_r <= 0;
        matrix_frame_href_r  <= 0;
        matrix_frame_clken_r <= 0;
    end
    else begin
        matrix_frame_vsync_r <= {matrix_frame_vsync_r[1:0],matrix_frame_vsync};
        matrix_frame_href_r  <= {matrix_frame_href_r [1:0], matrix_frame_href};
        matrix_frame_clken_r <= {matrix_frame_clken_r[1:0],matrix_frame_clken};
    end
end

               
endmodule
