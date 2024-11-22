unit Classe.Escola;

interface

type
  TEscola = class
  private
    Fid: Integer;
    Fnome: String;
    procedure Setid(const Value: Integer);
    procedure Setnome(const Value: String);

  public
    property id: Integer read Fid write Setid;
    property nome: String read Fnome write Setnome;

    procedure Salvar;
  end;

implementation

uses
  uDmEscola;

{ TEscola }

procedure TEscola.Salvar;
var
  DM: TDmEscola;
begin
  DM := TDmEscola.Create(nil);
  try
    if NOT (DM.qEscola.Active) then
    begin
      DM.qEscola.ParamByName('id').AsInteger  := Fid;
      DM.qEscola.ParamByName('pesq').AsString := '%%';
      DM.qEscola.Open;
    end;

    DM.SalvarEscola(Self);
  finally
    DM.Free;
  end;
end;

procedure TEscola.Setid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TEscola.Setnome(const Value: String);
begin
  Fnome := Value;
end;

end.
