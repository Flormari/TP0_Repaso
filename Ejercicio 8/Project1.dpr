program Project1;

uses
  Vcl.Forms,
  Heladeria in 'Heladeria.pas' {Form1},
  Contenedores in 'Contenedores.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
