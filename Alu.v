//----------------------------------------------------------------------------------
// Design Name: Alu
// Function: Executes six types of operations, and, or, add, nor, xor and sub.
//----------------------------------------------------------------------------------
module Alu (
    input [31:0] a,
	input [31:0] b,
	output [31:0] aluout,
	input [2:0] op,
	input unsig,
	output compout,
	output overflow
);
	reg compout, overflow, aluout;
	always @(*) begin
		
		if(unsig == 1) begin
			compout<=(a<b?1:0);
		end else begin
			compout<=($signed(a)<$signed(b) ? 1:0); // http://excamera.com/sphinx/fpga-verilog-sign.html
		end

		case(op)
			3'b000:begin
				//AND
				aluout<=(a&b);
				overflow<=0;
			end
			
			3'b001:begin
				//OR
				aluout<=(a|b);
				overflow<=0;
			end
			
			3'b010:begin
				//ADD
				if(unsig == 1) begin
					aluout = (a+b);
				end else begin
					aluout = ($signed(a)+$signed(b));
				end

				if($signed(a) >= 0 && $signed(b) >= 0) begin
					overflow = ($signed(aluout) < 0 ? 1 : 0);
				end else begin
					if($signed(a) < 0 && $signed(b) < 0) begin
						overflow = ($signed(aluout)>=0 ? 1 : 0);
					end
				end
			end
			
			3'b100:begin
				//NOR
				aluout<=(a~|b);
				overflow<=0;
			end
			
			3'b101:begin
				//XOR
				aluout<=(a^b);
				overflow<=0;
			end
			
			3'b110:begin
				//SUB
				if(unsig == 1) begin
					aluout = (a-b);
				end else begin
					aluout = ($signed(a)-$signed(b));
				end

				if($signed(a)>=0 && $signed(b)<0) begin
					overflow <= (aluout<0 ? 1 : 0);
				end else begin
					if($signed(a)<0 && $signed(b)>=0)begin
						overflow <= (aluout>=0 ? 1 : 0);
					end
				end
			end
			
			default:begin
				aluout<=0;
				overflow<=0;
			end
		endcase
	end

endmodule
