{
  Elabore um programa que entre com os dados de n (max. 20) pessoas (nome, rg, sexo, idade). Utilizar um vetor de
  registros para armazenar esses dados. Em seguida, o programa deve exibir um relatório contendo todos os dados das
  pessoas do sexo feminino com mais de 30 anos.
}

Program Exc5;
uses Crt;

Type
  reg_pessoa = record
    nome: string;
    rg: string;
    sexo: char;
    idade: integer;
  end;

  vet_pessoas = array[1..20] of reg_pessoa;

Procedure ler(var vet: vet_pessoas; n: integer);
  var
    sexo: char;
    i: integer;

  begin
    for i := 1 to n do
      begin
        write('Nome da pessoa ', i, ': ');
        readln(vet[i].nome);
        write('RG da pessoa ', i, ': ');
        readln(vet[i].rg);
        write('Idade da pessoa ', i, ': ');
        readln(vet[i].idade);

        repeat
          write('Sexo da pessoa ', i, '(Digite M ou F): ');
          readln(sexo);
          sexo := LowerCase(sexo);
          ClrScr;
        until(sexo = 'm') or (sexo = 'f');
        vet[i].sexo := sexo;
      end;
  end;

Procedure imprimir(vet: vet_pessoas; n: integer);
  var
    i: integer;

  begin
    writeln('-----------------PESSOAS DO SEXO FEMININO COM MAIS DE 30 ANOS-------------------');
    for i := 1 to n do
      begin
        if(vet[i].sexo = 'f') and (vet[i].idade > 30) then
          begin
            writeln('Nome da pessoa ', i, ': ', vet[i].nome);
            writeln('RG da pessoa ', i, ': ', vet[i].rg);
            writeln('idade da pessoa ', i, ': ', vet[i].idade);
            writeln('----------------');
          end;
      end;
    writeln('-------------------------------------------------------------------------------');
  end;

Var
  n: integer;
  vet: vet_pessoas;

Begin
  repeat
    write('Quantas pessoas você quer registrar? (Máximo 20): ');
    readln(n);
    ClrScr;
  until(n <= 20);

  ler(vet, n);
  imprimir(vet, n);
End.
