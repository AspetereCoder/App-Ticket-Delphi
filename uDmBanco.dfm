object DataModule1: TDataModule1
  Height = 480
  Width = 640
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=sQLite')
    LoginPrompt = False
    AfterConnect = FDConnection1AfterConnect
    BeforeConnect = FDConnection1BeforeConnect
    Left = 272
    Top = 56
  end
  object qryCriarFuncionarios: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE TABLE IF NOT EXISTS funcionarios ('
      ' id INTEGER PRIMARY KEY,'
      ' nome VARCHAR(35)'
      ' );')
    Left = 176
    Top = 144
  end
  object qrtBuscarFunc: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM funcionario')
    Left = 304
    Top = 144
  end
  object dsFuncionarios: TDataSource
    DataSet = qrtBuscarFunc
    Left = 416
    Top = 144
  end
  object qrtTickets: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT '
      '  t.id,'
      '  t.funcionarioId,'
      '  f.nome as funcionario_nome,'
      '  t.qtd,'
      '  t.dataCriacao'
      'FROM ticket t'
      'INNER JOIN funcionario f ON f.id = t.funcionarioId')
    Left = 176
    Top = 232
  end
  object dsTickets: TDataSource
    DataSet = qrtTickets
    Left = 280
    Top = 232
  end
end
