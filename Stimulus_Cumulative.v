module StimTraffic_Cumulative ;

wire [4:0] ans ;
reg clk ;
reg [1023:0] imgDataMid,imgDataL,imgDataR,imgDataD,imgDataT  ; 
wire [1023:0] imgDataOut1,imgDataOut2,imgDataOut3,imgDataOut4,imgDataOut5 ;
wire [4:0] act ;
reg [3:0] pMid,eMid,pL,eL,pR,eR,pT,eT,pD,eD ;
wire [13:0] d1,d2,d3,d4,d5 ;

wire [4:0] outMidF,outMidL,outMidR,outMidB ;
wire [4:0] outLF,outLR,outLB,outLL ;
wire [4:0] outRF,outRR,outRB,outRL ; 
wire [4:0] outTF,outTR,outTB,outTL ;
wire [4:0] outDF,outDR,outDB,outDL ;

integer Fin,Fin_ ;

TrafficSignal Mid(clk,outMidF,outMidL,outMidR,outMidB,imgDataOut1,d1,imgDataMid,act[0],pMid,eMid) ;
TrafficSignal L(clk,outLF,outLR,outLB,outLL,imgDataOut2,d2,imgDataL,act[1],pL,eL) ;
TrafficSignal R(clk,outRF,outRR,outRB,outRL,imgDataOut3,d3,imgDataR,act[2],pR,eR) ;
TrafficSignal T(clk,outTF,outTR,outTB,outTL,imgDataOut4,d4,imgDataT,act[3],pT,eT) ;
TrafficSignal D(clk,outDF,outDR,outDB,outDL,imgDataOut5,d5,imgDataD,act[4],pD,eD) ;
TrafficSystem Sys(clk,imgDataOut1,imgDataOut2,imgDataOut3,imgDataOut4,imgDataOut5,act,ans) ;

initial
begin
	pMid=0;eMid=0;pL=0;eL=0;pR=0;eR=0;pT=0;eT=0;pD=0;eD=0;
	$system("pip3 install pillow") ;
	$system("pip install pillow") ;
	clk = 0 ;
end 

always
begin
	clk=~clk ;#1 ;
end

initial
begin
	#30 ;
        $system("python3 ProcessImage_All.py") ; #10 ;
	Fin = $fopen("Inputs.txt","r") ;
	Fin_ = $fscanf(Fin,"%b",imgDataMid) ; #10 ;
	Fin_ = $fscanf(Fin,"%b",imgDataL) ; #10 ;
	Fin_ = $fscanf(Fin,"%b",imgDataR) ; #10 ;
	Fin_ = $fscanf(Fin,"%b",imgDataMid) ; #10 ;
	Fin_ = $fscanf(Fin,"%b",imgDataL) ; #10 ;
	Fin_ = $fscanf(Fin,"%b",imgDataL) ; #10 ;
	Fin_ = $fscanf(Fin,"%b",imgDataR) ; #10 ;
	Fin_ = $fscanf(Fin,"%b",imgDataMid) ; #10 ;
	Fin_ = $fscanf(Fin,"%b",imgDataL) ; #10 ;
	Fin_ = $fscanf(Fin,"%b",imgDataT) ; #10 ;
	Fin_ = $fscanf(Fin,"%b",imgDataD) ; #10 ;
	Fin_ = $fscanf(Fin,"%b",imgDataD) ; #10 ;
	Fin_ = $fscanf(Fin,"%b",imgDataD) ; #10 ;
	Fin_ = $fscanf(Fin,"%b",imgDataL) ; #10 ;
	Fin_ = $fscanf(Fin,"%b",imgDataMid) ; #10 ;
	Fin_ = $fscanf(Fin,"%b",imgDataL) ; #10 ;
	Fin_ = $fscanf(Fin,"%b",imgDataR) ; #10 ;
	Fin_ = $fscanf(Fin,"%b",imgDataL) ; #10 ;
	Fin_ = $fscanf(Fin,"%b",imgDataMid) ; #10 ;
	Fin_ = $fscanf(Fin,"%b",imgDataL) ; #10 ;
	Fin_ = $fscanf(Fin,"%b",imgDataR) ; #10 ;
	Fin_ = $fscanf(Fin,"%b",imgDataD) ; #10 ;
	Fin_ = $fscanf(Fin,"%b",imgDataT) ; #10 ;
	Fin_ = $fscanf(Fin,"%b",imgDataD) ; #10 ;
	Fin_ = $fscanf(Fin,"%b",imgDataL) ; #10 ;
	Fin_ = $fscanf(Fin,"%b",imgDataD) ; #10 ;
	Fin_ = $fscanf(Fin,"%b",imgDataL) ; #10 ;
	Fin_ = $fscanf(Fin,"%b",imgDataR) ; #10 ;
	pMid = 4 ; #50 ;
	eL = 8 ; #50 ; 
	pR = 1 ; #50 ;
	eD = 2 ; #50 ;	
	pT = 2 ; #50 ;
	#50 ; 
	pMid = 0 ; #5 ;
	eL = 0 ; #5 ; 
	pR = 0 ; #5 ; 
	eD = 0 ; #5 ; 
	pT = 0 ; 
end

endmodule 