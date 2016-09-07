{ 
Faça um algoritmo utilizando sub-rotinas que leia um vetor de registros com os campos: nome , P1, P2, P3 e P4 de
N(N<=50) alunos de um colégio. Após a leitura faça:
? Imprima o Nome e a média dos alunos aprovados (Média aritmética >= 5.0).
? Imprima o Nome e a média dos alunos em Recuperação (3.0 >= Média < 5.0).
? Imprima o Nome e a média dos alunos reprovados (Média < 3.0).
? Imprima o percentual de alunos aprovados.
? Imprima o percentual de alunos em exame
? Imprima o percentual de alunos reprovados.
}
Program Exercicio6 ;
Type
  reg_aluno = record
    nome: string;
    p1: real;
    p2: real;
    p3: real;
    p4: real;
    media: real;
  end;
  vet_alunos = array[1..50] of reg_aluno;

	var
	vet:vet_alunos;
  n:integer;
  qtdA:integer;
  qtdE:integer;
  qtdR:integer;
  
  procedure verificarQuantidade(var qtd:integer);
  begin
		repeat
			write('Digite a quantidade de alunso entre 1 e 50: ');
			readln(n);
		until (qtd >0) and (qtd <= 50);  	
  end;
  
  procedure cadastrarAlunos(var alunos:vet_alunos);
  var 
	i:integer;
	nome:string;
  begin   
  	 for i := 1 to n do
	  	 begin
	  	  writeln('--------------------------------------------------');
			 	write('Digite o nome do ',i,'o aluno: '); 
			 	readln(alunos[i].nome);
			 	write('Digite a p1: ');
			 	readln(alunos[i].p1);
			 	write('Digite a p2: ');
			 	readln(alunos[i].p2);
			 	write('Digite a p3: ');
			 	readln(alunos[i].p3);
			 	write('Digite a p4: ');
			 	readln(alunos[i].p4);
			 	alunos[i].media := (alunos[i].p1 + alunos[i].p2 + alunos[i].p3 + alunos[i].p4)/4;
			 	writeln('A média dele é: ', alunos[i].media);
  		 end;
  end;
  
  procedure mostrarNotasPorSituacao(alunos:vet_alunos; n:integer; situacao:char; var count:integer);
	var i:integer;  
  	begin
  		case situacao of
  			'a':
  			begin
  				count :=0;
  				for i := 1 to n do
						begin
							if(alunos[i].media >= 5) then
								begin
									count := count +1;
									writeln('Aluno: ',alunos[i].nome,' aprovado com ', alunos[i].media);
								end;
						end;
  			end;
  			
  			
  			'e':
  			begin
  				count := 0;
  				for i := 1 to n do
						begin
							if((alunos[i].media >= 3) and (alunos[i].media < 5)) then
								begin
								count := count + 1;
									writeln('Aluno: ',alunos[i].nome,' em exame com ', alunos[i].media);
								end;
						end;
  			end;
  			
  			
  			'r':
  			begin
  				count := 0;
  				for i := 1 to n do
						begin
							if(alunos[i].media < 3) then
								begin
									count := count + 1;
									writeln('Aluno: ',alunos[i].nome,' reprovado com ', alunos[i].media);
								end;
						end;
  			end;
  	end;
  end;
Begin
		qtdA :=0;
		qtdE :=0;
		qtdR :=0;
    verificarQuantidade(n);
    cadastrarAlunos(vet);
    writeln('------------------Lista de Aunos Aprovados (>= 5)----------------');
    mostrarNotasPorSituacao(vet, n, 'a', qtdA);
    writeln('Total de: ', (qtdA/n), '%');
    
    writeln('------------------Lista de Aunos em Exame (>= 3 < 5)----------------');
    mostrarNotasPorSituacao(vet, n, 'e', qtdE);
    writeln('Total de: ', (qtdE/n), '%');
		    
    writeln('------------------Lista de Aunos Reprovados (< 3)----------------');
    mostrarNotasPorSituacao(vet, n, 'r', qtdR);
    writeln('Total de: ', (qtdR/n), '%');
    

    
    
End.