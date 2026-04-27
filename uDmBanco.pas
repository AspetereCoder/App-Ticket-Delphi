unit uDmBanco;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDataModule1 = class(TDataModule)
    FDConnection1: TFDConnection;
    qryCriarFuncionarios: TFDQuery;
    qrtBuscarFunc: TFDQuery;
    dsFuncionarios: TDataSource;
    qrtTickets: TFDQuery;
    dsTickets: TDataSource;
    procedure FDConnection1BeforeConnect(Sender: TObject);
    procedure FDConnection1AfterConnect(Sender: TObject);
  private
    { Private declarations }
    procedure CriarTabelas;
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModule1.FDConnection1AfterConnect(Sender: TObject);
begin
  FDConnection1.ExecSQL('PRAGMA foreign_keys = ON;');
  CriarTabelas;

end;

procedure TDataModule1.FDConnection1BeforeConnect(Sender: TObject);
begin
  // Define o caminho para um arquivo físico para garantir a persistência
  FDConnection1.Params.Values['Database'] := ExtractFilePath(ParamStr(0)) + 'banco_dados.db';

  // Configuração para resolver o problema do WIDEMEMO via código
  FDConnection1.FormatOptions.AssignedValues := [fvMapRules, fvStrsTrim2Len];
  FDConnection1.FormatOptions.OwnMapRules := True;
  FDConnection1.FormatOptions.StrsTrim2Len := True;
  
  with FDConnection1.FormatOptions.MapRules.Add do
  begin
    SourceDataType := dtWideMemo;
    TargetDataType := dtWideString;
  end;
  
  with FDConnection1.FormatOptions.MapRules.Add do
  begin
    SourceDataType := dtMemo;
    TargetDataType := dtAnsiString;
  end;
end;

procedure TDataModule1.CriarTabelas;
begin
  FDConnection1.ExecSQL(
    'CREATE TABLE IF NOT EXISTS funcionario (' +
    '  id INTEGER PRIMARY KEY AUTOINCREMENT, ' +
    '  nome TEXT NOT NULL, ' +
    '  cpf TEXT, ' +
    '  cargo TEXT, ' +
    '  genero TEXT, ' +
    '  dataCriacao DATETIME DEFAULT CURRENT_TIMESTAMP, ' +
    '  qtdTickets INTEGER DEFAULT 0' +
    ');'
  );

  FDConnection1.ExecSQL(
    'CREATE TABLE IF NOT EXISTS ticket (' +
    '  id INTEGER PRIMARY KEY AUTOINCREMENT, ' +
    '  funcionarioId INTEGER NOT NULL, ' +
    '  qtd INTEGER DEFAULT 1, ' +
    '  dataCriacao DATETIME DEFAULT CURRENT_TIMESTAMP, ' +
    '  FOREIGN KEY (funcionarioId) REFERENCES funcionario(id) ON DELETE CASCADE' +
    ');'
  );
end;

end.
