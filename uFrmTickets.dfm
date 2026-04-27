object frmTickets: TfrmTickets
  Left = 0
  Top = 0
  Caption = 'Gerenciamento de Tickets'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object lblBuscarFunc: TLabel
    Left = 112
    Top = 64
    Width = 66
    Height = 15
    Caption = 'Funcion'#225'rio:'
  end
  object DBGrid1: TDBGrid
    Left = 104
    Top = 96
    Width = 417
    Height = 249
    DataSource = DataModule1.dsTickets
    TabOrder = 0
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
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'funcionario_nome'
        Title.Caption = 'Funcion'#225'rio'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qtd'
        Title.Caption = 'Qtd'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dataCriacao'
        Title.Caption = 'Data Cria'#231#227'o'
        Width = 120
        Visible = True
      end>
  end
  object edtBuscarFunc: TEdit
    Left = 184
    Top = 61
    Width = 241
    Height = 23
    TabOrder = 1
  end
  object btnBuscarFunc: TButton
    Left = 446
    Top = 60
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 2
    OnClick = btnBuscarFuncClick
  end
  object btnNovo: TButton
    Left = 168
    Top = 376
    Width = 75
    Height = 25
    Caption = 'Novo'
    TabOrder = 3
    OnClick = btnNovoClick
  end
  object btnExcluir: TButton
    Left = 416
    Top = 376
    Width = 75
    Height = 25
    Caption = 'Excluir'
    Enabled = False
    TabOrder = 4
    OnClick = btnExcluirClick
  end
  object txtCabecalho: TStaticText
    Left = 184
    Top = 26
    Width = 247
    Height = 29
    Caption = 'GERENCIAMENTO DE TICKET'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
end
