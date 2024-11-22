unit uEscola;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadPadrao, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TFrmEscolas = class(TfrmCadPadrao)
    procedure FormCreate(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    procedure AbreCadEscola(id_Escola: Integer = 0);
    procedure AbreEscolas;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEscolas: TFrmEscolas;

implementation

uses
  uDmEscola, Vcl.Navigation, uEscolaCad, System.Math;

{$R *.dfm}

procedure TFrmEscolas.AbreCadEscola(id_Escola: Integer = 0);
begin
  TNavigation.ExecuteOnClose := AbreEscolas;
  TNavigation.ParamInt := id_Escola;
  TNavigation.OpenModal(TFrmEscolaCad, FrmEscolaCad);
  DmEscola.qEscola.Locate('id', TNavigation.ParamInt, []);
end;

procedure TFrmEscolas.AbreEscolas;
begin
  DmEscola.ListarEscolas();
end;

procedure TFrmEscolas.btnEditarClick(Sender: TObject);
begin
  if DmEscola.qEscolaid.AsInteger = 0 then
    Exit;

  AbreCadEscola(DmEscola.qEscolaid.AsInteger);
end;

procedure TFrmEscolas.btnExcluirClick(Sender: TObject);
begin
  inherited;

  if DmEscola.qEscola.RecordCount = 0 then
    Exit;

  try
    DmEscola.qEscola.Tag := DmEscola.qEscola.RecNo;

    DmEscola.Excluir(DmEscola.qEscolaid.AsInteger);
    AbreEscolas();
    DmEscola.qEscola.RecNo := IfThen(DmEscola.qEscola.Tag > DmEscola.qEscola.RecordCount,
                                DmEscola.qEscola.RecordCount, DmEscola.qEscola.Tag);
  finally
    DmEscola.qEscola.Tag := 0;
  end;
end;

procedure TFrmEscolas.btnInserirClick(Sender: TObject);
begin
  AbreCadEscola();
end;

procedure TFrmEscolas.FormCreate(Sender: TObject);
begin
  inherited;
  DmEscola := TDmEscola.Create(Self);
end;

procedure TFrmEscolas.FormShow(Sender: TObject);
begin
  inherited;
  DmEscola.ListarEscolas();
end;

end.
