unit uDmEscola;

interface

uses
  System.SysUtils, System.Classes, uDmGeral, ZAbstractConnection, ZConnection,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, ZDataset,
  ZSqlUpdate, Classe.Escola;

type
  TDmEscola = class(TDmGeral)
    qEscola: TZQuery;
    qEscolaid: TZInt64Field;
    qEscolanome: TZUnicodeStringField;
    zEscola: TZUpdateSQL;
    qEscoladeleted: TZDateTimeField;
  private
    { Private declarations }
  public
    procedure ListarEscolas(aPesq: string = '');
    procedure ListarEscolaID(aId: integer = 0; aQuery: TZQuery = nil);
    procedure Excluir(aId: Integer);

    function SalvarEscola(aEscola: TEscola): Boolean;
  end;

var
  DmEscola: TDmEscola;

implementation

uses
  Vcl.Navigation, Vcl.Forms, Winapi.Windows;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDmEscola }

procedure TDmEscola.ListarEscolaID(aId: integer; aQuery: TZQuery);
begin
  if not Assigned(aQuery) then
    aQuery := TZQuery.Create(Self);

  aQuery.SQL := qEscola.SQL;

  aQuery.Close;
  aQuery.ParamByName('id').AsInteger := aId;
  aQuery.ParamByName('pesq').AsString := '%%';
  aQuery.Open;

  if aQuery.Owner.Name = Self.Name then
    aQuery.Free;
end;

procedure TDmEscola.ListarEscolas(aPesq: string);
begin
  qEscola.Close;
  qEscola.ParamByName('id').AsInteger := 0;
  qEscola.ParamByName('pesq').asstring := '%' + aPesq + '%';
  qEscola.Open;
end;

function TDmEscola.SalvarEscola(aEscola: TEscola): Boolean;
begin
  if aEscola.id = 0 then
    qEscola.Insert
  else
    qEscola.Edit;

  qEscolanome.AsString := aEscola.nome;

  qEscola.Post;

  if aEscola.id = 0 then
  begin
    TNavigation.ParamInt := RetornaUltimoID();
    aEscola.id := TNavigation.ParamInt;
  end;
end;

procedure TDmEscola.Excluir(aId: Integer);
begin
  if not (qEscola.Locate('id', aId, [])) then
  begin
    Application.MessageBox('Registro não encontrado. Por favor, verifique!', 'Atenção', 64);
    Abort;
  end;

  if Application.MessageBox('Deseja realmente excluir?', 'Confirmação', 64 + MB_YESNO) = ID_NO then
    Abort;

  qEscola.Edit;
  qEscola.FieldByName('deleted').AsDateTime := Now;
  qEscola.Post;
end;

end.

