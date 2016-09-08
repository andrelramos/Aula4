{
 Para controle dos ve�culos de uma cidade a secretaria de transportes criou um vetor de 25 registros com os seguintes campos:
Propriet�rio:___________ Combust�vel:________
Modelo:_________________ Cor:________________
No.Chassi:______________ Ano:____ Placa:_____
Fa�a um algoritmo, utilizando sub rotinas, que cadastre os ve�culos, calcule e exiba quantos carros do ano de 2009 s�o da cor azul e 
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
			write('Digite a quantidade de ve�culos entre 1 e 25: ');
			readln(n);
		until (qtd >0) and (qtd <= 25);  	
  end;
  
   Procedure cadastrarVeiculos(var vet: vet_veiculos; n: integer);
  var
    sexo: char;
    i: integer;

  begin
  
 
    for i := 1 to n do
      begin
      	write('Ve�culo ', i,'/',n);
      	gotoxy(1,2);
  			write('Propriet�rio: ');
  			gotoxy(33,2);
  			write('Combust�vel: ');
  			
  			gotoxy(1,3);
  			write('Modelo: ');
  			gotoxy(33,3);
  			write('Cor: ');
  			
				gotoxy(1,3);
  			write('Chassi: ');
  			gotoxy(33,3);
  			write('Ano: ');
  			gotoxy(63,3);
  			write('Placa: ');  	
				
				gotoxy(14,2);
				read(vet[i].proprietario);		
  			
  			
  			
  			readln(i);
//        write('Propriet�rio: ');
//        readln(vet[i].proprietario);
//        write('Combust�vel: ');
//        readln(vet[i].combustivel);
//        write('Modelo: ');
//        readln(vet[i].modelo);
//				write('Cor: ');
//        readln(vet[i].cor);
//				write('Chassi: ');
//        readln(vet[i].chassi);				             
//				write('Ano: ');
//        readln(vet[i].ano);   
//				write('Placa: ');
//        readln(vet[i].placa);				        
         clrscr;
      end;
  end;
  
  
Begin  
	verificarQuantidade(n);
	cadastrarVeiculos(veiculos,n);
End.