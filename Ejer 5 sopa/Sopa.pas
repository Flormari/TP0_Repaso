unit Sopa;

interface

type
  matrizSopa = array [1..9] of array[1..10] of Char;
  arrayPalabras = array [1..8] of String;

  Posicion = Record
    fila: integer;
    columna: integer;
  End;

  RecordPalabraEncontrada = Record
    Palabra: String;
    Posiciones: array of Posicion;
  End;

  RecordResultado = array of RecordPalabraEncontrada;

function resolverSopa(Sopa: matrizSopa; palabras: arrayPalabras)
  : RecordResultado;

implementation

function resolverSopa(Sopa: matrizSopa; palabras: arrayPalabras)
  : RecordResultado;
begin
  // acá tienen que resolver el problema
end;

end.
