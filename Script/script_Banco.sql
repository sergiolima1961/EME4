USE [EME4]
GO
/****** Object:  Table [dbo].[CEPS]    Script Date: 20/04/2021 11:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CEPS](
	[ID_CEP] [int] IDENTITY(1,1) NOT NULL,
	[CEP] [varchar](8) NULL,
	[LOGRADOURO] [varchar](50) NULL,
	[COMPLEMENTO] [varchar](20) NULL,
	[BAIRRO] [varchar](30) NULL,
	[CIDADE] [varchar](40) NULL,
	[ESTADO] [varchar](2) NULL,
 CONSTRAINT [PK_CEP] PRIMARY KEY NONCLUSTERED 
(
	[ID_CEP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ENDERECO]    Script Date: 20/04/2021 11:59:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ENDERECO](
	[ID_ENDERECO] [int] IDENTITY(1,1) NOT NULL,
	[CEP] [varchar](8) NULL,
	[LOGRADOURO] [varchar](50) NULL,
	[NUMERO] [varchar](10) NULL,
	[COMPLEMENTO] [varchar](20) NULL,
	[BAIRRO] [varchar](30) NULL,
	[CIDADE] [varchar](40) NULL,
	[ESTADO] [varchar](2) NULL,
 CONSTRAINT [PK_ENDERECO] PRIMARY KEY NONCLUSTERED 
(
	[ID_ENDERECO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ENTIDADE]    Script Date: 20/04/2021 11:59:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ENTIDADE](
	[ID_ENTIDADE] [int] IDENTITY(1,1) NOT NULL,
	[NOME] [varchar](90) NULL,
	[EMAIL] [varchar](100) NULL,
	[TELEFONE] [varchar](16) NULL,
	[CELULAR] [varchar](16) NULL,
	[TIPO_ENTIDADE] [int] NULL,
	[STATUS] [bit] NULL,
	[ID_ENDERECO] [int] NULL,
	[FANTANSIA] [varchar](90) NULL,
	[NUMERO_FISCAL] [varchar](14) NULL,
	[NATUREZA_JURIDICA] [varchar](50) NULL,
	[DATA_SITUACAO] [date] NULL,
	[CAPITAL_SOCIAL] [numeric](18, 2) NULL,
	[PORTE] [varchar](50) NULL,
	[ABERTURA] [datetime] NULL,
	[ULTIMA_ATUALIZACAO] [varchar](20) NULL,
 CONSTRAINT [PK_ENTIDADE] PRIMARY KEY NONCLUSTERED 
(
	[ID_ENTIDADE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ENTIDADE] ADD  DEFAULT ((300)) FOR [TIPO_ENTIDADE]
GO
ALTER TABLE [dbo].[ENTIDADE] ADD  DEFAULT ((0)) FOR [STATUS]
GO
ALTER TABLE [dbo].[ENTIDADE]  WITH CHECK ADD  CONSTRAINT [FK_ENDERECO_ID_ENDERECO] FOREIGN KEY([ID_ENDERECO])
REFERENCES [dbo].[ENDERECO] ([ID_ENDERECO])
GO
ALTER TABLE [dbo].[ENTIDADE] CHECK CONSTRAINT [FK_ENDERECO_ID_ENDERECO]
GO
/****** Object:  StoredProcedure [dbo].[SP_IAEC_CEPS]    Script Date: 20/04/2021 11:59:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		sergio lima
-- Create date: 19/04/2021
-- Description:	cadastro de ceps
-- =============================================
CREATE PROCEDURE [dbo].[SP_IAEC_CEPS](@ACAO             CHAR(1)='C'
                                      ,@ID_CEPS         [INT]
                                      ,@CEP             [VARCHAR](8)
                                      ,@LOGRADOURO      [VARCHAR](50)
                                      ,@COMPLEMENTO     [VARCHAR](20)
                                      ,@BAIRRO          [VARCHAR](30)
                                      ,@CIDADE          [VARCHAR](40)
                                      ,@ESTADO          [VARCHAR](2) )
AS
  BEGIN
      SET NOCOUNT ON;

      IF @ACAO = 'I'
        BEGIN
            INSERT [DBO].[CEPS]
                   ([CEP]
                    ,[LOGRADOURO]
                    ,[COMPLEMENTO]
                    ,[BAIRRO]
                    ,[CIDADE]
                    ,[ESTADO] )
            VALUES (@CEP
                    ,@LOGRADOURO
                    ,@COMPLEMENTO
                    ,@BAIRRO
                    ,@CIDADE
                    ,@ESTADO )
        END
      ELSE IF @ACAO = 'A'
        BEGIN
            UPDATE [DBO].[CEPS]
            SET    [CEP] = @CEP
                   ,[LOGRADOURO] = @LOGRADOURO
                   ,[COMPLEMENTO] = @COMPLEMENTO
                   ,[BAIRRO] = @BAIRRO
                   ,[CIDADE] = @CIDADE
                   ,[ESTADO] = @ESTADO
            WHERE  ID_CEP = @ID_CEPS
        END
      ELSE IF @ACAO = 'E'
        BEGIN
            DELETE FROM [DBO].[CEPS]
            WHERE  ID_CEP = @ID_CEPS
        END
      ELSE IF @ACAO = 'C'
        BEGIN
            SELECT [ID_CEP] [ID]
                   ,[CEP]
                   ,[LOGRADOURO]
                   ,[COMPLEMENTO]
                   ,[BAIRRO]
                   ,[CIDADE]
                   ,[ESTADO]
            FROM   [DBO].[CEPS]
            WHERE  CEP = @CEP
        END
  END

GO
/****** Object:  StoredProcedure [dbo].[SP_IAEC_ENDERECO]    Script Date: 20/04/2021 11:59:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		sergio lima
-- Create date: 19/04/2021
-- Description:	cadastro de endereço
-- =============================================
CREATE PROCEDURE [dbo].[SP_IAEC_ENDERECO](@ACAO             CHAR(1)='C'
                                         ,@ID_ENDERECO     [INT]
                                         ,@CEP             [VARCHAR](8)
                                         ,@LOGRADOURO      [VARCHAR](50)
                                         ,@NUMERO          [VARCHAR](10)
                                         ,@COMPLEMENTO     [VARCHAR](20)
                                         ,@BAIRRO          [VARCHAR](30)
                                         ,@CIDADE          [VARCHAR](40)
                                         ,@ESTADO          [VARCHAR](2)
                                         ,@ID_RETORN       INT OUTPUT)
AS
  BEGIN
      SET NOCOUNT ON;
                  DECLARE @ID_CEPS INT  =0


      IF @ACAO = 'I'
        BEGIN
            /*
              CADASTRO DE CEPS		
            */
            IF NOT EXISTS(SELECT 1
                          FROM   CEPS C
                          WHERE  C.CEP = @CEP)
              BEGIN

                  EXECUTE [DBO].[SP_IAEC_CEPS]
                    @ACAO,
                    @ID_CEPS,
                    @CEP,
                    @LOGRADOURO,
                    @COMPLEMENTO,
                    @BAIRRO,
                    @CIDADE,
                    @ESTADO;
              END

            INSERT [DBO].[ENDERECO]
                   ([CEP]
                    ,[LOGRADOURO]
                    ,[NUMERO]
                    ,[COMPLEMENTO]
                    ,[BAIRRO]
                    ,[CIDADE]
                    ,[ESTADO]
                     )
            VALUES (@CEP
                    ,@LOGRADOURO
                    ,@NUMERO
                    ,@COMPLEMENTO
                    ,@BAIRRO
                    ,@CIDADE
                    ,@ESTADO
                     )

            SET @ID_RETORN = @@IDENTITY;
        END
      ELSE IF @ACAO = 'A'
        BEGIN
            /*
              CADASTRO DE CEPS		
            */
            IF NOT EXISTS(SELECT 1
                          FROM   CEPS C
                          WHERE  C.CEP = @CEP)
              BEGIN
                  EXECUTE [DBO].[SP_IAEC_CEPS]
                    'I',
                    @ID_CEPS,
                    @CEP,
                    @LOGRADOURO,
                    @COMPLEMENTO,
                    @BAIRRO,
                    @CIDADE,
                    @ESTADO;
              END

            UPDATE [DBO].[ENDERECO]
            SET    [CEP] = @CEP
                   ,[LOGRADOURO] = @LOGRADOURO
                   ,[NUMERO] = @NUMERO
                   ,[COMPLEMENTO] = @COMPLEMENTO
                   ,[BAIRRO] = @BAIRRO
                   ,[CIDADE] = @CIDADE
                   ,[ESTADO] = @ESTADO
            WHERE  ID_ENDERECO = @ID_ENDERECO
        END
      ELSE IF @ACAO = 'E'
        BEGIN
            DELETE FROM [DBO].[ENDERECO]
            WHERE  ID_ENDERECO = @ID_ENDERECO
        END
      ELSE IF @ACAO = 'C'
        BEGIN
            SELECT [ID_ENDERECO] [ID]
                   ,[CEP]
                   ,[LOGRADOURO]
                   ,[NUMERO]
                   ,[COMPLEMENTO]
                   ,[BAIRRO]
                   ,[CIDADE]
                   ,[ESTADO]
            FROM   [DBO].[ENDERECO]
            WHERE  ID_ENDERECO = @ID_ENDERECO
        END
  END 
