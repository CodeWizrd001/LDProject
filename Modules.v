module PEncoder(out,in1,in2,in3,in4) ;

output reg out ;
input in1 ,in2 ,in3 ,in4 ;

always @(in1,in2,in3,in4)
begin
	if in1== 1
		out = 0 ;
	else if in2 == 1 
		out = 1 ;
	else if in3 == 1 
		out = 2 ;
	else if in4 == 1 
		out = 3 ;
	else 
		out = 2'bxx ;
end

endmodule