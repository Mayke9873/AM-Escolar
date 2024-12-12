inherited DmEscola: TDmEscola
  object qEscola: TZQuery
    Connection = conBD
    UpdateObject = zEscola
    SQL.Strings = (
      'select id, nome, deleted'
      'from escola'
      'where deleted is null'
      '  and (((0 = :id) or (id = :id)))'
      '  and nome like :pesq;')
    Params = <
      item
        Name = 'id'
      end
      item
        Name = 'pesq'
      end>
    Left = 408
    Top = 32
    ParamData = <
      item
        Name = 'id'
      end
      item
        Name = 'pesq'
      end>
    object qEscolaid: TZInt64Field
      FieldName = 'id'
      Required = True
    end
    object qEscolanome: TZUnicodeStringField
      FieldName = 'nome'
      Size = 255
    end
    object qEscoladeleted: TZDateTimeField
      FieldName = 'deleted'
    end
  end
  object zEscola: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM escola'
      'WHERE'
      '  escola.id = :OLD_id')
    InsertSQL.Strings = (
      'INSERT INTO escola'
      '  (id, nome)'
      'VALUES'
      '  (:id, :nome)')
    ModifySQL.Strings = (
      'UPDATE escola SET'
      '  id = :id,'
      '  nome = :nome,'
      '  deleted = :deleted'
      'WHERE'
      '  escola.id = :OLD_id')
    UseSequenceFieldForRefreshSQL = False
    Left = 443
    Top = 32
    ParamData = <
      item
        Name = 'id'
      end
      item
        Name = 'nome'
      end
      item
        Name = 'deleted'
      end
      item
        Name = 'OLD_id'
      end>
  end
end
