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
		$dumpfile("result.vcd");
		$dumpvars(0, tb_Alu);

		//Neste teste overflow tem que ser 0
		$display("Teste para overflow: Neste teste o sinal de overflow tem que ser 1(um)\n");
		a = 32'b01111111111111111111111111111111;
		b = 32'b01111111111111111111111111111111;
        op = 3'b010;
		unsig = 0;
		$display("a = %b\nb = %b\nop = %b\n", a, b, op);
		#10;
		$display("Result: compout=%b  overflow=%b  aluout=%b\n\n", compout, overflow, aluout);

		//$display();
	end
endmodule
