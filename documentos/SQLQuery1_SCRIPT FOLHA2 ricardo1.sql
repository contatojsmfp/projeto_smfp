CREATE DATABASE FolhaPagamento
ON PRIMARY (
    NAME = 'FolhaPagamento_Data',
    FILENAME = 'C:\Caminho\Para\O\Arquivo\FolhaPagamento.mdf',
    SIZE = 10MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
)
LOG ON (
    NAME = 'FolhaPagamento_Log',
    FILENAME = 'C:\Caminho\Para\O\Arquivo\FolhaPagamento_log.ldf',
    SIZE = 5MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 1MB
);


--Cadastro de Empresas

/*
Explicação dos Campos:
ID: Identificador único da tabela, gerado automaticamente com auto-incremento (BIGINT).
ce_NUMEMP: Número da empresa, armazenado como FLOAT para representar números inteiros ou decimais.
ce_NFILIAL: Número da filial, armazenado como FLOAT.
ce_SIGEMP: Sigla da empresa, armazenada como VARCHAR(2) (máximo de 2 caracteres).
ce_CODIGO: Código da empresa, armazenado como FLOAT.
CE_RAZSOC: Razão social da empresa, armazenada como VARCHAR(14) (máximo de 14 caracteres).
CE_SENEMP: Senha da empresa, armazenada como VARCHAR(30) (máximo de 30 caracteres).
CE_SEQDTA: Data de sequência de alguma operação.
CE_SEQNSA: Sequência de notas fiscais da empresa, armazenada como FLOAT.
ce_PATH: Caminho de armazenamento da empresa, armazenado como VARCHAR(30) (máximo de 30 caracteres).
ce_TMP: Caminho temporário de armazenamento, armazenado como VARCHAR(30) (máximo de 30 caracteres).
ce_ANO: Ano de referência, armazenado como VARCHAR(2).
ce_TIPO: Tipo de empresa, armazenado como FLOAT.
ce_CLASSE: Classe da empresa, armazenada como FLOAT.
ce_CNAE: Código CNAE da empresa, armazenado como FLOAT.
ce_SAT: Alíquota do SAT, armazenada como FLOAT.
ce_FPAS: Código FPAS da empresa, armazenado como FLOAT.
ce_CATEMP: Categoria da empresa, armazenada como VARCHAR(1).
ce_BANCO: Código do banco, armazenado como VARCHAR(8).
ce_TEL: Telefone da empresa, armazenado como VARCHAR(12).
ce_FAX: Número de fax, armazenado como VARCHAR(12).
ce_TELEX: Número de telex, armazenado como VARCHAR(12).
ce_CONTATO: Nome do contato principal da empresa, armazenado como VARCHAR(30).
ce_INSS: Número do INSS da empresa, armazenado como VARCHAR(30).
ce_INDINSS: Indicador do INSS, armazenado como FLOAT.
ce_DTRECINSS: Data de recebimento do INSS.
ce_SIMPLES: Indicador de participação no Simples Nacional, armazenado como FLOAT.
ce_CTERCEIRO: Contribuição de terceiros, armazenada como FLOAT.
Vínculo:
Vínculo com a própria tabela FPEMP: A tabela FPEMP está vinculada a si mesma pelos campos ce_NUMEMP e ce_NFILIAL, garantindo a integridade referencial para registros relacionados à empresa e filial.
Considerações:
Todos os campos originalmente definidos como NUMERIC foram substituídos por FLOAT, permitindo maior flexibilidade para armazenar valores inteiros e decimais.
A chave primária foi mantida no campo ID, garantindo que cada registro tenha um identificador único.

*/
--Cadastro de Empresas

USE [FolhaPag];
GO

-- Define que as comparações com valores NULL seguem a sintaxe ANSI
SET ANSI_NULLS ON;
GO

-- Permite o uso de identificadores delimitados por aspas duplas ou colchetes
SET QUOTED_IDENTIFIER ON;
GO

