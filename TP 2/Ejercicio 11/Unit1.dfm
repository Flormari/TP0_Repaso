object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 486
  ClientWidth = 725
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 15
  object TNumero: TLabel
    Left = 40
    Top = 27
    Width = 44
    Height = 15
    Caption = 'Numero'
  end
  object TBomba: TLabel
    Left = 208
    Top = 27
    Width = 38
    Height = 15
    Caption = 'Bomba'
  end
  object EdNumero: TEdit
    Left = 40
    Top = 48
    Width = 121
    Height = 23
    TabOrder = 0
    Text = '0'
  end
  object EdBomba: TEdit
    Left = 208
    Top = 48
    Width = 121
    Height = 23
    TabOrder = 1
    Text = '0'
  end
  object Ejecutar: TButton
    Left = 432
    Top = 23
    Width = 161
    Height = 48
    Caption = 'Ejecutar'
    TabOrder = 2
    OnClick = EjecutarClick
  end
  object Memo1: TMemo
    Left = 0
    Top = 104
    Width = 725
    Height = 382
    Align = alBottom
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
end
