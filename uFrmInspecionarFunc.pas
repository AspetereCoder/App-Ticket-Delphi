unit uFrmInspecionarFunc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmInspecionarFunc = class(TForm)
    pnlHeader: TPanel;
    lblTitulo: TLabel;
    grpDados: TGroupBox;
    lblNomeTit: TLabel;
    lblNomeVal: TLabel;
    lblCPFTit: TLabel;
    lblCPFVal: TLabel;
    lblCargoTit: TLabel;
    lblCargoVal: TLabel;
    lblGeneroTit: TLabel;
    lblGeneroVal: TLabel;
    lblDataTit: TLabel;
    lblDataVal: TLabel;
    lblTicketsTit: TLabel;
    lblTicketsVal: TLabel;
    btnFechar: TButton;
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CarregarDados;
  end;

var
  frmInspecionarFunc: TfrmInspecionarFunc;

implementation

{$R *.dfm}

uses uDmBanco;

procedure TfrmInspecionarFunc.CarregarDados;
begin
  lblNomeVal.Caption := DataModule1.qrtBuscarFunc.FieldByName('nome').AsString;
  lblCPFVal.Caption := DataModule1.qrtBuscarFunc.FieldByName('cpf').AsString;
  lblCargoVal.Caption := DataModule1.qrtBuscarFunc.FieldByName('cargo').AsString;
  lblGeneroVal.Caption := DataModule1.qrtBuscarFunc.FieldByName('genero').AsString;
  lblDataVal.Caption := DataModule1.qrtBuscarFunc.FieldByName('dataCriacao').AsString;
  lblTicketsVal.Caption := DataModule1.qrtBuscarFunc.FieldByName('qtdTickets').AsString;
end;

procedure TfrmInspecionarFunc.btnFecharClick(Sender: TObject);
begin
  Close;
end;

end.