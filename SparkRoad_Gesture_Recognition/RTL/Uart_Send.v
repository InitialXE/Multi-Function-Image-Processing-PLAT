module Uart_Send
#(
    parameter UART_BPS = 'd115200, //波特率9600
    parameter CLK_FREQ = 'd24_000_000, //时钟频率24Mhz
    parameter BYTES = 'd6, //需要发送数据的字节数
    parameter S = 8'b0101_0011,
    parameter U = 8'b0101_0101,
    parameter C = 8'b0100_0011,
    parameter E = 8'b0100_0101,
    parameter EXCLAMATORY = 8'b0010_0001
)
(
    input wire clk,
    input wire rst_n,
    input wire [(BYTES * 8 -1):0] pi_data,
    input wire pi_flag,

    output reg tx

);

localparam BAUD_CNT_MAX = CLK_FREQ/UART_BPS ;
//1S钟传输9600bit数据，时钟1S有5000000次，每传输1bi数据，共经过50000000/9600次时钟周期，
//故采样计数最大值50000000/9600=5208

reg work_en; //发送控制使能信号
reg [12:0] baud_cnt;//发送计数器，波特率9600，时钟频率50M，故计数5208次
reg bit_flag;//发送标志信号，baud_cnt为1时产生1个时钟周期的高电平

reg [(BYTES*8-1):0] UART_data; //需要发送的数据
reg [7:0] buffer_data; //发送数据缓存区，每次发送1字节
reg [12:0] cnt_num; //发送数据的字节数
reg byte_tx_done; //1字节数据发送完成标志信号
reg byte_tx_done_reg; //1字节数据发送完成标志信号打1拍，确保待发送数据给到发送数据缓存区
reg [4:0] bit_flag_cnt; //数据发送计数器，每发送1bit计数1次，发送完1字节后清零
reg pi_flag_reg1; //接收完成标志信号打一拍，将数据传递给buffer_data
reg pi_flag_reg2; //pi_flag_reg1打一拍，用于产生发送使能控制信号work_en

always @(posedge clk or negedge rst_n)
    if (rst_n == 1'b0)
        cnt_num <= 13'd0;
    else if ((cnt_num == (BYTES-1)) && (byte_tx_done == 1'b1))
        cnt_num <= 13'd0;
    else if ((work_en == 1'b1) && (byte_tx_done == 1'b1))
        cnt_num <= cnt_num + 1'd1;

always @(posedge clk or negedge rst_n)
    if (rst_n == 1'b0)
        bit_flag_cnt <= 5'b0;
    else if (work_en == 1'b0)
        bit_flag_cnt <= 5'b0;
    else if( (bit_flag_cnt == 5'd9) && ( (bit_flag == 13'b1) && (work_en == 1'b1) ) )
        bit_flag_cnt <= 5'd0;
    else if((bit_flag == 1'b1) && (work_en == 1'b1))
        bit_flag_cnt <= bit_flag_cnt + 1'b1;

always @(posedge clk or negedge rst_n)
    if (rst_n == 1'b0)
        byte_tx_done <= 1'b0;
    else if ( (bit_flag_cnt == 5'd9) && ( (bit_flag == 13'b1) && (work_en == 1'b1) ) )
        byte_tx_done <= 1'b1;
    else
        byte_tx_done <= 1'b0;

always @(posedge clk or negedge rst_n)
    if (rst_n == 1'b0)
        byte_tx_done_reg <= 1'b0;
    else
        byte_tx_done_reg <= byte_tx_done;

always @(posedge clk or negedge rst_n)
    if (rst_n == 1'b0)
        UART_data <= 'b0;
    else if ((pi_flag == 1'b1)&&(cnt_num == 13'd0))
        UART_data <= pi_data;
    else if (byte_tx_done == 1'b1)
        UART_data <= UART_data << 8;

always @(posedge clk or negedge rst_n)
    if( rst_n == 1'b0 )
        pi_flag_reg1 <= 1'b0;
    else if ((pi_flag == 1'b1) && (cnt_num == 13'd0) )
        pi_flag_reg1 <= 1'b1;
    else
        pi_flag_reg1 <= 1'b0;

always @(posedge clk or negedge rst_n)
    if( rst_n == 1'b0 )
        pi_flag_reg2 <= 1'b0;
    else if ((pi_flag_reg1 == 1'b1) && (cnt_num == 13'd0) )
        pi_flag_reg2 <= 1'b1;
    else
        pi_flag_reg2 <= 1'b0;

always @(posedge clk or negedge rst_n)
    if (rst_n == 1'b0)
        buffer_data <= 8'b0;
    else if ((pi_flag_reg1 == 1'b1)&&(cnt_num == 13'd0))
        buffer_data <= UART_data[(BYTES * 8 -1):(BYTES * 8 -8)];
    else if ((bit_flag_cnt == 5'd0) && (byte_tx_done_reg == 1'b1))
        buffer_data <= UART_data[(BYTES * 8 -1):(BYTES * 8 -8)];

always @(posedge clk or negedge rst_n)
    if(rst_n == 1'b0)
        work_en <= 1'b0;
    else if ((pi_flag_reg2 == 1'b1))
        work_en <= 1'b1;
    else if ((cnt_num == (BYTES-1)) && ((bit_flag_cnt == 5'd9) && (bit_flag == 1'b1)))
        work_en <= 1'b0;

always @(posedge clk or negedge rst_n)
    if(rst_n == 1'b0)
        baud_cnt <= 13'b0;
    else if ((work_en == 1'b0) || (baud_cnt == BAUD_CNT_MAX-1 ))
        baud_cnt <= 13'b0;
    else if(work_en == 1'b1)
        baud_cnt <= baud_cnt +1'b1;

always @(posedge clk or negedge rst_n)
    if(rst_n == 1'b0)
        bit_flag <= 1'b0;
    else if (baud_cnt == 13'b1)
        bit_flag <= 1'b1;
    else
        bit_flag <= 1'b0;

always @(posedge clk or negedge rst_n)
    if (rst_n == 1'b0)
        tx <= 1'b1;
    else if(bit_flag)
        case (bit_flag_cnt)
            0 : tx <= 1'b0;
            1 : tx <= buffer_data[0];
            2 : tx <= buffer_data[1];
            3 : tx <= buffer_data[2];
            4 : tx <= buffer_data[3];
            5 : tx <= buffer_data[4];
            6 : tx <= buffer_data[5];
            7 : tx <= buffer_data[6];
            8 : tx <= buffer_data[7];
            9 : tx <= 1'b1;
            default: tx <= 1'b1;
        endcase
endmodule
