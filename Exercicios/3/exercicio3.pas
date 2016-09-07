{
  Mesmo programa do exercício 2, porem este utiliza functions ao invés de procedures
}

Program Exc3;
uses Crt;

Type
  ty_prod = record
    cod: integer;
    nome: string[20];
    qtd: integer;
    v_unit:real;
  end;

  ty_vet = array[1..30] of ty_prod;

Procedure entrada(var prod:ty_vet; q:integer);
  var
    c: integer;

  begin
    for c := 1 to q do
      begin
        write('Código do produto ', c, ': ');
        readln(prod[c].cod);
        write('Nome do produto ', c, ': ');
        readln(prod[c].nome);
        write('Quantidade do produto ', c, ': ');
        readln(prod[c].qtd);
        write('Valor do produto ', c, ': ');
        readln(prod[c].v_unit);
        writeln('-----------------');
      end;
  end;

Function calculo(prod:ty_vet; q:integer; tot:real):real;
  var
    c: integer;

  begin
    tot := 0;
    for c:= 1 to q do
      begin
        tot := tot + prod[c].qtd * prod[c].v_unit;
      end;
    calculo := tot;
  end;

Var
  produto: ty_vet;
  n: integer;
  total: real;

Begin
  write('Quantos produtos você deseja cadastrar? ');
  readln(n);

  ClrScr;

  entrada(produto, n);

  writeln('-------------------------------------');
  writeln('Valor total: ', calculo(produto, n, total):8:2);
End.
