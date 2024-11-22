object FrmEscolaCad: TFrmEscolaCad
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FrmEscolaCad'
  ClientHeight = 208
  ClientWidth = 504
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnShow = FormShow
  TextHeight = 15
  object pnlTitulo: TPanel
    AlignWithMargins = True
    Left = 0
    Top = 12
    Width = 504
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
      Left = 18
      Top = 0
      Width = 146
      Height = 37
      Margins.Left = 18
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Caption = 'Nova Matr'#237'cula'
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
  object pnlBotoes: TPanel
    AlignWithMargins = True
    Left = 0
    Top = 151
    Width = 504
    Height = 49
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 8
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'pnlBotoes'
    ShowCaption = False
    TabOrder = 1
    object pnlCancelar: TPanel
      AlignWithMargins = True
      Left = 378
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
      Left = 258
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
  object pnlCentral: TPanel
    Left = 0
    Top = 49
    Width = 504
    Height = 102
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnlCentral'
    ShowCaption = False
    TabOrder = 2
    object lblNome: TLabel
      Left = 21
      Top = 30
      Width = 33
      Height = 15
      Caption = 'Nome'
    end
    object edtNome: TEdit
      Left = 21
      Top = 46
      Width = 468
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
  end
  object ds: TDataSource
    Left = 303
    Top = 23
  end
  object qEscola: TZQuery
    Connection = DmEscola.conBD
    Params = <>
    Left = 270
    Top = 23
  end
end
