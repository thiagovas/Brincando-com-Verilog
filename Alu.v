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
		
		if(unsig) begin
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
				aluout=(a+b);
				
				// There is a way with less comparisons to do this, but I don't know wether this work
				if($signed(a) >= 0 && $signed(b) >= 0) begin
					overflow = ($signed(aluout) < 0 ? 1'b1 : 1'b0);
					$display("OH\n");
				end else begin
					if($signed(a) < 0 && $signed(b) < 0) begin
						overflow = ($signed(aluout)>=0 ? 1 : 0);
						$display("OH2 %d %d %d\n", $signed(a), $signed(b), $signed(aluout));
					end
				end
			end
			
			3'b100:begin
				//NOR
				aluout<=(!a)&(!b);
				overflow<=0;
			end
			
			3'b101:begin
				//XOR
				aluout<=(a^b);
				overflow<=0;
			end
			
			3'b110:begin
				//SUB
				aluout<=(a-b);

				if(a>=0 && b<0) begin
					overflow <= (aluout<0 ? 1 : 0);
				end else begin
					if(a<0 && b>=0)begin
						overflow <= (aluout>=0 ? 1 : 0);
					end
				end
			end
			
			default:begin
				//TODO: Think in what to do in this case.
				overflow<=0;
			end
		endcase
	end

endmodule
