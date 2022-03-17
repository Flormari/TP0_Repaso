unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids;

type
  TForm1 = class(TForm)
    GMatriz: TStringGrid;
    BCargarM: TButton;
    procedure BCargarMClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BCargarMClick(Sender: TObject);
var
  F, C, N: Integer;
begin

  N := 4;

  Randomize;
  for F := 1 to N do
  begin
    for C := 1 to N do
      GMatriz.Cells[C, F] := (Random(99) + 1).ToString
  end;

end;

end.
