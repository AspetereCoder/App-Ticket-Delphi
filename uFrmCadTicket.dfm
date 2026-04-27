object frmCadTicket: TfrmCadTicket
  Left = 0
  Top = 0
  Caption = 'Cadastro de Ticket'
  ClientHeight = 304
  ClientWidth = 478
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 64
    Top = 72
    Width = 66
    Height = 15
    Caption = 'Funcion'#225'rio:'
  end
  object lblQtd: TLabel
    Left = 64
    Top = 232
    Width = 65
    Height = 15
    Caption = 'Quantidade:'
  end
  object lblData: TLabel
    Left = 232
    Top = 232
    Width = 27
    Height = 15
    Caption = 'Data:'
  end
  object StaticText1: TStaticText
    Left = 136
    Top = 32
    Width = 189
    Height = 29
    Caption = 'CADASTRO DE TICKET'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 64
    Top = 93
    Width = 329
    Height = 120
    DataSource = DataModule1.dsFuncionarios
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Title.Caption = 'ID'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Nome do Funcion'#225'rio'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qtdTickets'
        Title.Caption = 'Tickets Atuais'
        Width = 80
        Visible = True
      end>
  end
  object edtQtd: TEdit
    Left = 135
    Top = 229
    Width = 65
    Height = 23
    NumbersOnly = True
    TabOrder = 4
    Text = '1'
  end
  object DateTimePicker1: TDateTimePicker
    Left = 265
    Top = 232
    Width = 128
    Height = 23
    Date = 46139.000000000000000000
    Time = 0.425064560186001500
    TabOrder = 2
  end
  object btnCadastrar: TButton
    Left = 184
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 3
    OnClick = btnCadastrarClick
  end
end