GO
/****** Object:  StoredProcedure [dbo].[SP_IAEC_ENTIDADE]    Script Date: 20/04/2021 11:59:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		sergio lima
-- Create date: 19/04/2021
-- Description:	cadastro de entidade 
-- =============================================
CREATE PROCEDURE [dbo].[SP_IAEC_ENTIDADE](@ACAO                CHAR(1)='C'
                                         ,@ID_ENTIDADE        [INT]
                                         ,@NOME               [VARCHAR](90)
                                         ,@EMAIL              [VARCHAR](100)
                                         ,@TELEFONE           [VARCHAR](16)
                                         ,@CELULAR            [VARCHAR](16)
                                         ,@TIPO_ENTIDADE      [INT] = 100
                                         ,@STATUS             [BIT]
                                         ,@ID_ENDERECO        [INT]
                                         ,@CEP                [VARCHAR](8)
                                         ,@LOGRADOURO         [VARCHAR](50)
                                         ,@NUMERO             [VARCHAR](10)
                                         ,@COMPLEMENTO        [VARCHAR](20)
                                         ,@BAIRRO             [VARCHAR](30)
                                         ,@CIDADE             [VARCHAR](40)
                                         ,@ESTADO             [VARCHAR](2)
                                         ,@FANTANSIA          [VARCHAR](90)
                                         ,@NUMERO_FISCAL      [VARCHAR](14)
                                         ,@NATUREZA_JURIDICA  [VARCHAR](50)
                                         ,@ULTIMA_ATUALIZACAO [VARCHAR](20)
                                         ,@DATA_SITUACAO      DATETIME
                                         ,@CAPITAL_SOCIAL     NUMERIC(18, 2)
                                         ,@PORTE              [VARCHAR](50)
                                         ,@ABERTURA           DATETIME
                                         ,@ID_RETORN          INT
										 )
AS
  BEGIN
      DECLARE  @PESQUISA VARCHAR(150)='',
              @MOVIMENTO VARCHAR(200) =''

      SET nocount ON;

      IF @ACAO = 'I'
        BEGIN
            /*
               Endereço contrato
            */
            EXECUTE [DBO].[SP_IAEC_ENDERECO]
              @ACAO,
              @ID_ENDERECO,
              @CEP,
              @LOGRADOURO,
              @NUMERO,
              @COMPLEMENTO,
              @BAIRRO,
              @CIDADE,
              @ESTADO,
              @ID_RETORN output

            SET @ID_ENDERECO = @@IDENTITY;

            /*
             Cadastro de Cliente
            */
            INSERT INTO [dbo].[entidade]
                        ([nome]
                         ,[email]
                         ,[telefone]
                         ,[celular]
                         ,[tipo_entidade]
                         ,[status]
                         ,[id_endereco]
                         ,[fantansia]
                         ,[numero_fiscal]
                         ,[natureza_juridica]
                         ,[data_situacao]
                         ,[capital_social]
                         ,[porte]
                         ,[abertura]
                         ,[ultima_atualizacao])
                 VALUES(@NOME
                        ,@EMAIL
                        ,@TELEFONE
                        ,@CELULAR
                        ,@TIPO_ENTIDADE
						,@STATUS
                        ,@ID_ENDERECO
                        ,@FANTANSIA
                        ,@NUMERO_FISCAL
                        ,@NATUREZA_JURIDICA
                        ,@DATA_SITUACAO
                        ,@CAPITAL_SOCIAL
                        ,@PORTE
                        ,@ABERTURA
                        ,@ULTIMA_ATUALIZACAO );

            SET @ID_RETORN = @@IDENTITY;
        END
      ELSE IF @ACAO = 'A'
        BEGIN
            /*
               Endereço contrato
            */
            EXECUTE [DBO].[SP_IAEC_ENDERECO]
              @ACAO,
              @ID_ENDERECO,
              @CEP,
              @LOGRADOURO,
              @NUMERO,
              @COMPLEMENTO,
              @BAIRRO,
              @CIDADE,
              @ESTADO,
              @ID_RETORN output

            /*
              contrato 
            */
            UPDATE [DBO].[entidade]
               SET [nome] = @NOME
                   ,[email] = @EMAIL
                   ,[telefone] = @TELEFONE
                   ,[celular] = @CELULAR
                   ,[tipo_entidade] = @TIPO_ENTIDADE
                   ,[status] = @STATUS
                   ,[id_endereco] = @ID_ENDERECO
                   ,fantansia = @FANTANSIA
                   ,numero_fiscal = @NUMERO_FISCAL
                   ,natureza_juridica = @NATUREZA_JURIDICA
                   ,ultima_atualizacao = @ULTIMA_ATUALIZACAO
                   ,data_situacao = @DATA_SITUACAO
                   ,capital_social = @CAPITAL_SOCIAL
                   ,porte = @PORTE
                   ,abertura = @ABERTURA
             WHERE id_entidade = @ID_ENTIDADE;
        END
      ELSE IF @ACAO = 'E'
        BEGIN
            DELETE [DBO].[entidade]
             WHERE id_entidade = @ID_ENTIDADE;
        END
      ELSE IF @ACAO = 'C'
        BEGIN
            SELECT ENT.id_entidade [ID]
                   ,ENT.nome
                   ,ENT.email
                   ,ENT.telefone
                   ,ENT.celular
                   ,ENT.tipo_entidade
                   ,ENT.[status]
                   ,ENT.fantansia
                   ,ENT.numero_fiscal
                   ,ENT.natureza_juridica
                   ,ENT.ultima_atualizacao
                   ,ENT.data_situacao
                   ,ENT.capital_social
                   ,ENT.porte
                   ,ENT.abertura
                   ,ENT.id_endereco
                   ,ED.cep
                   ,ED.logradouro
                   ,ED.numero
                   ,ED.complemento
                   ,ED.bairro
                   ,ED.cidade
                   ,ED.estado
              FROM [DBO].[entidade] ENT (nolock)
                   LEFT JOIN endereco ED
                          ON ED.[id_endereco] = ENT.id_endereco
        END
      ELSE IF @ACAO = 'P'
        BEGIN
            SET @PESQUISA = @NUMERO_FISCAL
            SET @PESQUISA += '%'

            SELECT [id_entidade] [ID]
                   ,nome         
              FROM [DBO].[entidade] (nolock)
             WHERE numero_fiscal LIKE @PESQUISA
        END
  END 
GO
