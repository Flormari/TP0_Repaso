unit Heladeria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Contenedores, StrUtils;


Const
  ICho = 1;
  ICrA = 2;
  IFru = 3;
  ILim = 4;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    BCargar: TButton;
    EdChocolate: TEdit;
    TChocolate: TLabel;
    TCrema: TLabel;
    EdCrema: TEdit;
    TFrutilla: TLabel;
    TLimon: TLabel;
    EdFrutilla: TEdit;
    EdLimon: TEdit;
    BConsultaSabor: TButton;
    BQuitar2: TButton;
    BEmpezar: TButton;
    BCerrar: TButton;
    BConvi2S: TButton;
    BConvi3S: TButton;
    BQuitar3: TButton;
    BEjeCo2: TButton;
    ECon2: TEdit;
    BEjeCo3: TButton;
    ECon3: TEdit;
    procedure BCargarClick(Sender: TObject);
    procedure BConsultaSaborClick(Sender: TObject);
    procedure BQuitar2Click(Sender: TObject);
    procedure BEmpezarClick(Sender: TObject);
    procedure BCerrarClick(Sender: TObject);
    procedure BConvi2SClick(Sender: TObject);
    procedure BConvi3SClick(Sender: TObject);
    procedure BQuitar3Click(Sender: TObject);
    procedure BEjeCo2Click(Sender: TObject);
    procedure BEjeCo3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  T: Heladera;

implementation

{$R *.dfm}

// ============================== CARGAR BALDES ======================== //

procedure TForm1.BCargarClick(Sender: TObject);
var MensajeMemo: Bool;
  S: Sabores;
  R: Real;
  Bandera: Bool;
begin
  //verificar si la cantidad egresada es un numero (bandera y mayor a -1)
  Bandera := True;

  try
    StrToFloat(EdChocolate.Text);
  Except
    Bandera := False;
  end;


  if Bandera and (StrToFloat(EdChocolate.Text) >= 0) then begin

    MensajeMemo := False;

    if EdChocolate.Text <> '0'  then begin

      //En la TAD
      S := Chocolate;
      R := StrToFloat(EdChocolate.Text);
      T.CargarBalde(S, R);

      EdChocolate.Text := '0';

      MensajeMemo := True;
    end;

     if EdCrema.Text <> '0'  then begin

      //procedimiento de cargar en la TAD
      S := CremaAmericana;
      R := StrToFloat(EdCrema.Text);
      T.CargarBalde(S, R);

       EdCrema.Text := '0';

       MensajeMemo := True;
    end;

     if EdFrutilla.Text <> '0'  then begin

      //procedimiento de cargar en la TAD
      S := Frutilla;
      R := StrToFloat(EdFrutilla.Text);
      T.CargarBalde(S, R);

      EdFrutilla.Text := '0';

      MensajeMemo := True;
    end;

     if EdLimon.Text <> '0'  then begin

      //procedimiento de cargar en la TAD
      S := Limon;
      R := StrToFloat(EdLimon.Text);
      T.CargarBalde(S, R);

      EdLimon.Text := '0';

      MensajeMemo := True;
    end;

    if MensajeMemo then begin
      memo1.Clear;
      memo1.Lines.Add('Helados Cargados Correctamente');
    end
    else begin
      memo1.Clear;
      memo1.Lines.Add('Introducir Cantidad');
    end;

  end
  else showmessage('Error: Solo se pueden escribir numeros positivos');

end;


// ============================== CERRAR APLICACION ======================== //

procedure TForm1.BCerrarClick(Sender: TObject);
begin
  Close;
end;



// ============================== SABORES DISPONIBLES ======================== //

procedure TForm1.BConsultaSaborClick(Sender: TObject);
var CantL: Real;
  I: Integer;
begin

  CantL := 0;
  memo1.Clear;

  //Chocolate
  CantL := T.SaboresDisponibles(ICho);
  memo1.Lines.Add('Chocolate: ' +  FloatToStr(CantL) + ' Gramos');

  //Crema Americana
  CantL := T.SaboresDisponibles(ICrA);
  memo1.Lines.Add('Crema Americana: ' +  FloatToStr(CantL) + ' Gramos');

  //Frutilla
  CantL := T.SaboresDisponibles(IFru);
  memo1.Lines.Add('Frutilla: ' +  FloatToStr(CantL) + ' Gramos');

  //Limon
  CantL := T.SaboresDisponibles(ILim);
  memo1.Lines.Add('Limon: ' +  FloatToStr(CantL) + ' Gramos');


