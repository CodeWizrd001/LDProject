module segment7(OUT, IN);

output reg [13:0] OUT;
input [3:0] IN;

reg [3:0] temp;

always@(IN)
begin
	if(IN<10)
	begin
		OUT[13:7] = 7'b1111110;
	end

	if(IN>=10)
	begin 
		OUT[13:7] = 7'b0110000;
	end
end

always@(IN)
begin
	if(IN>=10)
		temp = IN-14'b1010;
	else
		temp = IN;
end

always@(temp)
begin
	if(temp == 0)
	begin
		OUT[6:0] = 7'b1111110;
	end
	
	if(temp == 1)
	begin
		OUT[6:0] = 7'b0110000;
	end
	
	if(temp == 2)
	begin
		OUT[6:0] = 7'b1101101;
	end

	if(temp == 3)
	begin
		OUT[6:0] = 7'b1111001;
	end

	if(temp == 4)
	begin
		OUT[6:0] = 7'b0110011;
	end

	if(temp == 5)
	begin
		OUT[6:0] = 7'b1011011;
	end

	if(temp == 6)
	begin
		OUT[6:0] = 7'b1011111;
	end
	
	if(temp == 7)
	begin
		OUT[6:0] = 7'b1110000;
	end
	
	if(temp == 8)
	begin
		OUT[6:0] = 7'b1111111;
	end
	
	if(temp == 9)
	begin
		OUT[6:0] = 7'b1110011;
	end
end	

endmodule
