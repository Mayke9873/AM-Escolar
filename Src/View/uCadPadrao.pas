unit uCadPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Navigation, uClienteCad;

type
  TfrmCadPadrao = class(TForm)
    pnlTela: TPanel;
    pnlNavBar: TPanel;
    pnl1: TPanel;
    btnExcluir: TSpeedButton;
    Panel1: TPanel;
    btnInserir: TSpeedButton;
    Panel2: TPanel;
    btnEditar: TSpeedButton;
    lblTitulo: TLabel;
    pnlCentral: TPanel;
    gdPrincipal: TDBGrid;
    ds: TDataSource;
    procedure gdPrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPadrao: TfrmCadPadrao;

implementation

{$R *.dfm}

procedure TfrmCadPadrao.gdPrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if Rect.Top = TStringGrid(gdPrincipal).CellRect(0, TStringGrid(gdPrincipal).Row).Top then
  begin
    gdPrincipal.Canvas.FillRect(Rect);
    gdPrincipal.Canvas.Brush.Color := TColor($FFFF00);
    gdPrincipal.Canvas.Font.Color := clBlack;
    gdPrincipal.Canvas.Font.Style := [fsBold];
  end;

  gdPrincipal.DefaultDrawDataCell(Rect, Column.Field, State);
end;

end.
