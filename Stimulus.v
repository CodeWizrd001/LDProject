module StimTraffic ;

wire [4:0] ans ;
reg clk ;
reg [1023:0] imgDataMid,imgDataL,imgDataR,imgDataD,imgDataT,imgData  ; 
wire [1023:0] imgDataOut1,imgDataOut2,imgDataOut3,imgDataOut4,imgDataOut5 ;
wire [4:0] act ;
reg [3:0] pMid,eMid,pL,eL,pR,eR,pT,eT,pD,eD ;

integer Fin,Fin_ ;

TrafficSignal Mid(clk,imgDataOut1,imgDataMid,act[0],pMid,eMid) ;
TrafficSignal L(clk,imgDataOut2,imgDataL,act[1],pL,eL) ;
TrafficSignal R(clk,imgDataOut3,imgDataR,act[2],pR,eR) ;
TrafficSignal T(clk,imgDataOut4,imgDataT,act[3],pT,eT) ;
TrafficSignal D(clk,imgDataOut5,imgDataD,act[4],pD,eD) ;
TrafficSystem Sys(clk,imgDataOut1,imgDataOut2,imgDataOut3,imgDataOut4,imgDataOut5,act,ans) ;

initial
begin
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
        $system("python ProcessImage.py A_1") ; #5 ;
	Fin = $fopen("A_1.txt","r") ;
	Fin_ = $fscanf(Fin,"%b",imgDataMid) ; #5 ;
	$system("python ProcessImage.py B_1") ; #5 ;
	Fin = $fopen("B_1.txt","r") ;
	Fin_ = $fscanf(Fin,"%b",imgDataL) ; #5 ;
	$system("python ProcessImage.py C_1") ; #5 ;
	Fin = $fopen("C_1.txt","r") ;
	Fin_ = $fscanf(Fin,"%b",imgDataR) ; #5 ;
	$system("python ProcessImage.py D_1") ; #5 ;
	Fin = $fopen("D_1.txt","r") ;
	Fin_ = $fscanf(Fin,"%b",imgData) ; #5 ;
	$system("python ProcessImage.py E_1") ; #5 ;
	Fin = $fopen("E_1.txt","r") ;
	Fin_ = $fscanf(Fin,"%b",imgData) ; #5 ;
	$system("python ProcessImage.py F_1") ; #5 ;
	Fin = $fopen("F_1.txt","r") ;
	Fin_ = $fscanf(Fin,"%b",imgData) ; #5 ;
	$system("python ProcessImage.py G_1") ; #5 ;
	Fin = $fopen("G_1.txt","r") ;
	Fin_ = $fscanf(Fin,"%b",imgData) ; #5 ;
	$system("python ProcessImage.py H_1") ; #5 ;
	Fin = $fopen("H_1.txt","r") ;
	Fin_ = $fscanf(Fin,"%b",imgData) ; #5 ;
	$system("python ProcessImage.py I_1") ; #5 ;
	Fin = $fopen("I_1.txt","r") ;
	Fin_ = $fscanf(Fin,"%b",imgData) ; #5 ;
	$system("python ProcessImage.py J_1") ; #5 ;
	Fin = $fopen("J_1.txt","r") ;
	Fin_ = $fscanf(Fin,"%b",imgData) ; #5 ;
	$system("python ProcessImage.py K_1") ; #5 ;
	Fin = $fopen("K_1.txt","r") ;
	Fin_ = $fscanf(Fin,"%b",imgData) ; #5 ;
	$system("python ProcessImage.py L_1") ; #5 ;
	Fin = $fopen("L_1.txt","r") ;
	Fin_ = $fscanf(Fin,"%b",imgData) ; #5 ;
	$system("python ProcessImage.py M_1") ; #5 ;
	Fin = $fopen("M_1.txt","r") ;
	Fin_ = $fscanf(Fin,"%b",imgData) ; #5 ;
	$system("python ProcessImage.py N_1") ; #5 ;
	Fin = $fopen("N_1.txt","r") ;
	Fin_ = $fscanf(Fin,"%b",imgData) ; #5 ;
	$system("python ProcessImage.py O_1") ; #5 ;
	Fin = $fopen("O_1.txt","r") ;
	Fin_ = $fscanf(Fin,"%b",imgData) ; #5 ;
	$system("python ProcessImage.py P_1") ; #5 ;
	Fin = $fopen("P_1.txt","r") ;
	Fin_ = $fscanf(Fin,"%b",imgData) ; #5 ;
	$system("python ProcessImage.py Q_1") ; #5 ;
	Fin = $fopen("Q_1.txt","r") ;
	Fin_ = $fscanf(Fin,"%b",imgData) ; #5 ;
	$system("python ProcessImage.py R_1") ; #5 ;
	Fin = $fopen("R_1.txt","r") ;
	Fin_ = $fscanf(Fin,"%b",imgData) ; #5 ;
	$system("python ProcessImage.py S_1") ; #5 ;
	Fin = $fopen("S_1.txt","r") ;
	Fin_ = $fscanf(Fin,"%b",imgData) ; #5 ;
	$system("python ProcessImage.py T_1") ; #5 ;
	Fin = $fopen("T_1.txt","r") ;
	Fin_ = $fscanf(Fin,"%b",imgData) ; #5 ;
	$system("python ProcessImage.py U_1") ; #5 ;
	Fin = $fopen("U_1.txt","r") ;
	Fin_ = $fscanf(Fin,"%b",imgData) ; #5 ;
	$system("python ProcessImage.py V_1") ; #5 ;
	Fin = $fopen("V_1.txt","r") ;
	Fin_ = $fscanf(Fin,"%b",imgData) ; #5 ;
	$system("python ProcessImage.py W_1") ; #5 ;
	Fin = $fopen("W_1.txt","r") ;
	Fin_ = $fscanf(Fin,"%b",imgData) ; #5 ;
	$system("python ProcessImage.py X_1") ; #5 ;
	Fin = $fopen("X_1.txt","r") ;
	Fin_ = $fscanf(Fin,"%b",imgData) ; #5 ;
	$system("python ProcessImage.py Y_1") ; #5 ;
	Fin = $fopen("Y_1.txt","r") ;
	Fin_ = $fscanf(Fin,"%b",imgData) ; #5 ;
	$system("python ProcessImage.py Z_1") ; #5 ;
	Fin = $fopen("Z_1.txt","r") ;
	Fin_ = $fscanf(Fin,"%b",imgData) ; #5 ;
end
endmodule 