end;


// ============================== CONBINAR 2 SABORES   ======================== //

procedure TForm1.BConvi2SClick(Sender: TObject);
Var Lis: Ax;
  Ind: Integer;
  I: Integer;
begin
  Ind := 0;
  Lis := T.DosSabores(Ind);

  memo1.Clear;
  memo1.Lines.Add('Introducir en la casilla siguiente el numero de combinacion que quiere consultar');

  for I := 1 to Ind do begin
    memo1.Lines.Add('Combinacion [' + I.ToString + ']: ' + Lis[I]);
  end;

  BEjeCo2.Enabled := True;
  ECon2.Enabled := True;

end;

// ============================== CONBINAR 3 SABORES   ======================== //

procedure TForm1.BConvi3SClick(Sender: TObject);
Var Lis: Ax;
  Ind: Integer;
  I: Integer;
begin
  Ind := 0;
  Lis := T.TresSabores(Ind);

  memo1.Clear;
  memo1.Lines.Add('Introducir en la casilla siguiente el numero de combinacion que quiere consultar');

  for I := 1 to Ind do begin
    memo1.Lines.Add('Combinacion [' + I.ToString + ']: ' + Lis[I]);
  end;

  BEjeCo3.Enabled := True;
  ECon3.Enabled := True;

end;

// ============================== CONSULTA 2 ======================== //

procedure TForm1.BEjeCo2Click(Sender: TObject);
Var Num: Integer;
  dispo: Bool;
begin

  dispo := False;

  try

    Num := strtoint(ECon2.Text);

  Except
    showmessage('Error, Solo se puede introducir numeros');
    Num := 15;
  end;


  if (Num > 0) and (Num < 11) then begin
    case Num of

      //Chocolate, chocolate
      1: dispo := T.Consulta(ICho, 50); 

      //Chocolate, crema
      2: if T.Consulta(ICho, 25) and T.Consulta(ICrA, 25) then dispo := True;
         

      // Chocolate, fruti
      3: if T.Consulta(ICho, 25) and T.Consulta(IFru, 25) then dispo := True;

      // Choco limon
      4: if T.Consulta(ICho, 25) and T.Consulta(ILim, 25) then dispo := True;

      //Crema y crema
      5: dispo := T.Consulta(ICrA, 50); 

      //crema y frutilla
      6: if T.Consulta(ICrA, 25) and T.Consulta(IFru, 25) then dispo := True;

      // Crema limon
      7: if T.Consulta(ICrA, 25) and T.Consulta(ILim, 25) then dispo := True;

      // frutilla frutilla
      8: dispo := T.Consulta(IFru, 50);

       // frutilla limon
      9: if T.Consulta(IFru, 25) and T.Consulta(ILim, 25) then dispo := True;

      // limon limon
      10: dispo := T.Consulta(ILim, 50);
        
    end;  

    memo1.Clear;
    
    if dispo then begin
      memo1.Lines.Add('El helado esta disponible');
    end
    else memo1.Lines.Add('El helado NO esta disponible');

    //condiciones al terminar
    ECon2.Text := 'Aqui';
    BEjeCo2.Enabled := False;
    ECon2.Enabled := False;
    
  end
  else memo1.Lines.Add('Introduzca un numero del 1 al 10');

end;


// ============================== CONSULTA 3 ======================== //

procedure TForm1.BEjeCo3Click(Sender: TObject);
Var Num: Integer;
  dispo: Bool;
