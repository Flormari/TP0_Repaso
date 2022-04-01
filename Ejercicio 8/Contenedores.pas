unit Contenedores;

interface

  uses
    System.SysUtils, Winapi.Windows;


  Const
    GramosBocha = 25;
    MinH = 1;
    MaxH = 4;

  Type
    Sabores = (Chocolate, CremaAmericana, Frutilla, Limon);
    Ax = Array [1..20] of String;

    Balde = Record
      Helado: Sabores;
      CantidadH: Real;
    End;

    Heladera = Object
      Item: Array [MinH..MaxH] of Balde;
      //Procedimientos y funciones
      Procedure Inicializar (Var Indice: Integer;Var Sabor: Sabores);
      Procedure CargarBalde (Var Sabor: Sabores;Var Cantidad: Real);
      function SaboresDisponibles (ISabor: Integer): Real;
      Function DosSabores (Var Indice: Integer): Ax;
      Function TresSabores (Var Indice: Integer): Ax;
      Function Quitar (Var ISabor: Integer; Cantidad: Real): Bool;
      function Consulta (ISabor: Integer; Cantidad: Real): Bool;

    End;

implementation

// ============================== INICIALIZAR BALDES ======================== //

Procedure Heladera.Inicializar (Var Indice: Integer;Var Sabor: Sabores);
begin
  //Numro de 1 a 4
  Item[Indice].Helado := Sabor;
  Item[Indice].CantidadH := 0;
end;

// ============================== CARGAR BALDES ======================== //

Procedure Heladera.CargarBalde (Var Sabor: Sabores;Var Cantidad: Real);
Var I: Integer;
  Bandera: Bool;
begin
  I := 1;
  Bandera := True;

  while (Bandera) and (I < 5) do begin

    if Item[I].Helado = Sabor then begin

      Item[I].CantidadH := Item[I].CantidadH + Cantidad;

      Bandera := False;
    end
    else begin
      I := I + 1;
    end;

  end;

end;


// ============================== SABORES DISPONIBLES ======================== //

function Heladera.SaboresDisponibles (ISabor: Integer): Real;
begin
  Result := Item[ISabor].CantidadH;
end;



// ============================== COMBINACIONES DE DOS SABORES ======================== //

Function Heladera.DosSabores (Var Indice: Integer): Ax;
Var Lista: Ax;
  I, II, Cont: Integer;
  PrimerSa, SegunS: String;
begin

  Indice := 1;

  for I := MinH to MaxH do begin

    // Inicializar Varia del segundo For
    Cont := I;

    //PrimerSabor
    case Item[I].Helado of

      Chocolate:  PrimerSa := 'Chocolate';
      CremaAmericana: PrimerSa := 'Crema Americana';
      Frutilla: PrimerSa := 'Frutilla';
      Limon: PrimerSa := 'Limon';

    end;

    for II := Cont to MaxH do begin

    //Segundo Sabor
       case Item[II].Helado of

        Chocolate:  SegunS := 'Chocolate';
        CremaAmericana: SegunS := 'Crema Americana';
        Frutilla: SegunS := 'Frutilla';
        Limon: SegunS := 'Limon';
       end;

       //Cargo la lista
       Lista[Indice]:= PrimerSa + ' , ' + SegunS;
       Indice := Indice + 1;


    end;


  end;

  Indice := Indice - 1;
  Result := Lista;

end;



// ============================== COMBINACIONES DE TRES SABORES ======================== //

Function Heladera.TresSabores (Var Indice: Integer): Ax;
Var Lista: Ax;
  I, II, III, Cont, ContII: Integer;
  PrimerSa, SegunS, TercerS: String;
begin

  Indice := 1;

  for I := MinH to MaxH do begin

    // Inicializar Varia del segundo For
    Cont := I;

    //PrimerSabor
    case Item[I].Helado of

      Chocolate:  PrimerSa := 'Chocolate';
      CremaAmericana: PrimerSa := 'Crema Americana';
      Frutilla: PrimerSa := 'Frutilla';
      Limon: PrimerSa := 'Limon';

    end;

    for II := Cont to MaxH do begin

      // Inicializar Varia del Tercer For
      ContII := II;

      //Segundo Sabor
       case Item[II].Helado of

        Chocolate:  SegunS := 'Chocolate';
        CremaAmericana: SegunS := 'Crema Americana';
        Frutilla: SegunS := 'Frutilla';
        Limon: SegunS := 'Limon';
       end;

       for III := ContII to MaxH do begin

          //Tercer Sabor
         case Item[III].Helado of

          Chocolate:  TercerS := 'Chocolate';
          CremaAmericana: TercerS := 'Crema Americana';
          Frutilla: TercerS := 'Frutilla';
          Limon: TercerS := 'Limon';
         end;

         //Cargo la lista
         Lista[Indice]:= PrimerSa + ' , ' + SegunS + ' , ' + TercerS;
         Indice := Indice + 1;
       end;


    end;


  end;

  Indice := Indice - 1;
  Result := Lista;

end;


// ============================== SERVIR HELADO / QUITAR ======================== //

Function Heladera.Quitar (Var ISabor: Integer; Cantidad: Real): Bool;
Var S: Bool;
begin

  if (Item[ISabor].CantidadH >= Cantidad) then begin
    Item[ISabor].CantidadH := Item[ISabor].CantidadH - Cantidad;
    S := True;
  end
  else S := False;

  Result := S;

end;


// ============================== CONSULTA DE CANTIDAD ======================== //

function Heladera.Consulta (ISabor: Integer; Cantidad: Real): Bool;
Var S: Bool;
begin

  if (Item[ISabor].CantidadH >= Cantidad) then begin
    S := True;
  end
  Else S := False;

  Result := S;


end;

end.
