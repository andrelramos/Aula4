Program Exc1;
uses Crt;

Type
  reg_funcionario = record
    n_registro: integer;
    nome: string;
    cargo: string;
    salario: real;
  end;

  vet_funcs = array[1..20] of reg_funcionario;

Procedure lerFuncionario(var vet: vet_funcs);
  var
    i: integer;

  begin
    for i := 1 to 20 do
      begin
        vet[i].n_registro := i;

        write('Nome do funcionário ', i, ': ');
        readln(vet[i].nome);
        write('Cargo do funcionário ', i, ': ');
        readln(vet[i].cargo);
        write('Salário do funcionário ', i, ': ');
        readln(vet[i].salario);
      end;
  end;

Procedure imprimir(vet: vet_funcs);
  var
    i: integer;

  begin
    ClrScr;
    writeln('--------------------------------------');
    writeln('Funcionários cadastrados');
    writeln('--------------------------------------');
    for i := 1 to 20 do
      begin
        writeln('Registro do funcionário ', i, ': ', vet[i].n_registro);
        writeln('Nome do funcionário ', i, ': ', vet[i].nome);
        writeln('Cargo do funcionário ', i, ': ', vet[i].cargo);
        writeln('Salário do funcionário ', i, ': ', vet[i].salario);
      end;
  end;

Procedure imprimir5000(vet: vet_funcs);
  var
    i: integer;

  begin
    writeln('--------------------------------------');
    writeln('Funcionários que recebem acima de 5000');
    writeln('--------------------------------------');
    for i := 1 to 20 do
      begin
        if(vet[i].salario > 5000.00) then
          begin
            writeln('Registro do funcionário ', i, ': ', vet[i].n_registro);
            writeln('Nome do funcionário ', i, ': ', vet[i].nome);
            writeln('Cargo do funcionário ', i, ': ', vet[i].cargo);
            writeln('Salário do funcionário ', i, ': ', vet[i].salario);
          end;
      end;
  end;

Var
  vet: vet_funcs;

Begin
  lerFuncionario(vet);
  imprimir(vet);
  imprimir5000(vet);
End.
