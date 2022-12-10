module apb(
input PCLK,
input PRESETn,
input [2:0]PADDR,
input [7:0] PWDATA,
input PWRITE,
input PSEL,
input PENABLE,
output reg[7:0]PRDATA=0,
inout  pin1,pin2,pin3,pin4,pin5,pin6,pin7,pin8
);

reg  state,next;
integer i;
localparam IDLE=1'b0 ,SETUP=1'b1;
reg [7:0] mem[0:7],out=8'd0,in=8'd0;

assign pin1=mem[0][0] ? out[0] : 1'bZ;
assign pin2=mem[0][1] ? out[1] : 1'bZ;
assign pin3=mem[0][2] ? out[2] : 1'bZ;
assign pin4=mem[0][3] ? out[3] : 1'bZ;
assign pin5=mem[0][4] ? out[4] : 1'bZ;
assign pin6=mem[0][5] ? out[5] : 1'bZ;
assign pin7=mem[0][6] ? out[6] : 1'bZ;
assign pin8=mem[0][7] ? out[7] : 1'bZ;



always @(posedge PCLK)
begin
if(PRESETn) 
    state<=IDLE;
else
    state<=next;
end

always @(negedge PCLK)
begin
next=IDLE;
case(state)
IDLE:begin
    if(PSEL)
        next=SETUP;
    else
        next=IDLE;
end

SETUP:begin
    if(!PSEL)
        next=IDLE;
    if(PWRITE)
	mem[3]=out;
    if(PWRITE && PENABLE && PSEL)begin
	mem[PADDR]=PWDATA;
	next=SETUP;
    end
    if(!PWRITE)
	mem[4]=in;
    if(!PWRITE && PENABLE && PSEL)begin
	PRDATA=mem[PADDR];
	next=SETUP;
    end

end

endcase

end
	

always @(posedge PCLK)
begin
    for(i=0;i<8;i=i+1)begin
	 if(mem[0][i])begin
	     if(mem[1][i] && !mem[2][i])begin
		  out[i]=1'b1;			
	     end
	     else if(mem[2][i])begin
	  	  out[i]=1'b0;
	     end		
	  end
	 if(!mem[0][i]) begin
             if(i==0)begin
	         in[0]=pin1;
	     end
	     if(i==1)begin
		 in[1]=pin2;
	     end  
	     if(i==2)begin
		 in[2]=pin3;
	     end
	     if(i==3)begin
		 in[3]=pin4;
	     end
	     if(i==4)begin
		 in[4]=pin5;
	     end
	     if(i==5)begin
		 in[5]=pin6;
	     end
	     if(i==6)begin
		 in[6]=pin7;
	     end
	     if(i==7)begin
		 in[7]=pin8;
	     end
	 end
	 if(mem[2][i])
	     out[i]=1'b0;
    end				
end
endmodule
