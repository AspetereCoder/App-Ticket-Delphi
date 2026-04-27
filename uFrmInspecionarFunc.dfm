object frmInspecionarFunc: TfrmInspecionarFunc
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Inspecionar Funcion'#225'rio'
  ClientHeight = 350
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 400
    Height = 50
    Align = alTop
    Caption = ''
    TabOrder = 0
    object lblTitulo: TLabel
      Left = 16
      Top = 13
      Width = 246
      Height = 25
      Caption = 'DETALHES DO FUNCION'#193'RIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object grpDados: TGroupBox
    Left = 16
    Top = 64
    Width = 368
    Height = 233
    Caption = ' Informa'#231#245'es Cadastrais '
    TabOrder = 1
    object lblNomeTit: TLabel
      Left = 16
      Top = 32
      Width = 36
      Height = 15
      Caption = 'Nome:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowFrame
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNomeVal: TLabel
      Left = 112
      Top = 32
      Width = 66
      Height = 15
      Caption = '---'
    end
    object lblCPFTit: TLabel
      Left = 16
      Top = 64
      Width = 24
      Height = 15
      Caption = 'CPF:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowFrame
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCPFVal: TLabel
      Left = 112
      Top = 64
      Width = 66
      Height = 15
      Caption = '---'
    end
    object lblCargoTit: TLabel
      Left = 16
      Top = 96
      Width = 35
      Height = 15
      Caption = 'Cargo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowFrame
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCargoVal: TLabel
      Left = 112
      Top = 96
      Width = 66
      Height = 15
      Caption = '---'
    end
    object lblGeneroTit: TLabel
      Left = 16
      Top = 128
      Width = 44
      Height = 15
      Caption = 'G'#234'nero:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowFrame
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblGeneroVal: TLabel
      Left = 112
      Top = 128
      Width = 66
      Height = 15
      Caption = '---'
    end
    object lblDataTit: TLabel
      Left = 16
      Top = 160
      Width = 71
      Height = 15
      Caption = 'Criado em:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowFrame
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDataVal: TLabel
      Left = 112
      Top = 160
      Width = 66
      Height = 15
      Caption = '---'
    end
    object lblTicketsTit: TLabel
      Left = 16
      Top = 192
      Width = 79
      Height = 15
      Caption = 'Total Tickets:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowFrame
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTicketsVal: TLabel
      Left = 112
      Top = 192
      Width = 66
      Height = 15
      Caption = '---'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object btnFechar: TButton
    Left = 152
    Top = 312
    Width = 97
    Height = 25
    Caption = 'Fechar'
    TabOrder = 2
    OnClick = btnFecharClick
  end
end