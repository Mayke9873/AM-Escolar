object frmCadPadrao: TfrmCadPadrao
  Left = 0
  Top = 0
  Align = alClient
  AutoSize = True
  BorderStyle = bsNone
  Caption = 'FrmCadPadrao'
  ClientHeight = 560
  ClientWidth = 684
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  TextHeight = 15
  object pnlCentral: TPanel
    Left = 0
    Top = 0
    Width = 684
    Height = 560
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnlCentral'
    ParentShowHint = False
    ShowCaption = False
    ShowHint = False
    TabOrder = 0
    object pnlTela: TPanel
      AlignWithMargins = True
      Left = 15
      Top = 8
      Width = 654
      Height = 552
      Margins.Left = 15
      Margins.Top = 8
      Margins.Right = 15
      Margins.Bottom = 0
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object pnlNavBar: TPanel
        Left = 0
        Top = 0
        Width = 654
        Height = 65
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        object lblTitulo: TLabel
          AlignWithMargins = True
          Left = 0
          Top = 14
          Width = 98
          Height = 37
          Margins.Left = 0
          Margins.Top = 14
          Margins.Right = 0
          Margins.Bottom = 14
          Align = alLeft
          Caption = 'Matr'#237'culas'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          ExplicitHeight = 30
        end
        object pnl1: TPanel
          AlignWithMargins = True
          Left = 544
          Top = 14
          Width = 110
          Height = 37
          Cursor = crHandPoint
          Margins.Left = 0
          Margins.Top = 14
          Margins.Right = 0
          Margins.Bottom = 14
          Align = alRight
          BevelOuter = bvNone
          Caption = 'pnl1'
          Color = 938951
          ParentBackground = False
          ShowCaption = False
          TabOrder = 0
          object btnExcluir: TSpeedButton
            Left = 0
            Top = 0
            Width = 110
            Height = 37
            Align = alClient
            Caption = 'Excluir'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitLeft = 56
            ExplicitTop = 24
            ExplicitWidth = 23
            ExplicitHeight = 22
          end
        end
        object Panel1: TPanel
          AlignWithMargins = True
          Left = 304
          Top = 14
          Width = 110
          Height = 37
          Cursor = crHandPoint
          Margins.Left = 0
          Margins.Top = 14
          Margins.Right = 10
          Margins.Bottom = 14
          Align = alRight
          BevelOuter = bvNone
          Caption = 'pnl1'
          Color = clSilver
          ParentBackground = False
          ShowCaption = False
          TabOrder = 1
          object btnInserir: TSpeedButton
            Left = 0
            Top = 0
            Width = 110
            Height = 37
            Align = alClient
            Caption = 'Inserir'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitLeft = 56
            ExplicitTop = 24
            ExplicitWidth = 23
            ExplicitHeight = 22
          end
        end
        object Panel2: TPanel
          AlignWithMargins = True
          Left = 424
          Top = 14
          Width = 110
          Height = 37
          Cursor = crHandPoint
          Margins.Left = 0
          Margins.Top = 14
          Margins.Right = 10
          Margins.Bottom = 14
          Align = alRight
          BevelOuter = bvNone
          Caption = 'pnl1'
          Color = clSilver
          ParentBackground = False
          ShowCaption = False
          TabOrder = 2
          object btnEditar: TSpeedButton
            Left = 0
            Top = 0
            Width = 110
            Height = 37
            Align = alClient
            Caption = 'Editar'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitLeft = 56
            ExplicitTop = 24
            ExplicitWidth = 23
            ExplicitHeight = 22
          end
        end
      end
      object gdPrincipal: TDBGrid
        Left = 0
        Top = 65
        Width = 654
        Height = 487
        Align = alClient
        BorderStyle = bsNone
        Color = clWhite
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = 'Segoe UI Semibold'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = gdPrincipalDrawColumnCell
      end
    end
  end
  object ds: TDataSource
    Left = 591
    Top = 96
  end
end
