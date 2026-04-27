unit uFrmCadTicket;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmCadTicket = class(TForm)
    StaticText1: TStaticText;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    lblQtd: TLabel;
    lblData: TLabel;
    DateTimePicker1: TDateTimePicker;
    btnCadastrar: TButton;
    edtQtd: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
  private
    { Private declarations }
    FOriginalQtd: Integer;
    FOriginalFuncId: Integer;
    FOriginalData: TDate;
    function HouveAlteracoes: Boolean;
  public
    { Public declarations }
    idTicket: Integer; // 0 = Novo, > 0 = Editar
    procedure CarregarDados;
  end;

var
  frmCadTicket: TfrmCadTicket;

implementation

{$R *.dfm}

uses uDmBanco;

procedure TfrmCadTicket.CarregarDados;
begin
  DataModule1.qrtBuscarFunc.Open;
  
  if idTicket > 0 then
  begin
    // Localiza o funcionário no Grid/Query
    DataModule1.qrtBuscarFunc.Locate('id', DataModule1.qrtTickets.FieldByName('funcionarioId').AsInteger, []);
    
    edtQtd.Text := DataModule1.qrtTickets.FieldByName('qtd').AsString;
    DateTimePicker1.Date := DataModule1.qrtTickets.FieldByName('dataCriacao').AsDateTime;
    
    // Guarda originais para verificação e cálculo de saldo
    FOriginalQtd := DataModule1.qrtTickets.FieldByName('qtd').AsInteger;
    FOriginalFuncId := DataModule1.qrtTickets.FieldByName('funcionarioId').AsInteger;
    FOriginalData := DateTimePicker1.Date;
    
    btnCadastrar.Caption := 'Atualizar';
  end
  else
  begin
    edtQtd.Text := '1';
    DateTimePicker1.Date := Date;
    btnCadastrar.Caption := 'Cadastrar';
  end;
end;

function TfrmCadTicket.HouveAlteracoes: Boolean;
begin
  Result := (StrToIntDef(edtQtd.Text, 0) <> FOriginalQtd) or
            (DataModule1.qrtBuscarFunc.FieldByName('id').AsInteger <> FOriginalFuncId) or
            (DateTimePicker1.Date <> FOriginalData);
end;

procedure TfrmCadTicket.btnCadastrarClick(Sender: TObject);
var
  vFuncId: Integer;
  vQtd: Integer;
begin
  if DataModule1.qrtBuscarFunc.IsEmpty then
  begin
    ShowMessage('Selecione um funcionário.');
    Exit;
  end;

  // Se for edição e não houve alteração, apenas sai
  if (idTicket > 0) and (not HouveAlteracoes) then
  begin
    ShowMessage('Nenhuma informação foi alterada.');
    Exit;
  end;

  vFuncId := DataModule1.qrtBuscarFunc.FieldByName('id').AsInteger;
  vQtd := StrToIntDef(edtQtd.Text, 0);

  DataModule1.FDConnection1.StartTransaction;
  try
    if idTicket = 0 then
    begin
      // NOVO TICKET
      DataModule1.FDConnection1.ExecSQL(
        'INSERT INTO ticket (funcionarioId, qtd, dataCriacao) VALUES (:fId, :qtd, :data)',
        [vFuncId, vQtd, FormatDateTime('yyyy-MM-dd', DateTimePicker1.Date)]
      );
      DataModule1.FDConnection1.ExecSQL(
        'UPDATE funcionario SET qtdTickets = qtdTickets + :qtd WHERE id = :fId',
        [vQtd, vFuncId]
      );
    end
    else
    begin
      // ATUALIZAR TICKET
      DataModule1.FDConnection1.ExecSQL(
        'UPDATE ticket SET funcionarioId = :fId, qtd = :qtd, dataCriacao = :data WHERE id = :id',
        [vFuncId, vQtd, FormatDateTime('yyyy-MM-dd', DateTimePicker1.Date), idTicket]
      );

      // Ajusta saldo do funcionário (estorna antigo e soma novo)
      // Se trocou de funcionário, tira de um e dá para o outro
      DataModule1.FDConnection1.ExecSQL(
        'UPDATE funcionario SET qtdTickets = qtdTickets - :oldQtd WHERE id = :oldFId',
        [FOriginalQtd, FOriginalFuncId]
      );
      DataModule1.FDConnection1.ExecSQL(
        'UPDATE funcionario SET qtdTickets = qtdTickets + :newQtd WHERE id = :newFId',
        [vQtd, vFuncId]
      );
    end;

    DataModule1.FDConnection1.Commit;
    DataModule1.qrtTickets.Refresh;
    DataModule1.qrtBuscarFunc.Refresh;
    Self.ModalResult := mrOk;
  except
    on E: Exception do
    begin
      DataModule1.FDConnection1.Rollback;
      ShowMessage('Erro ao salvar ticket: ' + E.Message);
    end;
  end;
end;

procedure TfrmCadTicket.FormShow(Sender: TObject);
begin
  DataModule1.qrtBuscarFunc.Open;
end;

end.
