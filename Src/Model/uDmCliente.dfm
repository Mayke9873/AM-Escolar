inherited DmCliente: TDmCliente
  inherited conBD: TZConnection
    Connected = True
  end
  object qAluno: TZQuery
    Connection = conBD
    UpdateObject = zAluno
    SQL.Strings = (
      'select'
      '  id, idEscola, nome, dtNasc,'
      '  NomePai, NomeMae, nomePrograma,'
      '  cargaHoraria, periodo, infoSaude, infoEspecial,'
      '  ativo,'
      '  case ativo when 1'
      '    then '#39'S'#39
      '    else '#39'N'#39' end ativoStr,'
      '  deleted'
      'from aluno'
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
    Left = 352
    Top = 40
    ParamData = <
      item
        Name = 'id'
      end
      item
        Name = 'pesq'
      end>
    object qAlunoid: TZInt64Field
      FieldName = 'id'
      Required = True
      Visible = False
    end
    object qAlunoidEscola: TZInt64Field
      FieldName = 'idEscola'
    end
    object qAlunonome: TZUnicodeStringField
      DisplayLabel = 'Aluno'
      DisplayWidth = 255
      FieldName = 'nome'
      Size = 255
    end
    object qAlunodtNasc: TZDateField
      Alignment = taCenter
      DisplayLabel = 'Dt. Nasc.'
      FieldName = 'dtNasc'
    end
    object qAlunoNomePai: TZUnicodeStringField
      FieldName = 'NomePai'
      Size = 255
    end
    object qAlunoNomeMae: TZUnicodeStringField
      FieldName = 'NomeMae'
      Size = 255
    end
    object qAlunonomePrograma: TZUnicodeStringField
      DisplayLabel = 'Programa'
      FieldName = 'nomePrograma'
      Size = 100
    end
    object qAlunocargaHoraria: TZIntegerField
      Alignment = taCenter
      DisplayLabel = 'Carga hr.'
      FieldName = 'cargaHoraria'
    end
    object qAlunoperiodo: TZUnicodeStringField
      FieldName = 'periodo'
      Size = 50
    end
    object qAlunoativo: TZShortIntField
      FieldName = 'ativo'
    end
    object qAlunoativoStr: TZUnicodeStringField
      Alignment = taCenter
      FieldName = 'ativoStr'
      ReadOnly = True
      Size = 1
    end
    object qAlunoinfoSaude: TZUnicodeCLobField
      FieldName = 'infoSaude'
      BlobType = ftWideMemo
    end
    object qAlunoinfoEspecial: TZUnicodeCLobField
      FieldName = 'infoEspecial'
      BlobType = ftWideMemo
    end
    object qAlunodeleted: TZDateTimeField
      FieldName = 'deleted'
    end
  end
  object zAluno: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM aluno'
      'WHERE'
      '  aluno.id = :OLD_id AND'
      
        '  ((aluno.idEscola IS NULL AND :OLD_idEscola IS NULL) OR (aluno.' +
        'idEscola = :OLD_idEscola)) AND'
      
        '  ((aluno.nome IS NULL AND :OLD_nome IS NULL) OR (aluno.nome = :' +
        'OLD_nome)) AND'
      
        '  ((aluno.dtNasc IS NULL AND :OLD_dtNasc IS NULL) OR (aluno.dtNa' +
        'sc = :OLD_dtNasc)) AND'
      
        '  ((aluno.NomePai IS NULL AND :OLD_NomePai IS NULL) OR (aluno.No' +
        'mePai = :OLD_NomePai)) AND'
      
        '  ((aluno.NomeMae IS NULL AND :OLD_NomeMae IS NULL) OR (aluno.No' +
        'meMae = :OLD_NomeMae)) AND'
      
        '  ((aluno.nomePrograma IS NULL AND :OLD_nomePrograma IS NULL) OR' +
        ' (aluno.nomePrograma = :OLD_nomePrograma)) AND'
      
        '  ((aluno.cargaHoraria IS NULL AND :OLD_cargaHoraria IS NULL) OR' +
        ' (aluno.cargaHoraria = :OLD_cargaHoraria)) AND'
      
        '  ((aluno.periodo IS NULL AND :OLD_periodo IS NULL) OR (aluno.pe' +
        'riodo = :OLD_periodo)) AND'
      
        '  ((aluno.infoSaude IS NULL AND :OLD_infoSaude IS NULL) OR (alun' +
        'o.infoSaude = :OLD_infoSaude)) AND'
      
        '  ((aluno.infoEspecial IS NULL AND :OLD_infoEspecial IS NULL) OR' +
        ' (aluno.infoEspecial = :OLD_infoEspecial)) AND'
      '  aluno.ativo = :OLD_ativo')
    InsertSQL.Strings = (
      'INSERT INTO aluno'
      
        '  (id, idEscola, nome, dtNasc, NomePai, NomeMae, nomePrograma, c' +
        'argaHoraria, '
      '   periodo, infoSaude, infoEspecial, ativo)'
      'VALUES'
      
        '  (:id, :idEscola, :nome, :dtNasc, :NomePai, :NomeMae, :nomeProg' +
        'rama, :cargaHoraria, '
      '   :periodo, :infoSaude, :infoEspecial, :ativo)')
    ModifySQL.Strings = (
      'UPDATE aluno SET'
      '  id = :id,'
      '  idEscola = :idEscola,'
      '  nome = :nome,'
      '  dtNasc = :dtNasc,'
      '  NomePai = :NomePai,'
      '  NomeMae = :NomeMae,'
      '  nomePrograma = :nomePrograma,'
      '  cargaHoraria = :cargaHoraria,'
      '  periodo = :periodo,'
      '  infoSaude = :infoSaude,'
      '  infoEspecial = :infoEspecial,'
      '  ativo = :ativo,'
      '  deleted = :deleted'
      'WHERE'
      '  aluno.id = :OLD_id')
    UseSequenceFieldForRefreshSQL = False
    Left = 400
    Top = 40
    ParamData = <
      item
        Name = 'id'
      end
      item
        Name = 'idEscola'
      end
      item
        Name = 'nome'
      end
      item
        Name = 'dtNasc'
      end
      item
        Name = 'NomePai'
      end
      item
        Name = 'NomeMae'
      end
      item
        Name = 'nomePrograma'
      end
      item
        Name = 'cargaHoraria'
      end
      item
        Name = 'periodo'
      end
      item
        Name = 'infoSaude'
      end
      item
        Name = 'infoEspecial'
      end
      item
        Name = 'ativo'
      end
      item
        Name = 'deleted'
      end
      item
        Name = 'OLD_id'
      end
      item
        Name = 'OLD_idEscola'
      end
      item
        Name = 'OLD_nome'
      end
      item
        Name = 'OLD_dtNasc'
      end
      item
        Name = 'OLD_NomePai'
      end
      item
        Name = 'OLD_NomeMae'
      end
      item
        Name = 'OLD_nomePrograma'
      end
      item
        Name = 'OLD_cargaHoraria'
      end
      item
        Name = 'OLD_periodo'
      end
      item
        Name = 'OLD_infoSaude'
      end
      item
        Name = 'OLD_infoEspecial'
      end
      item
        Name = 'OLD_ativo'
      end>
  end
  object qResponsavel: TZQuery
    Connection = conBD
    CachedUpdates = True
    UpdateObject = zPesponsavel
    SQL.Strings = (
      'select'
      '    id, idAluno, nome, rg, endereco, bairro,'
      '    cidade, uf, CEP, telefone, telefone2, '
      '    deleted'
      'from responsavel'
      'where deleted is null'
      '  and ((0 = :id) or (id = :id))'
      '  and ((0 = :idAluno) or (idAluno = :idAluno));')
    Params = <
      item
        Name = 'id'
      end
      item
        Name = 'idAluno'
      end>
    Left = 352
    Top = 96
    ParamData = <
      item
        Name = 'id'
      end
      item
        Name = 'idAluno'
      end>
    object qResponsavelid: TZInt64Field
      FieldName = 'id'
      Required = True
      Visible = False
    end
    object qResponsavelidAluno: TZInt64Field
      FieldName = 'idAluno'
      Visible = False
    end
    object qResponsavelnome: TZUnicodeStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 255
    end
    object qResponsavelrg: TZUnicodeStringField
      DisplayLabel = 'RG'
      FieldName = 'rg'
      Size = 50
    end
    object qResponsavelendereco: TZUnicodeStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'endereco'
      Size = 255
    end
    object qResponsavelbairro: TZUnicodeStringField
      DisplayLabel = 'Bairro'
      FieldName = 'bairro'
      Size = 80
    end
    object qResponsavelcidade: TZUnicodeStringField
      DisplayLabel = 'Cidade'
      FieldName = 'cidade'
      Size = 80
    end
    object qResponsaveluf: TZUnicodeStringField
      DisplayLabel = 'UF'
      FieldName = 'uf'
      Size = 2
    end
    object qResponsavelCEP: TZUnicodeStringField
      FieldName = 'CEP'
      Size = 7
    end
    object qResponsaveltelefone: TZUnicodeStringField
      DisplayLabel = 'Telefone'
      FieldName = 'telefone'
      Size = 11
    end
    object qResponsaveltelefone2: TZUnicodeStringField
      FieldName = 'telefone2'
      Size = 11
    end
    object qResponsaveldeleted: TZDateTimeField
      FieldName = 'deleted'
    end
  end
  object zPesponsavel: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM responsavel'
      'WHERE'
      '  responsavel.id = :OLD_id')
    InsertSQL.Strings = (
      'INSERT INTO responsavel'
      
        '  (id, idAluno, nome, rg, endereco, bairro, cidade, uf, cep, tel' +
        'efone, '
      '   telefone2)'
      'VALUES'
      
        '  (:id, :idAluno, :nome, :rg, :endereco, :bairro, :cidade, :uf, ' +
        ':cep, :telefone, '
      '   :telefone2)')
    ModifySQL.Strings = (
      'UPDATE responsavel SET'
      '  id = :id,'
      '  idAluno = :idAluno,'
      '  nome = :nome,'
      '  rg = :rg,'
      '  endereco = :endereco,'
      '  bairro = :bairro,'
      '  cidade = :cidade,'
      '  uf = :uf,'
      '  cep = :cep,'
      '  telefone = :telefone,'
      '  telefone2 = :telefone2,'
      '  deleted = :deleted'
      'WHERE'
      '  responsavel.id = :OLD_id')
    UseSequenceFieldForRefreshSQL = False
    Left = 400
    Top = 94
    ParamData = <
      item
        Name = 'id'
      end
      item
        Name = 'idAluno'
      end
      item
        Name = 'nome'
      end
      item
        Name = 'rg'
      end
      item
        Name = 'endereco'
      end
      item
        Name = 'bairro'
      end
      item
        Name = 'cidade'
      end
      item
        Name = 'uf'
      end
      item
        Name = 'cep'
      end
      item
        Name = 'telefone'
      end
      item
        Name = 'telefone2'
      end
      item
        Name = 'deleted'
      end
      item
        Name = 'OLD_id'
      end>
  end
end
