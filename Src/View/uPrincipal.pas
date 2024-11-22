unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.CategoryButtons, Vcl.WinXCtrls, Vcl.ExtCtrls, Vcl.Buttons, System.ImageList,
  Vcl.ImgList, Vcl.Imaging.pngimage;

type
  TFrmPrincipal = class(TForm)
    pnlPrincipal: TPanel;
    sSubMenu: TSplitView;
    CtgBtnSubMenu: TCategoryButtons;
    sMenu: TSplitView;
    Panel1: TPanel;
    CtgBtnMenu: TCategoryButtons;
    pnlTopSubMenu: TPanel;
    btnCloseSub: TSpeedButton;
    pnlCentral: TPanel;
    imgList: TImageList;
    imgMenu: TImage;
    btnCloseMenu: TSpeedButton;
    procedure CtgBtnMenuCategories0Items1Click(Sender: TObject);
    procedure btnCloseSubClick(Sender: TObject);
    procedure CtgBtnMenuCategories0Items2Click(Sender: TObject);
    procedure CtgBtnSubMenuCategories0Items0Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CtgBtnMenuCategories0Items0Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CtgBtnSubMenuCategories0Items1Click(Sender: TObject);
    procedure btnCloseMenuClick(Sender: TObject);
  private
    procedure CloseSubMenu;
    function VersaoExe: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  Vcl.Navigation, uCliente, uEscola, uDmGeral;

{$R *.dfm}

procedure TFrmPrincipal.btnCloseMenuClick(Sender: TObject);
begin
  sMenu.Opened := not sMenu.Opened;
end;

procedure TFrmPrincipal.btnCloseSubClick(Sender: TObject);
begin
  CloseSubMenu();
end;

procedure TFrmPrincipal.CloseSubMenu;
begin
  sSubMenu.Opened := False;
  CtgBtnSubMenu.SelectedItem := nil;
  sMenu.SetFocus;
end;

procedure TFrmPrincipal.CtgBtnMenuCategories0Items0Click(Sender: TObject);
var
  I: Integer;
begin
  CtgBtnMenu.SelectedItem := nil;
  CloseSubMenu();

  for I := 0 to pnlCentral.ControlCount -1 do
    if pnlCentral.Controls[I] is TForm then
    begin
      TNavigation.Close((pnlCentral.Controls[I] as TForm));
      Break;
    end;
end;

procedure TFrmPrincipal.CtgBtnMenuCategories0Items1Click(Sender: TObject);
begin
  sSubMenu.Opened := True;
end;

procedure TFrmPrincipal.CtgBtnMenuCategories0Items2Click(Sender: TObject);
begin
  Application.Terminate();
end;

procedure TFrmPrincipal.CtgBtnSubMenuCategories0Items0Click(Sender: TObject);
begin
  CloseSubMenu();
  TNavigation.Open(TfrmClientes, frmClientes, pnlCentral);
end;

procedure TFrmPrincipal.CtgBtnSubMenuCategories0Items1Click(Sender: TObject);
begin
  CloseSubMenu();
  TNavigation.Open(TFrmEscolas, frmEscolas, pnlCentral);
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  DmGeral := TDmGeral.Create(Application);
  Caption := 'AmEscolar :::: V.' + VersaoExe();
end;

function TFrmPrincipal.VersaoExe: string;
type
  PFFI = ^vs_FixedFileInfo;
var
  F: PFFI;
  Handle: Dword;
  Len: Longint;
  Data: Pchar;
  Buffer: Pointer;
  Tamanho: Dword;
  Parquivo: Pchar;
  Arquivo: string;
begin
  Arquivo := Application.ExeName;
  Parquivo := StrAlloc(Length(Arquivo) + 1);
  StrPcopy(Parquivo, Arquivo);
  Len := GetFileVersionInfoSize(Parquivo, Handle);
  Result := '';
  if Len > 0 then
  begin
    Data := StrAlloc(Len + 1);
    if GetFileVersionInfo(Parquivo, Handle, Len, Data) then
    begin
      VerQueryValue(Data, '\', Buffer, Tamanho);
      F := PFFI(Buffer);

      Result := Format('%d.%d.%d.%d', [HiWord(F^.dwFileVersionMs), LoWord(F^.dwFileVersionMs), HiWord(F^.dwFileVersionLs), Loword(F^.dwFileVersionLs)]);
    end;
    StrDispose(Data);
  end;

  StrDispose(Parquivo);
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  CloseSubMenu();
end;

end.
