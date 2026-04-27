unit uFrmTickets;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmTickets = class(TForm)
    lblBuscarFunc: TLabel;
    DBGrid1: TDBGrid;
    edtBuscarFunc: TEdit;
    btnBuscarFunc: TButton;
    btnNovo: TButton;
    btnExcluir: TButton;
    txtCabecalho: TStaticText;
    procedure btnNovoClick(Sender: TObject);
    procedure btnBuscarFuncClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtBuscarFuncKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure AtualizarBotoes;
  public
    { Public declarations }
  end;

var
  frmTickets: TfrmTickets;

implementation

{$R *.dfm}

uses uFrmCadTicket, uDmBanco;

procedure TfrmTickets.AtualizarBotoes;
begin
  btnExcluir.Enabled := not DataModule1.qrtTickets.IsEmpty;
end;

procedure TfrmTickets.btnBuscarFuncClick(Sender: TObject);
begin
  DataModule1.qrtTickets.Close;
  DataModule1.qrtTickets.SQL.Text := 
    'SELECT t.id, t.funcionarioId, f.nome as funcionario_nome, t.qtd, t.dataCriacao ' +
    'FROM ticket t ' +
    'INNER JOIN funcionario f ON f.id = t.funcionarioId ' +
    'WHERE f.nome LIKE :nome';
  DataModule1.qrtTickets.ParamByName('nome').AsString := '%' + edtBuscarFunc.Text + '%';
  DataModule1.qrtTickets.Open;
  AtualizarBotoes;
end;

procedure TfrmTickets.btnExcluirClick(Sender: TObject);
var
  vTicketId: Integer;
  vFuncId: Integer;
  vQtd: Integer;
begin
  if DataModule1.qrtTickets.IsEmpty then Exit;

  if MessageDlg('Deseja realmente excluir este ticket?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    vTicketId := DataModule1.qrtTickets.FieldByName('id').AsInteger;
    vFuncId := DataModule1.qrtTickets.FieldByName('funcionarioId').AsInteger;
    vQtd := DataModule1.qrtTickets.FieldByName('qtd').AsInteger;

    DataModule1.FDConnection1.StartTransaction;
    try
      // 1. Remove o ticket
      DataModule1.FDConnection1.ExecSQL('DELETE FROM ticket WHERE id = :id', [vTicketId]);

      // 2. Estorna a quantidade no cadastro do funcionário
      DataModule1.FDConnection1.ExecSQL(
        'UPDATE funcionario SET qtdTickets = qtdTickets - :qtd WHERE id = :fId',
        [vQtd, vFuncId]
      );

      DataModule1.FDConnection1.Commit;
      
      DataModule1.qrtTickets.Refresh;
      DataModule1.qrtBuscarFunc.Refresh; // Atualiza lista de funcionários também
      AtualizarBotoes;
      
      ShowMessage('Ticket excluído com sucesso!');
    except
      on E: Exception do
      begin
        DataModule1.FDConnection1.Rollback;
        ShowMessage('Erro ao excluir ticket: ' + E.Message);
      end;
    end;
  end;
end;

procedure TfrmTickets.btnNovoClick(Sender: TObject);
begin
  FrmCadTicket.idTicket := 0;
  FrmCadTicket.CarregarDados;
  
  if FrmCadTicket.ShowModal = mrOk then
  begin
    DataModule1.qrtTickets.Refresh;
    AtualizarBotoes;
  end;
end;

procedure TfrmTickets.edtBuscarFuncKeyPress(Sender: TObject; var Key: Char);
begin
  Key := UpCase(Key);
end;

procedure TfrmTickets.FormShow(Sender: TObject);
begin
  DataModule1.qrtTickets.Open;
  AtualizarBotoes;
end;

end.
