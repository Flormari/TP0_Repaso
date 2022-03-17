object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 495
  ClientWidth = 735
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 15
  object Memo1: TMemo
    Left = 550
    Top = 0
    Width = 185
    Height = 495
    Align = alRight
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object BEliminarESP: TButton
    Left = 184
    Top = 264
    Width = 129
    Height = 25
    Caption = '3_ Eliminar Espacios'
    TabOrder = 1
    OnClick = BEliminarESPClick
  end
  object MFrase: TMemo
    Left = 128
    Top = 64
    Width = 305
    Height = 89
    Lines.Strings = (
      'MFrase')
    TabOrder = 2
  end
  object BInvertir: TButton
    Left = 184
    Top = 328
    Width = 129
    Height = 25
    Caption = '4_ Invertir Cadena'
    TabOrder = 3
    OnClick = BInvertirClick
  end
  object BCantidad: TButton
    Left = 184
    Top = 384
    Width = 129
    Height = 25
    Caption = '5_ Cantidad de Letras'
    TabOrder = 4
    OnClick = BCantidadClick
  end
end
