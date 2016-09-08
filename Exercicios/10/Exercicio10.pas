{
 Para controle dos veículos de uma cidade a secretaria de transportes criou um vetor de 25 registros com os seguintes campos:
Proprietário:___________ Combustível:________
Modelo:_________________ Cor:________________
No.Chassi:______________ Ano:____ Placa:_____
Faça um algoritmo, utilizando sub rotinas, que cadastre os veículos, calcule e exiba quantos carros do ano de 2009 são da cor azul e 
quais seus modelos.
}
Program Pzim ;
Type
  reg_veiculo = record
  	proprietario:string;
    combustivel:string;
    modelo:string;
    cor:string;
    chassi:string;
    ano:integer;
    placa:string;
  end;

  vet_veiculos = array[1..25] of reg_veiculo;
  var
  veiculos:vet_veiculos;
  n:integer;
  
  procedure verificarQuantidade(var qtd:integer);
  begin
		repeat
			write('Digite a quantidade de veículos entre 1 e 25: ');
			readln(n);
		until (qtd >0) and (qtd <= 25);  	
  end;
  
   Procedure cadastrarVeiculos(var vet: vet_veiculos; n: integer);
  var
  	confirma:char;
    sexo: char;
    i: integer;

  begin
  
    clrscr;
    for i := 1 to n do
      begin
      	write('Veículo ', i,'/',n);
      	gotoxy(1,2);
  			write('Proprietário: ');
  			gotoxy(53,2);
  			write('Combustível: ');
  			
  			gotoxy(1,3);
  			write('Modelo: ');
  			gotoxy(33,3);
  			write('Cor: ');
  			
				gotoxy(1,4);
  			write('Chassi: ');
  			gotoxy(33,4);
  			write('Ano: ');
  			gotoxy(63,4);
  			write('Placa: ');  	
				
				gotoxy(15,2);
				read(vet[i].proprietario);	
				gotoxy(66,2);
				read(vet[i].combustivel);	
				gotoxy(9,3);
				readln(vet[i].modelo);
				gotoxy(38,3);
				readln(vet[i].cor);
				gotoxy(9,4);
				readln(vet[i].chassi);
				gotoxy(38,4);
				readln(vet[i].ano);
				gotoxy(70,4);
				readln(vet[i].placa);
				
				write('Confirma o cadastro do veículo com os dados acima? (S) ou (N) -> ');
				readln(confirma);
				if((confirma = 'n') or (confirma = 'N')) then
					i := i -1;        
         clrscr;
      end;
  end;
  
  procedure imprimirCarrosPorAnoECor(vet:vet_veiculos;n:integer;ano:integer;cor:string);
  	var 
		posicao:integer;
		i:integer;
  	
  	begin
  		posicao :=0;
  	  writeln('Carros do ano de: ', ano,' e que tenham a cor: ', cor);  	  
    	for i := 1 to n do
    		begin
    		    if((vet[i].ano = ano) and (vet[i].cor = cor)) then
    		    	begin
    		    			writeln(posicao,' -> Modelo: ',vet[i].modelo);    		    			
    		    			posicao := posicao +1;
    		    	end;
    		end;
    		writeln('Um total de: ',posicao,' carros encontrados.');
  	end;
  
  
Begin  
	verificarQuantidade(n);
	cadastrarVeiculos(veiculos,n);                        
	imprimirCarrosPorAnoECor(veiculos, n, 2009, 'azul');
	
End.