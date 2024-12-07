unit uResponsavelCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Navigation, Vcl.WinXCtrls,
  Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, ZAbstractRODataset, ZAbstractDataset, ZDataset, ZSqlUpdate, Vcl.DBCtrls, Datasnap.DBClient,
  Classe.Aluno;

type
  TFrmResponsavelCad = class(TForm)
    pnlBotoes: TPanel;
    pnlCancelar: TPanel;
    btnCancelar: TSpeedButton;
    pnlSalvar: TPanel;
    btnSalvar: TSpeedButton;
    edtEndereco: TEdit;
    lblNomePrograma1: TLabel;
    edtNome: TEdit;
    lblNome1: TLabel;
    lblCPF: TLabel;
    edtCPF: TEdit;
    edtCidade: TEdit;
    lblNomePrograma11: TLabel;
    edtBairro: TEdit;
    lblNomePrograma12: TLabel;
    edtUF: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edtCEP: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    pnlTitulo: TPanel;
    lblTitulo: TLabel;
    pnlCentral: TPanel;
    edtTel: TMaskEdit;
    edtTel2: TMaskEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    varInterior: Boolean;
    fecharTela: Boolean;
  public
    Fresponsavel: TResponsavel;
    FAluno: TAluno;
    class var ExecuteOnClose: procedure of Object;
  end;

var
  FrmResponsavelCad: TFrmResponsavelCad;

implementation

uses
  uDmCliente, System.Math, uClienteCad;

{$R *.dfm}

procedure TFrmResponsavelCad.btnCancelarClick(Sender: TObject);
begin
  fecharTela := True;
  Close;
end;

procedure TFrmResponsavelCad.btnSalvarClick(Sender: TObject);
begin
  with Fresponsavel do
  begin
    nome := edtNome.Text;
    CPF := edtCPF.Text;
    endereco := edtEndereco.Text;
    bairro := edtBairro.Text;
    cidade := edtCidade.Text;
    UF := edtUF.Text;
    CEP := edtCEP.Text;
    telefone := edtTel.Text;
    telefone2 := edtTel2.Text;

    if Fresponsavel.ex = 5 then
      ex := 4;
  end;

  Close;
end;

procedure TFrmResponsavelCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (varInterior) and Assigned(Fresponsavel) then
    Fresponsavel.Free;

  if fecharTela then
    ExecuteOnClose := nil
  else
  begin
    if Assigned(Fresponsavel) then
      if (Fresponsavel.id = 0) and (Fresponsavel.ex = 0) then
      begin
        Fresponsavel.ex := 98;
        FAluno.responsaveis.Add(Fresponsavel);
      end;

    if Assigned(ExecuteOnClose) then
    begin
      ExecuteOnClose();
      ExecuteOnClose := nil;
    end;
  end;

  Action := caFree;
  FrmResponsavelCad := nil;
end;

procedure TFrmResponsavelCad.FormShow(Sender: TObject);
begin
  if (Fresponsavel.id = 0) and (Fresponsavel.ex = 0) then
  begin
    lblTitulo.Caption := 'Novo Responsável';
    Exit;
  end;

  lblTitulo.Caption := 'Editar Responsável: '+ Fresponsavel.nome;

  fecharTela := False;
  varInterior := False;
  if NOT Assigned(Fresponsavel) then
  begin
    varInterior := True;
    Fresponsavel := TResponsavel.Create;
    Exit;
  end;

  edtNome.Text := Fresponsavel.nome;
  edtCPF.Text := Fresponsavel.CPF;
  edtEndereco.Text := Fresponsavel.endereco;
  edtBairro.Text := Fresponsavel.bairro;
  edtCidade.Text := Fresponsavel.cidade;
  edtUF.Text := Fresponsavel.UF;
  edtCEP.Text := Fresponsavel.CEP;
  edtTel.Text := Fresponsavel.telefone;
  edtTel2.Text := Fresponsavel.telefone2;
end;

end.
