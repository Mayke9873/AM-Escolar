unit uEscolaCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Navigation, Vcl.WinXCtrls,
  Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, ZAbstractRODataset, ZAbstractDataset, ZDataset, ZSqlUpdate;

type
  TFrmEscolaCad = class(TForm)
    lblTitulo: TLabel;
    pnlTitulo: TPanel;
    pnlBotoes: TPanel;
    pnlCancelar: TPanel;
    btnCancelar: TSpeedButton;
    pnlSalvar: TPanel;
    btnSalvar: TSpeedButton;
    ds: TDataSource;
    qEscola: TZQuery;
    pnlCentral: TPanel;
    edtNome: TEdit;
    lblNome: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEscolaCad: TFrmEscolaCad;

implementation

uses
  uDmEscola, Classe.Escola, System.Math;

{$R *.dfm}

procedure TFrmEscolaCad.btnCancelarClick(Sender: TObject);
begin
  DmEscola.ListarEscolas();

  TNavigation.CloseAndCancel(Self);
end;

procedure TFrmEscolaCad.btnSalvarClick(Sender: TObject);
var
  Escola: TEscola;
begin
  Escola := TEscola.Create;
  try
    Escola.id := TNavigation.ParamInt;
    Escola.nome := edtNome.Text;

    Escola.Salvar();
  finally
    Escola.Free;
  end;

  TNavigation.Close(Self);
end;

procedure TFrmEscolaCad.FormShow(Sender: TObject);
var
  DM : TDmEscola;
begin
  if (TNavigation.ParamInt = 0) then
  begin
    lblTitulo.Caption := 'Nova Escola';
    Exit;
  end;

  DM := TDmEscola.Create(Self);

  DM.ListarEscolaID(TNavigation.ParamInt, qEscola);

  lblTitulo.Caption := 'Editar Escola: '+ qEscola.FieldByName('nome').AsString;

  edtNome.Text        := qEscola.FieldByName('nome').AsString;

  DM.Free;
end;

end.
