{
 Dado o registro abaixo,
Nome
Sexo
Idade
Altura
Faça um algoritmo que leia N registros e determine:
a) altura da pessoa mais alta;
b) nome, sexo e idade da pessoa mais nova;
c) média de idade dos "baixinhos", altura <= 1,58 cm;
d) quantidades de mulheres com idade superior ou igual a 20.
}

Program Exercicio9;

Type
  reg_pessoa = record
    nome: string;
    sexo: char;
    idade: integer;
    altura:real;
end;

  vet_pessoas = array[1..100] of reg_pessoa;
  var
  pessoas:vet_pessoas;
  n:integer;
  
  
  procedure verificarQuantidade(var qtd:integer);
  begin
		repeat
			write('Digite a quantidade de pessoas entre 1 e 100: ');
			readln(n);
		until (qtd >0) and (qtd <= 100);  	
  end;
  
  
  Procedure cadastrarPessoas(var vet: vet_pessoas; n:integer);
  var
    sexo: char;
    i: integer;

  begin
    for i := 1 to n do
      begin
        write('Nome da pessoa ', i, ': ');
        readln(vet[i].nome);
        write('Idade da pessoa ', i, ': ');
        readln(vet[i].idade);
        
        write('Altura da pessoa ', i, ': ');
        readln(vet[i].altura);

        repeat
          write('Sexo da pessoa ', i, '(Digite m ou f): ');
          readln(sexo);
          ClrScr;
        until(sexo = 'm') or (sexo = 'f');
        vet[i].sexo := sexo;
      end;
      clrscr;
  end;


	function getMaiorAltura(pessoas:vet_pessoas;n:integer):real;
	var 
		altura:real;
		i:integer;	
	begin
		altura:=0;		
    for i := 1 to n do
    	begin
    		if(pessoas[i].altura > altura) then
    		altura:= pessoas[i].altura;
    	end;			
			getMaiorAltura:= altura;    	
	end;
	
	
		function getMenorIdade(pessoas:vet_pessoas;n:integer):integer;
	var 
		idade:integer;
		i:integer;	
	begin
		idade:=999;		
    for i := 1 to n do
    	begin
    		if(pessoas[i].idade < idade) then
    		idade:= pessoas[i].idade;
    	end;			
			getMenorIdade:= idade;    	
	end;
	
	
	
	procedure imprimirPessoasMaisAltas(pessoas:vet_pessoas;n:integer; altura:real);
  var i:integer;
  begin
		writeln('Pessoas mais altas igual à: ', altura:2:2);
    for i := 1 to n do
    	begin
    	if(pessoas[i].altura >= altura) then
    	begin
    	writeln('-> ', pessoas[i].nome, ' do sexo: ', pessoas[i].sexo, ', idade: ', pessoas[i].idade, ' e altura de: ', pessoas[i].altura:2:2);    	
   		end;
    	end;  	
  end;
  
  
  	
	procedure imprimirPessoasMaisNovas(pessoas:vet_pessoas;n:integer; idade:integer);
  var i:integer;
  begin
		writeln('Pessoas mais novas igual à: ', idade);
    for i := 1 to n do
    	begin
    	if(pessoas[i].idade <= idade) then
    	begin
    	writeln('-> ', pessoas[i].nome, ' do sexo: ', pessoas[i].sexo, ', idade: ', pessoas[i].idade, ' e altura de: ', pessoas[i].altura:2:2);    	
   		end;
    	end;  	
  end;
  
  
  	procedure imprimirPessoasPorSexoEIdade(pessoas:vet_pessoas;n:integer;sexo:char; idade:integer);
  var i:integer;
  begin
		writeln('Pessoas do sexo: ', sexo, ' com idade >= ', idade);
    for i := 1 to n do
    	begin
    	if((pessoas[i].idade >= idade) and (pessoas[i].sexo = sexo)) then
    	begin
    	writeln('-> ', pessoas[i].nome, ' do sexo: ', pessoas[i].sexo, ', idade: ', pessoas[i].idade, ' e altura de: ', pessoas[i].altura:2:2);    	
   		end;
    	end;  	
  end;
  
    	
	procedure imprimirMediaDeIdadeDeBaixinhos(pessoas:vet_pessoas;n:integer);
  var 
		i:integer;
		somaIdades:integer;
		somaBaixinhos:integer;
  
  begin
  	somaIdades:=0;
  	somaBaixinhos:=0;
    for i := 1 to n do
    	begin
    		if(pessoas[i].altura <= 1.58) then
    			begin
    			somaIdades:= somaIdades + pessoas[i].idade;
    			somaBaixinhos := somaBaixinhos +1;
    			//writeln('-> ', pessoas[i].nome, ' do sexo: ', pessoas[i].sexo, ', idade: ', pessoas[i].idade, ' e altura de: ', pessoas[i].altura:2:2);    	
   				end;
    	end;
			writeln('A média de idade de baixinhos é de: ',(somaIdades/somaBaixinhos):2:2);  	
  end;
  


Begin
	verificarQuantidade(n);
	cadastrarPessoas(pessoas, n);
	imprimirPessoasMaisAltas(pessoas, n, getMaiorAltura(pessoas,n));
	imprimirPessoasMaisNovas(pessoas, n, getMenorIdade(pessoas,n));
	imprimirMediaDeIdadeDeBaixinhos(pessoas, n);
	imprimirPessoasPorSexoEIdade(pessoas,n, 'f', 20);
//	mostrarMenu();
//	writeln(getMaiorAltura(pessoas, n));
//	mostrarPessoasMaisAltas(pessoas);
	

  
End.