object frmCadFunc: TfrmCadFunc
  Left = 0
  Top = 0
  Caption = 'Cadastro de Funcion'#225'rio'
  ClientHeight = 218
  ClientWidth = 340
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object lblNome: TLabel
    Left = 48
    Top = 32
    Width = 36
    Height = 15
    Caption = 'Nome:'
  end
  object edtNome: TEdit
    Left = 90
    Top = 29
    Width = 175
    Height = 23
    TabOrder = 0
  end
  object lbeCPF: TLabeledEdit
    Left = 48
    Top = 80
    Width = 121
    Height = 23
    EditLabel.Width = 24
    EditLabel.Height = 15
    EditLabel.Caption = 'CPF:'
    TabOrder = 1
    Text = ''
  end
  object rdgGenero: TRadioGroup
    Left = 175
    Top = 80
    Width = 90
    Height = 71
    Caption = 'G'#234'nero:'
    Items.Strings = (
      'M'
      'F')
    TabOrder = 2
  end
  object lbeCargo: TLabeledEdit
    Left = 48
    Top = 128
    Width = 121
    Height = 23
    EditLabel.Width = 32
    EditLabel.Height = 15
    EditLabel.Caption = 'Cargo'
    TabOrder = 3
    Text = ''
  end
  object btnSalvar: TButton
    Left = 136
    Top = 174
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 4
    OnClick = btnSalvarClick
  end
end
