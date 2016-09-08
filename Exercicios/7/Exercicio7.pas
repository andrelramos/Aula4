{
 Faça um algoritmo utilizando sub-rotinas que leia um vetor de registros com os campos: nome, idade e sexo de N
(N<=20) pessoas. Após a leitura faça:
a) Imprima o Nome, idade e sexo das pessoas cuja idade seja maior que a idade da primeira pessoa.
b) Imprima o Nome e idade de todas as mulheres.
c) Imprima o Nome dos homens menores de 21 anos.
}

Program Exercicio7 ;
Type
  reg_pessoa = record
    nome: string;
    sexo: char;
    idade: integer;
  end;

  vet_pessoas = array[1..20] of reg_pessoa;
  var
  pessoas:vet_pessoas;
  n:integer;
  
  Procedure cadastrarPessoas(var vet: vet_pessoas; n: integer);
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

        repeat
          write('Sexo da pessoa ', i, '(Digite m ou f): ');
          readln(sexo);
//					sexo := UpperCase(sexo);
          ClrScr;
        until(sexo = 'm') or (sexo = 'f');
        vet[i].sexo := sexo;
      end;
  end;
  
  procedure verificarQuantidade(var qtd:integer);
  begin
		repeat
			write('Digite a quantidade de pessoas entre 1 e 20: ');
			readln(n);
		until (qtd >0) and (qtd <= 20);  	
  end;
  
  procedure imprimirPessoasIdadeMaiorQue(idade:integer; pessoas:vet_pessoas; n:integer);
  var i:integer;
  begin
  	writeln('Idade maiores que ',idade,' de ', pessoas[1].nome);
    for i := 1 to n do
    begin;
    	if(pessoas[i].idade > idade) then
    		writeln('-> ', pessoas[i].nome, ' (sexo: ',pessoas[i].sexo,'| idade: ',pessoas[i].idade,')');
    end;
  end;
  
  
  procedure imprimirPessoasPorSexoeIdade(pessoas:vet_pessoas;sexo:char; idade:integer);
  var i:integer;
  begin
      for i := 1 to n do
	      begin
  				if((pessoas[i].sexo = sexo) and (pessoas[i].idade > idade)) then
    		writeln('-> ', pessoas[i].nome, ' (sexo: ',pessoas[i].sexo,'| idade: ',pessoas[i].idade,')');  				
		    end;
  end;
  
Begin
	verificarQuantidade(n);
	cadastrarPessoas(pessoas, n);
	imprimirPessoasIdadeMaiorQue(pessoas[1].idade, pessoas, n);    //da para simplificar e por no método abaixo
	writeln('------------------Todas as Mulheres---------------');
	imprimirPessoasPorSexoeIdade(pessoas, 'f', 0); //mulheres com idade acima de 0 anos
	writeln('------------------Todas os Homens acima de 21 anos---------------');  
	imprimirPessoasPorSexoeIdade(pessoas, 'm', 21); //homens com idade acima de 21 anos 
End.