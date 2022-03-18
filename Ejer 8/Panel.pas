unit Panel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, CorteControl;

type
  TForm1 = class(TForm)
    Button1: TButton;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Vec: VectorFactura;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var archivo: TextFile;
  Ubicacion, Texto: String;
  I: Integer;
begin
  Ubicacion := '.\Facturas.txt';
  //Asigno la ubicacion del archivo a la variable ARCHIVO
  AssignFile(archivo, Ubicacion);

  //Abro el archivo en modo lectura/escritura
  Reset (archivo);

  for I := 1 to length(Vec) do
  begin

    //Leo el archivo
    ReadLn (archivo, Texto);

    SplitRegistro(Texto, ';', Vec[I]);
  end;

  // Cierro el archivo
  CloseFile(archivo);

end;

end.
