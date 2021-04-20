object DM_DB: TDM_DB
  OldCreateOrder = False
  Height = 355
  Width = 520
  object FD_SQLlocal: TFDConnection
    Params.Strings = (
      'Database=EME4'
      'User_Name=LAPTOPSLIMA\slima'
      'Server=LAPTOPSLIMA'
      'OSAuthent=Yes'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 48
  end
  object FvCliente: TFDQuery
    Connection = FD_SQLlocal
    SQL.Strings = (
      'DECLARE @ACAO            CHAR(1)      = :ACAO,'
      '        @ID_ENTIDADE     INT          = :ID,'
      '        @NOME            VARCHAR(90)  = :NOM,'
      '        @EMAIL           VARCHAR(100) = :EMA,'
      '        @TELEFONE        VARCHAR(16)  = :TEL ,'
      '        @CELULAR         VARCHAR(16)  = :CEL,'
      '        @TIPO_ENTIDADE   INT          = :TIP,'
      '        @STATUS          BIT          = :STA,'
      '        @ID_ENDERECO     INT          = :IDEND,'
      '        @CEP             VARCHAR(8)   = :CEP,'
      '        @LOGRADOURO      VARCHAR(50)  = :LOG,'
      '        @NUMERO          VARCHAR(10)  = :NUM,'
      '        @COMPLEMENTO     VARCHAR(20)  = :COM,'
      '        @BAIRRO          VARCHAR(30)  = :BAI,'
      '        @CIDADE          VARCHAR(40)  = :CID,'
      '        @ESTADO          VARCHAR(2)   = :EST'
      '        ,@FANTANSIA          [VARCHAR](90) = :FAN'
      '        ,@NUMERO_FISCAL      [VARCHAR](14) = :NUMF'
      '        ,@NATUREZA_JURIDICA  [VARCHAR](90) = :NAT '
      '        ,@ULTIMA_ATUALIZACAO [VARCHAR](20) = :ULT'
      '        ,@DATA_SITUACAO      DATETIME = :DATS'
      '        ,@CAPITAL_SOCIAL     NUMERIC(18, 2) = :CAP'
      '        ,@PORTE              [VARCHAR](40)  = :POR'
      '        ,@ABERTURA           DATETIME = :ABE'
      '       , @ID_RETORN       INT          = :IDR'
      ''
      ''
      'EXECUTE [DBO].[SP_IAEC_ENTIDADE]'
      '  @ACAO,'
      '  @ID_ENTIDADE,'
      '  @NOME,'
      '  @EMAIL,'
      '  @TELEFONE,'
      '  @CELULAR,'
      '  @TIPO_ENTIDADE,'
      '  @STATUS,'
      '  @ID_ENDERECO,'
      '  @CEP,'
      '  @LOGRADOURO,'
      '  @NUMERO,'
      '  @COMPLEMENTO,'
      '  @BAIRRO,'
      '  @CIDADE,'
      '  @ESTADO,'
      '  @FANTANSIA           '
      '  ,@NUMERO_FISCAL       '
      '  ,@NATUREZA_JURIDICA   '
      '  ,@ULTIMA_ATUALIZACAO  '
      '  ,@DATA_SITUACAO       '
      '  ,@CAPITAL_SOCIAL      '
      '  ,@PORTE               '
      '  ,@ABERTURA           '
      '  ,@ID_RETORN'
      '')
    Left = 208
    Top = 88
    ParamData = <
      item
        Name = 'ACAO'
        DataType = ftString
        ParamType = ptInput
        Value = 'C'
      end
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NOM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'EMA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TEL'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CEL'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TIP'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'STA'
        DataType = ftBoolean
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDEND'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CEP'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'LOG'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NUM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'BAI'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CID'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'EST'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'FAN'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NUMF'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NAT'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ULT'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATS'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CAP'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'POR'
        DataType = ftCurrency
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ABE'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDR'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object FvClienteID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ReadOnly = True
      Visible = False
    end
    object FvClientenumero_fiscal: TStringField
      DisplayLabel = 'CNPJ'
      DisplayWidth = 18
      FieldName = 'numero_fiscal'
      Origin = 'numero_fiscal'
      EditMask = '00\.000\.000\.0000\-00;0;_'
      Size = 14
    end
    object FvClientenome: TStringField
      DisplayWidth = 90
      FieldName = 'nome'
      Origin = 'nome'
      Size = 90
    end
    object FvClientefantansia: TStringField
      DisplayWidth = 90
      FieldName = 'fantansia'
      Origin = 'fantansia'
      Size = 90
    end
    object FvClientetelefone: TStringField
      DisplayWidth = 16
      FieldName = 'telefone'
      Origin = 'telefone'
      Size = 16
    end
    object FvClientecelular: TStringField
      DisplayWidth = 16
      FieldName = 'celular'
      Origin = 'celular'
      Size = 16
    end
    object FvClienteemail: TStringField
      DisplayWidth = 100
      FieldName = 'email'
      Origin = 'email'
      Size = 100
    end
    object FvClientetipo_entidade: TIntegerField
      FieldName = 'tipo_entidade'
      Origin = 'tipo_entidade'
      Visible = False
    end
    object FvClientestatus: TBooleanField
      DisplayWidth = 5
      FieldName = 'status'
      Origin = 'status'
    end
    object FvClientenatureza_juridica: TStringField
      DisplayWidth = 50
      FieldName = 'natureza_juridica'
      Origin = 'natureza_juridica'
      Size = 50
    end
    object FvClienteultima_atualizacao: TStringField
      DisplayWidth = 20
      FieldName = 'ultima_atualizacao'
      Origin = 'ultima_atualizacao'
    end
    object FvClientedata_situacao: TDateField
      DisplayWidth = 11
      FieldName = 'data_situacao'
      Origin = 'data_situacao'
    end
    object FvClientecapital_social: TFMTBCDField
      DisplayWidth = 19
      FieldName = 'capital_social'
      Origin = 'capital_social'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object FvClienteporte: TStringField
      DisplayWidth = 50
      FieldName = 'porte'
      Origin = 'porte'
      Size = 50
    end
    object FvClienteabertura: TSQLTimeStampField
      DisplayWidth = 10
      FieldName = 'abertura'
      Origin = 'abertura'
    end
    object FvClienteID_ENDERECO: TIntegerField
      FieldName = 'ID_ENDERECO'
      Origin = 'ID_ENDERECO'
      Visible = False
    end
    object FvClientecep: TStringField
      DisplayWidth = 9
      FieldName = 'cep'
      Origin = 'cep'
      EditMask = '00000\-9999;0;_'
      Size = 8
    end
    object FvClientelogradouro: TStringField
      DisplayWidth = 50
      FieldName = 'logradouro'
      Origin = 'logradouro'
      Size = 50
    end
    object FvClientenumero: TStringField
      DisplayWidth = 10
      FieldName = 'numero'
      Origin = 'numero'
      Size = 10
    end
    object FvClientecomplemento: TStringField
      DisplayWidth = 20
      FieldName = 'complemento'
      Origin = 'complemento'
    end
    object FvClientebairro: TStringField
      DisplayWidth = 30
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 30
    end
    object FvClientecidade: TStringField
      DisplayWidth = 40
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 40
    end
    object FvClienteestado: TStringField
      DisplayWidth = 5
      FieldName = 'estado'
      Origin = 'estado'
      Size = 2
    end
  end
  object FtCliente: TFDQuery
    Connection = FD_SQLlocal
    SQL.Strings = (
      'DECLARE @ACAO            CHAR(1)      = :ACAO,'
      '        @ID_ENTIDADE     INT          = :ID,'
      '        @NOME            VARCHAR(90)  = :NOM,'
      '        @EMAIL           VARCHAR(100) = :EMA,'
      '        @TELEFONE        VARCHAR(16)  = :TEL ,'
      '        @CELULAR         VARCHAR(16)  = :CEL,'
      '        @TIPO_ENTIDADE   INT          = :TIP,'
      '        @STATUS          BIT          = :STA,'
      '        @ID_ENDERECO     INT          = :IDEND,'
      '        @CEP             VARCHAR(8)   = :CEP,'
      '        @LOGRADOURO      VARCHAR(50)  = :LOG,'
      '        @NUMERO          VARCHAR(10)  = :NUM,'
      '        @COMPLEMENTO     VARCHAR(20)  = :COM,'
      '        @BAIRRO          VARCHAR(30)  = :BAI,'
      '        @CIDADE          VARCHAR(40)  = :CID,'
      '        @ESTADO          VARCHAR(2)   = :EST'
      '        ,@FANTANSIA          VARCHAR(90) = :FANTASIA'
      '        ,@NUMERO_FISCAL      VARCHAR(14) = :NUMF'
      '        ,@NATUREZA_JURIDICA  VARCHAR(50) = :NAT '
      '        ,@ULTIMA_ATUALIZACAO VARCHAR(20) = :ULT'
      '        ,@DATA_SITUACAO      DATETIME = :DATS'
      '        ,@CAPITAL_SOCIAL     NUMERIC(18, 2) = :CAP'
      '        ,@PORTE              VARCHAR(50)  = :POR'
      '        ,@ABERTURA           DATETIME = :ABE'
      '       , @ID_RETORN       INT          = :IDR'
      ''
      ''
      'EXECUTE [DBO].[SP_IAEC_ENTIDADE]'
      '  @ACAO,'
      '  @ID_ENTIDADE,'
      '  @NOME,'
      '  @EMAIL,'
      '  @TELEFONE,'
      '  @CELULAR,'
      '  @TIPO_ENTIDADE,'
      '  @STATUS,'
      '  @ID_ENDERECO,'
      '  @CEP,'
      '  @LOGRADOURO,'
      '  @NUMERO,'
      '  @COMPLEMENTO,'
      '  @BAIRRO,'
      '  @CIDADE,'
      '  @ESTADO,'
      '  @FANTANSIA           '
      '  ,@NUMERO_FISCAL       '
      '  ,@NATUREZA_JURIDICA   '
      '  ,@ULTIMA_ATUALIZACAO  '
      '  ,@DATA_SITUACAO       '
      '  ,@CAPITAL_SOCIAL      '
      '  ,@PORTE               '
      '  ,@ABERTURA           '
      '  ,@ID_RETORN'
      '')
    Left = 208
    Top = 32
    ParamData = <
      item
        Name = 'ACAO'
        DataType = ftString
        ParamType = ptInput
        Value = 'C'
      end
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NOM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'EMA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TEL'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CEL'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TIP'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'STA'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDEND'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CEP'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'LOG'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NUM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'BAI'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CID'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'EST'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'FANTASIA'
        ParamType = ptInput
      end
      item
        Name = 'NUMF'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NAT'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ULT'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATS'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CAP'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'POR'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ABE'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDR'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FtClienteID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ReadOnly = True
    end
    object FtClientenome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 90
    end
    object FtClienteemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 100
    end
    object FtClientetelefone: TStringField
      FieldName = 'telefone'
      Origin = 'telefone'
      Size = 16
    end
    object FtClientecelular: TStringField
      FieldName = 'celular'
      Origin = 'celular'
      Size = 16
    end
    object FtClientetipo_entidade: TIntegerField
      FieldName = 'tipo_entidade'
      Origin = 'tipo_entidade'
    end
    object FtClientestatus: TBooleanField
      FieldName = 'status'
      Origin = 'status'
    end
    object FtClientefantansia: TStringField
      FieldName = 'fantansia'
      Origin = 'fantansia'
      Size = 90
    end
    object FtClientenumero_fiscal: TStringField
      FieldName = 'numero_fiscal'
      Origin = 'numero_fiscal'
      Size = 14
    end
    object FtClientenatureza_juridica: TStringField
      FieldName = 'natureza_juridica'
      Origin = 'natureza_juridica'
      Size = 50
    end
    object FtClienteultima_atualizacao: TStringField
      FieldName = 'ultima_atualizacao'
      Origin = 'ultima_atualizacao'
    end
    object FtClientedata_situacao: TDateField
      FieldName = 'data_situacao'
      Origin = 'data_situacao'
    end
    object FtClientecapital_social: TFMTBCDField
      FieldName = 'capital_social'
      Origin = 'capital_social'
      Precision = 18
      Size = 2
    end
    object FtClienteporte: TStringField
      FieldName = 'porte'
      Origin = 'porte'
      Size = 50
    end
    object FtClienteabertura: TSQLTimeStampField
      FieldName = 'abertura'
      Origin = 'abertura'
    end
    object FtClienteid_endereco: TIntegerField
      FieldName = 'id_endereco'
      Origin = 'id_endereco'
    end
    object FtClientecep: TStringField
      FieldName = 'cep'
      Origin = 'cep'
      Size = 8
    end
    object FtClientelogradouro: TStringField
      FieldName = 'logradouro'
      Origin = 'logradouro'
      Size = 50
    end
    object FtClientenumero: TStringField
      FieldName = 'numero'
      Origin = 'numero'
      Size = 10
    end
    object FtClientecomplemento: TStringField
      FieldName = 'complemento'
      Origin = 'complemento'
    end
    object FtClientebairro: TStringField
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 30
    end
    object FtClientecidade: TStringField
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 40
    end
    object FtClienteestado: TStringField
      FieldName = 'estado'
      Origin = 'estado'
      Size = 2
    end
  end
  object FvEndereco: TFDQuery
    Connection = FD_SQLlocal
    SQL.Strings = (
      ''
      'DECLARE @ACAO            CHAR(1) = :AC,'
      '        @ID_ENDERECO     INT = :ID,'
      '        @CEP             VARCHAR(8) = :CEP,'
      '        @LOGRADOURO      VARCHAR(50) = :LOG,'
      '        @NUMERO          VARCHAR(10) = :NUM ,'
      '        @COMPLEMENTO     VARCHAR(20) = :COM,'
      '        @BAIRRO          VARCHAR(30) = :BAI,'
      '        @CIDADE          VARCHAR(40) = :CID,'
      '        @ESTADO          VARCHAR(2)  = :UF,'
      '        @ID_RETORN       INT = 0'
      ''
      'EXECUTE [DBO].[SP_IAEC_ENDERECO]'
      '  @ACAO,'
      '  @ID_ENDERECO,'
      '  @CEP,'
      '  @LOGRADOURO,'
      '  @NUMERO,'
      '  @COMPLEMENTO,'
      '  @BAIRRO,'
      '  @CIDADE,'
      '  @ESTADO,'
      '        @ID_RETORN')
    Left = 200
    Top = 176
    ParamData = <
      item
        Name = 'AC'
        DataType = ftString
        ParamType = ptInput
        Value = 'C'
      end
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CEP'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'LOG'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NUM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'BAI'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CID'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'UF'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object FDAutoIncField5: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ReadOnly = True
    end
    object StringField4: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      EditMask = '00000\-000;0;_'
      Size = 8
    end
    object StringField5: TStringField
      FieldName = 'LOGRADOURO'
      Origin = 'LOGRADOURO'
      Size = 50
    end
    object StringField6: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 10
    end
    object StringField7: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
    end
    object StringField8: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 30
    end
    object StringField9: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 40
    end
    object StringField10: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Size = 2
    end
  end
  object fvCEPS: TFDQuery
    Connection = FD_SQLlocal
    SQL.Strings = (
      'DECLARE @ACAO            CHAR(1) = :AC,'
      '        @ID_CEPS         INT = :ID,'
      '        @CEP             VARCHAR(8) = :CEP,'
      '        @LOGRADOURO      VARCHAR(50) = :LOG,'
      '        @COMPLEMENTO     VARCHAR(20) = :COM,'
      '        @BAIRRO          VARCHAR(30) = :BAI,'
      '        @CIDADE          VARCHAR(40) = :CID,'
      '        @ESTADO          VARCHAR(2)  = :EST'
      ''
      'EXECUTE SP_IAEC_CEPS'
      '  @ACAO,'
      '  @ID_CEPS,'
      '  @CEP,'
      '  @LOGRADOURO,'
      '  @COMPLEMENTO,'
      '  @BAIRRO,'
      '  @CIDADE,'
      '  @ESTADO ')
    Left = 216
    Top = 224
    ParamData = <
      item
        Name = 'AC'
        DataType = ftString
        ParamType = ptInput
        Value = 'C'
      end
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CEP'
        DataType = ftString
        ParamType = ptInput
        Value = '04141020'
      end
      item
        Name = 'LOG'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'BAI'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CID'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'EST'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object FDAutoIncField7: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ReadOnly = True
    end
    object StringField20: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 8
    end
    object StringField21: TStringField
      FieldName = 'LOGRADOURO'
      Origin = 'LOGRADOURO'
      Size = 50
    end
    object StringField23: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
    end
    object StringField24: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 30
    end
    object StringField25: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 40
    end
    object StringField26: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Size = 2
    end
  end
  object FD_JSON: TFDQuery
    Connection = FD_SQLlocal
    SQL.Strings = (
      'BEGIN'
      'DECLARE'
      '  @json nvarchar(max) = :DSC '
      ''
      '  SELECT *'
      '  INTO   #todos'
      
        '  FROM   openjson(@json) WITH ( nome nvarchar(200) '#39'$.nome'#39' , fa' +
        'ntansia nvarchar(200) '#39'$.fantasia'#39' , capital_social nvarchar(20)' +
        ' '#39'$.capital_social'#39' , cnpj nvarchar(22) '#39'$.cnpj'#39' , ultima_atuali' +
        'zacao nvarchar(20) '#39'$.ultima_atualizacao'#39' , natureza_juridica nv' +
        'archar(50) '#39'$.natureza_juridica'#39' , data_situacao nvarchar(20) '#39'$' +
        '.data_situacao'#39' , logradouro nvarchar(100) '#39'$.logradouro'#39' , nume' +
        'ro nvarchar(10) '#39'$.numero'#39' , complemento nvarchar(20) '#39'$.complem' +
        'ento'#39' , bairro nvarchar(30) '#39'$.bairro'#39' , cep nvarchar(10) '#39'$.cep' +
        #39' , uf nvarchar(02) '#39'$.uf'#39' , telefone nvarchar(30) '#39'$.telefone'#39' ' +
        ', email nvarchar(200) '#39'$.email'#39' , municipio nvarchar(100) '#39'$.mun' +
        'icipio'#39' , porte nvarchar(100) '#39'$.porte'#39' , abertura nvarchar(10) ' +
        #39'$.abertura'#39' , status nvarchar(10) '#39'$.status'#39' , atividades nvarc' +
        'har(max) '#39'$.atividade_principal'#39' AS json , atividades_secundaria' +
        's nvarchar(max) '#39'$.atividades_secundarias'#39' AS json , qsas nvarch' +
        'ar(max) '#39'$.qsa'#39' AS json ) outer apply openjson(qsas) WITH (qsa_q' +
        'ual nvarchar(30) '#39'$.qual'#39', qsa_nome nvarchar(30) '#39'$.nome'#39') outer' +
        ' '
      
        'apply openjson(atividades ) WITH (a_dsd nvarchar(30) '#39'$.text'#39', a' +
        '_code nvarchar(30) '#39'$.code'#39') outer apply openjson ( atividades_s' +
        'ecundarias) WITH (as_dsd nvarchar(30) '#39'$.text'#39', as_code nvarchar' +
        '(30) '#39'$.code'#39');'
      '  '
      '  SELECT *'
      '  FROM   #todos'
      '  DROP TABLE #todos'
      'END;')
    Left = 376
    Top = 56
    ParamData = <
      item
        Name = 'DSC'
        DataType = ftWideString
        ParamType = ptInput
        Value = 
          '{"situacao":"ATIVA","bairro":"INCONFIDENCIA","logradouro":"R MAR' +
          'IO CAMPOS","numero":"197","cep":"30.820-280","municipio":"BELO H' +
          'ORIZONTE","porte":"EMPRESA DE PEQUENO PORTE","abertura":"12/06/1' +
          '995","natureza_juridica":"206-2 - Sociedade Empres'#225'ria Limitada"' +
          ',"cnpj":"00.650.512/0001-01","ultima_atualizacao":"2021-04-09T20' +
          ':37:32.072Z","status":"OK","fantasia":"","complemento":"","efr":' +
          '"","motivo_situacao":"","situacao_especial":"","data_situacao_es' +
          'pecial":"","capital_social":"50000.00"}'
      end>
    object FD_JSONnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 200
    end
    object FD_JSONfantansia: TWideStringField
      FieldName = 'fantansia'
      Origin = 'fantansia'
      Size = 200
    end
    object FD_JSONcapital_social: TWideStringField
      FieldName = 'capital_social'
      Origin = 'capital_social'
    end
    object FD_JSONcnpj: TWideStringField
      FieldName = 'cnpj'
      Origin = 'cnpj'
      Size = 22
    end
    object FD_JSONultima_atualizacao: TWideStringField
      FieldName = 'ultima_atualizacao'
      Origin = 'ultima_atualizacao'
    end
    object FD_JSONnatureza_juridica: TWideStringField
      FieldName = 'natureza_juridica'
      Origin = 'natureza_juridica'
      Size = 50
    end
    object FD_JSONdata_situacao: TWideStringField
      FieldName = 'data_situacao'
      Origin = 'data_situacao'
    end
    object FD_JSONlogradouro: TWideStringField
      FieldName = 'logradouro'
      Origin = 'logradouro'
      Size = 100
    end
    object FD_JSONnumero: TWideStringField
      FieldName = 'numero'
      Origin = 'numero'
      Size = 10
    end
    object FD_JSONcomplemento: TWideStringField
      FieldName = 'complemento'
      Origin = 'complemento'
    end
    object FD_JSONbairro: TWideStringField
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 30
    end
    object FD_JSONcep: TWideStringField
      FieldName = 'cep'
      Origin = 'cep'
      Size = 10
    end
    object FD_JSONuf: TWideStringField
      FieldName = 'uf'
      Origin = 'uf'
      Size = 2
    end
    object FD_JSONtelefone: TWideStringField
      FieldName = 'telefone'
      Origin = 'telefone'
      Size = 30
    end
    object FD_JSONemail: TWideStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 200
    end
    object FD_JSONmunicipio: TWideStringField
      FieldName = 'municipio'
      Origin = 'municipio'
      Size = 100
    end
    object FD_JSONporte: TWideStringField
      FieldName = 'porte'
      Origin = 'porte'
      Size = 100
    end
    object FD_JSONabertura: TWideStringField
      FieldName = 'abertura'
      Origin = 'abertura'
      Size = 10
    end
    object FD_JSONstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 10
    end
    object FD_JSONatividades: TWideMemoField
      FieldName = 'atividades'
      Origin = 'atividades'
      BlobType = ftWideMemo
      Size = 2147483647
    end
    object FD_JSONatividades_secundarias: TWideMemoField
      FieldName = 'atividades_secundarias'
      Origin = 'atividades_secundarias'
      BlobType = ftWideMemo
      Size = 2147483647
    end
    object FD_JSONqsas: TWideMemoField
      FieldName = 'qsas'
      Origin = 'qsas'
      BlobType = ftWideMemo
      Size = 2147483647
    end
    object FD_JSONqsa_qual: TWideStringField
      FieldName = 'qsa_qual'
      Origin = 'qsa_qual'
      Size = 30
    end
    object FD_JSONqsa_nome: TWideStringField
      FieldName = 'qsa_nome'
      Origin = 'qsa_nome'
      Size = 30
    end
    object FD_JSONa_dsd: TWideStringField
      FieldName = 'a_dsd'
      Origin = 'a_dsd'
      Size = 30
    end
    object FD_JSONa_code: TWideStringField
      FieldName = 'a_code'
      Origin = 'a_code'
      Size = 30
    end
    object FD_JSONas_dsd: TWideStringField
      FieldName = 'as_dsd'
      Origin = 'as_dsd'
      Size = 30
    end
    object FD_JSONas_code: TWideStringField
      FieldName = 'as_code'
      Origin = 'as_code'
      Size = 30
    end
  end
end
