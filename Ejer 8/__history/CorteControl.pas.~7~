unit CorteControl;

interface

  uses
    System.SysUtils;

  Type

  Facturacion = Record
    NroDeFactura: Integer;
    Fecha: TDate;
    Importe: Real;
  end;

  VectorFactura = Array [1..5] of Facturacion;

procedure SplitRegistro(Texto, Separador: String; Registro: Facturacion);

implementation

 //------------------------------------------------------------
 //FUNCIONES
 //------------------------------------------------------------



 //------------------------------------------------------------
 //PROCEDIMIENTOS
 //------------------------------------------------------------

procedure SplitRegistro(Texto, Separador: String; Registro: Facturacion);
var Posicion: Integer;
begin
  //NroDeFacturacion ; Fecha ; Importe

  Texto := Texto + Separador;

  Posicion := Pos(Separador, Texto);

  //Primer
  Registro.NroDeFactura := StrToInt(copy(Texto, 1, Posicion - 1));
  Texto := copy(Texto, Posicion + 1, Length(Texto));
  Posicion := Pos(Separador, Texto);


  //Segundo
  Registro.Fecha := StrToDate(copy(Texto, 1, Posicion - 1));
  Texto := copy(Texto, Posicion + 1, Length(Texto));
  Posicion := Pos(Separador, Texto);


  //Tercero
  Registro.Importe := StrToFloat(copy(Texto, 1, Posicion - 1));

end;


end.
