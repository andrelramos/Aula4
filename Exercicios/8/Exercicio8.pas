{ 
A Companhia de Água Corredeira armazena os dados de seus clientes (codigo, nome, endereco e mcons). Elabore um
programa capaz de ler os dados de n (máximo de 20) clientes (utilizar um vetor de registros para armazenar esses
dados). Em seguida, o programa deve imprimir um relatório conforme o modelo abaixo.
Nome Endereço Valor da Conta
XXX XXXX XX
XXX XXXX XX
XXX XXXX XX

}

Program Exercicio8 ;
Type
  reg_cliente = record
  	codigo:integer;
    nome: string;
    endereco: string;
    mcons: real;
  end;

  vet_clientes = array[1..20] of reg_cliente;
  var
  clientes:vet_clientes;
  n:integer;
  
  
  procedure verificarQuantidade(var qtd:integer);
  begin
		repeat
			write('Digite a quantidade de clientes entre 1 e 20: ');
			readln(n);
		until (qtd >0) and (qtd <= 20);  	
  end;
  
    Procedure cadastrarClientes(var vet: vet_clientes; n: integer);
  var
    sexo: char;
    i: integer;

  begin
    for i := 1 to n do
      begin
        write('Nome da pessoa ', i, ': ');
        readln(vet[i].nome);
        write('Endereço: ', i, ': ');
        readln(vet[i].endereco);
        write('Consumo Médio: ', i, ': ');
        readln(vet[i].mcons);
         clrscr;
      end;
  end;
  
  
  procedure imprimirRelatorio(clientes:vet_clientes;n:integer);
  var i:integer;
  begin
  	gotoxy(1,1);
		writeln('Nome');
  	gotoxy(60,1);
  	writeln('Endereço');
  	gotoxy(120,1);	
  	writeln('Valor da Conta');
  	gotoxy(1,2);
  	for i:= 1 to 134 do
  		begin
	  	write('-');
	  	end;
    for i := 1 to n do
    	begin
    	gotoxy(1,(i+2));
    	writeln(clientes[i].nome);
    	
    	gotoxy(60,(i+2));
    	writeln(clientes[i].endereco);
    	
    	
    	gotoxy(120,(i+2));
    	writeln('R$: ', (clientes[i].mcons*0.35):2:2);
    	end;  	
  end;
  
  
Begin

	verificarQuantidade(n);
	cadastrarClientes(clientes, n);
	imprimirRelatorio(clientes, n);
  
End.