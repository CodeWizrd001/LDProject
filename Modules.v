module Mux2x1(out,in1,in2,s) ;

output reg out ;
input in1,in2,s ;

always@(in1,in2,s)
begin 
	if(s == 0) 
		out = in1 ;
	else if(s == 1) 
		out = in2 ;
	else 
		out = 1'bx ;
end

endmodule 

module Or(out,a,b) ;

output out ;
input a,b ;

or(out,a,b) ;

endmodule 

module PEncoder(out,in1,in2,in3,in4) ;

output reg [1:0] out ;
input in1 ,in2 ,in3 ,in4 ;

always @(in1,in2,in3,in4)
begin
	if (in1== 1)
		out = 0 ;
	else if(in2 == 1) 
		out = 1 ;
	else if(in3 == 1)
		out = 2 ;
	else if(in4 == 1)
		out = 3 ;
	else 
		out = 2'bxx ;
end

endmodule

module Decoder(o1,o2,o3,o4,in) ;

output reg o1,o2,o3,o4 ;
input [1:0] in ;

always @(in)
begin
	if(in == 0)
	begin 
		o1 = 1 ;
		o2 = 0 ;
		o3 = 0 ;
		o4 = 0 ;
	end 
	if(in == 1)
	begin 
		o1 = 0 ;
		o2 = 1 ;
		o3 = 0 ;
		o4 = 0 ;
	end 
	if(in == 2)
	begin 
		o1 = 0 ;
		o2 = 0 ;
		o3 = 1 ;
		o4 = 0 ;
	end 
	if(in == 3)
	begin 
		o1 = 0 ;
		o2 = 0 ;
		o3 = 0 ;
		o4 = 1 ;
	end 
end

endmodule

module TimerIC(clk,mode,BoardSelect) ;

output reg [1:0] mode,BoardSelect ;
input clk ;
reg [5:0] TClock ;

initial 
begin
	mode = 0 ;
	BoardSelect = 0 ;
end

always @(posedge clk) 
begin 
	TClock = TClock + 1 ;
	if(TClock%16==15)
		mode =~ mode ;
	if(TClock%32==31)
		BoardSelect = BoardSelect + 1 ;
end
endmodule

module LightBoard(enable,mode,mode_out) ;

output reg [1:0] mode_out ;
input enable ;
input [1:0] mode ;

endmodule

module TrafficSignal(clk) ;

input clk ;

endmodule 

module TrafficSystem(clk,imgData,ans) ;

input clk ;
input [1023:0] imgData ;

integer Fin ;
integer Fin_ ;
integer i ;
integer j ;
integer max ;
integer maxi ;

output reg [5:0] ans ;

reg [11:0] similar [260:0] ;
reg [1023:0] Sample [260:0] ;

initial 
begin 
	for(i=0;i<260;i=i+1)
		similar[i] = 0 ;
	Fin = $fopen("Samples/pixelArrayInputFile.txt","r") ;
	if (Fin==0)
	begin
    		$display("data_file handle was NULL");
    		$finish;
	end
	for(i=0;i<260;i=i+1)
	begin 
		Fin_ = $fscanf(Fin,"%b",Sample[i]) ;
	end
end

always@(imgData)
begin
	for(i=0;i<260;i=i+1)
		for(j=0;j<1024;j=j+1)
		begin
			if(Sample[i][j] == imgData[j])
				similar[i] = similar[i] + 1 ;
		end
	max = 0 ;
	maxi = 0 ;
	for(i=0;i<260;i=i+1)
		if(similar[i]>max)
		begin 
			max = similar[i] ;
			maxi = i ;
		end
	ans = maxi/10 + 1 ;
end
endmodule 