begin

  dispo := False;

  try

    Num := strtoint(ECon3.Text);

  Except
    showmessage('Error, Solo se puede introducir numeros');
    Num := 40;
  end;


  if (Num > 0) and (Num < 21) then begin
    case Num of

      //Chocolate, chocolate chocolate
      1: dispo := T.Consulta(ICho, 75); 

      //Chocolate chocolate, crema
      2: if T.Consulta(ICho, 50) and T.Consulta(ICrA, 25) then dispo := True;
         
      // Chocolate chocolate, fruti
      3: if T.Consulta(ICho, 50) and T.Consulta(IFru, 25) then dispo := True;

      // Choco choco limon
      4: if T.Consulta(ICho, 50) and T.Consulta(ILim, 25) then dispo := True;

      //choco Crema y crema
      5: if T.Consulta(ICho, 25) and T.Consulta(ICrA, 50) then dispo := True;  

      //chocolate crema y frutilla
      6: if T.Consulta(ICho, 25) and T.Consulta(ICrA, 25) and T.Consulta(IFru, 25) then dispo := True;

      // choco Crema limon                 
      7: if T.Consulta(ICho, 25) and T.Consulta(ICrA, 25) and T.Consulta(ILim, 25) then dispo := True;

      // choco frutilla frutilla   
      8: if T.Consulta(ICho, 25) and T.Consulta(IFru, 50) then dispo := True;

      // choco frutilla limon  
      9: if T.Consulta(ICho, 25) and T.Consulta(IFru, 25) and T.Consulta(ILim, 25) then dispo := True;

      // choco limon limon  
      10: if T.Consulta(ICho, 25) and T.Consulta(ILim, 50) then dispo := True;
      
      // crema x3
      11: dispo := T.Consulta(ICrA, 75);    

      //crema crema frutila     
      12: if T.Consulta(ICrA, 50) and T.Consulta(IFru, 25) then dispo := True;
         
      // crema crema limon         
      13: if T.Consulta(ICrA, 50) and T.Consulta(ILim, 25) then dispo := True;

      // crema frutilla frutilla  
      14: if T.Consulta(ICrA, 25) and T.Consulta(IFru, 50) then dispo := True;

      //crema fruti limon       
      15: if T.Consulta(ICrA, 25) and T.Consulta(IFru, 25) and T.Consulta(ILim, 25) then dispo := True; 

      //crema limon limon
      16: if T.Consulta(ICrA, 25) and T.Consulta(ILim, 50) then dispo := True;

      // frutilla x3
      17: dispo := T.Consulta(IFru, 75);

      // frutilla frutilla limon     
      18: if T.Consulta(IFru, 50) and T.Consulta(ILim, 25) then dispo := True;

      // frutilla limon limon
      19: if T.Consulta(IFru, 25) and T.Consulta(ILim, 50) then dispo := True;

      // limon x3
      20: dispo := T.Consulta(ILim, 75);
        
    end;  

    memo1.Clear;
    
    if dispo then begin
      memo1.Lines.Add('El helado esta disponible');
    end
    else memo1.Lines.Add('El helado NO esta disponible');

    //condiciones al terminar
    ECon3.Text := 'Aqui';
    BEjeCo3.Enabled := False;
    ECon3.Enabled := False;
    
  end
  else memo1.Lines.Add('Introduzca un numero del 1 al 20');

end;

// ============================== INICIALIZAR BALDES ======================== //

procedure TForm1.BEmpezarClick(Sender: TObject);
Var
  C: Sabores;
  I: Integer;
begin
  //Inicializar contenedores
  C := Chocolate;
  I := ICho;
  T.Inicializar(I, C);

  I := ICrA;
  C := CremaAmericana;
  T.Inicializar(I, C);

  I := IFru;
  C := Frutilla;
  T.Inicializar(I, C);

  I := ILim;
  C := Limon;
  T.Inicializar(I, C);



  BCargar.Enabled := True;
  BConsultaSabor.Enabled := True;
  BQuitar2.Enabled := True;
  BQuitar3.Enabled := True;
  BCerrar.Enabled := True;
  BConvi2S.Enabled := True;
  BConvi3S.Enabled := True;
end;


// ============================== SERVIR 2 ======================== //

procedure TForm1.BQuitar2Click(Sender: TObject);
Var PrimerS, SegundoS: String;
  I1, I2: Integer;
