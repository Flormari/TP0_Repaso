object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 503
  ClientWidth = 751
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 15
  object TChocolate: TLabel
    Left = 8
    Top = 107
    Width = 54
    Height = 15
    Caption = 'Chocolate'
  end
  object TCrema: TLabel
    Left = 8
    Top = 136
    Width = 95
    Height = 15
    Caption = 'Crema Americana'
  end
  object TFrutilla: TLabel
    Left = 216
    Top = 107
    Width = 36
    Height = 15
    Caption = 'Frutilla'
  end
  object TLimon: TLabel
    Left = 218
    Top = 136
    Width = 34
    Height = 15
    Caption = 'Limon'
  end
  object Memo1: TMemo
    Left = 344
    Top = 0
    Width = 407
    Height = 503
    Align = alRight
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object BCargar: TButton
    Left = 88
    Top = 56
    Width = 156
    Height = 25
    Caption = 'Cargar Helado'
    Enabled = False
    TabOrder = 1
    OnClick = BCargarClick
  end
  object EdChocolate: TEdit
    Left = 111
    Top = 104
    Width = 50
    Height = 23
    TabOrder = 2
    Text = '0'
  end
  object EdCrema: TEdit
    Left = 111
    Top = 133
    Width = 50
    Height = 23
    TabOrder = 3
    Text = '0'
  end
  object EdFrutilla: TEdit
    Left = 271
    Top = 104
    Width = 50
    Height = 23
    TabOrder = 4
    Text = '0'
  end
  object EdLimon: TEdit
    Left = 271
    Top = 133
    Width = 50
    Height = 23
    TabOrder = 5
    Text = '0'
  end
  object BConsultaSabor: TButton
    Left = 88
    Top = 176
    Width = 156
    Height = 25
    Caption = 'Consultar Sabores'
    Enabled = False
    TabOrder = 6
    OnClick = BConsultaSaborClick
  end
  object BQuitar2: TButton
    Left = 8
    Top = 392
    Width = 137
    Height = 25
    Caption = 'Servir 2 Sabores'
    Enabled = False
    TabOrder = 7
    OnClick = BQuitar2Click
  end
  object BEmpezar: TButton
    Left = 8
    Top = 8
    Width = 137
    Height = 33
    Caption = 'Abrir Heladeria'
    TabOrder = 8
    OnClick = BEmpezarClick
  end
  object BCerrar: TButton
    Left = 8
    Top = 456
    Width = 137
    Height = 33
    Caption = 'Cerrar Heladeria'
    Enabled = False
    TabOrder = 9
    OnClick = BCerrarClick
  end
  object BConvi2S: TButton
    Left = 8
    Top = 248
    Width = 156
    Height = 25
    Caption = 'Convinaciones de 2 Sabores'
    Enabled = False
    TabOrder = 10
    OnClick = BConvi2SClick
  end
  object BConvi3S: TButton
    Left = 8
    Top = 312
    Width = 156
    Height = 25
    Caption = 'Convinaciones de 3 Sabores'
    Enabled = False
    TabOrder = 11
    OnClick = BConvi3SClick
  end
  object BQuitar3: TButton
    Left = 184
    Top = 392
    Width = 137
    Height = 25
    Caption = 'Servir 3 Sabores'
    Enabled = False
    TabOrder = 12
    OnClick = BQuitar3Click
  end
  object BEjeCo2: TButton
    Left = 250
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Consultar'
    Enabled = False
    TabOrder = 13
    OnClick = BEjeCo2Click
  end
  object ECon2: TEdit
    Left = 184
    Top = 249
    Width = 60
    Height = 23
    Enabled = False
    TabOrder = 14
    Text = 'Aqui'
  end
  object BEjeCo3: TButton
    Left = 250
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Consultar'
    Enabled = False
    TabOrder = 15
    OnClick = BEjeCo3Click
  end
  object ECon3: TEdit
    Left = 184
    Top = 313
    Width = 60
    Height = 23
    Enabled = False
    TabOrder = 16
    Text = 'Aqui'
  end
end