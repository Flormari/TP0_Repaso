unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    BCargarTexto: TButton;
    BSplit: TButton;
    procedure BCargarTextoClick(Sender: TObject);
    procedure BSplitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BCargarTextoClick(Sender: TObject);
var archivo: TextFile;
  Ubicacion, Texto: String;
begin
  Ubicacion := '.\NotasPrueba.txt';
  //Asigno la ubicacion del archivo a la variable ARCHIVO
  AssignFile(archivo, Ubicacion);

  //Abro el archivo en modo lectura/escritura
  Reset (archivo);

  //Leo el archivo
  Read (archivo, Texto);

  //El texto lo pongo en el memo
  Texto := LowerCase(Texto);
  memo1.Lines.Add(Texto);

  // Cierro el archivo
  CloseFile(archivo);
end;

procedure TForm1.BSplitClick(Sender: TObject);
var Vector: array[0..20] of String;
  Texto: String;
  Separador: String;
  archivo: TextFile;
  IndiceV, Posicion, I: Integer;
begin
  //Inicializar
  Separador := ' ';
  IndiceV := 0;

  //Asigno la ubicacion del archivo a la variable ARCHIVO
  AssignFile(archivo, '.\NotasPrueba.txt');

  //Abro el archivo en modo lectura/escritura
  Reset (archivo);

  //Leo el archivo
  Read (archivo, Texto);

  //concateno el separador al final
  Texto := Texto + Separador;

  Posicion := Pos(Separador, Texto);

  // Mientras existan separadores
  while Posicion > 0 do
    begin
      inc(IndiceV);   //Indice del Vector

      Vector[IndiceV] := copy(Texto, 1, Posicion - 1);
      Texto := copy(Texto, Posicion + 1, Length(Texto));

      Posicion := Pos(Separador, Texto);
    end;

   // Cierro el archivo
  CloseFile(archivo);

  for I := 1 to IndiceV do
    memo1.Lines.Add('V[' + I.ToString + ']: ' + Vector[I]);

end;

end.
