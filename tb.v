`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module tb;

localparam DSIZE = 8;

reg [DSIZE-1:0] wdata;
reg winc, wclk, wrst_n;
reg rinc, rclk, rrst_n;

wire [DSIZE-1:0] rdata;
wire wfull;
wire rempty;

integer i;

localparam wperiod = 12.5;
localparam rperiod = 15.87;
localparam burst = 120;

fifo1 f1(.rdata(rdata), .wfull(wfull), .rempty(rempty), .wdata(wdata), .winc(winc), .wclk(wclk),
		 .wrst_n(wrst_n), .rinc(rinc), .rclk(rclk), .rrst_n(rrst_n));
		 
always 
	begin
	
		wclk = 1'b0; #(wperiod/2);
		wclk = 1'b1; #(wperiod/2);
		
end

		
always 
	begin

		rclk = 1'b0; #(rperiod/2);
		rclk = 1'b1; #(rperiod/2);
end


initial
	begin
	
		rinc = 1'b1;
		winc = 1'b1; 
		
		wrst_n = 1'b0; 
		rrst_n = 1'b0;
		
		#rperiod;
		
		wrst_n = 1'b1;
		rrst_n = 1'b1;
		
		
		#(wperiod/2);
		
		for (i = 1; i <= burst; i = i + 1) begin
		
			wdata = i; #wperiod;
		
		end
		
		winc = 1'b0;
		
		#3300 $stop;
	
end

endmodule


 