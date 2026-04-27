unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    btnTickets: TButton;
    btnFuncionarios: TButton;
    procedure btnFuncionariosClick(Sender: TObject);
    procedure btnTicketsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uFrmFuncionarios, uFrmTickets;

procedure TfrmPrincipal.btnFuncionariosClick(Sender: TObject);
begin
  frmFuncionarios.ShowModal;
end;

procedure TfrmPrincipal.btnTicketsClick(Sender: TObject);
begin
  frmTickets.ShowModal();
end;

end.
