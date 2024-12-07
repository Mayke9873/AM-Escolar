object FrmClienteCad: TFrmClienteCad
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FrmClienteCad'
  ClientHeight = 521
  ClientWidth = 718
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object pnlTitulo: TPanel
    AlignWithMargins = True
    Left = 0
    Top = 12
    Width = 718
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
  object pgc1: TPageControl
    AlignWithMargins = True
    Left = 18
    Top = 53
    Width = 682
    Height = 403
    Margins.Left = 18
    Margins.Top = 4
    Margins.Right = 18
    Margins.Bottom = 8
    ActivePage = tsAluno
    Align = alClient
    DoubleBuffered = False
    ParentDoubleBuffered = False
    TabOrder = 1
    object tsAluno: TTabSheet
      Caption = 'Aluno'
      object lblNome: TLabel
        Left = 21
        Top = 30
        Width = 33
        Height = 15
        Caption = 'Nome'
      end
      object lblNomePrograma: TLabel
        Left = 21
        Top = 139
        Width = 52
        Height = 15
        Caption = 'Programa'
      end
      object Label1: TLabel
        Left = 464
        Top = 139
        Width = 71
        Height = 15
        Caption = 'Carga hor'#225'ria'
        Visible = False
      end
      object Label2: TLabel
        Left = 21
        Top = 248
        Width = 16
        Height = 15
        Caption = 'Pai'
      end
      object Label3: TLabel
        Left = 21
        Top = 312
        Width = 23
        Height = 15
        Caption = 'M'#227'e'
      end
      object Label4: TLabel
        Left = 329
        Top = 140
        Width = 41
        Height = 15
        Caption = 'Per'#237'odo'
      end
      object lblDtNasc: TLabel
        Left = 329
        Top = 80
        Width = 82
        Height = 15
        Caption = 'Dt. Nascimento'
      end
      object lblEscola: TLabel
        Left = 21
        Top = 192
        Width = 33
        Height = 15
        Caption = 'Escola'
      end
      object lblCPF: TLabel
        Left = 21
        Top = 81
        Width = 21
        Height = 15
        Caption = 'CPF'
      end
      object edtNome: TEdit
        Left = 21
        Top = 46
        Width = 418
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
      object edtNomePrograma: TEdit
        Left = 21
        Top = 155
        Width = 302
        Height = 29
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 100
        ParentFont = False
        TabOrder = 3
      end
      object chkAtivo: TCheckBox
        Left = 461
        Top = 39
        Width = 56
        Height = 17
        Caption = 'Ativo'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 2
      end
      object edtCargahr: TEdit
        Left = 464
        Top = 155
        Width = 158
        Height = 29
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 4
        Visible = False
      end
      object edtPai: TEdit
        Left = 21
        Top = 264
        Width = 601
        Height = 29
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 255
        ParentFont = False
        TabOrder = 7
      end
      object edtMae: TEdit
        Left = 21
        Top = 328
        Width = 601
        Height = 29
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 255
        ParentFont = False
        TabOrder = 8
      end
      object cbPeriodo: TComboBox
        Left = 329
        Top = 156
        Width = 110
        Height = 28
        Cursor = crHandPoint
        BevelInner = bvNone
        BevelOuter = bvNone
        Style = csDropDownList
        BiDiMode = bdRightToLeftNoAlign
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 5
        Items.Strings = (
          'Manh'#227
          'Tarde'
          'Noite'
          'Integral')
      end
      object medtDtNasc: TMaskEdit
        Left = 329
        Top = 97
        Width = 110
        Height = 29
        EditMask = '00/00/0000;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 1
        Text = '  /  /    '
      end
      object dblkcbbEscola: TDBLookupComboBox
        Left = 21
        Top = 208
        Width = 302
        Height = 29
        DropDownAlign = daCenter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        KeyField = 'id'
        ListField = 'nome'
        ListSource = dsEscola
        NullValueKey = 8
        ParentFont = False
        TabOrder = 6
      end
      object edtCPF: TEdit
        Left = 21
        Top = 97
        Width = 302
        Height = 29
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 50
        ParentFont = False
        TabOrder = 9
      end
      object chkUsoImagem: TCheckBox
        Left = 461
        Top = 55
        Width = 184
        Height = 21
        Caption = 'Permite uso de Imagem'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
      end
    end
    object tsResponsavel: TTabSheet
      Caption = 'Respons'#225'veis'
      ImageIndex = 1
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 674
        Height = 373
        Align = alClient
        BevelOuter = bvNone
        Caption = 'pnl1'
        TabOrder = 0
        object gdResponsavel: TDBGrid
          AlignWithMargins = True
          Left = 4
          Top = 52
          Width = 666
          Height = 321
          Margins.Left = 4
          Margins.Top = 0
          Margins.Right = 4
          Margins.Bottom = 0
          Align = alClient
          BorderStyle = bsNone
          Color = clWhite
          DataSource = dsReponsavel
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -15
          TitleFont.Name = 'Segoe UI Semibold'
          TitleFont.Style = [fsBold]
          OnDrawColumnCell = gdResponsavelDrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'nome'
              Title.Caption = 'Nome'
              Width = 220
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cpf'
              Title.Caption = 'CPF'
              Width = 140
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'endereco'
              Title.Caption = 'Endere'#231'o'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'bairro'
              Title.Caption = 'Bairro'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cidade'
              Title.Caption = 'Cidade'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'uf'
              Title.Caption = 'UF'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'telefone'
              Title.Caption = 'Telefone'
              Visible = True
            end>
        end
        object pnlbot: TPanel
          Left = 0
          Top = 0
          Width = 674
          Height = 52
          Align = alTop
          BevelOuter = bvNone
          Caption = 'pnlbot'
          Padding.Left = 4
          Padding.Right = 4
          TabOrder = 1
          object Panel1: TPanel
            AlignWithMargins = True
            Left = 556
            Top = 8
            Width = 110
            Height = 32
            Cursor = crHandPoint
            Margins.Left = 0
            Margins.Top = 8
            Margins.Right = 4
            Margins.Bottom = 12
            Align = alRight
            BevelOuter = bvNone
            Caption = 'pnl1'
            Color = 938951
            ParentBackground = False
            ShowCaption = False
            TabOrder = 0
            object btnExcluirResponsavel: TSpeedButton
              Left = 0
              Top = 0
              Width = 110
              Height = 32
              Align = alClient
              Caption = 'Excluir'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Segoe UI Semibold'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = btnExcluirResponsavelClick
              ExplicitLeft = 56
              ExplicitTop = 24
              ExplicitWidth = 23
              ExplicitHeight = 22
            end
          end
          object Panel2: TPanel
            AlignWithMargins = True
            Left = 316
            Top = 8
            Width = 110
            Height = 32
            Cursor = crHandPoint
            Margins.Left = 0
            Margins.Top = 8
            Margins.Right = 10
            Margins.Bottom = 12
            Align = alRight
            BevelOuter = bvNone
            Caption = 'pnl1'
            Color = clSilver
            ParentBackground = False
            ShowCaption = False
            TabOrder = 1
            object btnInserirResponsavel: TSpeedButton
              Left = 0
              Top = 0
              Width = 110
              Height = 32
              Align = alClient
              Caption = 'Inserir'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Segoe UI Semibold'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = btnInserirResponsavelClick
              ExplicitLeft = 56
              ExplicitTop = 24
              ExplicitWidth = 23
              ExplicitHeight = 22
            end
          end
          object Panel3: TPanel
            AlignWithMargins = True
            Left = 436
            Top = 8
            Width = 110
            Height = 32
            Cursor = crHandPoint
            Margins.Left = 0
            Margins.Top = 8
            Margins.Right = 10
            Margins.Bottom = 12
            Align = alRight
            BevelOuter = bvNone
            Caption = 'pnl1'
            Color = clSilver
            ParentBackground = False
            ShowCaption = False
            TabOrder = 2
            object btnEditarResponsavel: TSpeedButton
              Left = 0
              Top = 0
              Width = 110
              Height = 32
              Align = alClient
              Caption = 'Editar'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Segoe UI Semibold'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = btnEditarResponsavelClick
              ExplicitLeft = 56
              ExplicitTop = 24
              ExplicitWidth = 23
              ExplicitHeight = 22
            end
          end
        end
      end
    end
    object tsInfo: TTabSheet
      Caption = 'Informa'#231#245'es'
      ImageIndex = 2
      object lblNomePrograma2: TLabel
        Left = 367
        Top = 21
        Width = 138
        Height = 17
        Caption = 'Necessidades Especiais'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNome2: TLabel
        Left = 26
        Top = 21
        Width = 37
        Height = 17
        Caption = 'Saude'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object mSaude: TMemo
        Left = 26
        Top = 41
        Width = 280
        Height = 268
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object mEspecial: TMemo
        Left = 367
        Top = 41
        Width = 280
        Height = 268
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
  end
  object pnlBotoes: TPanel
    AlignWithMargins = True
    Left = 0
    Top = 464
    Width = 718
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
      Left = 592
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
      Left = 472
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
  object ds: TDataSource
    DataSet = qAluno
    Left = 303
    Top = 23
  end
  object qAluno: TZQuery
    Connection = DmCliente.conBD
    Params = <>
    Left = 270
    Top = 23
  end
  object dsReponsavel: TDataSource
    DataSet = dsResponsavel
    Left = 406
    Top = 23
  end
  object qEscola: TZQuery
    Connection = DmCliente.conBD
    SQL.Strings = (
      'select'
      '  id, nome'
      'from escola'
      'where deleted is null'
      '')
    Params = <>
    Left = 494
    Top = 23
    object qEscolaid: TZInt64Field
      FieldName = 'id'
      Required = True
    end
    object qEscolanome: TZUnicodeStringField
      FieldName = 'nome'
      Size = 255
    end
  end
  object dsEscola: TDataSource
    DataSet = qEscola
    Left = 527
    Top = 23
  end
  object dsResponsavel: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 369
    Top = 23
    object dsResponsavelid: TIntegerField
      FieldName = 'id'
    end
    object dsResponsavelnome: TStringField
      FieldName = 'nome'
    end
    object dsResponsavelrg: TStringField
      FieldName = 'cpf'
    end
    object dsResponsavelendereco: TStringField
      FieldName = 'endereco'
    end
    object dsResponsavelbairro: TStringField
      FieldName = 'bairro'
    end
    object dsResponsavelcidade: TStringField
      FieldName = 'cidade'
    end
    object dsResponsaveluf: TStringField
      FieldName = 'uf'
    end
    object dsResponsavelcep: TStringField
      FieldName = 'cep'
    end
    object dsResponsaveltelefone: TStringField
      FieldName = 'telefone'
    end
    object dsResponsaveltelefone2: TStringField
      FieldName = 'telefone2'
    end
    object dsResponsavelex: TIntegerField
      FieldName = 'ex'
    end
    object dsResponsavelindex: TIntegerField
      FieldName = 'index'
    end
  end
end
