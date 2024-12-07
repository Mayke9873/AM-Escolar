unit uClienteCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Navigation, Vcl.WinXCtrls,
  Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, ZAbstractRODataset, ZAbstractDataset, ZDataset, ZSqlUpdate, Vcl.DBCtrls, Datasnap.DBClient, Classe.Aluno,
  System.Generics.Collections;

type
  TFrmClienteCad = class(TForm)
    lblTitulo: TLabel;
    lblNome: TLabel;
    edtNome: TEdit;
    edtNomePrograma: TEdit;
    lblNomePrograma: TLabel;
    pnlTitulo: TPanel;
    pnlBotoes: TPanel;
    pnlCancelar: TPanel;
    btnCancelar: TSpeedButton;
    pnlSalvar: TPanel;
    btnSalvar: TSpeedButton;
    pgc1: TPageControl;
    tsAluno: TTabSheet;
    tsResponsavel: TTabSheet;
    tsInfo: TTabSheet;
    lblNomePrograma2: TLabel;
    lblNome2: TLabel;
    mSaude: TMemo;
    mEspecial: TMemo;
    chkAtivo: TCheckBox;
    Label1: TLabel;
    edtCargahr: TEdit;
    edtPai: TEdit;
    Label2: TLabel;
    edtMae: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    cbPeriodo: TComboBox;
    pnl1: TPanel;
    gdResponsavel: TDBGrid;
    ds: TDataSource;
    pnlbot: TPanel;
    Panel1: TPanel;
    btnExcluirResponsavel: TSpeedButton;
    Panel2: TPanel;
    btnInserirResponsavel: TSpeedButton;
    Panel3: TPanel;
    btnEditarResponsavel: TSpeedButton;
    qAluno: TZQuery;
    dsReponsavel: TDataSource;
    medtDtNasc: TMaskEdit;
    lblDtNasc: TLabel;
    lblEscola: TLabel;
    dblkcbbEscola: TDBLookupComboBox;
    qEscola: TZQuery;
    dsEscola: TDataSource;
    qEscolaid: TZInt64Field;
    qEscolanome: TZUnicodeStringField;
    dsResponsavel: TClientDataSet;
    dsResponsavelid: TIntegerField;
    dsResponsavelnome: TStringField;
    dsResponsavelrg: TStringField;
    dsResponsavelendereco: TStringField;
    dsResponsavelbairro: TStringField;
    dsResponsavelcidade: TStringField;
    dsResponsaveluf: TStringField;
    dsResponsaveltelefone: TStringField;
    dsResponsavelex: TIntegerField;
    dsResponsavelindex: TIntegerField;
    dsResponsavelcep: TStringField;
    dsResponsaveltelefone2: TStringField;
    edtCPF: TEdit;
    lblCPF: TLabel;
    chkUsoImagem: TCheckBox;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gdResponsavelDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnInserirResponsavelClick(Sender: TObject);
    procedure btnEditarResponsavelClick(Sender: TObject);
    procedure btnExcluirResponsavelClick(Sender: TObject);
    
  private
    Aluno: TAluno;
    procedure AbreCadResponsavel(index_Responsavel: Integer = 0);
    procedure InserirResponsaveisCDS;
    procedure ValidaCampos;

  public
    { Public declarations }
  end;

var
  FrmClienteCad: TFrmClienteCad;

implementation

uses
  uDmCliente, System.Math, uResponsavelCad;

{$R *.dfm}

procedure TFrmClienteCad.btnCancelarClick(Sender: TObject);
begin
  TNavigation.CloseAndCancel(Self);
end;

procedure TFrmClienteCad.btnEditarResponsavelClick(Sender: TObject);
begin
  AbreCadResponsavel(dsResponsavelindex.AsInteger);
end;

procedure TFrmClienteCad.btnExcluirResponsavelClick(Sender: TObject);
begin
  if dsResponsavel.RecordCount = 0 then    //TODO: Alterar codigo pra excluir responsavel.
    Exit;

  try
    dsResponsavel.Tag := dsResponsavel.RecNo;

    Aluno.responsaveis[dsResponsavel.Tag -1].ex := 99;

    InserirResponsaveisCDS();

    dsResponsavel.RecNo := IfThen(dsResponsavel.Tag > dsResponsavel.RecordCount,
                                dsResponsavel.RecordCount, dsResponsavel.Tag);
  finally
    dsResponsavel.Tag := 0;
  end;
end;

procedure TFrmClienteCad.gdResponsavelDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  if Rect.Top = TStringGrid(gdResponsavel).CellRect(0, TStringGrid(gdResponsavel).Row).Top then
  begin
    gdResponsavel.Canvas.FillRect(Rect);
    gdResponsavel.Canvas.Brush.Color := TColor($FFFF00);
    gdResponsavel.Canvas.Font.Color := clBlack;
    gdResponsavel.Canvas.Font.Style := [fsBold];
  end;

  gdResponsavel.DefaultDrawDataCell(Rect, Column.Field, State);
end;

procedure TFrmClienteCad.AbreCadResponsavel(index_Responsavel: Integer = 0);
var
  LResponsavel: TResponsavel;
begin
  FrmResponsavelCad := TFrmResponsavelCad.Create(Self);

  FrmResponsavelCad.FAluno := Aluno;
  
  if index_Responsavel = 0 then
    LResponsavel := TResponsavel.Create
  else
    LResponsavel := Aluno.responsaveis[index_Responsavel -1];

  FrmResponsavelCad.Fresponsavel := LResponsavel;

  FrmResponsavelCad.ExecuteOnClose := InserirResponsaveisCDS;
  FrmResponsavelCad.ShowModal;
    
  dsResponsavel.Locate('index', IfThen(LResponsavel.id <> 0,
                                  index_Responsavel, Aluno.responsaveis.Count), []);
