program AMEscolar;

uses
  Vcl.Forms,
  uCadPadrao in 'Src\View\uCadPadrao.pas' {frmCadPadrao},
  uDmGeral in 'Src\Model\uDmGeral.pas' {DmGeral: TDataModule},
  Vcl.Loading in 'Src\Utils\Vcl.Loading.pas',
  Vcl.Navigation in 'Src\Utils\Vcl.Navigation.pas',
  Vcl.Session in 'Src\Utils\Vcl.Session.pas',
  uLogin in 'Src\View\uLogin.pas' {FrmLogin},
  uClienteCad in 'Src\View\uClienteCad.pas' {FrmClienteCad},
  uImpAluno in 'Src\Report\uImpAluno.pas' {FrmImpAluno},
  uPrincipal in 'Src\View\uPrincipal.pas' {FrmPrincipal},
  uCliente in 'Src\View\uCliente.pas' {FrmClientes},
  uEscola in 'Src\View\uEscola.pas' {FrmEscolas},
  uDmEscola in 'Src\Model\uDmEscola.pas' {DmEscola: TDataModule},
  uDmCliente in 'Src\Model\uDmCliente.pas' {DmCliente: TDataModule},
  Classe.Aluno in 'Src\Class\Classe.Aluno.pas',
  Classe.Escola in 'Src\Class\Classe.Escola.pas',
  uEscolaCad in 'Src\View\uEscolaCad.pas' {FrmEscolaCad},
  uResponsavelCad in 'Src\View\uResponsavelCad.pas' {FrmResponsavelCad};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmResponsavelCad, FrmResponsavelCad);
  Application.Run;
end.
