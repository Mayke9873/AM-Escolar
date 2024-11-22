inherited FrmEscolas: TFrmEscolas
  Caption = 'FrmEscolas'
  Visible = False
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  inherited pnlCentral: TPanel
    inherited pnlTela: TPanel
      inherited pnlNavBar: TPanel
        inherited lblTitulo: TLabel
          Width = 68
          Height = 37
          Caption = 'Escolas'
          ExplicitWidth = 68
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
        Columns = <
          item
            Expanded = False
            FieldName = 'nome'
            Title.Caption = 'Escola'
            Width = 400
            Visible = True
          end>
      end
    end
  end
  inherited ds: TDataSource
    DataSet = DmEscola.qEscola
  end
end
