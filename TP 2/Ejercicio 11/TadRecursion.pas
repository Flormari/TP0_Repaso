unit TadRecursion;

interface

  Uses
    System.SysUtils, Winapi.Windows;

  Type

    ListaTerminada = Array [1..30] of Integer;

    Recursion = Object
      function Bomba (N, B: Integer;Var Ind: Integer; Lista: ListaTerminada): ListaTerminada;
    End;

implementation


function Recursion.Bomba (N, B: Integer;Var Ind: Integer; Lista: ListaTerminada): ListaTerminada;
Var N1, N2: Integer;
begin

  //Operaciones
  N1 := N div B;
  N2 := N - N1;

  //Caso Base
  if N2 <= B then begin
    Lista[Ind] := N1;
    Lista[Ind + 1] := N2;
    Ind := Ind + 1;
    Bomba := Lista;
  end

  //Caso Recursivo
  else begin
    Lista[Ind] := N1;
    Ind := Ind + 1;
    Bomba := Bomba(N2, B, Ind, Lista);
  end;



end;

end.
