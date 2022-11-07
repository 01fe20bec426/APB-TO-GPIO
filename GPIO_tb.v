module apb_tb;

	// Inputs
	reg PCLK;
	reg PRESETn;
	reg [2:0] PADDR;
	reg [7:0] PWDATA;
	reg PWRITE;
	reg PSEL;
	reg PENABLE;

	// Outputs
	wire [7:0] PRDATA;
	wire pin1;
	wire pin2;
	wire pin3;
	wire pin4;
	wire pin5;
	wire pin6;
	wire pin7;
	wire pin8;


	// Instantiate the Unit Under Test (UUT)
	apb uut (
		.PCLK(PCLK), 
		.PRESETn(PRESETn), 
		.PADDR(PADDR), 
		.PWDATA(PWDATA), 
		.PWRITE(PWRITE), 
		.PSEL(PSEL), 
		.PENABLE(PENABLE), 
		.PRDATA(PRDATA),
		.pin1(pin1), 
		.pin2(pin2), 
		.pin3(pin3), 
		.pin4(pin4), 
		.pin5(pin5), 
		.pin6(pin6), 
		.pin7(pin7), 
		.pin8(pin8)
	);
always #16.66 PCLK=~PCLK;
	initial begin
	
		// Initialize Inputs
		PCLK = 1;
		PRESETn = 0;
		PADDR = 0;
		PWDATA = 0;
		PWRITE = 0;
		PSEL = 0;
		PENABLE = 0;
	end
	 initial begin
	 PRESETn=1;
	 #66;
	 #33;
	 PRESETn=0;
	 #66;

////////////////////////////////set pin 1	
	//dir                  		
		PADDR=0;
		PWDATA=8'd8;
		PSEL=1;
		PWRITE=1;
		#33;
		PENABLE=1;
#33;
PSEL=0;
PENABLE=0;
    //set
		PADDR=1;
		PWDATA=8'd8;
		#33;
		PSEL=1;
		#33;
		PENABLE=1;
#33;
PSEL=0;
PENABLE=0;
   //clr
		PADDR=2;
		PWDATA=8'd0;
		#33;
		PSEL=1;
		#33;
		PENABLE=1;
#33;
PSEL=0;
PENABLE=0;

//////////////////////////////////////set pin 2
	 //dir
		PADDR=0;
		PWDATA=8'd9;
		#33;
		PSEL=1;
		PWRITE=1;
		#33;
		PENABLE=1;
#33;
PSEL=0;
PENABLE=0;
    //set
		PADDR=1;
		PWDATA=8'd1;
		#33;
		PSEL=1;
		#33;
		PENABLE=1;
#33;
PSEL=0;
PENABLE=0;

///////////////////////////////////// off pin
		PADDR=2;
		PWDATA=8'd8;
		#33;
		PSEL=1;
		#33;
		PENABLE=1;
#33;
PSEL=0;
PENABLE=0;
/////////////////////////////////status

	 //dir
		PADDR=0;
		PWDATA=8'd8;
		#33;
		PSEL=1;
		PWRITE=1;
		#33;
		PENABLE=1;
#33;
PSEL=0;
PENABLE=0;
    // pwrite 0 Read
		#33;
		PSEL=1;
		PADDR=4;
		PWRITE=0;
		#33;
		PENABLE=1;
#33;
PSEL=0;
PENABLE=0;
/*
///////////////////////////
		PADDR=0;
		PWDATA=8'd1;
		#33;
		PSEL=1;
		PWRITE=1;
		#33;
		PENABLE=1;
#33;
PSEL=0;
PENABLE=0;
    //set
		PADDR=1;
		PWDATA=8'd1;
		#33;
		PSEL=1;
		#33;
		PENABLE=1;
#33;
PSEL=0;
PENABLE=0;
//////////////////////////
 //dir
		PADDR=0;
		PWDATA=8'd0;
		#33;
		PSEL=1;
		PWRITE=1;
		#33;
		PENABLE=1;
#33;
PSEL=0;
PENABLE=0;
    // pwrite 0 Read
		#33;
		PSEL=1;
		PADDR=4;
		PWRITE=0;
		#33;
		PENABLE=1;
#33;
PSEL=0;
PENABLE=0;
///////////////////////
		PADDR=2;
		PWDATA=8'd1;
		#33;
		PWRITE=1;
		PSEL=1;
		#33;
		PENABLE=1;
#33;
PSEL=0;
PENABLE=0;*/
		end
		

      
endmodule
