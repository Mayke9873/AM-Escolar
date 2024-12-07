object FrmResponsavelCad: TFrmResponsavelCad
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FrmResponsavelCad'
  ClientHeight = 400
  ClientWidth = 660
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object pnlBotoes: TPanel
    AlignWithMargins = True
    Left = 0
    Top = 343
    Width = 660
    Height = 49
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 8
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'pnlBotoes'
    ShowCaption = False
    TabOrder = 2
    object pnlCancelar: TPanel
      AlignWithMargins = True
      Left = 534
      Top = 8
      Width = 110
      Height = 33
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 8
      Margins.Right = 16
      Margins.Bottom = 8
      Align = alRight
      BevelOuter = bvNone
      Color = 938951
      ParentBackground = False
      ShowCaption = False
      TabOrder = 0
      object btnCancelar: TSpeedButton
        Left = 0
        Top = 0
        Width = 110
        Height = 33
        Align = alClient
        Caption = 'Cancelar'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnCancelarClick
        ExplicitLeft = 56
        ExplicitTop = 24
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object pnlSalvar: TPanel
      AlignWithMargins = True
      Left = 414
      Top = 8
      Width = 110
      Height = 33
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 8
      Margins.Right = 10
      Margins.Bottom = 8
      Align = alRight
      BevelOuter = bvNone
      Color = clSilver
      ParentBackground = False
      ShowCaption = False
      TabOrder = 1
      object btnSalvar: TSpeedButton
        Left = 0
        Top = 0
        Width = 110
        Height = 33
        Align = alClient
        Caption = 'Salvar'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnSalvarClick
        ExplicitLeft = -32
        ExplicitHeight = 19
      end
    end
  end
  object pnlTitulo: TPanel
    AlignWithMargins = True
    Left = 0
    Top = 12
    Width = 660
    Height = 37
    Margins.Left = 0
    Margins.Top = 12
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    Caption = 'pnlTitulo'
    ShowCaption = False
    TabOrder = 0
    object lblTitulo: TLabel
      AlignWithMargins = True
      Left = 24
      Top = 0
      Width = 176
      Height = 37
      Margins.Left = 24
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Caption = 'Novo Respons'#225'vel'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 30
    end
  end
  object pnlCentral: TPanel
    Left = 0
    Top = 49
    Width = 660
    Height = 294
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnlCentral'
    ShowCaption = False
    TabOrder = 1
    object Label5: TLabel
      Left = 421
      Top = 139
      Width = 14
      Height = 15
      Caption = 'UF'
    end
    object Label6: TLabel
      Left = 506
      Top = 139
      Width = 21
      Height = 15
      Caption = 'CEP'
    end
    object Label7: TLabel
      Left = 24
      Top = 191
      Width = 53
      Height = 15
      Caption = 'Telefone 1'
    end
    object Label8: TLabel
      Left = 236
      Top = 191
      Width = 53
      Height = 15
      Caption = 'Telefone 2'
    end
    object lblCPF: TLabel
      Left = 454
      Top = 31
      Width = 21
      Height = 15
      Caption = 'CPF'
    end
    object lblNome1: TLabel
      Left = 24
      Top = 31
      Width = 33
      Height = 15
      Caption = 'Nome'
    end
    object lblNomePrograma1: TLabel
      Left = 24
      Top = 83
      Width = 49
      Height = 15
      Caption = 'Endere'#231'o'
    end
    object lblNomePrograma11: TLabel
      Left = 24
      Top = 139
      Width = 37
      Height = 15
      Caption = 'Cidade'
    end
    object lblNomePrograma12: TLabel
      Left = 399
      Top = 83
      Width = 31
      Height = 15
      Caption = 'Bairro'
    end
    object edtCPF: TEdit
      Left = 454
      Top = 47
      Width = 178
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 50
      ParentFont = False
      TabOrder = 1
    end
    object edtUF: TEdit
      Left = 421
      Top = 155
      Width = 82
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 5
    end
    object edtCEP: TEdit
      Left = 506
      Top = 155
      Width = 126
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 7
      ParentFont = False
      TabOrder = 6
    end
    object edtNome: TEdit
      Left = 24
      Top = 47
      Width = 424
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 255
      ParentFont = False
      TabOrder = 0
    end
    object edtEndereco: TEdit
      Left = 24
      Top = 99
      Width = 369
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 255
      ParentFont = False
      TabOrder = 2
    end
    object edtCidade: TEdit
      Left = 24
      Top = 155
      Width = 391
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 80
      ParentFont = False
      TabOrder = 4
    end
    object edtBairro: TEdit
      Left = 399
      Top = 99
      Width = 233
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 80
      ParentFont = False
      TabOrder = 3
    end
    object edtTel: TMaskEdit
      Left = 24
      Top = 207
      Width = 175
      Height = 29
      EditMask = '(99)99999-9999;0;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 14
      ParentFont = False
      TabOrder = 7
      Text = ''
    end
    object edtTel2: TMaskEdit
      Left = 236
      Top = 207
      Width = 175
      Height = 29
      EditMask = '(99)99999-9999;0;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 14
      ParentFont = False
      TabOrder = 8
      Text = ''
    end
  end
end
