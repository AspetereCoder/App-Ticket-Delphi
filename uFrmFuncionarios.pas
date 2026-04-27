unit uFrmFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmFuncionarios = class(TForm)
    DBGrid1: TDBGrid;
    edtBuscarFunc: TEdit;
    lblBuscarFunc: TLabel;
    btnBuscarFunc: TButton;
    btnNovo: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnInspecionar: TButton;
    txtCabecalho: TStaticText;
    procedure btnNovoClick(Sender: TObject);
    procedure btnBuscarFuncClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnInspecionarClick(Sender: TObject);
    procedure edtBuscarFuncKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure AtualizarBotoes;
  public
    { Public declarations }
  end;

var
  frmFuncionarios: TfrmFuncionarios;

implementation

{$R *.dfm}

uses uFrmCadFunc, uDmBanco, uFrmInspecionarFunc;

procedure TfrmFuncionarios.btnInspecionarClick(Sender: TObject);
begin
  if DataModule1.qrtBuscarFunc.IsEmpty then Exit;

  frmInspecionarFunc.CarregarDados;
  frmInspecionarFunc.ShowModal;
end;

procedure TfrmFuncionarios.btnEditarClick(Sender: TObject);
begin
  if DataModule1.qrtBuscarFunc.IsEmpty then Exit;

  frmCadFunc.idFuncionario := DataModule1.qrtBuscarFunc.FieldByName('id').AsInteger;
  frmCadFunc.CarregarDados;
  
  if frmCadFunc.ShowModal = mrOk then
    DataModule1.qrtBuscarFunc.Refresh;
end;

procedure TfrmFuncionarios.AtualizarBotoes;
begin
  btnExcluir.Enabled := not DataModule1.qrtBuscarFunc.IsEmpty;
  btnEditar.Enabled := not DataModule1.qrtBuscarFunc.IsEmpty;
  btnInspecionar.Enabled := not DataModule1.qrtBuscarFunc.IsEmpty;
end;

procedure TfrmFuncionarios.btnBuscarFuncClick(Sender: TObject);
begin
  DataModule1.qrtBuscarFunc.Close;
  DataModule1.qrtBuscarFunc.SQL.Text := 'SELECT * FROM funcionario WHERE nome LIKE :nome';
  DataModule1.qrtBuscarFunc.ParamByName('nome').AsString := '%' + edtBuscarFunc.Text + '%';
  DataModule1.qrtBuscarFunc.Open;
  AtualizarBotoes;
end;

procedure TfrmFuncionarios.btnExcluirClick(Sender: TObject);
var
  vId: Integer;
  vNome: string;
begin
  if DataModule1.qrtBuscarFunc.IsEmpty then Exit;

  vId := DataModule1.qrtBuscarFunc.FieldByName('id').AsInteger;
  vNome := DataModule1.qrtBuscarFunc.FieldByName('nome').AsString;

  if MessageDlg('Deseja realmente excluir o funcionário "' + vNome + '"?' + #13#10 + 
                'Isso também excluirá todos os seus tickets.', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      DataModule1.FDConnection1.ExecSQL('DELETE FROM funcionario WHERE id = :id', [vId]);
      
      DataModule1.qrtBuscarFunc.Refresh;
      
      // Só atualiza os tickets se a query estiver aberta (evita erro de dataset fechado)
      if DataModule1.qrtTickets.Active then
        DataModule1.qrtTickets.Refresh;
        
      AtualizarBotoes;
      
      ShowMessage('Funcionário excluído com sucesso!');
    except
      on E: Exception do
        ShowMessage('Erro ao excluir funcionário: ' + E.Message);
    end;
  end;
end;

procedure TfrmFuncionarios.btnNovoClick(Sender: TObject);
begin
  frmCadFunc.idFuncionario := 0;
  frmCadFunc.CarregarDados;
  
  if frmCadFunc.ShowModal = mrOk then
  begin
    DataModule1.qrtBuscarFunc.Refresh;
    AtualizarBotoes;
  end;
end;

procedure TfrmFuncionarios.edtBuscarFuncKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := UpCase(Key);
end;

procedure TfrmFuncionarios.FormShow(Sender: TObject);
begin
  DataModule1.qrtBuscarFunc.Open;
  AtualizarBotoes;
end;

end.
