unit uDmGeral;

interface

uses
  System.Classes, ZAbstractConnection, ZConnection, Data.DB, ZAbstractRODataset, ZAbstractDataset,
  ZAbstractTable, ZDataset;

type
  TDmGeral = class(TDataModule)
    conBD: TZConnection;
    tbParametro: TZTable;
    tbParametroid: TZInt64Field;
    tbParametroRazao: TZUnicodeStringField;
    tbParametrofantasia: TZUnicodeStringField;
    tbParametroendereco: TZUnicodeStringField;
    tbParametrobairro: TZUnicodeStringField;
    tbParametrocidade: TZUnicodeStringField;
    tbParametrouf: TZUnicodeStringField;
    tbParametrotelefone: TZUnicodeStringField;
    tbParametroemail: TZUnicodeStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    function RetornaUltimoID: Integer;
  end;

var
  DmGeral: TDmGeral;

implementation

uses
  System.SysUtils, Vcl.Forms, Vcl.Dialogs;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDmGeral.DataModuleCreate(Sender: TObject);
var
  I: Integer;
begin
  conBD.LibraryLocation := ExtractFilePath(Application.ExeName) + 'libmariadb.dll';

  try
    conBD.Connect;

    for I := 0 to ComponentCount - 1 do
      if Components[I].ClassName = 'TZTable' then
        (Components[I] as TZTable).Open;
  except on E: Exception do
    begin
      Application.MessageBox(PChar('Nao foi possivel conectar ao banco de dados'#13+ E.Message), 'Atenção', 16);
      Halt;
    end;
  end
end;

procedure TDmGeral.DataModuleDestroy(Sender: TObject);
begin
  conBD.Disconnect;
end;

function TDmGeral.RetornaUltimoID: Integer;
var
  LQuery: TZQuery;
begin
  LQuery := TZQuery.Create(nil);
  try
    LQuery.Connection := conBD;

    LQuery.SQL.Add('select LAST_INSERT_ID() as id;');
    LQuery.Open;

    Result := LQuery.FieldByName('id').AsInteger;
  finally
    LQuery.Free;
  end;
end;

end.
