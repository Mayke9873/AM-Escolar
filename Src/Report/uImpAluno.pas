unit uImpAluno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data.DB, Vcl.Imaging.pngimage, Classe.Aluno, Datasnap.DBClient,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFrmImpAluno = class(TForm)
    rpAluno: TRLReport;
    rlbndHeader: TRLBand;
    rlblHeader: TRLLabel;
    rlbndFooter: TRLBand;
    rlblSoftware: TRLLabel;
    rlsystmnfFolhas: TRLSystemInfo;
    rlgrpAluno: TRLGroup;
    rlbndAluno: TRLBand;
    rlblNomeAluno1: TRLLabel;
    rlblDtNasc1: TRLLabel;
    rlblAluno11: TRLLabel;
    dsResponsavel: TClientDataSet;
    dsResponsavelid: TIntegerField;
    dsResponsavelnome: TStringField;
    dsResponsavelrg: TStringField;
    dsResponsavelendereco: TStringField;
    dsResponsavelbairro: TStringField;
    dsResponsavelcidade: TStringField;
    dsResponsaveluf: TStringField;
    dsResponsavelcep: TStringField;
    dsResponsaveltelefone: TStringField;
    dsResponsaveltelefone2: TStringField;
    dsResponsavelex: TIntegerField;
    dsResponsavelindex: TIntegerField;
    dsReponsavel: TDataSource;
    ds: TDataSource;
    RLDBText1: TRLDBText;
    qAluno: TZQuery;
    qAlunoid: TZInt64Field;
    qAlunoidEscola: TZInt64Field;
    qAlunonome: TZUnicodeStringField;
    qAlunodtNasc: TZDateField;
    qAlunoNomePai: TZUnicodeStringField;
    qAlunoNomeMae: TZUnicodeStringField;
    qAlunonomePrograma: TZUnicodeStringField;
    qAlunocargaHoraria: TZIntegerField;
    qAlunoperiodo: TZUnicodeStringField;
    qAlunoinfoSaude: TZBlobField;
    qAlunoinfoEspecial: TZBlobField;
    qAlunoativo: TZUnicodeStringField;
    RLDBText2: TRLDBText;
    rlbndPai: TRLBand;
    rlblTitleAluno: TRLLabel;
    RLLabel5: TRLLabel;
    RLDBText5: TRLDBText;
    rlbndMae: TRLBand;
    RLLabel2: TRLLabel;
    RLDBText6: TRLDBText;
    rlbndMatricula: TRLBand;
    RLLabel3: TRLLabel;
    RLDBText7: TRLDBText;
    RLPanel1: TRLPanel;
    RLLabel4: TRLLabel;
    RLDBText3: TRLDBText;
    rlbndCargaCurso: TRLBand;
    RLLabel6: TRLLabel;
    RLDBText4: TRLDBText;
    rlbndInstituicao: TRLBand;
    RLLabel7: TRLLabel;
    RLMemo1: TRLMemo;
    dsResponsavelEndCompleto: TStringField;
    rlsbdtlResponsavel: TRLSubDetail;
    rlbndTitleResponsavel: TRLBand;
    RLLabel8: TRLLabel;
    RLDBText8: TRLDBText;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLDBText9: TRLDBText;
    rlbndResponsavel: TRLBand;
    rlbndTelefones: TRLBand;
    RLDBText11: TRLDBText;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLDBText10: TRLDBText;
    RLPanel4: TRLPanel;
    rlmgLogo: TRLImage;
    RLBand1: TRLBand;
    RLMemo2: TRLMemo;
    RLMemo3: TRLMemo;
    rlbndInfoSaude: TRLBand;
    RLLabel1: TRLLabel;
    RLDBMemo1: TRLDBMemo;
    rlbndInfoEspecial: TRLBand;
    RLLabel13: TRLLabel;
    RLDBMemo2: TRLDBMemo;
    rlbndTitlInformacoes: TRLBand;
    RLLabel14: TRLLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rlbndResponavelBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rlbndTelefonesBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rlbndTitlInformacoesBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rlbndInfoSaudeBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rlbndInfoEspecialBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rlbndTitleResponsavelBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    colorBand: Boolean;
    Aluno: TAluno;
    procedure InserirResponsaveisCDS;
  public
    { Public declarations }
  end;

var
  FrmImpAluno: TFrmImpAluno;

implementation

uses
  uDmCliente, VCL.Navigation, Math;

{$R *.dfm}

procedure TFrmImpAluno.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsResponsavel.EmptyDataSet;
  Action := TCloseAction.caFree;
  FrmImpAluno := nil;
end;

procedure TFrmImpAluno.FormCreate(Sender: TObject);
var
  DM: TDmCliente;
begin
  colorBand := True;
  dsResponsavel.CreateDataSet;

  Aluno := TAluno.Create;
  DM    := TDmCliente.Create(Self);
  DM.ListarAlunoID(TNavigation.ParamInt, qAluno);

  Aluno.id := TNavigation.ParamInt;
  DM.ListarResponsavelID(0, Aluno);
  InserirResponsaveisCDS();

  rpAluno.PreviewModal;

  FreeandNil(DM);
  FreeAndNIL(Aluno);
  dsResponsavel.EmptyDataSet;
end;

procedure TFrmImpAluno.InserirResponsaveisCDS;
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
    dsResponsavel.FieldByName('rg').AsString := aResponsavel.RG;
    dsResponsavel.FieldByName('endereco').Asstring := aResponsavel.endereco;
    dsResponsavel.FieldByName('bairro').AsString := aResponsavel.bairro;
    dsResponsavel.FieldByName('cidade').AsString := aResponsavel.cidade;
    dsResponsavel.FieldByName('uf').AsString := aResponsavel.uf;
    dsResponsavel.FieldByName('CEP').AsString := aResponsavel.CEP;
    dsResponsavel.FieldByName('telefone').AsString := aResponsavel.telefone;
    dsResponsavel.FieldByName('telefone2').AsString := aResponsavel.telefone2;
    dsResponsavel.FieldByName('ex').AsInteger := aResponsavel.ex;
    dsResponsavel.FieldByName('index').AsInteger := Aluno.responsaveis.IndexOf(aResponsavel) +1;
    dsResponsavel.FieldByName('EndCompleto').AsString := aResponsavel.endereco +', '+ aResponsavel.bairro +' - '+
                                aResponsavel.cidade;
    dsResponsavel.Post;
  end;
end;

procedure TFrmImpAluno.rlbndInfoEspecialBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  PrintIt := not (qAlunoinfoEspecial.AsString = EmptyStr);
end;

procedure TFrmImpAluno.rlbndInfoSaudeBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  PrintIt := not (qAlunoinfoSaude.AsString = EmptyStr);
end;

procedure TFrmImpAluno.rlbndResponavelBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  //rlbndResponsavel.Color := ColorToRGB(IfThen(colorBand, clWhite, clSilver));

  colorBand:= not colorBand;
end;

procedure TFrmImpAluno.rlbndTelefonesBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  //rlbndTelefones.Color := rlbndResponsavel.Color;
end;

procedure TFrmImpAluno.rlbndTitleResponsavelBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  PrintIt := not (qAlunoinfoSaude.AsString = EmptyStr) and not (qAlunoinfoEspecial.AsString = EmptyStr);
end;

procedure TFrmImpAluno.rlbndTitlInformacoesBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  PrintIt := (dsResponsavel.RecordCount > 0);
end;

end.
