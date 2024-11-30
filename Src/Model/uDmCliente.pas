unit uDmCliente;

interface

uses
  uDmGeral, ZSqlUpdate, ZDataset, Data.DB, ZAbstractRODataset, ZAbstractDataset,
  ZAbstractTable, ZAbstractConnection, ZConnection, Classe.Aluno, System.Classes;

type
  TDmCliente = class(TDmGeral)
    qAluno: TZQuery;
    zAluno: TZUpdateSQL;
    qAlunoid: TZInt64Field;
    qAlunoidEscola: TZInt64Field;
    qAlunonome: TZUnicodeStringField;
    qAlunodtNasc: TZDateField;
    qAlunoNomePai: TZUnicodeStringField;
    qAlunoNomeMae: TZUnicodeStringField;
    qAlunonomePrograma: TZUnicodeStringField;
    qAlunocargaHoraria: TZIntegerField;
    qResponsavel: TZQuery;
    zPesponsavel: TZUpdateSQL;
    qAlunoperiodo: TZUnicodeStringField;
    qResponsavelid: TZInt64Field;
    qResponsavelidAluno: TZInt64Field;
    qResponsavelnome: TZUnicodeStringField;
    qResponsavelendereco: TZUnicodeStringField;
    qResponsavelbairro: TZUnicodeStringField;
    qResponsavelcidade: TZUnicodeStringField;
    qResponsaveluf: TZUnicodeStringField;
    qResponsaveltelefone: TZUnicodeStringField;
    qResponsavelCEP: TZUnicodeStringField;
    qResponsaveltelefone2: TZUnicodeStringField;
    qAlunoativoStr: TZUnicodeStringField;
    qAlunoativo: TZShortIntField;
    qAlunoinfoSaude: TZUnicodeCLobField;
    qAlunoinfoEspecial: TZUnicodeCLobField;
    qAlunodeleted: TZDateTimeField;
    qResponsaveldeleted: TZDateTimeField;
    qResponsavelCPF: TZUnicodeStringField;
  private
    procedure SalvarResponsavel(idAluno: integer; aResponsavel: TResponsavel);
    { Private declarations }
  public
    procedure ListarAlunos(aPesq: String = '');
    procedure ListarAlunoID(aId: integer = 0; aQuery: TZQuery = nil);
    procedure ListarResponsaveis(aIdAluno: Integer = 0);
    procedure ListarResponsavelID(aId: Integer; aAluno: TAluno = nil);
    procedure Excluir(aIdAluno: Integer);

    function SalvarAluno(aAluno:  TAluno): Boolean;
  end;

var
  DmCliente: TDmCliente;

implementation

uses
  System.SysUtils, Vcl.Navigation, Math, Vcl.Forms, Winapi.Windows;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDmCliente }

procedure TDmCliente.ListarAlunos(aPesq: String = '');
begin
  qAluno.Close;
  qAluno.ParamByName('id').AsInteger  := 0;
  qAluno.ParamByName('pesq').asstring := '%'+ aPesq +'%';
  qAluno.Open;
end;

procedure TDmCliente.ListarResponsaveis(aIdAluno: Integer = 0);
begin
  qResponsavel.Close;
  qResponsavel.ParamByName('id').AsInteger      := 0;
  qResponsavel.ParamByName('idAluno').AsInteger := aIdAluno;
  qResponsavel.Open;
end;

procedure TDmCliente.ListarResponsavelID(aId: Integer; aAluno: TAluno = nil);
var
  I: Integer;
begin
  qResponsavel.Close;
  qResponsavel.ParamByName('id').AsInteger      := aId;
  qResponsavel.ParamByName('idAluno').AsInteger := aAluno.id;
  qResponsavel.Open;

  if Assigned(aAluno) then
    for I := 0 to qResponsavel.RecordCount -1 do
    begin
      qResponsavel.RecNo := I+1;

      with aAluno do
      begin
        aAluno.responsaveis.Add(TResponsavel.Create);
        responsaveis[I].id      := qResponsavelid.AsInteger;
        responsaveis[I].nome    := qResponsavelnome.AsString;
        responsaveis[I].CPF      := qResponsavelCPF.AsString;
        responsaveis[I].endereco  := qResponsavelendereco.AsString;
        responsaveis[I].bairro  := qResponsavelbairro.AsString;
        responsaveis[I].cidade  := qResponsavelcidade.AsString;
        responsaveis[I].uf      := qResponsaveluf.AsString;
        responsaveis[I].CEP     := qResponsavelCEP.AsString;
        responsaveis[I].telefone  := qResponsaveltelefone.AsString;
        responsaveis[I].telefone2 := qResponsaveltelefone2.AsString;
        responsaveis[I].ex := 5;
      end;
    end;
