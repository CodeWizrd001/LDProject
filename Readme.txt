Documentation


module Mux2x1(out,in1,in2,s);

Input : 
	in1,in2
		input fed into the component
	s
		signal input
Output :
	out
		to store and give out the final output
Behavior : 
		 Acts as the output which saves the values of input based on the value of s


module Or(out,a,b);

Input :
	a,b
		input that needed to be or gated
Output :
	out 
		to store and give out the final output
Behavior : 
		Represents as the or gate to give out the final or-ed output.


module PEncoder(out,used,in1,in2,in3,in4);

Input :
	 in1,in2,in3,in4
		represents the signal position in of the traffic light signal at a particular instant.
Output :
	out 
		stores the traffic signal position based on the input values
Behavior : 
		Stores the values of state of the traffic signal position that need to executed at the 			
		moment. This is used when there is a special occasion where the traffic signals needed 			
		to manipulated in favor of a particular;ar vehicle movement e.g: Ambulance, VIP 			
		transportation. This is input completely under the sensor control.







module Decoder(o1,o2,o3,o4,in);

Input : 
	[1:0]in 
		accepts the signal for the traffic controller that is obtained 
Output :
	o1,o2,o3,o4
		stores the output for the enabler for the LightBoard
Behavior : 
		acts as a Decoder to assign the value to each of LightBoard




module TimerIC(clk,reset,mode,BoardSelect) ;
Input :
	clk
		to change to the next value of timer. acts as the clock 
	reset 
		to change the value to its original value to reset the value. this is used when the priority 			
		encoder is used to pull 0the system back to the original condition after the emergency 			
		situation is been handled.
Output :
	mode 
		to select among the 2 modes of the traffic signal.
	BoardSelect
		to enable the traffic signals that needed to put forth across the road
Behavior :
		to increase the counter to cycle through the modes and LightBoards


module LightBoard(enable,mode,mode_out,out) ;
Input :
	enable
		to enable the LightBoard
	mode 
		to determine the mode of the traffic
Output :
	mode_out 
		to reconfigure the opposite traffic signal depending on the current light signal
	[4:0]out
		binary digits representing the color that needed to be emitted
			5'b (red)(orange)(Green-left)(Green-Front)(Green-Right)
Behavior : 
	Gives the lights that needed to emitted in one traffic signal among four in one junction of 	among 5 junctions 


module TrafficSignal(clk,imgDataOut,imgData,active,p,e) ;

Input :
	clk
		to change to the next value of timer. acts as the clock 

	[1024:0]imgData;
		to store the image matrix data obtained from compared sample
		to store the image data	
	[3:0]p
		Load priority signal variable. To indicate which road or mode needed to be changed to 			
		so as to decrease the traffic load
	[3:0]e
		Emergency signal variable. To indicate which road or mode needed to be changed to, so 	a to 		
		to decrease the movement of vehicles along a particular lane allowing vehicles of high 			
		values to pass through

Output :
	[1023:0] imdDataOut:
		to pass the image from traffic signal to the other so the image can be verified at the next 			
		traffic signal 
		
	active 
		to check the flag of the signal from which the imgData is obtained so we could compare 		
		the car that passes the both signals
	
	[4:0]outF
	[4:0]outL
	[4:0]outR
	[4:0]outB
		outputs the lights that are activated in light boards in one traffic signal in a junction
		F, L, R , B represents Front, Left, Right, Back

Behavior : 
	This module contains one junction of the system. It has four TrafficSignals of one junction 
	The TrafficSignal

module TrafficSystem(clk,imgDataIn1 ,imgDataIn2 ,imgDataIn3 ,imgDataIn4 ,imgDataIn5,signal,ans);

Input :
	clk
		to change to the next value of timer. acts as the clock 
		
	[1023:0] imgDataIn1 ,imgDataIn2 ,imgDataIn3 ,imgDataIn4 ,imgDataIn5 
		to accept the image data obtained from each of the traffic signal from each junction so 			
		they can be compared with each other TrafficSignal

	[4:0]signal
		to accept which traffic signal is giving out the image data to be compared.
Output :
	[4:0]ans 
		to store the values characters in terms of numbers i.e.  [ a=1, b=2, ... z=26 ] 
		
Behavior :
		This is final module which determines the working of the entire TrafficSystem
		TrafficSystem coordinates the working of  the five  TrafficSignals in a harmonic manner
		It also contains processing of the image data and redirects the processed image to the 			
		other TrafficSignals for checking.

	

Requirements
	
	-Python version 3.60 or greater 
	-Pillow package 
	
