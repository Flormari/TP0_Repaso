object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Sopa de Letras'
  ClientHeight = 263
  ClientWidth = 570
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object bResolverSopa: TButton
    Left = 16
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Resolver Sopa'
    TabOrder = 0
    OnClick = bResolverSopaClick
  end
  object Memo: TMemo
    Left = 16
    Top = 55
    Width = 505
    Height = 186
    TabOrder = 1
  end
end
