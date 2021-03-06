DECLARE @json nvarchar(max) = N'[
{"atividade_principal":[{"text":"Suporte t�cnico, manuten��o e outros servi�os em tecnologia da informa��o","code":"62.09-1-00"}]
,"data_situacao":"03/11/2005","tipo":"MATRIZ","nome":"DATABIT TECNOLOGIA E SISTEMAS LTDA","uf":"MG","telefone":"(31) 3416-8225","email":"financeiro@databit.com.br"
,"atividades_secundarias":[{"text":"Desenvolvimento e licenciamento de programas de computador customiz�veis","code":"62.02-3-00"},
{"text":"Repara��o e manuten��o de computadores e de equipamentos perif�ricos","code":"95.11-8-00"},
{"text":"Repara��o e manuten��o de equipamentos de comunica��o","code":"95.12-6-00"}],
"qsa":[{"qual":"49-S�cio-Administrador","nome":"RODNER DOS SANTOS MARTINS"},{"qual":"22-S�cio","nome":"MARCOS VINICIOS FERREIRA CAMPOS"},{"qual":"22-S�cio","nome":"ANDREIA ETNA FORMAGGINI"},{"qual":"22-S�cio","nome":"SIDNEY SANCHES MOREIRA"}]
,"situacao":"ATIVA","bairro":"INCONFIDENCIA","logradouro":"R MARIO CAMPOS","numero":"197","cep":"30.820-280","municipio":"BELO HORIZONTE","porte":"EMPRESA DE PEQUENO PORTE","abertura":"12/06/1995","natureza_juridica":"206-2 - Sociedade Empres�ria Limitada","cnpj":"00.650.512/0001-01","ultima_atualizacao":"2021-04-09T20:37:32.072Z","status":"OK","fantasia":"","complemento":"","efr":"","motivo_situacao":"","situacao_especial":"","data_situacao_especial":"","capital_social":"50000.00","extra":{},"billing":{"free":true,"database":true}}
]'

 /*
    quebras
   */
select @json = N'[
{"atividade_principal":[{"text":"Repara��o e manuten��o de computadores e de equipamentos perif�ricos","code":"95.11-8-00"}]
,"data_situacao":"12/04/2021"
,"complemento":"CASA 01"
,"tipo":"MATRIZ"
,"nome":"SERGIO DOS SANTOS LIMA 02191749895"
,"uf":"SP"
,"telefone":"(11) 9756-8350"
,"email":"sergio_santos_lima@hotmail.com"
,"atividades_secundarias":[{"text":"Treinamento em inform�tica","code":"85.99-6-03"}]
,"qsa":[]
,"situacao":"ATIVA"
,"bairro":"VILA MENCK"
,"logradouro":"R MOACIR SALLES DAVILA"
,"numero":"107","cep":"06.288-020","municipio":"OSASCO","porte":"MICRO EMPRESA","abertura":"12/04/2021","natureza_juridica":"213-5 - Empres�rio (Individual)","fantasia":"SSL INFORMATICA","cnpj":"41.535.456/0001-33","ultima_atualizacao":"2021-04-14T04:29:26.109Z","status":"OK","efr":"","motivo_situacao":"","situacao_especial":"","data_situacao_especial":"","capital_social":"1000.00","extra":{},"billing":{"free":true,"database":true}}
]'
   /*
   
   */

SELECT 
*
into #todos
FROM openjson(@json) 
WITH ( 
	   nome NVARCHAR(200) '$.nome'
	  , fantansia NVARCHAR(200) '$.fantasia'
	  , capital_social NVARCHAR(20)  '$.capital_social'
	  , cnpj Nvarchar(22)  '$.cnpj' 
	  , ultima_atualizacao Nvarchar(20) '$.ultima_atualizacao'
	  ,  natureza_juridica nvarchar(20) '$.natureza_juridica'
	  , data_situacao nvarchar(20) '$.data_situacao' 
	  , bairro NVARCHAR(30) '$.bairro'
	  , CEP NVARCHAR(10) '$.cep'
	  , uf NVARCHAR(02) '$.uf'
	  , telefone NVARCHAR(30) '$.telefone'
	  , email NVARCHAR(200) '$.email'
	  , municipio NVARCHAR(100) '$.municipio'
	  , porte NVARCHAR(100) '$.porte'
	  , abertura NVARCHAR(10) '$.abertura' 
	  , status nvarchar(10)  '$.status'
	  , atividades nvarchar(max) '$.atividade_principal' AS    json
      , atividades_secundarias nvarchar(max) '$.atividades_secundarias' AS json
	  , qsas nvarchar(max) '$.qsa' AS json
	  ) 

OUTER apply openjson(qsas)
WITH (qsa_qual nvarchar(30) '$.qual', qsa_nome nvarchar(30) '$.nome') 

OUTER apply openjson(atividades
) WITH (a_dsd nvarchar(30) '$.text', a_code nvarchar(30) '$.code') 

OUTER apply openjson (
atividades_secundarias) WITH (as_dsd nvarchar(30) '$.text', as_code nvarchar(30) '$.code'); 


select *
from #todos

drop table #todos