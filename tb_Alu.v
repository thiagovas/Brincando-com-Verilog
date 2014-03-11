//----------------------------------------------------------------------------------
// Design Name: Testbench for the Alu module.
// Function: Test if the output of all operations is what is expected to be.
//----------------------------------------------------------------------------------
module tb_Alu;
	reg [31:0] a;
	reg [31:0] b;
	reg [2:0] op;
	reg unsig;
	wire compout;
	wire overflow;
	wire [31:0] aluout;

	Alu tb(a, b, aluout, op, unsig, compout, overflow);
	initial begin
		//$dumpfile("result.vcd");
		//$dumpvars(0, tb_Alu);

		a = 32'b11111111111111111111111111111111;
		b = 32'b11111111111111111111111111111111;
        op = 3'b010;
        unsig = 0;
		#10;
		$display("%b  %b  %b\n", compout, overflow, aluout);
	end
endmodule
