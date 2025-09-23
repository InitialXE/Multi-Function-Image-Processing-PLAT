module Perimeter_aera(
    input   wire    clk,
    input   wire    rst_n,


    input   wire    Sobel_clk,//synthesis keep
    input   wire    Dilation_clk,//synthesis keep

    input           Sobel_img,//synthesis keep
    input           Dilation_img,//synthesis keep

    output  reg  [23:0] Perimeter,      //周长
    output  reg  [23:0] Aera,//synthesis keep   
    output  reg         end_flag,  
    output  reg	  [23:0] Perimeter_Aera//synthesis keep
 );

parameter   ROW_CNT = 800;
parameter   COL_CNT = 600;      //800lie  600行

reg [11:0]  count_x;//synthesis keep
reg [11:0]  count_y;//synthesis keep

wire	display_number_area =	(count_x >= 150 && count_x <=  450) && (count_y >= 50 && count_y <= 350); //64
//行计数 
always @(posedge clk or negedge rst_n)begin  
    if(rst_n == 1'b0)begin
        count_x <= 0;
    end
    else if(Sobel_clk && count_x == ROW_CNT - 1)
        count_x <= 0;
    else if(Sobel_clk)begin
        count_x <= count_x + 1'b1;
    end
    else 
        count_x <= count_x;
end

assign  row_flag = (Sobel_clk && count_x == 800 - 1'b1)? 1'b1:1'b0;

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

wire   flag ;//synthesis keep   
assign flag = (count_x == 150 && count_y == 50)? 1'b1:1'b0;



wire   end_flag ;//synthesis keep   
assign end_flag = (count_x == 450 && count_y == 350)? 1'b1:1'b0;


always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
       Perimeter   <= 1'd0;
    end
    else    begin
        if(flag)    
        begin
            Perimeter   <= 1'd0;
        end
        else if(Sobel_clk && display_number_area && Sobel_img == 1'b1)
        begin
            Perimeter   <=  Perimeter + 1'b1;
        end
    end
end 
always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
       Aera   <= 1'd0;
    end
    else    begin
        if(flag)    
        begin
            Aera   <= 1'd0;
        end
        else if(Dilation_clk && display_number_area && Dilation_img == 1'b1)
        begin
            Aera    <=  Aera + 1'b1;
        end
    end
end 


always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
       Perimeter_Aera   <= 1'd0;
    end
    else    begin
        if(ok_flag_Perimeter_Aera)    
        begin
            Perimeter_Aera   <= quotient;
        end
    end
end 


wire    [23:0]      quotient;//synthesis keep


wire        ok_flag_Perimeter_Aera;//synthesis keep
Divider u_Divider_1(
    .clk(clk),
    .rst(~rst_n),

    .numerator(Aera*10),
    .denominator(Perimeter),

    .start(end_flag),

    .quotient(quotient),
    .remainder(),
    .done(ok_flag_Perimeter_Aera)
);

endmodule
