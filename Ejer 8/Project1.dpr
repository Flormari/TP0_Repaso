program Project1;

uses
  Vcl.Forms,
  Panel in 'Panel.pas' {Form1},
  CorteControl in 'CorteControl.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
