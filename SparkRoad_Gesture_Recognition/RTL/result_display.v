 
module  result_display(
    input                pixel_clk,
    input                sys_rst_n,
    input                rom_clk,
    input        [15:0]  Switch,      //模式切换结果显示
    input        [11:0]  pixel_xpos,  //像素点横坐标
    input        [11:0]  pixel_ypos,  //像素点纵坐标
    input        [23:0]  lcd_data,    //输入像素点数据
    input        [5:0]   sdata,       //手势识别结果
    output  reg  [23:0]  pixel_data   //像素点数据
);
 
reg   [13:0]  rom_addr;
wire  [23:0]  rom_data0;
wire  [23:0]  rom_data1;
wire  [23:0]  rom_data2;
wire  [23:0]  rom_data3;
wire  [23:0]  rom_data4;
wire  [23:0]  rom_data5;
wire  [23:0]  rom_data6;
wire   		  sys_rst_p;
wire          rd_en;
wire          pic_range;

parameter H_VALID = 10'd800;    //行有效数据
parameter V_VALID = 10'd600;    //场有效数据

parameter PIC_H = 10'd100;      //图片长度
parameter PIC_V = 10'd100;      //图片宽度
parameter PIC_SIZE= 14'd10000;  //图片像素个数

assign sys_rst_p = !sys_rst_n;

g0_rom u_g0_rom
(
    .clka                   (rom_clk                ),
    .addra                  (rom_addr               ),
    .doa                    (rom_data0              ),
	.ocea    				(rd_en					),
    .rsta    				(sys_rst_p			    )
); 
g1_rom u_g1_rom
(
    .clka                   (rom_clk                ),
    .addra                  (rom_addr               ),
    .doa                    (rom_data1              ),
	.ocea    				(rd_en					),
    .rsta    				(sys_rst_p			    )
);
g2_rom u_g2_rom
(
    .clka                   (rom_clk                ),
    .addra                  (rom_addr               ),
    .doa                    (rom_data2              ),
    .ocea    				(rd_en					),
    .rsta    				(sys_rst_p			    )
);
g3_rom u_g3_rom
(
    .clka                   (rom_clk                ),
    .addra                  (rom_addr               ),
    .doa                    (rom_data3              ),
    .ocea    				(rd_en					),
    .rsta    				(sys_rst_p			    )
);
g4_rom u_g4_rom
(
    .clka                   (rom_clk                ),
    .addra                  (rom_addr               ),
    .doa                    (rom_data4              ),
    .ocea    				(rd_en					),
    .rsta    				(sys_rst_p			    )
);
g5_rom u_g5_rom
(
    .clka                   (rom_clk                ),
    .addra                  (rom_addr               ),
    .doa                    (rom_data5              ),
    .ocea    				(rd_en					),
    .rsta    				(sys_rst_p			    )
);
g_none_rom u_g_none_rom
(
    .clka                   (rom_clk                ),
    .addra                  (rom_addr               ),
    .doa                    (rom_data6              ),
    .ocea    				(rd_en					),
    .rsta    				(sys_rst_p			    )
);


//图片范围
assign pic_range = (pixel_xpos >= H_VALID - PIC_H + 1'b1) && (pixel_xpos <=H_VALID) && (pixel_ypos >= 1'b1) && (pixel_ypos <=PIC_V);

//rom使能信号
assign rd_en = ((pixel_xpos >= (H_VALID - PIC_H)) && (pixel_xpos <= H_VALID-1'b1) && (pixel_ypos >= 1'b0) && (pixel_ypos <= PIC_V-1'b1));

//rom地址产生
always @(posedge rom_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        rom_addr <= 14'b0;
    else if(rom_addr==PIC_SIZE - 1'b1)
        rom_addr <= 14'b0;
    else if(rd_en==1'b1)
        rom_addr <= rom_addr + 1'b1;
end

//数据显示 
always @(*) begin
    if(pic_range &&(Switch[0] == 1&&Switch[1] == 1&&Switch[2] == 1&&Switch[3] == 1&&Switch[4] == 1&&Switch[5] == 0)) 
    begin
        if(sdata==0)
        	pixel_data <= rom_data0;          //叠加显示识别结果
        else if(sdata==1)
        	pixel_data <= rom_data1;
        else if(sdata==2)
        	pixel_data <= rom_data2;
        else if(sdata==3)
        	pixel_data <= rom_data3;
        else if(sdata==4)
        	pixel_data <= rom_data4;
        else if(sdata==5)
        	pixel_data <= rom_data5;
		else
        	pixel_data <= rom_data6;            
    end
    else
        pixel_data <= lcd_data;               //显示原始画面
end
 
    
endmodule