end;

procedure TFrmClienteCad.btnInserirResponsavelClick(Sender: TObject);
begin
  AbreCadResponsavel();
end;

procedure TFrmClienteCad.btnSalvarClick(Sender: TObject);
var
  LAluno: TAluno;
begin
  ValidaCampos();

  LAluno := TAluno.Create;
  try
    LAluno := Aluno;
    with LAluno do
    begin
      id := TNavigation.ParamInt;
      nome := edtNome.Text;
      dtNasc := medtDtNasc.Text;
      ativo := chkAtivo.Checked;
      nomePrograma := edtNomePrograma.Text;
      cargaHoraria := StrToFloatDef(edtCargahr.Text, 0);
      periodo := cbPeriodo.Text;
      nomePai := edtPai.Text;
      nomeMae := edtMae.Text;
      infoSaude := mSaude.Lines.Text;
      infoEspecial := mEspecial.Lines.Text;
      CPF := edtCPF.Text;
      permiteUsoImagem := chkUsoImagem.Checked;

      if (dblkcbbEscola.KeyValue <> null) and (dblkcbbEscola.KeyValue <> EmptyStr) then
        idEscola := dblkcbbEscola.KeyValue;

      Salvar();
    end;
  finally
    LAluno.Free;
  end;

  dsResponsavel.EmptyDataSet;
  TNavigation.Close(Self);
end;

procedure TFrmClienteCad.ValidaCampos;
var
  vData: TDateTime;
begin
  if medtDtNasc.Text <> '  /  /    ' then
    if not (TryStrToDate(medtDtNasc.Text, vData)) then
    begin
      Application.MessageBox('Data inválida. Por favor, verifique!', 'Atenção', 48);
      Abort;
    end;

end;

procedure TFrmClienteCad.InserirResponsaveisCDS;
var
  aResponsavel: TResponsavel;
begin
  dsResponsavel.EmptyDataSet;

  for aResponsavel in Aluno.Responsaveis do
  begin
    if (aResponsavel.ex = 99) then
      Continue;
  
    dsResponsavel.Append;            
    dsResponsavel.FieldByName('id').AsInteger := aResponsavel.id;
    dsResponsavel.FieldByName('nome').AsString := aResponsavel.nome;
    dsResponsavel.FieldByName('cpf').AsString := aResponsavel.CPF;
    dsResponsavel.FieldByName('endereco').Asstring := aResponsavel.endereco;
    dsResponsavel.FieldByName('bairro').AsString := aResponsavel.bairro;
    dsResponsavel.FieldByName('cidade').AsString := aResponsavel.cidade;
    dsResponsavel.FieldByName('uf').AsString := aResponsavel.uf;
    dsResponsavel.FieldByName('CEP').AsString := aResponsavel.CEP;
    dsResponsavel.FieldByName('telefone').AsString := aResponsavel.telefone;
    dsResponsavel.FieldByName('telefone2').AsString := aResponsavel.telefone2;
    dsResponsavel.FieldByName('ex').AsInteger := aResponsavel.ex;
    dsResponsavel.FieldByName('index').AsInteger := Aluno.responsaveis.IndexOf(aResponsavel) +1;
    dsResponsavel.Post; 
  end;
end;

procedure TFrmClienteCad.FormCreate(Sender: TObject);
begin
  pgc1.TabIndex := 0;

  qEscola.Open;
  dsResponsavel.CreateDataSet;
end;

procedure TFrmClienteCad.FormShow(Sender: TObject);
var
  DM : TDmCliente;
begin
  Aluno := TAluno.Create;

  if (TNavigation.ParamInt = 0) then
  begin
    lblTitulo.Caption := 'Nova Matrícula';
    Exit;
  end;

  DM    := TDmCliente.Create(Self);
  Aluno.id := TNavigation.ParamInt;

  DM.ListarAlunoID(TNavigation.ParamInt, qAluno);
  DM.ListarResponsavelID(0, Aluno);
  InserirResponsaveisCDS();

  lblTitulo.Caption := 'Editar Mátricula: '+ qAluno.FieldByName('nome').AsString;

  edtNome.Text        := qAluno.FieldByName('nome').AsString;
  medtDtNasc.Text     := qAluno.FieldByName('dtNasc').AsString;
  chkAtivo.Checked    := (qAluno.FieldByName('ativoStr').AsString = 'S');
  edtNomePrograma.Text:= qAluno.FieldByName('nomePrograma').AsString;
  edtCargahr.Text     := qAluno.FieldByName('cargaHoraria').AsString;
  cbPeriodo.ItemIndex := cbPeriodo.Items.IndexOf(qAluno.FieldByName('periodo').AsString);
  edtPai.Text         := qAluno.FieldByName('nomePai').AsString;
  edtMae.Text         := qAluno.FieldByName('nomeMae').AsString;
  edtCPF.Text         := qAluno.FieldByName('CPF').AsString;
  dblkcbbEscola.KeyValue := qAluno.FieldByName('idEscola').AsString;
  chkUsoImagem.Checked   := (qAluno.FieldByName('PermiteUsoImagem').AsInteger = 1);

  if NOT (qAluno.FieldByName('infoSaude').AsString.Trim = EmptyStr) then
    mSaude.Lines.Add(qAluno.FieldByName('infoSaude').AsString);

  if NOT (qAluno.FieldByName('infoEspecial').AsString.Trim = EmptyStr) then
    mEspecial.Lines.Add(qAluno.FieldByName('infoEspecial').AsString);

  FreeAndNil(DM);
end;

end.
