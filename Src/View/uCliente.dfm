inherited FrmClientes: TFrmClientes
  Caption = 'FrmClientes'
  Visible = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  inherited pnlCentral: TPanel
    inherited pnlTela: TPanel
      inherited pnlNavBar: TPanel
        inherited lblTitulo: TLabel
          Height = 37
        end
        inherited pnl1: TPanel
          inherited btnExcluir: TSpeedButton
            OnClick = btnExcluirClick
          end
        end
        inherited Panel1: TPanel
          inherited btnInserir: TSpeedButton
            OnClick = btnInserirClick
          end
        end
        inherited Panel2: TPanel
          inherited btnEditar: TSpeedButton
            OnClick = btnEditarClick
          end
        end
      end
      inherited gdPrincipal: TDBGrid
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        OnDblClick = gdPrincipalDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'nome'
            Width = 220
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dtNasc'
            Title.Alignment = taCenter
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nomePrograma'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cargaHoraria'
            Title.Alignment = taCenter
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ativoStr'
            Title.Alignment = taCenter
            Title.Caption = 'Ativo'
            Width = 60
            Visible = True
          end>
      end
    end
  end
  inherited ds: TDataSource
    DataSet = DmCliente.qAluno
  end
end
