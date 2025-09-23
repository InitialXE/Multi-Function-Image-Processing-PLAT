module Gesture_recognition( 
    input   wire    clk,
    input   wire    rst_n,

    input   [31:0]  Hu_1,
    input   [31:0]  Hu_2,
    input   [23:0]  Perimeter_Aera,

    output  [5:0]   sdata
);


parameter   Gesture_0_Hu_1  =   25;  
parameter   Gesture_0_Hu_2  =   401;
parameter   Gesture_0_Scale =   172;

parameter   Gesture_1_Hu_1  =   17;  
parameter   Gesture_1_Hu_2  =   141;
parameter   Gesture_1_Scale =   114;

parameter   Gesture_2_Hu_1  =   21;
parameter   Gesture_2_Hu_2  =   165;
parameter   Gesture_2_Scale =   114;

parameter   Gesture_3_Hu_1  =   20;                                                       
parameter   Gesture_3_Hu_2  =   160;
parameter   Gesture_3_Scale =   98;

parameter   Gesture_4_Hu_1  =   19;
parameter   Gesture_4_Hu_2  =   85;
parameter   Gesture_4_Scale =   95;

parameter   Gesture_5_Hu_1  =   19;
parameter   Gesture_5_Hu_2  =   85;
parameter   Gesture_5_Scale =   168;

reg [35:0]  Distance_0;
reg [35:0]  Distance_1;
reg [35:0]  Distance_2;
reg [35:0]  Distance_3;
reg [35:0]  Distance_4;
reg [35:0]  Distance_5;

reg [35:0]  Distance_0_Ok;
reg [35:0]  Distance_1_Ok;
reg [35:0]  Distance_2_Ok;
reg [35:0]  Distance_3_Ok;
reg [35:0]  Distance_4_Ok;
reg [35:0]  Distance_5_Ok;


reg [15:0]  Gesture0_Hu_1_cache;
reg [15:0]  Gesture1_Hu_1_cache;
reg [15:0]  Gesture2_Hu_1_cache;
reg [15:0]  Gesture3_Hu_1_cache;
reg [15:0]  Gesture4_Hu_1_cache;
reg [15:0]  Gesture5_Hu_1_cache;

reg [15:0]  Gesture0_Hu_2_cache;
reg [15:0]  Gesture1_Hu_2_cache;
reg [15:0]  Gesture2_Hu_2_cache;
reg [15:0]  Gesture3_Hu_2_cache;
reg [15:0]  Gesture4_Hu_2_cache;
reg [15:0]  Gesture5_Hu_2_cache;

reg [20:0]  Gesture0_PA_cache;
reg [20:0]  Gesture1_PA_cache;
reg [20:0]  Gesture2_PA_cache;
reg [20:0]  Gesture3_PA_cache;
reg [20:0]  Gesture4_PA_cache;
reg [20:0]  Gesture5_PA_cache;


always@(posedge clk or negedge rst_n) begin
    if (!rst_n)begin
	    Gesture0_Hu_1_cache  <=  0;
        Gesture1_Hu_1_cache  <=  0;
        Gesture2_Hu_1_cache  <=  0;
        Gesture3_Hu_1_cache  <=  0;
        Gesture4_Hu_1_cache  <=  0;
        Gesture5_Hu_1_cache  <=  0;
    end
    else    begin
        Gesture0_Hu_1_cache <=  Hu_1-Gesture_0_Hu_1;
        Gesture1_Hu_1_cache <=  Hu_1-Gesture_1_Hu_1;
        Gesture2_Hu_1_cache <=  Hu_1-Gesture_2_Hu_1;
        Gesture3_Hu_1_cache <=  Hu_1-Gesture_3_Hu_1;
        Gesture4_Hu_1_cache <=  Hu_1-Gesture_4_Hu_1;
        Gesture5_Hu_1_cache <=  Hu_1-Gesture_5_Hu_1;
    end
end 

always@(posedge clk or negedge rst_n) begin
    if (!rst_n)begin
	    Gesture0_Hu_2_cache  <=  0;
        Gesture1_Hu_2_cache  <=  0;
        Gesture2_Hu_2_cache  <=  0;
        Gesture3_Hu_2_cache  <=  0;
        Gesture4_Hu_2_cache  <=  0;
        Gesture5_Hu_2_cache  <=  0;
    end
    else    begin
        Gesture0_Hu_2_cache <=  Hu_2-Gesture_0_Hu_2;
        Gesture1_Hu_2_cache <=  Hu_2-Gesture_1_Hu_2;
        Gesture2_Hu_2_cache <=  Hu_2-Gesture_2_Hu_2;
        Gesture3_Hu_2_cache <=  Hu_2-Gesture_3_Hu_2;
        Gesture4_Hu_2_cache <=  Hu_2-Gesture_4_Hu_2;
        Gesture5_Hu_2_cache <=  Hu_2-Gesture_5_Hu_2;
    end
end 

always@(posedge clk or negedge rst_n) begin
    if (!rst_n)begin
	    Gesture0_PA_cache  <=  0;
        Gesture1_PA_cache  <=  0;
        Gesture2_PA_cache  <=  0;
        Gesture3_PA_cache  <=  0;
        Gesture4_PA_cache  <=  0;
        Gesture5_PA_cache  <=  0;
    end
    else    begin
        Gesture0_PA_cache <=  Perimeter_Aera-Gesture_0_Scale;
        Gesture1_PA_cache <=  Perimeter_Aera-Gesture_1_Scale;
        Gesture2_PA_cache <=  Perimeter_Aera-Gesture_2_Scale;
        Gesture3_PA_cache <=  Perimeter_Aera-Gesture_3_Scale;
        Gesture4_PA_cache <=  Perimeter_Aera-Gesture_4_Scale;
        Gesture5_PA_cache <=  Perimeter_Aera-Gesture_5_Scale;
    end
