unit uCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadPadrao, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ExtCtrls, System.Math;

type
  TFrmClientes = class(TfrmCadPadrao)
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure gdPrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure gdPrincipalDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirClick(Sender: TObject);
  private
    procedure AbreCadCliente(id_cliente: Integer = 0);
    procedure AbreClientes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmClientes: TFrmClientes;

implementation

uses
  Vcl.Navigation, uClienteCad, uDmCliente, uImpAluno;

{$R *.dfm}

procedure TFrmClientes.AbreCadCliente(id_cliente: Integer = 0);
begin
  TNavigation.ExecuteOnClose := AbreClientes;
  TNavigation.ParamInt := id_cliente;
  TNavigation.OpenModal(TFrmClienteCad, FrmClienteCad);
  DmCliente.qAluno.Locate('id', TNavigation.ParamInt, []);
end;

procedure TFrmClientes.AbreClientes;
begin
  DmCliente.ListarAlunos();
end;

procedure TFrmClientes.btnEditarClick(Sender: TObject);
begin
  if DmCliente.qAlunoid.AsInteger = 0 then
    Exit;

  AbreCadCliente(DmCliente.qAlunoid.AsInteger);
end;

procedure TFrmClientes.btnExcluirClick(Sender: TObject);
begin
  inherited;

  if DmCliente.qAluno.RecordCount = 0 then
    Exit;

  try
    DmCliente.qAluno.Tag := DmCliente.qAluno.RecNo;

    DmCliente.Excluir(DmCliente.qAlunoid.AsInteger);
    AbreClientes();
    DmCliente.qAluno.RecNo := IfThen(DmCliente.qAluno.Tag > DmCliente.qAluno.RecordCount,
                                DmCliente.qAluno.RecordCount, DmCliente.qAluno.Tag);
  finally
    DmCliente.qAluno.Tag := 0;
  end;
end;

procedure TFrmClientes.btnInserirClick(Sender: TObject);
begin
  AbreCadCliente();
end;

procedure TFrmClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  FreeAndNil(DmCliente);
end;

procedure TFrmClientes.FormCreate(Sender: TObject);
begin
  inherited;

  DmCliente := TDmCliente.Create(Self);
end;

procedure TFrmClientes.FormShow(Sender: TObject);
begin
  inherited;

  DmCliente.ListarAlunos();
end;

procedure TFrmClientes.gdPrincipalDblClick(Sender: TObject);
begin
  inherited;

  TNavigation.ParamInt := DmCliente.qAlunoid.AsInteger;
  Application.CreateForm(TFrmImpAluno, FrmImpAluno);
  DmCliente.qAluno.Locate('id', TNavigation.ParamInt, []);
end;

procedure TFrmClientes.gdPrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;

  if (DmCliente.qAlunoativoStr.AsString = 'N') then
    gdPrincipal.Canvas.Brush.Color := TColor($000E53C7);

  gdPrincipal.DefaultDrawDataCell(Rect, Column.Field, State);
end;

end.
