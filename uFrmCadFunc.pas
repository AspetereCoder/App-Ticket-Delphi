unit uFrmCadFunc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask;

type
  TfrmCadFunc = class(TForm)
    lblNome: TLabel;
    edtNome: TEdit;
    rdgGenero: TRadioGroup;
    lbeCargo: TLabeledEdit;
    btnSalvar: TButton;
    lblCPF: TLabel;
    mskCPF: TMaskEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure lbeCargoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FOriginalNome: string;
    FOriginalCPF: string;
    FOriginalCargo: string;
    FOriginalGenero: Integer;
    function HouveAlteracoes: Boolean;
  public
    { Public declarations }
    idFuncionario: Integer; // 0 = Novo, > 0 = Editar
    procedure CarregarDados;
  end;

var
  frmCadFunc: TfrmCadFunc;

implementation

{$R *.dfm}

uses uDmBanco, FireDAC.Comp.Client, FireDAC.Stan.Param;

procedure TfrmCadFunc.CarregarDados;
begin
  if idFuncionario > 0 then
  begin
    edtNome.Text := DataModule1.qrtBuscarFunc.FieldByName('nome').AsString;
    mskCPF.Text := DataModule1.qrtBuscarFunc.FieldByName('cpf').AsString;
    lbeCargo.Text := DataModule1.qrtBuscarFunc.FieldByName('cargo').AsString;

    if DataModule1.qrtBuscarFunc.FieldByName('genero').AsString = 'M' then
      rdgGenero.ItemIndex := 0
    else if DataModule1.qrtBuscarFunc.FieldByName('genero').AsString = 'F' then
      rdgGenero.ItemIndex := 1
    else
      rdgGenero.ItemIndex := -1;

    // Guarda estado original para comparação
    FOriginalNome := edtNome.Text;
    FOriginalCPF := mskCPF.Text;
    FOriginalCargo := lbeCargo.Text;
    FOriginalGenero := rdgGenero.ItemIndex;
    
    btnSalvar.Caption := 'Atualizar';
  end
  else
  begin
    edtNome.Clear;
    mskCPF.Clear;
    lbeCargo.Clear;
    rdgGenero.ItemIndex := -1;
    btnSalvar.Caption := 'Cadastrar';
  end;
end;

procedure TfrmCadFunc.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  Key := UpCase(Key);
end;

function TfrmCadFunc.HouveAlteracoes: Boolean;
begin
  Result := (edtNome.Text <> FOriginalNome) or
            (mskCPF.Text <> FOriginalCPF) or
            (lbeCargo.Text <> FOriginalCargo) or
            (rdgGenero.ItemIndex <> FOriginalGenero);
end;

procedure TfrmCadFunc.lbeCargoKeyPress(Sender: TObject; var Key: Char);
begin
  Key := UpCase(Key);
end;

procedure TfrmCadFunc.btnSalvarClick(Sender: TObject);
var
  vGenero: string;
  vQry: TFDQuery;
begin
  // Validação básica: CPF preenchido
  if Trim(mskCPF.Text) = '   .   .   -  ' then
  begin
    ShowMessage('Por favor, informe o CPF.');
    Exit;
  end;

  // Verificação de CPF Duplicado
  vQry := TFDQuery.Create(nil);
  try
    vQry.Connection := DataModule1.FDConnection1;
    vQry.SQL.Text := 'SELECT id FROM funcionario WHERE cpf = :cpf AND id <> :id';
    vQry.ParamByName('cpf').AsString := mskCPF.Text;
    vQry.ParamByName('id').AsInteger := idFuncionario;
    vQry.Open;

    if not vQry.IsEmpty then
    begin
      ShowMessage('Este CPF já está cadastrado para outro funcionário!');
      Exit;
    end;
  finally
    vQry.Free;
  end;

  // Se for edição e não houve alteração, apenas fecha
  if (idFuncionario > 0) and (not HouveAlteracoes) then
  begin
    ShowMessage('Nenhuma informação foi alterada.');
    Self.ModalResult := mrNone;
    Exit;
  end;

  if rdgGenero.ItemIndex = 0 then
    vGenero := 'M'
  else if rdgGenero.ItemIndex = 1 then
    vGenero := 'F'
  else
    vGenero := '';

  try
    if idFuncionario = 0 then
    begin
      // Lógica de Inserção
      DataModule1.FDConnection1.ExecSQL(
        'INSERT INTO funcionario (nome, cpf, cargo, genero) VALUES (:nome, :cpf, :cargo, :genero)',
        [edtNome.Text, mskCPF.Text, lbeCargo.Text, vGenero]
      );
      ShowMessage('Funcionário cadastrado com sucesso!');
    end
    else
    begin
      // Lógica de Atualização
      DataModule1.FDConnection1.ExecSQL(
        'UPDATE funcionario SET nome = :nome, cpf = :cpf, cargo = :cargo, genero = :genero WHERE id = :id',
        [edtNome.Text, mskCPF.Text, lbeCargo.Text, vGenero, idFuncionario]
      );
      ShowMessage('Funcionário atualizado com sucesso!');
    end;
    
    Self.ModalResult := mrOk;
  except
    on E: Exception do
      ShowMessage('Erro ao salvar: ' + E.Message);
  end;
end;

end.