end 

always@(posedge clk or negedge rst_n) begin
    if (!rst_n)begin
	    Distance_0  <=  0;
        Distance_1  <=  0;
        Distance_2  <=  0;
        Distance_3  <=  0;
        Distance_4  <=  0;
        Distance_5  <=  0;
    end //
 	else begin
        Distance_0  <=  (Gesture0_Hu_1_cache)*(Gesture0_Hu_1_cache) + (Gesture0_Hu_2_cache)*(Gesture0_Hu_2_cache)  + (Gesture0_PA_cache)* (Gesture0_PA_cache);
        Distance_1  <=  (Gesture1_Hu_1_cache)*(Gesture1_Hu_1_cache) + (Gesture1_Hu_2_cache)*(Gesture1_Hu_2_cache)  + (Gesture1_PA_cache)* (Gesture1_PA_cache);
        Distance_2  <=  (Gesture2_Hu_1_cache)*(Gesture2_Hu_1_cache) + (Gesture2_Hu_2_cache)*(Gesture2_Hu_2_cache)  + (Gesture2_PA_cache)* (Gesture2_PA_cache);
        Distance_3  <=  (Gesture3_Hu_1_cache)*(Gesture3_Hu_1_cache) + (Gesture3_Hu_2_cache)*(Gesture3_Hu_2_cache)  + (Gesture3_PA_cache)* (Gesture3_PA_cache);
        Distance_4  <=  (Gesture4_Hu_1_cache)*(Gesture4_Hu_1_cache) + (Gesture4_Hu_2_cache)*(Gesture4_Hu_2_cache)  + (Gesture4_PA_cache)* (Gesture4_PA_cache);
        Distance_5  <=  (Gesture5_Hu_1_cache)*(Gesture5_Hu_1_cache) + (Gesture5_Hu_2_cache)*(Gesture5_Hu_2_cache)  + (Gesture5_PA_cache)* (Gesture5_PA_cache);
    end	
end	


always@(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        Distance_0_Ok   <=   0;
        Distance_1_Ok   <=   0;
        Distance_2_Ok   <=   0;
        Distance_3_Ok   <=   0;
        Distance_4_Ok   <=   0;
        Distance_5_Ok   <=   0;
    end
    else    begin
        if(Distance_0[35]  == 1'b1)
            Distance_0_Ok <= -Distance_0;
        else
            Distance_0_Ok <=  Distance_0;
            
        if(Distance_1[35]  == 1'b1)
            Distance_1_Ok <= -Distance_1;
        else
            Distance_1_Ok <=  Distance_1;
            
        if(Distance_2[35]  == 1'b1)
            Distance_2_Ok <= -Distance_2;
        else
            Distance_2_Ok <=  Distance_2;
            
        if(Distance_3[35]  == 1'b1)
            Distance_3_Ok <= -Distance_3;
        else
            Distance_3_Ok <=  Distance_3;
            
        if(Distance_4[35]  == 1'b1)
            Distance_4_Ok <= -Distance_4;
        else
            Distance_4_Ok <=  Distance_4;
            
        if(Distance_5[35]  == 1'b1)
            Distance_5_Ok <= -Distance_5;
        else
            Distance_5_Ok <=  Distance_5;
    end
end



reg [35:0] min_data_1;
reg [35:0] min_data_2;

reg [35:0] min_data;

always@(posedge clk or negedge rst_n) begin
    if (!rst_n)begin
        min_data_1    <=  36'd0;
        min_data_2    <=  36'd0;
    end
   else    begin
        if((Distance_0_Ok <= Distance_1_Ok) && (Distance_0_Ok <= Distance_2_Ok))
            min_data_1 <= Distance_0_Ok;
        else if((Distance_1_Ok <= Distance_0_Ok) && (Distance_1_Ok <= Distance_2_Ok))
            min_data_1 <= Distance_1_Ok;
        else
            min_data_1 <= Distance_2_Ok;
            
        if((Distance_3_Ok <= Distance_4_Ok) && (Distance_3_Ok <= Distance_5_Ok))
            min_data_2 <= Distance_3;
        else if((Distance_4_Ok <= Distance_3_Ok) && (Distance_4_Ok <= Distance_5_Ok))
            min_data_2 <= Distance_4_Ok;
        else
            min_data_2 <= Distance_5_Ok;

       
    end
end

always@(posedge clk or negedge rst_n) begin
    if (!rst_n)begin
        min_data <= 36'd0;
    end
    else    begin
        if(min_data_1 <= min_data_2)
            min_data    <=  min_data_1;
        else
            min_data    <=  min_data_2;
    end
end
reg    [5:0]   data;
//assign      sdata =  data;
always@(posedge clk or negedge rst_n) begin
    if(!rst_n)
        data    <=  0;
    else    begin
        if(Perimeter_Aera   >=  24'd10)begin
            if(min_data ==  Distance_0_Ok)
                data    <=  6'd0;
            else    if(min_data ==  Distance_1_Ok)
                data    <=  6'd1;
            else    if(min_data ==  Distance_2_Ok)
                data    <=  6'd2;
            else    if(min_data ==  Distance_3_Ok)
                data    <=  6'd3;
            else    if(min_data ==  Distance_4_Ok)
                data    <=  6'd4;
            else    if(min_data ==  Distance_5_Ok)
                data    <=  6'd5;
            else
                data    <=  6'd7;
        end
        else
            data    <=  6'd8;
    end
end

assign      sdata =  data;

endmodule