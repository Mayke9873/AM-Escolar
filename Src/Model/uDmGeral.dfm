object DmGeral: TDmGeral
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 427
  Width = 569
  object conBD: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'RawStringEncoding=DB_CP')
    DisableSavepoints = False
    HostName = 'localhost'
    Port = 0
    Database = 'escolar'
    User = 'root'
    Password = '123456'
    Protocol = 'mysql'
    Left = 40
    Top = 32
  end
  object tbParametro: TZTable
    Connection = conBD
    TableName = 'parametros'
    Left = 96
    Top = 32
    object tbParametroid: TZInt64Field
      FieldName = 'id'
      Required = True
    end
    object tbParametroRazao: TZUnicodeStringField
      FieldName = 'Razao'
      Size = 255
    end
    object tbParametrofantasia: TZUnicodeStringField
      FieldName = 'fantasia'
      Size = 255
    end
    object tbParametroendereco: TZUnicodeStringField
      FieldName = 'endereco'
      Size = 255
    end
    object tbParametrobairro: TZUnicodeStringField
      FieldName = 'bairro'
      Size = 80
    end
    object tbParametrocidade: TZUnicodeStringField
      FieldName = 'cidade'
      Size = 80
    end
    object tbParametrouf: TZUnicodeStringField
      FieldName = 'uf'
      Size = 2
    end
    object tbParametrotelefone: TZUnicodeStringField
      FieldName = 'telefone'
      Size = 11
    end
    object tbParametroemail: TZUnicodeStringField
      FieldName = 'email'
      Size = 80
    end
  end
end
