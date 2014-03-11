//----------------------------------------------------------------------------------
// Degign Name: Alu
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
	
	always @(*) begin
		case(op)
			3'b000:begin
				//AND
			end
				
			3'b001:begin
				//OR
			end
				
			3'b010:begin
				//ADD
			end
				
			3'b100:begin
				//NOR
			end
				
			3'b101:begin
				//XOR
			end
				
			3'b110:begin
				//SUB
			end
				
			default:begin
				//TODO: Think in what to do in this case.
			end

		endcase
	end

endmodule
