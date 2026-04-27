object frmFuncionarios: TfrmFuncionarios
  Left = 0
  Top = 0
  Caption = 'Gerenciamento de Funcion'#225'rios'
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
    Width = 433
    Height = 249
    DataSource = DataModule1.dsFuncionarios
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cargo'
        Title.Caption = 'Cargo'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qtdTickets'
        Title.Caption = 'Tickets'
        Visible = True
      end>
  end
  object edtBuscarFunc: TEdit
    Left = 184
    Top = 61
    Width = 241
    Height = 23
    TabOrder = 1
    OnKeyPress = edtBuscarFuncKeyPress
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
    Left = 112
    Top = 376
    Width = 75
    Height = 25
    Caption = 'Novo'
    TabOrder = 3
    OnClick = btnNovoClick
  end
  object btnEditar: TButton
    Left = 224
    Top = 376
    Width = 75
    Height = 25
    Caption = 'Editar'
    Enabled = False
    TabOrder = 4
    OnClick = btnEditarClick
  end
  object btnExcluir: TButton
    Left = 432
    Top = 376
    Width = 75
    Height = 25
    Caption = 'Excluir'
    Enabled = False
    TabOrder = 5
    OnClick = btnExcluirClick
  end
  object btnInspecionar: TButton
    Left = 327
    Top = 376
    Width = 75
    Height = 25
    Caption = 'Inspecionar'
    Enabled = False
    TabOrder = 6
    OnClick = btnInspecionarClick
  end
  object txtCabecalho: TStaticText
    Left = 152
    Top = 25
    Width = 312
    Height = 29
    Caption = 'GERENCIAMENTO DE FUNCIONARIO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
end