-- Criação da tabela FPEMP
CREATE TABLE [dbo].[FPEMP](
    [ID] [bigint] IDENTITY(1,1),                 -- Identificador único com auto-incremento (BIGINT)
    [ID_FPEMP] [bigint],                         -- Identificador da empresa pai para vínculo entre empresa matriz e filial
    [ce_NFILIAL] [smallint],                     -- Código da filial (número pequeno para identificação de filiais)
 	[ce_CNPJEMP] [varchar](18) ,               -- CNPJ da empresa com formato de 18 caracteres para armazenar máscara
    [ce_INSEST] [varchar](16) ,               -- Inscrição estadual da empresa (até 16 caracteres)
    [CE_RAZSOC] [varchar](40) ,                -- Razão social da empresa (até 40 caracteres)
    [ce_TIPO] [smallint],                        -- Tipo de empresa, identificado por número pequeno
	[ce_CLASSE] [varchar](3) ,                   -- Classe da empresa (representada por 3 caracteres)
    [ce_CNAE] [varchar](max),                    -- Código CNAE, classificação de atividades econômicas, com tamanho variável
    [ce_SAT] [float],                            -- Alíquota SAT (Seguro Acidente de Trabalho)
    [ce_FPAS] [float],                           -- Código FPAS (Fundo de Previdência e Assistência Social)
	[ce_CATEMP] [varchar](1) ,                  -- Categoria da empresa, representada por 1 caractere   
	[ce_BANCO] [varchar](8) ,                     -- Código do banco (até 8 caracteres)      
	[ce_TEL] [varchar](12) ,                      -- Telefone da empresa (até 12 caracteres)          
	[ce_CONTATO] [varchar](30) ,                -- Nome do contato principal da empresa (até 30 caracteres)  
	[ce_INSS] [varchar](30) ,                   -- Número do INSS da empresa (até 30 caracteres)   
    [ce_INDINSS] [bit],                         -- - Indicador de inscrição no INSS (1: Sim, 0: Não)
    [ce_DTRECINSS] [datetime],                   -- Data de recebimento do INSS
    [ce_SIMPLES] [bit],                          -- Indicador de participação no Simples Nacional (1: Sim, 0: Não)
    [ce_CTERCEIRO] [float],                      -- Contribuição de terceiros (float)
    [ce_endemp] [varchar](30) ,   -- Endereço da empresa (até 30 caracteres) 
	[ce_BAIEMP] [varchar](20) ,  -- Bairro da empresa (até 20 caracteres)
	[ce_CIDEMP] [varchar](20) ,   -- Cidade da empresa (até 20 caracteres) 
	[ce_CEPEMP] [varchar](8) ,   -- CEP da empresa (até 8 caracteres) 
	[ce_ESTEMP] [varchar](2) ,   -- Estado da empresa, representado por sigla de 2 caracteres
	[ce_ATVPRI] [varchar](4) ,   -- Código da atividade principal da empresa (até 4 caracteres)
	[ce_ATVSEC] [varchar](4) ,   -- Código da atividade secundario  da empresa (até 4 caracteres)
	[ce_QTDPRO] [float],                         -- Quantidade de profissionais na empresa
    [ce_QTDFAM] [float],                         -- Quantidade de funcionários familiares
    [ce_BAMPIS] [varchar](3) ,  -- Banco PIS da empresa (até 3 caracteres)   
	[ce_AGEPIS] [varchar](4) ,  -- Agência bancária do PIS da empresa (até 4 caracteres)  
	[ce_DIGPIS] [varchar](1) ,   -- Dígito verificador do PIS (1 caractere)  
	[ce_VALARR] [float],                         -- Valor do arrendamento
    [ce_PERQZN] [float],                         -- Percentual da quinzena
    [ce_DTATU] [datetime],                       -- Data de atualização dos dados
    [ce_DTINIPER] [datetime],                    -- Data de início do período
    [ce_MENSAG] [varchar](50) ,   -- mensagem livre
	[ce_SALMES] [varchar](3) ,   -- Código do salário mensal (até 3 caracteres)
	[ce_SALFAM] [varchar](3) ,   -- Código do salário familiar (até 3 caracteres)
	[ce_VBRISCO] [varchar](3) ,   -- Código do valor de risco (até 3 caracteres) vigilantes 
	[ce_IAPAS] [varchar](3) ,     -- Código do Instituto de Assistência Previdenciária (até 3 caracteres) 
	[ce_CREEXEC] [varchar](3) ,   -- Código do crédito do exercício (até 3 caracteres)   
	[ce_DBBEXEC] [varchar](3) ,   -- Código do débito do exercício (até 3 caracteres)  
	[ce_IRFONTE] [varchar](3) ,   -- Código de retenção do imposto de renda (até 3 caracteres)
	[ce_CREARR] [varchar](3) ,   -- Código de crédito do arrendamento (até 3 caracteres)
	[ce_DEBARR] [varchar](3) ,    -- Código de débito do arrendamento (até 3 caracteres)
	[ce_13SAL] [varchar](3) ,      -- Código do décimo terceiro salário (até 3 caracteres) 
	[ce_ADI13S] [varchar](3) ,      -- Código de adiantamento do décimo terceiro salário (até 3 caracteres)   
	[ce_DESC13S] [varchar](3) ,    -- Código de desconto do décimo terceiro salário (até 3 caracteres)  
	[ce_IAPA13] [varchar](3) ,       -- Código do IAPAS para o décimo terceiro salário (até 3 caracteres)
	[ce_DIF13C] [varchar](3) ,      -- Código de diferença do décimo terceiro crédito (até 3 caracteres) 
	[ce_DIF13D] [varchar](3) ,     -- Código de diferença do décimo terceiro débito (até 3 caracteres)  
	[ce_FERIAS] [varchar](3) ,      -- Código de férias (até 3 caracteres) 
	[ce_DIFSAL] [varchar](3) ,    -- Código de diferença salarial (até 3 caracteres)
    [ce_VLSALFAM] [float],                       -- Valor do salário familiar
    [ce_VLSALFAM1] [float],                      -- Valor adicional do salário familiar
    [ce_SALMIN] [float],                         -- Salário mínimo da empresa
    [ce_TETIAP] [float],                         -- Teto de alíquota da empresa
    [ce_ABADEP] [float],                         -- Abatimento por dependente
    [ce_RECMIN] [float],                         -- Receita mínima
    [ce_LIMDED] [float],                         -- Limite de dedução
    [ce_VALISE] [float],                         -- Valor de isenção
    [ce_PROLAB] [float],                         -- Valor do pró-labore
    [ce_VALHORA] [float],                        -- Valor da hora trabalhada
    [CE_EMAIL] [varchar](max),                   -- E-mail da empresa
    -- Coluna calculada para identificação composta
    [IDIDEMP] AS (concat(
        CONVERT([varchar](max), CASE WHEN ISNULL([ID_FPEMP], 0)<>(0) THEN [ID_FPEMP] ELSE [ID] END), 
        '.', 
        CASE WHEN ISNULL([ID_FPEMP], 0)<>(0) THEN [ID] END)
    ),
    
    -- Definição da chave primária da tabela
    PRIMARY KEY CLUSTERED ([ID] ASC)
    WITH (
        PAD_INDEX = OFF, 
        STATISTICS_NORECOMPUTE = OFF, 
        IGNORE_DUP_KEY = OFF, 
        ALLOW_ROW_LOCKS = ON, 
        ALLOW_PAGE_LOCKS = ON, 
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
GO

-- Criação de chave estrangeira, vinculando a coluna [ID_FPEMP] à própria tabela
ALTER TABLE [dbo].[FPEMP]
    WITH CHECK ADD FOREIGN KEY ([ID_FPEMP]) REFERENCES [dbo].[FPEMP]([ID]);
GO


--Explicações dos Componentes
--TabelaFPEMP : Armazena informações previstas sobre cada empresa, incluindo dados cadastrais, dados fiscais e de atividade econômica.
--Chave Primária : A coluna [ID]é usada como chave primária com incremento automático.
--__Chave EstrangeiraID_FPEMP : Perm[ID]da própri


-- Cadastro de funcionarios 
USE PESSOAL;
GO

CREATE TABLE FPCD (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,
    CD_NUMMAT        VARCHAR(6),          
    CD_NOMFUN        VARCHAR(40),
    CD_NUMLOT        VARCHAR(8), 
    CD_NUMCBO        VARCHAR(7),
    CD_CATDIS        VARCHAR(1),
    CD_SEXO          VARCHAR(1),
    CD_DTNASC        DATETIME,
    CD_NACION        VARCHAR(2), 
    CD_ANOCHE        VARCHAR(4),
    CD_ESTCIV        VARCHAR(1),
    CD_GRINST        VARCHAR(1),
    CD_NATURA        VARCHAR(2),
    CD_NUMFIL        FLOAT,
    CD_NUMDEP        FLOAT,
    CD_DTADM         DATETIME,
    CD_CODSIT        VARCHAR(1),
    CD_DTAFAS        DATETIME,
    CD_EMPANT        VARCHAR(1),
    CD_ALTURA        FLOAT,
    CD_PESO          VARCHAR(3),  
    CD_RACOR         VARCHAR(10),      
    CD_CORCAB        VARCHAR(10),
    CD_COROLH        VARCHAR(10), 
    CD_TPSANG        VARCHAR(2),
    CD_NUMCTP        VARCHAR(7),
    CD_SERCTP        VARCHAR(5),
    CD_ESTCTP        VARCHAR(2), 
    CD_NUMRG         VARCHAR(11),
    CD_ORGEMRG       VARCHAR(3), 
    CD_ESTRG         VARCHAR(2), 
    CD_DTEXRG        DATETIME,
    CD_NUMCPF        VARCHAR(11),
    CD_NPISNIT       VARCHAR(11),
    CD_NUMCNH        VARCHAR(11),
    CD_ESTCNH        VARCHAR(2),
    CD_CATCNH        VARCHAR(3),
    CD_DTEMCNH       DATETIME,
    CD_DTVENCNH      DATETIME,
    CD_DTPRICNH      DATETIME,
    CD_NUMTIT        VARCHAR(12), 
    CD_NUMZONA       VARCHAR(3),
    CD_NUMSECAO      VARCHAR(5),
    CD_NUMRESER      VARCHAR(15),
    CD_BCOCTA        VARCHAR(3),
    CD_AGECTA        VARCHAR(4),
    CD_NUMCTA        VARCHAR(8),
    CD_DIGCTA        VARCHAR(1), 
    CD_DTULTF        DATETIME,
    CD_CODCEF        VARCHAR(11), 
    CD_CODFGTS       VARCHAR(1),
    CD_DTFGTS        DATETIME,
    CD_BCFGTS        VARCHAR(3),
    CD_AGFGTS        VARCHAR(4),
    CD_CODRES        VARCHAR(1),
    CD_DTRES         DATETIME,
    CD_HORSEM        FLOAT,
    CD_EXAMED        VARCHAR(4),
    CD_MOTAFA        VARCHAR(1), 
    CD_NUMCAR        VARCHAR(4),
    CD_PERPAG        VARCHAR(6),
    CD_VINEMP        VARCHAR(1),
    CD_NUMFIC        VARCHAR(5),
    CD_SALMES        FLOAT,
    CD_SALBAS        FLOAT,
    CD_FAISAL        VARCHAR(6),      
    CD_FGTS01        FLOAT,
    CD_FGTS02        FLOAT,
    CD_FGTS03        FLOAT,
    CD_FGTS04        FLOAT,  
    CD_FGTS05        FLOAT,
    CD_FGTS06        FLOAT,
    CD_FGTS07        FLOAT,
    CD_FGTS08        FLOAT,
    CD_FGTS09        FLOAT, 
    CD_FGTS10        FLOAT,
    CD_FGTS11        FLOAT,
    CD_FGTS12        FLOAT,
    CD_ENDFUN        VARCHAR(40),
    CD_COMFUN        VARCHAR(15),
    CD_BAIFUN        VARCHAR(15),
    CD_CEPFUN        VARCHAR(8),
    CD_CIDFUN        VARCHAR(20),
    CD_ESTFUN        VARCHAR(2),
    CD_TELFUN        VARCHAR(11),
    CD_PERQZN        FLOAT,
    CD_HORA          TIME(6), 
    CD_HORTRB        VARCHAR(10),
    CD_INTERV        VARCHAR(10),  
    CD_SINDICA       VARCHAR(1),
    CD_CONFEDE       VARCHAR(1),
    CD_FERVEN        FLOAT,
    CD_HORAULA       FLOAT,  
    CD_VALAULA       FLOAT,
    CD_QUINQUE       VARCHAR(1),  
    CD_PERQUIN       VARCHAR(6),
    CD_SUPER         VARCHAR(1),
    CD_PERSUP        FLOAT,
    CD_PROVA         VARCHAR(1),
    CD_PERPROV       FLOAT,   
    CD_SINDESC       VARCHAR(1),
    CD_PERSIND       FLOAT,
    CD_VALE          VARCHAR(1),
    CD_PERVALE       FLOAT, 
    CD_DRCT          VARCHAR(1),
    CD_PERDRCT       FLOAT,
    CD_UNITRAB       VARCHAR(15),
    CD_CODADM        VARCHAR(2),
    CD_DTMOVI        DATETIME,
    CD_COD_MOV       VARCHAR(1),
    CD_NOMEMAE       VARCHAR(40),
    CD_NOMEPAI       VARCHAR(40),
    CD_NOMECONJ      VARCHAR(40),
    CD_CIDNASC       VARCHAR(20),
    CD_ESTCONJ       VARCHAR(2), 
    CD_DTNACONJ      DATETIME,
    CD_NUMEMP        FLOAT,
    CD_NFILIAL       FLOAT,	   

    
    CONSTRAINT ID_fpcd BIGINT REFERENCES PK_FPEMP_ID(ID),
    CONSTRAINT PK_FPCD PRIMARY KEY CLUSTERED (CD_NUMMAT),
    CONSTRAINT UNQ_FPCD_CPF UNIQUE NONCLUSTERED (CD_NUMCPF),
    CONSTRAINT CHK_FPCD_SEXO CHECK (CD_SEXO IN('M','F')),
    CONSTRAINT CHK_FPCD_CD_SALMES CHECK (CD_SALMES > 0)
    
);
GO

ALTER TABLE FPCD ADD CONSTRAINT FK_FPCD_FPCF FOREIGN KEY (CD_NUMMAT) REFERENCES FPCF(CF_NUMMAT);
ALTER TABLE FPCD ADD CONSTRAINT FK_FPCD_FPLT FOREIGN KEY (CD_NUMLOT) REFERENCES FPLT(LT_NUMLOT);
ALTER TABLE FPCD ADD CONSTRAINT FK_FPCD_FPRL FOREIGN KEY (CD_NUMMAT) REFERENCES FPRL(RL_NUMMAT);
ALTER TABLE FPCD ADD CONSTRAINT FK_FPCD_FPRLS FOREIGN KEY (CD_NUMMAT) REFERENCES FPRLS(ID_RLSMAT);
ALTER TABLE FPCD ADD CONSTRAINT FK_FPCD_FPRLD FOREIGN KEY (CD_NUMMAT) REFERENCES FPRLD(ID_RLDMAT);
ALTER TABLE FPCD ADD CONSTRAINT FK_FPCD_FPBA FOREIGN KEY (CD_BCOCTA) REFERENCES FPBA(BA_CODBCO);
ALTER TABLE FPCD ADD CONSTRAINT FK_FPCD_FPDF FOREIGN KEY (CD_NUMMAT) REFERENCES FPDF(DF_NUMMAT);
ALTER TABLE FPCD ADD CONSTRAINT FK_FPCD_FPRES FOREIGN KEY (CD_NUMMAT) REFERENCES FPRES(VA_NUMMAT);
GO

-- Vinculando FPCD com FPEMP considerando ID da empresa (CD_NUMEMP) e filial (CD_NFILIAL)
ALTER TABLE FPCD 
ADD CONSTRAINT FK_FPCD_FPEMP 
FOREIGN KEY (CD_NUMEMP, CD_NFILIAL) 
REFERENCES FPEMP(ID, ce_NFILIAL);

-- Vinculando FPCD com FPCF considerando matrícula (CD_NUMMAT) e ID da empresa (CD_NUMEMP)
ALTER TABLE FPCD 
ADD CONSTRAINT FK_FPCD_FPCF 
FOREIGN KEY (CD_NUMMAT, CD_NUMEMP) REFERENCES FPCF(CF_NUMMAT, CF_NUMEMP);


----------------------------------------------------------------------------------------------------
-- Complemento dos cadastros para geracao de e-social;

--Estrutura da Tabela para SST.

--A tabela a seguir será chamada FPCD_SST e vai guardar os dados relacionados à SST de cada trabalhador. Os campos estarão alinhados com os eventos do eSocial, como o S-2220 (Monitoramento de Saúde), S-2240 (Condições Ambientais do Trabalho) e S-2210 (CAT).
---------------------------------------------------------------------------------------------------------------
--Descrição dos Campos:
--CD_NUMMAT: Matrícula do trabalhador, que serve como chave estrangeira para ligação com a tabela FPCD.

--CD_MONITORAMENTO_SAUDE: Indica se o trabalhador está sob monitoramento de saúde ocupacional, por exemplo, por exames médicos periódicos.

--CD_CONDICOES_AMBIENTAIS: Define se o trabalhador está exposto a condições ambientais de risco no local de trabalho.
--CD_CODCAT: Código da Comunicação de Acidente de Trabalho (CAT), utilizado para registrar casos de acidentes ou doenças ocupacionais.

--CD_DESCRICAO_ACIDENTE: Descrição detalhada do acidente, caso tenha ocorrido.
--CD_DATA_ACIDENTE: Data do acidente de trabalho, se aplicável.
--CD_RESULTADO_EXAME: Resultado dos exames médicos realizados no trabalhador.
--CD_CIDEXAM: Código do CID (Classificação Internacional de Doenças) relacionado ao exame ocupacional.
--CD_MEDICO_RESPONSAVEL: Nome do médico que realizou ou supervisionou o exame ocupacional.
--CD_DTAEXAM: Data em que o exame ocupacional foi realizado.
--CD_TIPO_EXAME: Tipo de exame realizado (admissional, periódico, demissional).
--CD_PROF_RISCO: Indica se o trabalhador está exposto a riscos ocupacionais (sim/não).
--CD_TIPO_RISCO: Tipo de risco ao qual o trabalhador está exposto (ex.: físico, químico, biológico).
--CD_GRAU_RISCO: Grau do risco (baixo, médio, alto), conforme determinado pelas normas de segurança.
--CD_INICIO_EXPOSICAO: Data de início da exposição ao risco ocupacional.
--CD_TEMPO_EXPOSICAO: Tempo de exposição do trabalhador a determinado risco.
--Relação com a Tabela FPCD:
--A tabela FPCD_SST vai se relacionar com a tabela FPCD através do campo CD_NUMMAT (número de matrícula do trabalhador), permitindo que os dados de SST sejam consultados e vinculados ao empregado na folha de pagamento.

--Essa estrutura permite que você registre e monitore todos os aspectos de Segurança e Saúde no Trabalho exigidos pelo eSocial, além de criar relatórios e acompanhar os eventos relevantes de SST.


/----------------------------------------------------------------------------------------------------

    CREATE TABLE FPCD_SST (
    ID_SST BIGINT IDENTITY(1,1) PRIMARY KEY,   -- Identificador único para os registros de SST
    CD_NUMMAT VARCHAR(6) NOT NULL,             -- Matrícula do trabalhador (ligação com FPCD)
    CD_MONITORAMENTO_SAUDE VARCHAR(1),         -- Indica se há monitoramento de saúde ocupacional (Sim/Não)
    CD_CONDICOES_AMBIENTAIS VARCHAR(1),        -- Exposição a condições ambientais de risco (Sim/Não)
    CD_CODCAT VARCHAR(10),                     -- Código do CAT (Comunicação de Acidente de Trabalho)
    CD_DESCRICAO_ACIDENTE VARCHAR(255),        -- Descrição do acidente (se houver)
    CD_DATA_ACIDENTE DATETIME,                 -- Data do acidente
    CD_RESULTADO_EXAME VARCHAR(50),            -- Resultado dos exames médicos (se aplicável)
    CD_CIDEXAM VARCHAR(10),                    -- Código da Classificação Internacional de Doenças (CID) do exame
    CD_MEDICO_RESPONSAVEL VARCHAR(40),         -- Nome do médico responsável pelo exame
    CD_DTAEXAM DATETIME,                       -- Data de realização do exame ocupacional
    CD_TIPO_EXAME VARCHAR(1),                  -- Tipo de exame (admissional, periódico, demissional)
    CD_PROF_RISCO VARCHAR(1),                  -- Se o empregado está exposto a riscos ocupacionais (Sim/Não)
    CD_TIPO_RISCO VARCHAR(50),                 -- Tipo de risco ocupacional (físico, químico, biológico, etc.)
    CD_GRAU_RISCO VARCHAR(1),                  -- Grau do risco (baixo, médio, alto)
    CD_INICIO_EXPOSICAO DATETIME,              -- Data de início da exposição ao risco
    CD_TEMPO_EXPOSICAO VARCHAR(20)             -- Tempo de exposição ao risco
);

-- Informações sobre Segurança e Saúde no Trabalho (SST)
ALTER TABLE FPCD ADD CD_SST_MONITORAMENTO VARCHAR(1);  -- Monitoramento da saúde
ALTER TABLE FPCD ADD CD_SST_CONDICOES_TRAB VARCHAR(1); -- Condições ambientais do trabalho
ALTER TABLE FPCD ADD CD_SST_CIDCAT VARCHAR(10);        -- Código de CAT (Comunicação de Acidente de Trabalho)

-- Dependentes (já temos CD_NUMDEP, mas podemos precisar de mais detalhes)
ALTER TABLE FPCD ADD CD_NOME_DEP VARCHAR(40);          -- Nome dos dependentes
ALTER TABLE FPCD ADD CD_DT_NASC_DEP DATETIME;          -- Data de nascimento dos dependentes
ALTER TABLE FPCD ADD CD_GRAU_DEP VARCHAR(1);           -- Grau de parentesco dos dependentes

-- Informações adicionais do Contrato de Trabalho
ALTER TABLE FPCD ADD CD_TIPO_CONTRATO VARCHAR(1);      -- Tipo de contrato (CLT, temporário, intermitente)
ALTER TABLE FPCD ADD CD_TIPO_JORNADA VARCHAR(1);       -- Tipo de jornada (parcial, integral, turnos)

-- Dados de desligamento
ALTER TABLE FPCD ADD CD_MOTIVO_DESLIGAMENTO VARCHAR(1); -- Motivo do desligamento (demissão, aposentadoria, etc.)

-- Criar um campo adicional para "Complemento de Endereço" caso necessário
ALTER TABLE FPCD ADD CD_COMPL_END VARCHAR(20);         -- Complemento de endereço


/*--------------------------------------------------------------------------------------------------------------------
-Resumo: das Obrigacoes 
•	FGTS: GRF (via SEFIP ou Conectividade Social)
•	INSS: GPS (via folha de pagamento ou SEFIP)
•	IRRF: DARF (via folha de pagamento)
•	Contribuições ao Sistema S: GPS (via folha de pagamento ou SEFIP)
•	CAGED: Arquivo eletrônico (via folha de pagamento ou sistema específico)
•	RAIS: Arquivo eletrônico (via folha de pagamento ou sistema da RAIS)
•	DIRF: Arquivo eletrônico (via folha de pagamento ou Receitanet)
•	eSocial: Arquivo eletrônico (via folha de pagamento ou sistema específico)
•	EFD-Reinf: Arquivo eletrônico (via sistema contábil)
•	DCTFWeb: Arquivo eletrônico (via e-CAC)
•	GRRF: Guia para rescisão (via Conectividade Social).

Cada uma dessas obrigações tem prazos e formas de envio específicas, e a automação do processo de geração e envio dessas guias e arquivos facilita o cumprimento das obrigações fiscais e previdenciárias. Se precisar de mais detalhes ou de ajuda para integrar algum desses processos ao seu sistema de folha, estou à disposição

*/
--Obrigacoes 
--Estrutura da Tabela para Geração da GPS:

CREATE TABLE GPS_GENERACAO (
    ID_GPS BIGINT IDENTITY(1,1) PRIMARY KEY,      -- Identificador único da GPS
    CD_EMPRESA VARCHAR(14) NOT NULL,              -- CNPJ ou CEI da empresa
    CD_COMPETENCIA VARCHAR(7) NOT NULL,           -- Competência (mês/ano) no formato MM/YYYY
    CD_NUMEMPREGADO VARCHAR(11),                  -- CPF do empregado (caso haja individualização)
    CD_NOME_EMPREGADO VARCHAR(40),                -- Nome do empregado
    VL_REMUNERACAO_EMPREGADO DECIMAL(15, 2),      -- Remuneração total do empregado para cálculo da contribuição
    VL_INSS_EMPREGADO DECIMAL(15, 2),             -- Valor da contribuição INSS do empregado
    VL_INSS_PATRONAL DECIMAL(15, 2),              -- Valor da contribuição INSS do empregador (20% da folha)
    VL_RAT DECIMAL(15, 2),                        -- Valor do RAT (Risco Ambiental de Trabalho)
    VL_OUTRAS_ENTIDADES DECIMAL(15, 2),           -- Contribuição devida a outras entidades e fundos (Sistema S)
    VL_TOTAL_INSS DECIMAL(15, 2),                 -- Total da contribuição previdenciária a ser recolhida
    DT_VENCIMENTO DATETIME,                       -- Data de vencimento da GPS
    CD_CODIGO_PAGAMENTO VARCHAR(4),               -- Código de pagamento da GPS (ex: 2100, 2003)
    CD_TIPO_EMPRESA VARCHAR(1),                   -- Tipo da empresa (Simples Nacional, Lucro Presumido, etc.)
    CD_COD_SEFIP VARCHAR(2),                      -- Código da SEFIP para classificação (ex: 115, 150)
    CD_SITUACAO GPS VARCHAR(1) DEFAULT 'A',       -- Situação do pagamento (A: Aberto, P: Pago)
    CD_BANCO_PAGAMENTO VARCHAR(3),                -- Código do banco onde o pagamento será efetuado
    CD_AGENCIA_PAGAMENTO VARCHAR(4),              -- Código da agência onde o pagamento será efetuado
    CD_CONTA_PAGAMENTO VARCHAR(10),               -- Número da conta para pagamento
    DT_PAGAMENTO DATETIME                         -- Data de pagamento da GPS
);
GO

--Obrigacoes 
----Estrutura SQL da Tabela para Envio da GRF (FGTS)
/*
Para atender ao FGTS (Fundo de Garantia por Tempo de Serviço), as empresas utilizam a GRF (Guia de Recolhimento do FGTS), que pode ser gerada via SEFIP ou através do Conectividade Social da Caixa Econômica Federal. A seguir, está a estrutura de uma tabela para armazenar os dados necessários para a geração da GRF, usada no recolhimento mensal do FGTS dos trabalhadores.
*/
CREATE TABLE GRF_ENVIO (
    ID_GRF BIGINT IDENTITY(1,1) PRIMARY KEY,      -- Identificador único da GRF gerada
    CD_EMPRESA VARCHAR(14) NOT NULL,              -- CNPJ ou CEI da empresa
    CD_COMPETENCIA VARCHAR(7) NOT NULL,           -- Competência (mês/ano) no formato MM/YYYY
    CD_NUMEMPREGADO VARCHAR(11) NOT NULL,         -- CPF do empregado
    CD_NOME_EMPREGADO VARCHAR(40) NOT NULL,       -- Nome completo do empregado
    VL_REMUNERACAO_EMPREGADO DECIMAL(15, 2) NOT NULL, -- Valor da remuneração do empregado para cálculo do FGTS
    VL_FGTS_EMPREGADO DECIMAL(15, 2) NOT NULL,    -- Valor do FGTS devido pelo empregador (8% da remuneração)
    CD_TIPO_RECOLHIMENTO VARCHAR(1) NOT NULL,     -- Tipo de recolhimento (Mensal, Rescisório, etc.)
    VL_MULTA_FGTS DECIMAL(15, 2),                 -- Valor da multa de 40% ou 50% (em caso de rescisão)
    DT_VENCIMENTO DATETIME NOT NULL,              -- Data de vencimento da GRF
    CD_SITUACAO_GRF VARCHAR(1) DEFAULT 'A',       -- Situação do pagamento (A: Aberta, P: Paga)
    CD_BANCO_PAGAMENTO VARCHAR(3),                -- Código do banco onde será feito o pagamento
    CD_AGENCIA_PAGAMENTO VARCHAR(4),              -- Agência bancária onde será feito o pagamento
    CD_CONTA_PAGAMENTO VARCHAR(10),               -- Conta bancária de pagamento
    CD_FORMA_PAGAMENTO VARCHAR(1),                -- Forma de pagamento (B: Boleto, T: Transferência bancária)
    DT_PAGAMENTO DATETIME                         -- Data de pagamento da GRF
);
GO
--------------------------------------------------------------------------------------------------------------------
--Obrigacoes 
--IRRF: DARF (via folha de pagamento)

CREATE TABLE irrf_darf_folha_pagamento (
    id_registro INT PRIMARY KEY AUTO_INCREMENT,      -- Chave primária com auto-incremento
    cnpj_empresa VARCHAR(14) NOT NULL,               -- CNPJ da empresa (14 dígitos, sem separadores)
    razao_social_empresa VARCHAR(255) NOT NULL,      -- Razão social da empresa
    mes_competencia DATE NOT NULL,                   -- Mês de competência (ex.: 2024-10-01 para outubro de 2024)
    codigo_receita VARCHAR(4) NOT NULL,              -- Código de Receita para DARF (por exemplo, 0561)
    valor_irrf DECIMAL(15, 2) NOT NULL,              -- Valor do IRRF retido na fonte
    data_pagamento DATE NOT NULL,                    -- Data de pagamento da folha de pagamento
    nome_funcionario VARCHAR(255) NOT NULL,          -- Nome do funcionário
    cpf_funcionario VARCHAR(11) NOT NULL,            -- CPF do funcionário (11 dígitos)
    salario_bruto DECIMAL(15, 2) NOT NULL,           -- Salário bruto do funcionário
    base_calculo_irrf DECIMAL(15, 2) NOT NULL,       -- Base de cálculo do IRRF após deduções
    aliquota_irrf DECIMAL(5, 2) NOT NULL,            -- Alíquota de IRRF aplicada ao funcionário
    deducoes_irrf DECIMAL(15, 2) DEFAULT 0,          -- Deduções aplicáveis para IRRF (ex: dependentes)
    valor_irrf_retido DECIMAL(15, 2) NOT NULL,       -- Valor efetivo do IRRF retido do funcionário
    data_envio DATE NOT NULL,                        -- Data do envio do DARF
    referencia_legal VARCHAR(255) DEFAULT 'Art. 70 da Lei 11.196/2005' -- Referência legal
);

-- Inserção de exemplo para um envio de DARF IRRF mensal
INSERT INTO irrf_darf_folha_pagamento 
(cnpj_empresa, razao_social_empresa, mes_competencia, codigo_receita, valor_irrf, data_pagamento, 
nome_funcionario, cpf_funcionario, salario_bruto, base_calculo_irrf, aliquota_irrf, deducoes_irrf, valor_irrf_retido, data_envio)
VALUES
('12345678000195', 'Empresa Exemplo LTDA', '2024-10-01', '0561', 1500.00, '2024-10-10', 
'João Silva', '12345678901', 5000.00, 4500.00, 27.5, 189.59, 1262.85, '2024-10-20');

---------------------------------------------------------------------------------------------------------------
--rubrica do eSocial
CREATE TABLE rubricas_esocial (
    id_rubrica INT PRIMARY KEY AUTO_INCREMENT,          -- Identificador único da rubrica (auto-incremento)
    
    cod_rubrica VARCHAR(30) NOT NULL,                   -- Código da rubrica (definido pela empresa), no máximo 30 caracteres
    descricao_rubrica VARCHAR(255) NOT NULL,            -- Descrição da rubrica (nome da verba), até 255 caracteres
    nat_rubrica VARCHAR(3) NOT NULL,                    -- Natureza da rubrica, conforme tabela de natureza de rubricas do eSocial (campo codNatRubr)
    tipo_rubrica ENUM('Provento', 'Desconto', 'Informativo') NOT NULL,  
                                                        -- Tipo da rubrica (provento, desconto ou informativo)
    
    inc_base_irrf ENUM('Sim', 'Nao') NOT NULL,          -- Indicador de incidência na base do IRRF (sim ou não)
    inc_base_inss ENUM('Sim', 'Nao') NOT NULL,          -- Indicador de incidência na base do INSS (sim ou não)
    inc_base_fgts ENUM('Sim', 'Nao') NOT NULL,          -- Indicador de incidência na base do FGTS (sim ou não)
    inc_base_sindicato ENUM('Sim', 'Nao') NOT NULL,     -- Indicador de incidência para o sindicato
    
    observacao TEXT,                                    -- Campo de observação para possíveis detalhes adicionais sobre a rubrica
    
    data_inicio_validade DATE NOT NULL,                 -- Data de início de validade da rubrica
    data_fim_validade DATE,                             -- Data de fim de validade da rubrica (opcional)
    
    criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,        -- Data de criação do registro, gerado automaticamente
    ultima_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
                                                        -- Data de última atualização do registro, atualizada automaticamente
);

-- Comentários sobre a tabela:
-- 1. "id_rubrica" é o identificador único de cada rubrica, gerado automaticamente.
-- 2. "cod_rubrica" é o código que a empresa utiliza para identificar a rubrica.
-- 3. "descricao_rubrica" define o nome ou descrição da rubrica, importante para a identificação da natureza da verba.
-- 4. "nat_rubrica" se refere à natureza da rubrica, que deve seguir os códigos estabelecidos pelo eSocial (por exemplo, 100 para salário, 180 para adiantamento, etc.).
-- 5. "tipo_rubrica" define se a rubrica é um provento, desconto ou apenas informativo, como um controle.
-- 6. Os campos "inc_base_irrf", "inc_base_inss", "inc_base_fgts" e "inc_base_sindicato" indicam se há incidência da rubrica em bases como IRRF, INSS, FGTS e sindicato.
-- 7. "observacao" permite armazenar detalhes adicionais relevantes sobre a rubrica.
-- 8. "data_inicio_validade" e "data_fim_validade" indicam o período de validade da rubrica. A data de fim é opcional.
-- 9. "criacao" e "ultima_atualizacao" são gerados automaticamente pelo sistema para controle interno.

-- Exemplo de inserção de dados:
INSERT INTO rubricas_esocial 
(cod_rubrica, descricao_rubrica, nat_rubrica, tipo_rubrica, inc_base_irrf, inc_base_inss, inc_base_fgts, inc_base_sindicato, data_inicio_validade)
VALUES 
('001', 'Salário Base', '100', 'Provento', 'Sim', 'Sim', 'Sim', 'Nao', '2024-01-01'),
('002', 'Desconto INSS', '921', 'Desconto', 'Nao', 'Sim', 'Nao', 'Nao', '2024-01-01'),
('003', 'Adiantamento Salarial', '180', 'Provento', 'Sim', 'Sim', 'Sim', 'Nao', '2024-01-01');

-------------------------------------------------------------------------------------------------------
--Tabela de grupo conforme -
--Grupo, Grupo Pai, Nível Descrição Ocor., Chave Condição , com base 
 --no layout Versão S-1.2 (cons. até NT 02/2024 rev.) --(aprovada pela Portaria Conjunta RFB/MPS/MTE
 -- nº 44, de 11/08/2023 – DOU de -17/08/2023) em sql comentada,

CREATE TABLE resumo_registro_esocial (
    id_registro INT PRIMARY KEY AUTO_INCREMENT,         -- Identificador único do registro
    grupo VARCHAR(100) NOT NULL,                        -- Nome do grupo do layout eSocial
    grupo_pai VARCHAR(100),                             -- Nome do grupo pai (grupo superior hierárquico)
    nivel INT NOT NULL,                                 -- Nível hierárquico do grupo no layout
    descricao TEXT NOT NULL,                            -- Descrição do campo ou grupo no layout
    ocorrencia VARCHAR(50) NOT NULL,                    -- Frequência de ocorrência do registro (Ocor. Mínima/Máxima)
    chave VARCHAR(255),                                 -- Definição de chave (se aplicável, chave primária composta, etc.)
    condicao TEXT,                                      -- Condições ou regras aplicáveis ao registro (regras de preenchimento)
    
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,   -- Data de criação do registro
    ultima_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
                                                       -- Data de última atualização do registro
);
GO
-- Comentários sobre os campos:
-- 1. "id_registro" é o identificador único, gerado automaticamente.
-- 2. "grupo" armazena o nome do grupo do layout do eSocial.
-- 3. "grupo_pai" identifica o grupo hierárquico superior, se aplicável. Pode ser nulo para grupos principais.
-- 4. "nivel" representa o nível de profundidade dentro do layout do eSocial.
-- 5. "descricao" fornece uma descrição detalhada do campo ou grupo.
-- 6. "ocorrencia" define a quantidade de vezes que o campo ou grupo pode ocorrer (mínima e máxima).
-- 7. "chave" representa a definição de chave (se o grupo é parte de uma chave primária, etc.).
-- 8. "condicao" contém as regras e condições para o preenchimento correto do campo ou grupo.

-- Exemplo de inserção de registros com base no layout do eSocial versão S-1.2:

INSERT INTO resumo_registro_esocial 
(grupo, grupo_pai, nivel, descricao, ocorrencia, chave, condicao)
VALUES 
('S-1010', NULL, 1, 'Informações das Rubricas', '1-1', 'Sim', 'Obrigatório o preenchimento para todas as rubricas usadas na folha de pagamento'),
('Identificação do Trabalhador', 'S-1010', 2, 'CPF do trabalhador', '1-1', 'Sim', 'Obrigatório quando se tratar de trabalhador cadastrado'),
('Bases de Cálculo', 'S-1010', 2, 'Base de cálculo de IRRF', '0-1', 'Não', 'Preencher apenas quando houver retenção de IRRF na folha de pagamento');

-- Outro exemplo:
INSERT INTO resumo_registro_esocial 
(grupo, grupo_pai, nivel, descricao, ocorrencia, chave, condicao)
VALUES 
('S-1200', NULL, 1, 'Remuneração do trabalhador', '1-1', 'Sim', 'Preenchimento obrigatório para todo trabalhador com vínculo ativo no mês de apuração'),
('Detalhamento da Remuneração', 'S-1200', 2, 'Valor do salário', '1-1', 'Não', 'Informar o valor do salário acordado para o trabalhador'),
('Descontos', 'S-1200', 2, 'Desconto de INSS', '0-1', 'Não', 'Preencher se houver desconto de INSS na remuneração do trabalhador');

------------------------------------------------------------------------------------------------------------------
CRIE TABELAS •	EFD-Reinf: Arquivo eletrônico (via sistema contábil)
•	DCTFWeb: Arquivo eletrônico (via e-CAC)
•	GRRF: Guia para rescisão (via Conectividade Social), com base  no layout Versão S-1.2 (cons. até NT 02/2024 rev.)
(aprovada pela Portaria Conjunta RFB/MPS/MTE nº 44, de 11/08/2023 – DOU de
17/08/2023) em sql comentada 

TABELA 

CREATE TABLE efd_reinf (
    id_registro INT PRIMARY KEY AUTO_INCREMENT,         -- Identificador único do registro
    cnpj_empresa VARCHAR(14) NOT NULL,                 -- CNPJ da empresa responsável pela entrega da EFD-Reinf
    periodo_apuracao DATE NOT NULL,                    -- Período de apuração (mês/ano)
    tipo_evento VARCHAR(10) NOT NULL,                  -- Tipo de evento (R-1000, R-2010, etc.)
    valor_retencao FLOAT NOT NULL,                     -- Valor da retenção de impostos/contribuições
    natureza_retencao VARCHAR(10) NOT NULL,            -- Natureza da retenção (com base na tabela de natureza de retenção)
    data_envio DATE NOT NULL,                          -- Data de envio da EFD-Reinf
    status_envio VARCHAR(50) NOT NULL,                 -- Status do envio (ex: Enviado, Pendente, Processado)
    
    criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,       -- Data de criação do registro
    ultima_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
                                                       -- Data de última atualização do registro
);

-- Comentários:
-- 1. "cnpj_empresa" identifica a empresa que está enviando a EFD-Reinf.
-- 2. "periodo_apuracao" define o mês e ano de referência do arquivo.
-- 3. "tipo_evento" refere-se ao tipo de evento do arquivo EFD-Reinf (ex: R-1000 - Informações de cadastro, R-2010 - Retenções de serviços tomados).
-- 4. "valor_retencao" é o valor da retenção de imposto/contribuição.
-- 5. "natureza_retencao" refere-se ao código da natureza da retenção.
-- 6. "data_envio" e "status_envio" monitoram quando o arquivo foi enviado e o status do processamento.

-- Exemplo de inserção:
INSERT INTO efd_reinf 
(cnpj_empresa, periodo_apuracao, tipo_evento, valor_retencao, natureza_retencao, data_envio, status_envio)
VALUES 
('12345678000195', '2024-10-01', 'R-2010', 15000.00, '804', '2024-10-20', 'Enviado');
--------------------------------------------------------------------------------------------------
TABELA DCTF_WEB

CREATE TABLE dctf_web (
    id_declaracao INT PRIMARY KEY AUTO_INCREMENT,       -- Identificador único da declaração
    cnpj_empresa VARCHAR(14) NOT NULL,                 -- CNPJ da empresa
    periodo_apuracao DATE NOT NULL,                    -- Período de apuração (mês/ano)
    valor_contribuicoes FLOAT NOT NULL,                -- Valor total das contribuições a serem pagas
    valor_creditos FLOAT NOT NULL,                     -- Valor dos créditos que podem ser abatidos
    valor_total_devido FLOAT NOT NULL,                 -- Valor total devido após abatimento dos créditos
    data_envio DATE NOT NULL,                          -- Data de envio da DCTFWeb
    status_envio VARCHAR(50) NOT NULL,                 -- Status do envio (Enviado, Pendente, Processado)
    
    criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,       -- Data de criação do registro
    ultima_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
                                                       -- Data de última atualização do registro
);

-- Comentários:
-- 1. "cnpj_empresa" identifica a empresa responsável pela entrega da DCTFWeb.
-- 2. "periodo_apuracao" define o mês e ano de referência do arquivo.
-- 3. "valor_contribuicoes" é o total das contribuições apuradas no período.
-- 4. "valor_creditos" refere-se aos créditos fiscais que podem ser usados para abater o valor devido.
-- 5. "valor_total_devido" é o total a pagar após o abatimento dos créditos.
-- 6. "data_envio" e "status_envio" monitoram o envio e o estado da declaração.

-- Exemplo de inserção:
INSERT INTO dctf_web 
(cnpj_empresa, periodo_apuracao, valor_contribuicoes, valor_creditos, valor_total_devido, data_envio, status_envio)
VALUES 
('12345678000195', '2024-09-01', 100000.00, 5000.00, 95000.00, '2024-09-30', 'Enviado');

-------------------------------------------------------------------------------------------------------------------
TABELA GRF
CREATE TABLE grrf (
    id_grrf INT PRIMARY KEY AUTO_INCREMENT,            -- Identificador único da GRRF
    cnpj_empresa VARCHAR(14) NOT NULL,                 -- CNPJ da empresa responsável pelo recolhimento
    matricula_funcionario INT NOT NULL,                -- Matrícula do funcionário cujo FGTS está sendo recolhido
    data_rescisao DATE NOT NULL,                       -- Data da rescisão do contrato de trabalho
    valor_fgts FLOAT NOT NULL,                         -- Valor do FGTS a ser recolhido
    valor_multa_fgts FLOAT NOT NULL,                   -- Valor da multa rescisória do FGTS (geralmente 40%)
    data_envio DATE NOT NULL,                          -- Data de envio da GRRF
    status_envio VARCHAR(50) NOT NULL,                 -- Status do envio (Enviado, Pendente, Processado)
    
    criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,       -- Data de criação do registro
    ultima_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
                                                       -- Data de última atualização do registro
);

-- Comentários:
-- 1. "cnpj_empresa" identifica a empresa responsável pelo recolhimento.
-- 2. "matricula_funcionario" é o número da matrícula do funcionário cujo FGTS está sendo recolhido.
-- 3. "data_rescisao" é a data da rescisão do contrato de trabalho.
-- 4. "valor_fgts" é o valor do FGTS a ser recolhido.
-- 5. "valor_multa_fgts" representa o valor da multa rescisória (geralmente 40% sobre o saldo do FGTS).
-- 6. "data_envio" e "status_envio" monitoram o envio e o status da guia GRRF.

-- Exemplo de inserção:
INSERT INTO grrf 
(cnpj_empresa, matricula_funcionario, data_rescisao, valor_fgts, valor_multa_fgts, data_envio, status_envio)
VALUES 
('12345678000195', 12345, '2024-09-01', 3000.00, 1200.00, '2024-09-05', 'Enviado');



-------------------------------------------------------------------------------------------------------------------

--Arquivo com dados fixos - fpps
--W_FPPS:=  "F:\FOLHA\"+W_SIGEMP+"\"+W_SIGEMP+'FPPS.DBF'

---IF !FILE("&W_FPPS")   

-- // Arquivo de Empresas-- 
--Criação da tabela FPPS (Dados da Empresa Filial):

USE PESSOAL;
GO

CREATE TABLE FPPS (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY, -- Identificador único do registro (chave primária com auto-incremento)
    
    -- Campos da empresa
    ps_SIGEMP        VARCHAR(2),                       -- Sigla da empresa (2 caracteres)
    ps_NUMEMP        FLOAT,                            -- Número da empresa
    ps_NFILIAL       FLOAT,                            -- Número da filial
    
    -- Informações de endereço
    ps_endemp        VARCHAR(30),                      -- Endereço da empresa (30 caracteres)
    ps_BAIEMP        VARCHAR(20),                      -- Bairro da empresa (20 caracteres)
    ps_CIDEMP        VARCHAR(20),                      -- Cidade da empresa (20 caracteres)
    ps_CEPEMP        VARCHAR(8),                       -- CEP da empresa (8 caracteres)
    ps_ESTEMP        VARCHAR(2),                       -- Estado da empresa (2 caracteres)
    
    -- Identificadores fiscais
    ps_CNPJEMP       VARCHAR(14),                      -- CNPJ da empresa (14 dígitos)
    ps_INSEST        VARCHAR(16),                      -- Inscrição estadual da empresa (16 caracteres)
    
    -- Atividades econômicas
    ps_ATVPRI        VARCHAR(4),                       -- Código da atividade principal (4 caracteres)
    ps_ATVSEC        VARCHAR(4),                       -- Código da atividade secundária (4 caracteres)
    
    -- Quantidade de empregados e dependentes
    ps_QTDPRO        FLOAT,                            -- Quantidade de profissionais
    ps_QTDFAM        FLOAT,                            -- Quantidade de familiares dependentes
    
    -- Informações financeiras e fiscais
    ps_SENEMP        VARCHAR(15),                      -- Senha de acesso da empresa (15 caracteres)
    ps_BAMPIS        VARCHAR(3),                       -- Banco para recolhimento de PIS
    ps_AGEPIS        VARCHAR(4),                       -- Agência do banco para PIS
    ps_DIGPIS        VARCHAR(1),                       -- Dígito verificador do PIS
    
    -- Valores diversos (IRRF, FGTS, etc.)
    ps_VALARR        FLOAT,                            -- Valor arrecadado
    ps_PERQZN        FLOAT,                            -- Percentual aplicado para determinada zona
    ps_DTATU         DATETIME,                         -- Data da última atualização
    ps_DTINIPER      DATETIME,                         -- Data de início do período de apuração
    
    -- Informações adicionais
    ps_MENSAG        VARCHAR(50),                      -- Mensagem adicional ou aviso
    ps_SALMES        VARCHAR(3),                       -- Salário do mês (código)
    ps_SALFAM        VARCHAR(3),                       -- Valor de salário-família (código)
    ps_VBRISCO       VARCHAR(3),                       -- Valor bruto de risco (código)
    
    -- Informações fiscais adicionais
    ps_IAPAS         VARCHAR(3),                       -- Código de recolhimento ao INSS
    ps_CREEXEC       VARCHAR(3),                       -- Crédito executivo
    ps_DBBEXEC       VARCHAR(3),                       -- Débito executivo
    ps_IRFONTE       VARCHAR(3),                       -- Imposto de renda na fonte (código)
    ps_CREARR        VARCHAR(3),                       -- Crédito arrecadado
    ps_DEBARR        VARCHAR(3),                       -- Débito arrecadado
    
    -- 13º Salário
    PS_13SAL         VARCHAR(3),                       -- 13º salário
    ps_ADI13S        VARCHAR(3),                       -- Adiantamento do 13º salário
    ps_DESC13S       VARCHAR(3),                       -- Desconto do 13º salário
    ps_IAPA13        VARCHAR(3),                       -- Código INSS 13º salário
    ps_DIF13C        VARCHAR(3),                       -- Diferença de cálculo 13º salário (código)
    ps_DIF13D        VARCHAR(3),                       -- Diferença de desconto 13º salário (código)
    
    -- Outras informações de férias, salários e valores acumulados
    ps_FERIAS        VARCHAR(3),                       -- Código referente a férias
    ps_DIFSAL        VARCHAR(3),                       -- Diferença salarial (código)
    ps_VLSALFAM      FLOAT,                            -- Valor do salário-família
    ps_VLSALFAM1     FLOAT,                            -- Valor do salário-família 1
    
    -- Outros valores e limites
    ps_SALMIN        FLOAT,                            -- Salário mínimo
    ps_TETIAP        FLOAT,                            -- Teto INSS
    ps_ABADEP        FLOAT,                            -- Abatimento por dependente
    ps_RECMIN        FLOAT,                            -- Recolhimento mínimo
    ps_LIMDED        FLOAT,                            -- Limite de dedução
    ps_VALISE        FLOAT,                            -- Valor de isenção
    ps_PROLAB        FLOAT,                            -- Pro-labore
    ps_VALHORA       FLOAT,                            -- Valor da hora trabalhada

    -- Chave estrangeira para vincular FPPS à tabela FPEMP
    CONSTRAINT FK_FPPS_FPEMP FOREIGN KEY (ps_NUMEMP) REFERENCES FPEMP(ce_NUMEMP),
    
    -- Definição de chaves e índices
    CONSTRAINT PK_FPPS PRIMARY KEY CLUSTERED (ps_NUMEMP), -- Chave primária com índice clusterizado
    CONSTRAINT UNQ_FPPS_CNPJ UNIQUE NONCLUSTERED (ps_CNPJEMP) -- CNPJ deve ser único
);
GO
--Vinculando a tabela FPCD com FPPS (Empresa e Filial):
-- Vinculando FPCD com FPPS considerando empresa (CD_NUMEMP) e filial (CD_NFILIAL)
ALTER TABLE FPCD 
ADD CONSTRAINT FK_FPCD_FPPS FOREIGN KEY (CD_NUMEMP, CD_NFILIAL) REFERENCES FPPS(ps_NUMEMP, ps_NFILIAL);
GO
-------------------------------------------------------------------------------------------------------

--Criação da tabela FPRL (Valores Acumulados Quinzena):
/*
Explicações sobre as tabelas:
FPS :

Contém informações sobre a empresa e sua filial, como CNPJ, endereço, e dados relacionados a negociações e valores fiscais.
Há uma chave primária composta pelo número da empresa ( ps_NUMEMP ) e filial ( ps_NFILIAL ), vinculada à tabela FPEMP .
Definido um índice único para o campo ps_CNPJEMP para garantir a unicidade do CNPJ.
FPCD :

Foi adicionada uma chave estrangeira para vincular a tabela de cadastro de funcionários FPCD com FPPS , com base no número da empresa e filial.
FPRL :

Essa tabela armazena os valores acumulados de proventos e descontos para cada quinzena, como FGTS, INSS e IRRF.
As chaves estrangeiras conectam os registros à tabela de funcionários FPCD e à tabela de empresas FPEMP , co
Essas tabelas modelam uma estrutura de informações fiscais e financeiras que podem ser utilizadas em um sistema contábil e de folha de pagamento, com vínculos consistentes entre empresas, filiais e funcionários.

*/

USE PESSOAL;
GO
-- Tabela FPRL (Valores Acumulados Quinzena)
CREATE TABLE FPRL (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,               -- Identificador único (auto-incremento)
    
    RL_NUMMAT  VARCHAR(6),                             -- Número da matrícula do trabalhador
    RL_NUMLOT  VARCHAR(8),                             -- Número do lote de pagamento
    RL_TOTPRO  FLOAT,                                  -- Total de proventos
    RL_TOTDES  FLOAT,                                  -- Total de descontos
    RL_VALLIQ  FLOAT,                                  -- Valor líquido a receber
    RL_VLFGTS  FLOAT,                                  -- Valor de FGTS recolhido
    RL_VIAPAS  FLOAT,                                  -- Valor de INSS recolhido (IAPAS)
    RL_VALIRF  FLOAT,                                  -- Valor de imposto de renda retido na fonte
    
    -- Informações bancárias
    RL_CODBCO  VARCHAR(3),                             -- Código do banco
    RL_CODAGE  VARCHAR(3),                             -- Código da agência
    RL_NUMCTA  VARCHAR(8),                             -- Número da conta corrente
    
    -- Outras informações de cálculo
    RL_RENBRT  FLOAT,                                  -- Rendimento bruto
    RL_RENTBR  FLOAT,                                  -- Rendimento tributável
    RL_BASIAP  FLOAT,                                  -- Base de cálculo para INSS
    RL_BASFGTS FLOAT,                                  -- Base de cálculo para FGTS
    
    -- Informações da empresa e filial
    RL_NUMEMP  FLOAT,                                  -- Número da empresa
    RL_NFILIAL FLOAT,                                  -- Número da filial
    
    -- Chaves estrangeiras para vinculação
    CONSTRAINT FK_FPRL_FPEMP FOREIGN KEY (RL_NUMEMP, RL_NFILIAL) 
    REFERENCES FPEMP (ID, ce_NFILIAL),
    
    CONSTRAINT FK_FPRL_FPCD FOREIGN KEY (RL_NUMMAT, RL_NUMEMP, RL_NFILIAL)    REFERENCES FPCD (CD_NUMMAT, CD_NUMEMP, CD_NFILIAL));
GO

-- Tabela FPRL (Valores Acumulados Quinzena)
CREATE TABLE FPRL (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,
    RL_NUMMAT  VARCHAR(6), 
    RL_NUMLOT  VARCHAR(8),
    RL_TOTPRO  FLOAT,
    RL_TOTDES  FLOAT,
    RL_VALLIQ  FLOAT,
    RL_VLFGTS  FLOAT,
    RL_VIAPAS  FLOAT,
    RL_VALIRF  FLOAT,
    RL_CODBCO  VARCHAR(3),
    RL_CODAGE  VARCHAR(3), 
    RL_NUMCTA  VARCHAR(8),
    RL_RENBRT  FLOAT,
    RL_RENTBR  FLOAT,
    RL_BASIAP  FLOAT,
    RL_BASFGTS FLOAT,
    RL_NUMEMP  FLOAT,
    RL_NFILIAL FLOAT,
    
    CONSTRAINT FK_FPRL_FPEMP FOREIGN KEY (RL_NUMEMP, RL_NFILIAL)     REFERENCES FPEMP (ID, ce_NFILIAL),
    CONSTRAINT FK_FPRL_FPCD FOREIGN KEY (RL_NUMMAT, RL_NUMEMP, RL_NFILIAL)     REFERENCES FPCD (CD_NUMMAT, CD_NUMEMP, CD_NFILIAL)
);
GO

-- Tabela FPRLD (Valores Acumulados 2)
CREATE TABLE FPRLD (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,
    ID_RLDMAT VARCHAR(6),
    RL_NUMLOT VARCHAR(8),
    RL_TOTPRO FLOAT,
    RL_TOTDES FLOAT,
    RL_VALLIQ FLOAT,
    RL_VLFGTS FLOAT,
    RL_VIAPAS FLOAT,
    RL_VALIRF FLOAT,
    RL_CODBCO VARCHAR(3),
    RL_CODAGE VARCHAR(3),
    RL_NUMCTA VARCHAR(8),
    RL_RENBRT FLOAT,
    RL_RENTBR FLOAT,
    RL_BASIAP FLOAT,
    RL_BASFGTS FLOAT,
    RL_NUMEMP FLOAT,
    RL_NFILIAL FLOAT,
    
    CONSTRAINT FK_FPRLD_FPEMP FOREIGN KEY (RL_NUMEMP, RL_NFILIAL)               REFERENCES FPEMP (ID, ce_NFILIAL),
    CONSTRAINT FK_FPRLD_FPCD FOREIGN KEY (ID_RLDMAT, RL_NUMEMP, RL_NFILIAL)     REFERENCES FPCD (CD_NUMMAT, CD_NUMEMP, CD_NFILIAL)
);
GO

-- Tabela FPRLS (Valores Acumulados Diário/Semanal)
CREATE TABLE FPRLS (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,
    RL_NUMMAT VARCHAR(6),
    RL_NUMLOT VARCHAR(8),
    RL_TOTPRO FLOAT,
    RL_TOTDES FLOAT,
    RL_VALLIQ FLOAT,
    RL_VLFGTS FLOAT,
    RL_VIAPAS FLOAT,
    RL_VALIRF FLOAT,
    RL_CODBCO VARCHAR(3),
    RL_CODAGE VARCHAR(3), 
    RL_NUMCTA VARCHAR(8),
    RL_RENBRT FLOAT,
    RL_RENTBR FLOAT,
    RL_BASIAP FLOAT,
    RL_BASFGTS FLOAT,
    RL_NUMEMP FLOAT,
    RL_NFILIAL FLOAT,

    CONSTRAINT FK_FPRLS_FPEMP FOREIGN KEY (RL_NUMEMP, RL_NFILIAL) 
    REFERENCES FPEMP (ID, ce_NFILIAL),
    CONSTRAINT FK_FPRLS_FPCD FOREIGN KEY (RL_NUMMAT, RL_NUMEMP, RL_NFILIAL)  
    REFERENCES FPCD (CD_NUMMAT, CD_NUMEMP, CD_NFILIAL)
);
GO

-- Tabela FPBA (Dados do Banco da Empresa)
CREATE TABLE FPBA (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,
    BA_CODBCO VARCHAR(3),
    BA_CODAGE VARCHAR(4),
    BA_DIGITO VARCHAR(1),
    BA_NOMBCO VARCHAR(20),
    BA_NOMAGE VARCHAR(20),
    BA_CIDAGE VARCHAR(20),
    BA_ESTAGE VARCHAR(2),
    BA_CEPAGE VARCHAR(8),
    RL_NUMEMP FLOAT,
    RL_NFILIAL FLOAT,

    CONSTRAINT FK_FPBA_FPEMP FOREIGN KEY (RL_NUMEMP, RL_NFILIAL) 
    REFERENCES FPEMP (ID, ce_NFILIAL),
    CONSTRAINT FK_FPBA_FPCD FOREIGN KEY (RL_NUMEMP, RL_NFILIAL)   REFERENCES FPCD (CD_NUMEMP, CD_NFILIAL)
);
GO

-- Tabela FPFU (Arquivo de Funções)
CREATE TABLE FPFU (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,
    FU_CODFUN VARCHAR(7),
    FU_NOMFUN VARCHAR(20),
    FU_NUMEMP FLOAT,
    FU_NFILIAL FLOAT,

    CONSTRAINT FK_FPFU_FPEMP FOREIGN KEY (FU_NUMEMP, FU_NFILIAL) 
    REFERENCES FPEMP (ID, ce_NFILIAL),
    CONSTRAINT FK_FPFU_FPCD FOREIGN KEY (FU_NUMEMP, FU_NFILIAL)     REFERENCES FPCD (CD_NUMEMP, CD_NFILIAL)
);
GO

-- Vinculando a tabela FPCD com a tabela FPEMP pela empresa e filial
ALTER TABLE FPCD 
ADD CONSTRAINT FK_FPCD_FPEMP 
FOREIGN KEY (CD_NUMEMP, CD_NFILIAL) REFERENCES FPEMP (ID, ce_NFILIAL);
GO

USE PESSOAL;
GO

-- Tabela VERBAS_FER (Verbas de Férias) com vínculo à FPEMP
CREATE TABLE VERBAS_FER (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,
    MFF_NUMMAT   VARCHAR(6),
    MFF_ANOMES   VARCHAR(4),
    MFF_CODVER   VARCHAR(3),
    MFF_QTDHOR   FLOAT,
    MFF_VALVER   FLOAT,
    MFF_NUMEMP   FLOAT,
    MFF_NFILIAL  FLOAT,

    CONSTRAINT FK_VERBAS_FER_FPCD FOREIGN KEY (MFF_NUMMAT, MFF_NUMEMP, MFF_NFILIAL)
    REFERENCES FPCD (CD_NUMMAT, CD_NUMEMP, CD_NFILIAL),
    
    CONSTRAINT FK_VERBAS_FER_FPEMP FOREIGN KEY (MFF_NUMEMP, MFF_NFILIAL)   REFERENCES FPEMP (ID, ce_NFILIAL)
);
GO

-- Tabela VERBAS_RES (Verbas de Rescisão) com vínculo à FPEMP
CREATE TABLE VERBAS_RES (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,
    MR_NUMMAT   VARCHAR(6),
    MR_ANOMES   VARCHAR(4),
    MR_CODVER   VARCHAR(3),
    MR_QTDHOR   FLOAT,
    MR_VALVER   FLOAT,
    MR_NUMEMP   FLOAT,
    MR_NFILIAL  FLOAT,

    CONSTRAINT FK_VERBAS_RES_FPCD FOREIGN KEY (MR_NUMMAT, MR_NUMEMP, MR_NFILIAL)
    REFERENCES FPCD (CD_NUMMAT, CD_NUMEMP, CD_NFILIAL),
    
    CONSTRAINT FK_VERBAS_RES_FPEMP FOREIGN KEY (MR_NUMEMP, MR_NFILIAL)  REFERENCES FPEMP (ID, ce_NFILIAL)
);
GO

-- Tabela FPVB (Verbas Incidências) com vínculo à FPEMP
CREATE TABLE FPVB (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,
    VB_CODVER    VARCHAR(3),
    VB_NOMVER    VARCHAR(20),
    VB_NOMABV    VARCHAR(12),
    VB_FORVER    VARCHAR(1),
    VB_TIPVER    VARCHAR(1),
    VB_IRFONTE   VARCHAR(1),
    VB_IRANUAL   VARCHAR(1),
    VB_FGTS      VARCHAR(1),
    VB_IAPAS     VARCHAR(1),
    VB_13SAL     VARCHAR(1),
    VB_FERIAS    VARCHAR(1),
    VB_RESCIS    VARCHAR(1),
    VB_RAIS      VARCHAR(1),
    VB_EXPINF    VARCHAR(70),
    VB_EXPPOS    VARCHAR(70),
    VB_NUMEMP    FLOAT,
    VB_NFILIAL   FLOAT,

    CONSTRAINT FK_FPVB_FPEMP FOREIGN KEY (VB_NUMEMP, VB_NFILIAL)  REFERENCES FPEMP (ID, ce_NFILIAL)
);
GO

USE PESSOAL;
GO
-- // Arquivo de 13er. Salario
-- Tabela FP13 (13º Salário) com vínculos à FPEMP e FPCD

USE PESSOAL;
GO

-- Tabela FP13 (13º Salário) com FLOAT e DATETIME, criando chave primária por empresa e filial, 
-- e vinculando à FPEMP (pela empresa e filial) e FPCD (pela matrícula)
CREATE TABLE FP13 (
    M13_NUMEMP   FLOAT,
    M13_NFILIAL  FLOAT,
    M13_NUMMAT   VARCHAR(6), 
    M13_NUMLOT   VARCHAR(8), 
    M13_CODVER   VARCHAR(3), 
    M13_QTDHOR   FLOAT,
    M13_PROPOR   FLOAT,
    M13_VAL13S   FLOAT,
    M13_VALADI   FLOAT,
    M13_IAP13S   FLOAT,

    CONSTRAINT PK_FP13 PRIMARY KEY (M13_NUMEMP, M13_NFILIAL, M13_NUMMAT),

    CONSTRAINT FK_FP13_FPEMP FOREIGN KEY (M13_NUMEMP, M13_NFILIAL)
    REFERENCES FPEMP (ID, ce_NFILIAL),

    CONSTRAINT FK_FP13_FPCD FOREIGN KEY (M13_NUMMAT, M13_NUMEMP, M13_NFILIAL)
    REFERENCES FPCD (CD_NUMMAT, CD_NUMEMP, CD_NFILIAL)
);
GO

USE PESSOAL;
GO

 --// Arquivo de Movimento
 --- Tabela FPMVB (Movimento) com ID como chave primária e vínculos à FPEMP e FPCD
CREATE TABLE FPMVB (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,
    MV_NUMEMP   FLOAT,
    MV_NFILIAL  FLOAT,
    MV_NUMMAT   VARCHAR(6),
    MV_TIPMOV   VARCHAR(1),
    MV_CODVER   VARCHAR(3),
    MV_NUMLOT   VARCHAR(8),
    MV_CODRET   FLOAT,
    MV_VALMOV   FLOAT,

    CONSTRAINT FK_FPMVB_FPEMP FOREIGN KEY (MV_NUMEMP, MV_NFILIAL)
    REFERENCES FPEMP (ID, ce_NFILIAL),

    CONSTRAINT FK_FPMVB_FPCD FOREIGN KEY (MV_NUMMAT, MV_NUMEMP, MV_NFILIAL)
    REFERENCES FPCD (CD_NUMMAT, CD_NUMEMP, CD_NFILIAL)
);
GO

 --// Arquivo de Movimento
 
-- Tabela FPMV (Movimento) com ID como chave primária e vínculos à FPEMP e FPCD
CREATE TABLE FPMV (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,
    MV_NUMEMP   FLOAT,
    MV_NFILIAL  FLOAT,
    MV_NUMMAT   VARCHAR(6),
    MV_TIPMOV   VARCHAR(1),
    MV_CODVER   VARCHAR(3),
    MV_NUMLOT   VARCHAR(8),
    MV_CODRET   FLOAT,
    MV_VALMOV   FLOAT,

    CONSTRAINT FK_FPMV_FPEMP FOREIGN KEY (MV_NUMEMP, MV_NFILIAL)
    REFERENCES FPEMP (ID, ce_NFILIAL),

    CONSTRAINT FK_FPMV_FPCD FOREIGN KEY (MV_NUMMAT, MV_NUMEMP, MV_NFILIAL)
    REFERENCES FPCD (CD_NUMMAT, CD_NUMEMP, CD_NFILIAL)
);
GO

 --// Arquivo de Valores Acumulados
-- Tabela FPVA (Valores Acumulados) com ID como chave primária e vínculos à FPEMP e FPCD
CREATE TABLE FPVA (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,
    VA_NUMEMP   FLOAT,
    VA_NFILIAL  FLOAT,
    VA_NUMMAT   VARCHAR(6),
    VA_NUMLOT   VARCHAR(8),
    VA_DIA      VARCHAR(2),
    VA_ANOMES   VARCHAR(4),
    VA_CODVER   VARCHAR(3),
    VA_QTDHOR   FLOAT,
    VA_VALVER   FLOAT,
    VA_RES      VARCHAR(1),
    VA_INSIDE   VARCHAR(1),
    VA_VERBA    VARCHAR(1),
    VA_FATOR    VARCHAR(5),

    CONSTRAINT FK_FPVA_FPEMP FOREIGN KEY (VA_NUMEMP, VA_NFILIAL)
    REFERENCES FPEMP (ID, ce_NFILIAL),

    CONSTRAINT FK_FPVA_FPCD FOREIGN KEY (VA_NUMMAT, VA_NUMEMP, VA_NFILIAL)
    REFERENCES FPCD (CD_NUMMAT, CD_NUMEMP, CD_NFILIAL)
);
GO

USE PESSOAL;
GO


 ---// Arquivo 
  
-- Tabela FPRF com ID como chave primária, vinculando à FPEMP (pela empresa e filial) e à FPCD (pela matrícula)
CREATE TABLE FPRF (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,
    RF_NUMEMP   FLOAT,
    RF_NFILIAL  FLOAT,
    RF_NUMLOT   VARCHAR(8),
    RF_CODVER   VARCHAR(3),
    RF_VALVER   FLOAT,
    RF_QTDHOR   FLOAT,

    CONSTRAINT FK_FPRF_FPEMP FOREIGN KEY (RF_NUMEMP, RF_NFILIAL)
    REFERENCES FPEMP (ID, ce_NFILIAL)
);
GO

 ---// Arquivo Arq. p/ rais.
  
-- Tabela FPVR com ID como chave primária, vinculando à FPEMP (pela empresa e filial) e à FPCD (pela matrícula)
CREATE TABLE FPVR (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,
    VR_NUMEMP   FLOAT,
    VR_NFILIAL  FLOAT,
    VR_NUMMAT   VARCHAR(6),
    VR_CODVER   VARCHAR(3),
    VR_QTDHOR   FLOAT,
    VR_VALVER   FLOAT,

    CONSTRAINT FK_FPVR_FPEMP FOREIGN KEY (VR_NUMEMP, VR_NFILIAL)
    REFERENCES FPEMP (ID, ce_NFILIAL),

    CONSTRAINT FK_FPVR_FPCD FOREIGN KEY (VR_NUMMAT, VR_NUMEMP, VR_NFILIAL)
    REFERENCES FPCD (CD_NUMMAT, CD_NUMEMP, CD_NFILIAL)
);
GO
