{
  A Companhia de Taxi LocalCerto armazena os dados de seus motoristas (codigo,nome, número do taxi e Kper).
  Elabore um programa capaz de ler os dados de n (máximo de 20) motoristas (utilizar um vetor de registros para
  armazenar esses dados). Em seguida, o programa deve imprimir um relatório conforme o modelo abaixo.

  Nome Motorista              Número do Taxi              Valor a Receber
      XXX                          XXX                          XX
      XXX                          XXX                          XX
      XXX                          XXX                          XX

  O valor a receber é calculado multiplicando-se a quantidade Kper (Kilometro percorrido) por R$ 1,20.
  Ao final o programa deve também exibir todos os dados do motorista com maior valor a receber.
}

Program Exc4;
uses Crt;

Type
  reg_motorista = record
    codigo: integer;
    nome: string;
    numero: integer;
    kper: real;
  end;

  vet_motoristas = array[1..20] of reg_motorista;

Function calculo(kper:real):real;
  begin
    calculo := kper * 1.20;
  end;

Procedure ler(var vet:vet_motoristas; n:integer);
  var
    i: integer;

  begin
    for i := 1 to n do
      begin
        write('Código do motorista ', i, ': ');
        readln(vet[i].codigo);
        write('Nome do motorista ', i, ': ');
        readln(vet[i].nome);
        write('Número do taxi ', i, ': ');
        readln(vet[i].numero);
        write('Kilometros percorridos ', i, ': ');
        readln(vet[i].kper);
        ClrScr;
      end;
  end;

Procedure imprimir(vet: vet_motoristas; n:integer);
  var
    i: integer;
    columns: array[1..3] of integer;

  begin
    ClrScr;
    columns[1] := 10;
    columns[2] := 40;
    columns[3] := 60;

    writeln('-------------------------------RELATÓRIO---------------------------------');

    gotoXY(columns[1], 0);
    write('Nome Motorista');

    gotoXY(columns[2], 0);
    write('Número do taxi');

    gotoXY(columns[3], 0);
    write('Valor a Receber');
    for i := 1 to n do
      begin
        gotoXY(columns[1]+5, 3*i);
        write(vet[i].nome);

        gotoXY(columns[2]+5, 3*i);
        write(vet[i].numero);

        gotoXY(columns[3]+5, 3*i);
        writeln(calculo(vet[i].kper):6:2);
      end;
    writeln('-------------------------------------------------------------------------');
  end;

Var
  n: integer;
  vet: vet_motoristas;

Begin
  repeat
    write('Quantos motoristas você deseja cadastrar? (máximo 20): ');
    readln(n);
    ClrScr;
  until(n <= 20);

  ler(vet, n);
  imprimir(vet, n);
End.
