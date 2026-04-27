program AppTicket;

uses
  Vcl.Forms,
  uFrmFuncionarios in 'uFrmFuncionarios.pas' {frmFuncionarios},
  uFrmPrincipal in 'uFrmPrincipal.pas' {frmPrincipal},
  uFrmCadFunc in 'uFrmCadFunc.pas' {frmCadFunc},
  uFrmTickets in 'uFrmTickets.pas' {frmTickets},
  uFrmCadTicket in 'uFrmCadTicket.pas' {frmCadTicket},
  uFrmInspecionarFunc in 'uFrmInspecionarFunc.pas' {frmInspecionarFunc},
  uDmBanco in 'uDmBanco.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadFunc, frmCadFunc);
  Application.CreateForm(TfrmTickets, frmTickets);
  Application.CreateForm(TfrmCadTicket, frmCadTicket);
  Application.CreateForm(TfrmFuncionarios, frmFuncionarios);
  Application.CreateForm(TfrmInspecionarFunc, frmInspecionarFunc);
  Application.Run;
end.
