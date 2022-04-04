unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TadRecursion;

type
  TForm1 = class(TForm)
    EdNumero: TEdit;
    EdBomba: TEdit;
    TNumero: TLabel;
    TBomba: TLabel;
    Ejecutar: TButton;
    Memo1: TMemo;
    procedure EjecutarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.EjecutarClick(Sender: TObject);
Var Num, Bomb, Indice, I: Integer;
  R: Recursion;
  Lista, ListaNueva: ListaTerminada;
  Bandera: Bool;
  Result: String;
begin

  //Control
  Bandera := True;

  try
    Num := strtoint(EdNumero.Text);
    Bomb := strtoint(EdBomba.Text);
  except
    Bandera := False;
  end;

  //Operacion
  if Bandera and (Num > 0) and (Bomb > 0) then begin

    Indice := 1;

    ListaNueva := R.Bomba(Num, Bomb, Indice, lista);

    //Mensaje
    Result := '[ ';
    for I := 1 to Indice do begin
      Result := Result + (ListaNueva[I].ToString) + ' ';
    end;
    Result := Result + ']';

    Memo1.Clear;
    Memo1.Lines.Add('Numero: ' + Num.ToString);
    Memo1.Lines.Add('Bomba: ' + Bomb.ToString);
    Memo1.Lines.Add('Resultado: ' + Result);

  end
  else showmessage('Error: Solo se pueden escribir numeros positivos');


end;

end.
