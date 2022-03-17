object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 466
  ClientWidth = 748
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 15
  object GMatriz: TStringGrid
    Left = 168
    Top = 112
    Width = 332
    Height = 161
    TabOrder = 0
    RowHeights = (
      24
      24
      24
      24
      20)
  end
  object BCargarM: TButton
    Left = 200
    Top = 48
    Width = 121
    Height = 25
    Caption = 'Cargar Matriz'
    TabOrder = 1
    OnClick = BCargarMClick
  end
end