end;

procedure TDmCliente.ListarAlunoID(aId: integer = 0; aQuery: TZQuery = nil);
begin
  if Not Assigned(aQuery) then
  begin
    aQuery := TZQuery.Create(Self);
    aQuery.Connection := conBD;
  end;

  aQuery.SQL := qAluno.SQL;

  aQuery.Close;
  aQuery.ParamByName('id').AsInteger  := aId;
  aQuery.ParamByName('pesq').AsString := '%%';
  aQuery.Open;

  if aQuery.Owner.Name = Self.Name then
    aQuery.Free;
end;

function TDmCliente.SalvarAluno(aAluno: TAluno): Boolean;
var
  I: Integer;
begin
  Result := False;

  if aAluno.id = 0 then
    qAluno.Insert
  else
    qAluno.Edit;

  if aAluno.idEscola <> 0 then
    qAlunoidEscola.AsInteger  := aAluno.idEscola;

  qAlunonome.AsString       := aAluno.nome;
  qAlunodtNasc.AsString     := aAluno.dtNasc;
  qAlunoNomePai.AsString    := aAluno.nomePai;
  qAlunoNomeMae.AsString    := aAluno.nomeMae;
  qAlunonomePrograma.AsString  := aAluno.nomePrograma;
  qAlunocargaHoraria.AsInteger := StrToInt(FloatToStr(aAluno.cargaHoraria));
  qAlunoperiodo.AsString    := aAluno.periodo;
  qAlunoativo.AsInteger     := IfThen(aAluno.ativo, 1, 0);
  qAlunoinfoSaude.AsString  := Trim(aAluno.infoSaude);
  qAlunoinfoEspecial.AsString  := Trim(aAluno.infoEspecial);

  qAluno.Post;
  qAluno.ApplyUpdates;

  if aAluno.id = 0 then
  begin
    TNavigation.ParamInt := RetornaUltimoID();
    aAluno.id := TNavigation.ParamInt;
  end;

  qResponsavel.Close;
  qResponsavel.ParamByName('id').AsInteger      := 0;
  qResponsavel.ParamByName('idAluno').AsInteger := aAluno.id;
  qResponsavel.Open;

  for I := 0 to aAluno.responsaveis.Count -1 do
    SalvarResponsavel(aAluno.id, aAluno.responsaveis[I]);
end;

procedure TDmCliente.SalvarResponsavel(idAluno: integer; aResponsavel: TResponsavel);
begin
  if (aResponsavel.ex = 5) then
    Exit;

  if aResponsavel.id = 0 then
    qResponsavel.Insert
  else
  begin
    qResponsavel.Locate('id', aResponsavel.id, []);
    qResponsavel.Edit;
  end;

  case aResponsavel.ex of
    99: qResponsavel.FieldByName('deleted').AsDateTime := Now;

  else
    begin
      qResponsavel.FieldByName('idAluno').AsInteger := idAluno;
      qResponsavel.FieldByName('id').AsInteger := aResponsavel.id;
      qResponsavel.FieldByName('nome').AsString := aResponsavel.nome;
      qResponsavel.FieldByName('CPF').AsString := aResponsavel.CPF;
      qResponsavel.FieldByName('endereco').Asstring := aResponsavel.endereco;
      qResponsavel.FieldByName('bairro').AsString := aResponsavel.bairro;
      qResponsavel.FieldByName('cidade').AsString := aResponsavel.cidade;
      qResponsavel.FieldByName('uf').AsString := aResponsavel.uf;
      qResponsavel.FieldByName('CEP').AsString := aResponsavel.CEP;
      qResponsavel.FieldByName('telefone').AsString := aResponsavel.telefone;
      qResponsavel.FieldByName('telefone2').AsString := aResponsavel.telefone2;
    end;
  end;

  qResponsavel.Post;
  qResponsavel.ApplyUpdates;
end;

procedure TDmCliente.Excluir(aIdAluno: Integer);
begin
  if not (qAluno.Locate('id', aIdAluno, [])) then
  begin
    Application.MessageBox('Registro não encontrado. Por favor, verifique!', 'Atenção', 64);
    Abort;
  end;

  if Application.MessageBox('Deseja realmente excluir?', 'Confirmação', 64 + MB_YESNO) = ID_NO then
    Abort;

  qAluno.Edit;
  qAluno.FieldByName('deleted').AsDateTime := Now;
  qAluno.Post;
end;

end.
