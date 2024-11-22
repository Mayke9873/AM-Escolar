unit Classe.Aluno;

interface

uses
  System.Generics.Collections;

type
  TResponsavel = class
  private
    FRG: String;
    Fbairro: String;
    Fuf: String;
    Fid: Integer;
    Fnome: String;
    Fcidade: String;
    Fendereco: String;
    Ftelefone: String;
    FCEP: String;
    Ftelefone2: String;
    Fex: Integer;
    procedure Setbairro(const Value: String);
    procedure Setcidade(const Value: String);
    procedure Setendereco(const Value: String);
    procedure Setid(const Value: Integer);
    procedure Setnome(const Value: String);
    procedure SetRG(const Value: String);
    procedure Settelefone(const Value: String);
    procedure Setuf(const Value: String);
    procedure SetCEP(const Value: String);
    procedure Settelefone2(const Value: String);
    procedure Setex(const Value: Integer);

  public
    property id: Integer read Fid write Setid;
    property nome: String read Fnome write Setnome;
    property RG: String read FRG write SetRG;
    property endereco: String read Fendereco write Setendereco;
    property bairro: String read Fbairro write Setbairro;
    property cidade: String read Fcidade write Setcidade;
    property uf: String read Fuf write Setuf;
    property CEP: String read FCEP write SetCEP;
    property telefone: String read Ftelefone write Settelefone;
    property telefone2: String read Ftelefone2 write Settelefone2;
    property ex : Integer read Fex write Setex;
  end;

  TAluno = class
  private
    FnomePai: String;
    FcargaHoraria: Real;
    FnomePrograma: String;
    FinfoSaude: String;
    Fid: Integer;
    FidEscola: Integer;
    Fperiodo: string;
    FdtNasc: String;
    FnomeMae: string;
    FinfoEspecial: String;
    Fnome: String;
    Fativo: Boolean;
    Fresponsaveis: TObjectList<TResponsavel>;
    procedure SetcargaHoraria(const Value: Real);
    procedure SetdtNasc(const Value: String);
    procedure Setid(const Value: Integer);
    procedure SetidEscola(const Value: Integer);
    procedure SetinfoEspecial(const Value: String);
    procedure SetinfoSaude(const Value: String);
    procedure Setnome(const Value: String);
    procedure SetnomeMae(const Value: string);
    procedure SetnomePai(const Value: String);
    procedure SetnomePrograma(const Value: String);
    procedure Setperiodo(const Value: String);
    procedure Setativo(const Value: Boolean);
    procedure Setresponsaveis(const Value: TObjectList<TResponsavel>);

  public
    property id: Integer read Fid write Setid;
    property idEscola: Integer read FidEscola write SetidEscola;
    property nome: String read Fnome write Setnome;
    property dtNasc: String read FdtNasc write SetdtNasc;
    property nomePai: String read FnomePai write SetnomePai;
    property nomeMae: string read FnomeMae write SetnomeMae;
    property nomePrograma: String read FnomePrograma write SetnomePrograma;
    property cargaHoraria: Real read FcargaHoraria write SetcargaHoraria;
    property periodo: String read Fperiodo write Setperiodo;
    property infoSaude: String read FinfoSaude write SetinfoSaude;
    property infoEspecial: String read FinfoEspecial write SetinfoEspecial;
    property ativo: Boolean read Fativo write Setativo;
    property responsaveis: TObjectList<TResponsavel> read Fresponsaveis write Setresponsaveis;

    constructor Create;
    destructor Destroy; override;

    procedure Salvar;
  end;

implementation

uses
  uDmCliente, System.SysUtils, StrUtils;

{ TAluno }

constructor TAluno.Create;
begin
  Fresponsaveis := TObjectList<TResponsavel>.Create;
end;

destructor TAluno.Destroy;
begin
  Fresponsaveis.Free;
  inherited;
end;

procedure TAluno.Salvar;
var
  DMCli: TDmCliente;
begin
  DMCli := TDmCliente.Create(nil);

  try
    if NOT (DMCli.qAluno.Active) then
    begin
      DMCli.qAluno.ParamByName('id').AsInteger  := Fid;
      DMCli.qAluno.ParamByName('pesq').AsString := '%%';
      DMCli.qAluno.Open;
    end;

    DMCli.SalvarAluno(Self);
  finally
    FreeAndNil(DMCli);
  end;
end;

procedure TAluno.Setativo(const Value: Boolean);
begin
  Fativo := Value;
end;

procedure TAluno.SetcargaHoraria(const Value: Real);
begin
  FcargaHoraria := Value;
end;

procedure TAluno.SetdtNasc(const Value: String);
var
  vData: TDateTime;
begin
  FdtNasc := IfThen(TryStrToDate(Value, vData), Value, '');
end;

procedure TAluno.Setid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TAluno.SetidEscola(const Value: Integer);
begin
  FidEscola := Value;
end;

procedure TAluno.SetinfoEspecial(const Value: String);
begin
  FinfoEspecial := Value;
end;

procedure TAluno.SetinfoSaude(const Value: String);
begin
  FinfoSaude := Value;
end;

procedure TAluno.Setnome(const Value: String);
begin
  Fnome := Value;
end;

procedure TAluno.SetnomeMae(const Value: string);
begin
  FnomeMae := Value;
end;

procedure TAluno.SetnomePai(const Value: String);
begin
  FnomePai := Value;
end;

procedure TAluno.SetnomePrograma(const Value: String);
begin
  FnomePrograma := Value;
end;

procedure TAluno.Setperiodo(const Value: String);
begin
  Fperiodo := Value;
end;

procedure TAluno.Setresponsaveis(const Value: TObjectList<TResponsavel>);
begin
  Fresponsaveis := Value;
end;

{ TResposavel }

procedure TResponsavel.Setbairro(const Value: String);
begin
  Fbairro := Value;
end;

procedure TResponsavel.SetCEP(const Value: String);
begin
  FCEP := Value;
end;

procedure TResponsavel.Setcidade(const Value: String);
begin
  Fcidade := Value;
end;

procedure TResponsavel.Setendereco(const Value: String);
begin
  Fendereco := Value;
end;

procedure TResponsavel.Setex(const Value: Integer);
begin
  Fex := Value;
end;

procedure TResponsavel.Setid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TResponsavel.Setnome(const Value: String);
begin
  Fnome := Value;
end;

procedure TResponsavel.SetRG(const Value: String);
begin
  FRG := Value;
end;

procedure TResponsavel.Settelefone(const Value: String);
begin
  Ftelefone := Value;
end;

procedure TResponsavel.Settelefone2(const Value: String);
begin
  Ftelefone2 := Value;
end;

procedure TResponsavel.Setuf(const Value: String);
begin
  Fuf := Value;
end;

end.
