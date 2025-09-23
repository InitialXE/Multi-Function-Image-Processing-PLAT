`timescale 1ns/1ns


`define	RED 	16'b11111_000000_00000
`define	GREEN 	16'b00000_111111_00000
`define	BLUE 	16'b00000_000000_11111
`define	WHITE 	16'b11111_111111_11111
`define	BLACK 	16'b00000_000000_00000
`define	YELLOW 	16'b11111_111111_00000
`define	CYAN 	16'b11111_000000_11111//紫色
`define	ROYAL 	16'b00000_111111_11111//深蓝色


module vga_display
#(
	parameter	y_min = 0,
    parameter	x_min = 100,		//200 行到 600行  100列到500列
    parameter	y_max = 400,
    parameter	x_max = 500
    
)
( 
    input  wire         clk,
    input  wire         rst_n,
	input  wire	[15:0]	lcd_data,		//lcd data
    input  wire	[15:0]	cam_img,
    input  wire	[15:0]	boom_img,
	input 		[11:0]	lcd_x,
	input 		[11:0]	lcd_y,
	input  wire		    display_en,
	output	reg[15:0]	display_data,		//显示数据

    input      [9:0]      centre_x,
    input      [9:0]      centre_y,
    input      [9:0]   x_min_locate,
    input      [9:0]   x_max_locate,
    input      [9:0]   y_min_locate,
    input      [9:0]   y_max_locate
 );

wire	display_number_area =	(lcd_x >= x_min && lcd_x <=  x_max) && (lcd_y >= y_min && lcd_y <= y_max); //64


always @(*)begin
        if(lcd_y == y_min && lcd_x >= x_min && lcd_x <= x_max)
            display_data <= `CYAN;
        else if(lcd_y == y_max && lcd_x >= x_min && lcd_x <= x_max)
            display_data <= `CYAN;
        else if(lcd_x == x_min && lcd_y >= y_min && lcd_y <= y_max)
            display_data <= `CYAN;
        else if(lcd_x == x_max && lcd_y >= y_min && lcd_y <= y_max)
            display_data <= `CYAN;
        else if(lcd_x == centre_x && lcd_y >= y_min && lcd_y <= y_max )
            display_data <= `RED;
        else if(lcd_y == centre_y && lcd_x >= x_min && lcd_x <= x_max )
            display_data <= `RED;
        else if(lcd_x == x_min_locate && lcd_y >= y_min && lcd_y <= y_max )
            display_data <= `GREEN;
        else if(lcd_x == x_max_locate && lcd_y >= y_min && lcd_y <= y_max )
            display_data <= `GREEN;
        else if(lcd_y == y_min_locate && lcd_x >= x_min && lcd_x <= x_max )
            display_data <= `GREEN;
        else if(lcd_y == y_max_locate && lcd_x >= x_min && lcd_x <= x_max )
            display_data <= `GREEN;
        else if(display_number_area == 1'b1)begin
        	if(display_en)
            	display_data <= lcd_data;
        end
        else if(display_en)
            display_data <= lcd_data;
        else 
            display_data <= 0;
end

endmodule
