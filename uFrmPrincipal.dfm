object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Home'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object btnTickets: TButton
    Left = 360
    Top = 160
    Width = 193
    Height = 113
    Caption = 'Tickets'
    TabOrder = 0
    OnClick = btnTicketsClick
  end
  object btnFuncionarios: TButton
    Left = 64
    Top = 160
    Width = 193
    Height = 113
    Caption = 'Funcionarios'
    TabOrder = 1
    OnClick = btnFuncionariosClick
  end
end