begin
  PrimerS := ' ';
  SegundoS := ' ';

  // Primer Sabor
  PrimerS := InputBox('Seleccionar Sabores', 'Primer Sabor', ' ');
  PrimerS := AnsiLowerCase(PrimerS);

  while (PrimerS <> 'chocolate') and (PrimerS <> 'crema americana') and (PrimerS <> 'frutilla') and (PrimerS <> 'limon') do begin

    PrimerS := InputBox('Introdusca correctamente el primer sabor', 'Primer Sabor', ' ');
    PrimerS := AnsiLowerCase(PrimerS)

  end;

  //Segundo Sabor
  SegundoS := InputBox('Seleccionar Sabores', 'Segundo Sabor', ' ');
  SegundoS := AnsiLowerCase(SegundoS);

  while (SegundoS <> 'chocolate') and (SegundoS <> 'crema americana') and (SegundoS <> 'frutilla') and (SegundoS <> 'limon') do begin

    SegundoS := InputBox('Introdusca correctamente el segundo sabor', 'Segundo Sabor', ' ');
    SegundoS := AnsiLowerCase(SegundoS)

  end;


  //Quitar
  I1 := ansiindexstr(PrimerS, ['chocolate', 'crema americana', 'frutilla', 'limon']);
  I1 := I1 + 1;

  I2 := ansiindexstr(SegundoS, ['chocolate', 'crema americana', 'frutilla', 'limon']);
  I2 := I2 + 1;

  memo1.Clear;

  if T.Consulta(I1, 25) and T.Consulta(I2, 25) then begin
    T.Quitar(I1, 25);
    T.Quitar(I2, 25);
    memo1.Lines.Add('Helado servido correctamente');
  end
  else memo1.Lines.Add('No hay suficiente helado, intentelo en otro momento');

end;


// ============================== SERVIR 3 ======================== //


procedure TForm1.BQuitar3Click(Sender: TObject);
Var PrimerS, SegundoS, TercerS: String;
  I1, I2, I3: Integer;
begin
  PrimerS := ' ';
  SegundoS := ' ';

  // Primer Sabor
  PrimerS := InputBox('Seleccionar Sabores', 'Primer Sabor', ' ');
  PrimerS := AnsiLowerCase(PrimerS);

  while (PrimerS <> 'chocolate') and (PrimerS <> 'crema americana') and (PrimerS <> 'frutilla') and (PrimerS <> 'limon') do begin

    PrimerS := InputBox('Introdusca correctamente el primer sabor', 'Primer Sabor', ' ');
    PrimerS := AnsiLowerCase(PrimerS)

  end;

  //Segundo Sabor
  SegundoS := InputBox('Seleccionar Sabores', 'Segundo Sabor', ' ');
  SegundoS := AnsiLowerCase(SegundoS);

  while (SegundoS <> 'chocolate') and (SegundoS <> 'crema americana') and (SegundoS <> 'frutilla') and (SegundoS <> 'limon') do begin

    SegundoS := InputBox('Introdusca correctamente el segundo sabor', 'Segundo Sabor', ' ');
    SegundoS := AnsiLowerCase(SegundoS)

  end;

  //Tercer Sabor
  TercerS := InputBox('Seleccionar Sabores', 'Tercer Sabor', ' ');
  TercerS := AnsiLowerCase(TercerS);

  while (TercerS <> 'chocolate') and (TercerS <> 'crema americana') and (TercerS <> 'frutilla') and (TercerS <> 'limon') do begin

    TercerS := InputBox('Introdusca correctamente el tercer sabor', 'Tercer Sabor', ' ');
    TercerS := AnsiLowerCase(TercerS)

  end;


  //Quitar
  I1 := ansiindexstr(PrimerS, ['chocolate', 'crema americana', 'frutilla', 'limon']);
  I1 := I1 + 1;

  I2 := ansiindexstr(SegundoS, ['chocolate', 'crema americana', 'frutilla', 'limon']);
  I2 := I2 + 1;

  I3 := ansiindexstr(TercerS, ['chocolate', 'crema americana', 'frutilla', 'limon']);
  I3 := I3 + 1;


   memo1.Clear;

  if T.Consulta(I1, 25) and T.Consulta(I2, 25) and T.Consulta(I3, 25) then begin
    T.Quitar(I1, 25);
    T.Quitar(I2, 25);
    T.Quitar(I3, 25);
    memo1.Lines.Add('Helado servido correctamente');
  end
  else memo1.Lines.Add('No hay suficiente helado, intentelo en otro momento');

end;


end.