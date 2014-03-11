//----------------------------------------------------------------------------------
// Design Name: tb_Alu.
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

		//Neste teste overflow tem que ser 1(um)
		$display("Teste para overflow: Neste teste o sinal de overflow tem que ser 1(um)");
		a = 32'b01111111111111111111111111111111;
		b = 32'b01111111111111111111111111111111;
        op = 3'b010;
		unsig = 0;
		$display("a = %b\nb = %b\nop = %b", a, b, op);
		#10;
		$display("Result: compout=%b  overflow=%b  aluout=%b\n\n", compout, overflow, aluout);

		//Neste teste, overflow tem que ser 0(zero)
		$display("Teste para overflow: Neste teste o sinal de overflow tem que ser 0(zero)");
		a = 32'b01000011011001100111000100000111;
		b = 32'b00001100110001100100011001111000;
        op = 3'b010;
		unsig = 0;
		$display("a = %b\nb = %b\nop = %b", a, b, op);
		#10;
		$display("Result: compout=%b  overflow=%b  aluout=%b\n\n", compout, overflow, aluout);
		
		
		//INICIO TESTE OPERACOES
		$display("Teste das operações:\n");
		$display("AND");
		a = 32'b01000011011001100111000100000111;
		b = 32'b00001100110001100100011001111000;
        op = 3'b000;
		unsig = 0;
		$display("a = %b\nb = %b\nop = %b", a, b, op);
		#10;
		$display("Result: compout=%b  overflow=%b  aluout=%b\n\n", compout, overflow, aluout);
		
		
		$display("OR");
		a = 32'b01000011011001100111000100000111;
		b = 32'b00001100110001100100011001111000;
        op = 3'b001;
		unsig = 0;
		$display("a = %b\nb = %b\nop = %b", a, b, op);
		#10;
		$display("Result: compout=%b  overflow=%b  aluout=%b\n\n", compout, overflow, aluout);
	

		$display("ADD");
		a = 32'b01000011011001100111000100000111;
		b = 32'b00001100110001100100011001111000;
        op = 3'b010;
		unsig = 0;
		$display("a = %b\nb = %b\nop = %b", a, b, op);
		#10;
		$display("Result: compout=%b  overflow=%b  aluout=%b\n\n", compout, overflow, aluout);
		

		$display("NOR");
		a = 32'b01000011011001100111000100000111;
		b = 32'b00001100110001100100011001111000;
        op = 3'b100;
		unsig = 0;
		$display("a = %b\nb = %b\nop = %b", a, b, op);
		#10;
		$display("Result: compout=%b  overflow=%b  aluout=%b\n\n", compout, overflow, aluout);
		

		$display("XOR");
		a = 32'b01000011011001100111000100000111;
		b = 32'b00001100110001100100011001111000;
        op = 3'b101;
		unsig = 0;
		$display("a = %b\nb = %b\nop = %b", a, b, op);
		#10;
		$display("Result: compout=%b  overflow=%b  aluout=%b\n\n", compout, overflow, aluout);
		
		
		$display("SUB");
		a = 32'b01000011011001100111000100000111;
		b = 32'b00001100110001100100011001111000;
        op = 3'b110;
		unsig = 0;
		$display("a = %b\nb = %b\nop = %b", a, b, op);
		#10;
		$display("Result: compout=%b  overflow=%b  aluout=%b\n\n", compout, overflow, aluout);
		//END TESTE OPERACOES
	end
endmodule
