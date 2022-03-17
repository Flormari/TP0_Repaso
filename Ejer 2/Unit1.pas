unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    BEliminarESP: TButton;
    MFrase: TMemo;
    BInvertir: TButton;
    BCantidad: TButton;
    procedure BEliminarESPClick(Sender: TObject);
    procedure BInvertirClick(Sender: TObject);
    procedure BCantidadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

//------------------------------------------------------
// FUNCIONES INTERNAS DEL PROYECTO
//------------------------------------------------------

function EliminarESP (Texto: String): String;
Var TextoN: string;
  Posicion: Integer;
begin

  while length(Texto) <> 0 do
    begin
      Posicion := Pos(' ', Texto);

      if Posicion = 0 then
        Posicion := length(Texto) + 1;

      TextoN := TextoN + copy(Texto, 1, Posicion - 1);
      Texto := copy(Texto, Posicion + 1, length(texto));
    end;

  Result := TextoN;
end;

//------------------------------------------------------
// PROCEDIMIENTOS DEL PROYECTO
//------------------------------------------------------

procedure TForm1.BCantidadClick(Sender: TObject);
var Texto: String;
begin
  Texto := MFrase.Lines.Text;

  memo1.Lines.Add((length(texto)).ToString);
end;

procedure TForm1.BEliminarESPClick(Sender: TObject);
Var Texto, TextoN: string;

begin
  Texto := MFrase.Lines.Text;

  TextoN := EliminarESP(Texto);

   memo1.Lines.Add(TextoN);
end;

procedure TForm1.BInvertirClick(Sender: TObject);
Var Texto, TextoN: string;
    Posicion: Integer;

begin
  Texto := MFrase.Lines.Text;
  Texto := EliminarESP(Texto);

  while length(Texto) <> 0 do
    begin
      Posicion := length(texto);
      TextoN := TextoN + Texto[Posicion];
      Texto := copy(Texto, 1, Posicion - 1);
    end;


  memo1.Lines.Add(TextoN);
end;

end.
