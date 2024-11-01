
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

--USE [FolhaPag];
GO
CREATE TABLE FPEMP (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,         -- Identificador único com auto-incremento (BIGINT)
	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde
    --ce_NUMEMP  FLOAT,                           -- Número da empresa (FLOAT)
    ce_NFILIAL SMALLINT,                           -- Número da filial (FLOAT)
    --ce_SIGEMP  VARCHAR(2),                      -- Sigla da empresa (2 caracteres)
    CNPJ       VARCHAR(18),                           -- CNPJ 
    CE_RAZSOC  VARCHAR(14),                     -- Razão social da empresa (até 14 caracteres)
    CE_SENEMP  VARCHAR(30),                     -- Senha da empresa (até 30 caracteres)
    CE_SEQDTA  DATETIME,                        -- Data de sequência de alguma operação
    CE_SEQNSA  FLOAT,                           -- Sequência de notas fiscais (FLOAT)
    ce_PATH    VARCHAR(30),                     -- Caminho de armazenamento (até 30 caracteres)
    ce_TMP     VARCHAR(30),                     -- Caminho temporário de armazenamento (até 30 caracteres)
    ce_ANO     VARCHAR(2),                      -- Ano de referência (até 2 caracteres)
    ce_TIPO    FLOAT,                           -- Tipo da empresa (FLOAT)
    ce_CLASSE  FLOAT,                           -- Classe da empresa (FLOAT)
    ce_CNAE    FLOAT,                           -- Código CNAE da empresa (FLOAT)
    ce_SAT     FLOAT,                           -- Alíquota do SAT (FLOAT)
    ce_FPAS    FLOAT,                           -- Código FPAS da empresa (FLOAT)
    ce_CATEMP  VARCHAR(1),                      -- Categoria da empresa (1 caractere)
    ce_BANCO   VARCHAR(8),                      -- Código do banco (até 8 caracteres)
    ce_TEL     VARCHAR(12),                     -- Telefone da empresa (até 12 caracteres)
    ce_FAX     VARCHAR(12),                     -- Número de fax (até 12 caracteres)
    ce_TELEX   VARCHAR(12),                     -- Número de telex (até 12 caracteres)
    ce_CONTATO VARCHAR(30),                     -- Nome do contato principal (até 30 caracteres)
    ce_INSS    VARCHAR(30),                     -- Número do INSS (até 30 caracteres)
    ce_INDINSS FLOAT,                           -- Indicador do INSS (FLOAT)
    ce_DTRECINSS DATETIME,                      -- Data de recebimento do INSS
    ce_SIMPLES  FLOAT,                          -- Indicador de participação no Simples Nacional (FLOAT)
    ce_CTERCEIRO FLOAT
);
GO
novo fpemp
USE [FolhaPag]
GO

/****** Object:  Table [dbo].[FPEMP]    Script Date: 01/11/2024 11:43:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FPEMP](
[id] BIGINT IDENTITY(1,1) NOT NULL, --- Identificador único da tabela, campo `IDENTITY`.
[id_fpemp] BIGINT NULL, --- Identificador da empresa pai (para relacionar com uma empresa matriz ou filial).
[ce_nfilial] SMALLINT NULL, --- Número da filial, se aplicável.
[ce_CNPJEMP] VARCHAR(18) NULL, --- CNPJ da empresa.
[CE_RAZSOC] VARCHAR(40) NULL, --- Razão social da empresa (nome jurídico).
[ce_nome_fant] VARCHAR(40) NULL, --- Nome fantasia da empresa (nome popular).
[ce_inscest] VARCHAR(16) NULL, --- Inscrição estadual, usada para identificação em operações fiscais.
[ce_inscmunic] VARCHAR(20) NULL, --- Inscrição municipal, usada para identificação fiscal no município.
[ce_naturez_jur] VARCHAR(50) NULL, --- Natureza jurídica da empresa, como MEI, LTDA, EIRELI, etc.
[ce_endemp] VARCHAR(30) NULL, --- Endereço da sede da empresa.
[ce_num] INT NULL, --- Número do endereço.
[ce_compl] VARCHAR(40) NULL, --- Complemento do endereço (ex: bloco, apto).
[ce_baiemp] VARCHAR(20) NULL, --- Bairro da localização da empresa.
[ce_cidemp] VARCHAR(20) NULL, --- Cidade onde a empresa está localizada.
[ce_ufemp] CHAR(2) NULL, --- Unidade Federativa (Estado) da empresa (ex: SP, RJ).
[ce_cep] VARCHAR(8) NULL, --- Código postal (CEP) do endereço da empresa.
[ce_Telef] VARCHAR(15) NULL, --- Número de telefone para contato da empresa.
[ce_contato_emp] VARCHAR(30) NULL, --- Nome do contato principal na empresa.
[ce_e_mail] VARCHAR(MAX) NULL, --- Endereço de e-mail principal para comunicação com a empresa.
[ce_dtini_ativ] DATE NULL, --- Data de início das atividades da empresa.
[ce_sit_cadast] VARCHAR(20) NULL, --- Situação cadastral da empresa (ex: ativa, inativa).
[ce_dtsit_cadast] DATE NULL, --- Data de atualização da situação cadastral.
[ce_tipo_reg_trib] VARCHAR(50) NULL, --- Tipo de regime tributário da empresa (ex: Simples Nacional, Lucro Presumido).
[ce_porte_emp] VARCHAR(50) NULL, --- Porte da empresa, como pequeno, médio ou grande.
[ce_resp_nome] VARCHAR(40) NULL, --- Nome do responsável pela empresa.
[ce_resp_cpf] VARCHAR(11) NULL, --- CPF do responsável pela empresa.
[ce_resp_email] VARCHAR(100) NULL, --- E-mail do responsável pela empresa.
[ce_resp_tel] VARCHAR(15) NULL, --- Telefone do responsável pela empresa.
[ce_criado_em] DATETIME DEFAULT GETDATE(), --- Data de criação do registro, com valor padrão de `GETDATE()`.
[ce_atual_em] DATETIME DEFAULT GETDATE(), --- Data de última atualização do registro, com valor padrão de `GETDATE()`.
[ce_cibge_munemp] VARCHAR(6) NULL, --- Código do IBGE referente ao município da empresa.
[ce_cibge_cidemp] VARCHAR(6) NULL, --- Código do IBGE referente à cidade da empresa.
[ce_tipemp] FLOAT NULL, --- Tipo de empresa (pode representar classificações internas).
[ce_CLASSE] VARCHAR(3) NULL, --- Classe de classificação da empresa.
[ce_CNAE] VARCHAR(MAX) NULL, --- Código Nacional de Atividades Econômicas, indicando a atividade principal da empresa.
[ce_aliqsatemp] FLOAT NULL, --- Alíquota de SAT (Seguro Acidente de Trabalho) da empresa.
[ce_cfpas_emp] VARCHAR(30) NULL, --- Código do FPAS (Fundo de Previdência e Assistência Social).
[ce_CAT_EMP] VARCHAR(1) NULL, --- Categoria da empresa (classificação adicional).
[ce_bco_emp] FLOAT NULL, --- Número do banco da conta da empresa.
[ce_age_emp] FLOAT NULL, --- Número da agência bancária da empresa.
[ce_cta_dig_emp] FLOAT NULL, --- Conta e dígito verificador da conta bancária da empresa.
[ce_ninss_emp] VARCHAR(30) NULL, --- Número do INSS da empresa.
[ce_indinss] BIT NULL, --- Indicador de contribuição ao INSS (1 para sim, 0 para não).
[ce_dtrecinss] DATE NULL, --- Data de recebimento da contribuição ao INSS.
[ce_simplnac_emp] BIT NULL, --- Indicador de adesão ao Simples Nacional (1 para sim, 0 para não).
[ce_codterceiro] FLOAT NULL, --- Código de terceiros para contribuição (ex: SESCOOP, SENAC).
[ce_ATVPRI] VARCHAR(4) NULL, --- Código da atividade principal.
[ce_ATVSEC] VARCHAR(4) NULL, --- Código da atividade secundária.
[ce_bcopis] VARCHAR(3) NULL, --- Código do banco específico para PIS.
[ce_agepis] VARCHAR(4) NULL, --- Código da agência para depósito de PIS.
[ce_digpis] VARCHAR(1) NULL, --- Dígito verificador da conta PIS.
[ce_mensag] VARCHAR(50) NULL --- Campo para observações ou mensagens adicionais.



-- Cadastro de funcionarios 
/*
Explicação:
Vínculos com FPEMP: Os campos CD_NUMEMP e CD_NFILIAL fazem referência à tabela FPEMP, garantindo que cada funcionário esteja vinculado a uma empresa e filial.
Dados de eSocial: Campos como CD_NUMDEP, CD_CATDIS, e outros relacionados a segurança e saúde no trabalho (SST) e FGTS fazem parte dos dados exigidos pelo eSocial.
Vínculos com outras tabelas: A tabela FPCD possui relacionamentos com outras tabelas auxiliares (FPCF, FPLT, FPRL, entre outras) para garantir a integridade dos dados dos funcionários.
USE PESSOAL;
GO
todas essas tabelas faz parte de cadastros funcionarioa e dados do e-social, Rescreva  identificando os campos e comentando criar o vinculo com fpemp pela empresa, filial e o que faz parte do e-social.

*/


GO

CREATE TABLE FPCD (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,           -- Identificador único com auto-incremento (BIGINT)
    ID_FPEMP BIGINT REFERENCES FPEMP(ID), 
    CD_NUMMAT        VARCHAR(6),                   -- Número da matrícula do funcionário (chave primária)
    CD_NOMFUN        VARCHAR(40),                  -- Nome completo do funcionário
    CD_NUMLOT        VARCHAR(8),                   -- Número do lote do funcionário
    CD_NUMCBO        VARCHAR(7),                   -- Código CBO (Classificação Brasileira de Ocupações)
    CD_CATDIS        VARCHAR(1),                   -- Categoria de trabalhador com deficiência (eSocial)
    CD_SEXO          VARCHAR(1),                   -- Sexo do funcionário (M/F)
    CD_DTNASC        DATETIME,                     -- Data de nascimento do funcionário
    CD_NACION        VARCHAR(2),                   -- Nacionalidade do funcionário
    CD_ANOCHE        VARCHAR(4),                   -- Ano de chegada ao Brasil (se aplicável)
    CD_ESTCIV        VARCHAR(1),                   -- Estado civil do funcionário
    CD_GRINST        VARCHAR(1),                   -- Grau de instrução
    CD_NATURA        VARCHAR(2),                   -- Naturalidade do funcionário
    CD_NUMFIL        FLOAT,                        -- Número de filhos do funcionário
    CD_NUMDEP        FLOAT,                        -- Número de dependentes do funcionário (eSocial)
    CD_DTADM         DATETIME,                     -- Data de admissão do funcionário
    CD_CODSIT        VARCHAR(1),                   -- Código de situação do funcionário (Ativo, Afastado)
    CD_DTAFAS        DATETIME,                     -- Data de afastamento (se aplicável)
    CD_EMPANT        VARCHAR(1),                   -- Indicador de emprego anterior
    CD_ALTURA        FLOAT,                        -- Altura do funcionário (em metros)
    CD_PESO          VARCHAR(3),                   -- Peso do funcionário (em kg)
    CD_RACOR         VARCHAR(10),                  -- Raça/Cor (eSocial)
    CD_CORCAB        VARCHAR(10),                  -- Cor do cabelo
    CD_COROLH        VARCHAR(10),                  -- Cor dos olhos
    CD_TPSANG        VARCHAR(2),                   -- Tipo sanguíneo do funcionário
    CD_NUMCTP        VARCHAR(7),                   -- Número da Carteira de Trabalho e Previdência Social (CTPS)
    CD_SERCTP        VARCHAR(5),                   -- Série da CTPS
    CD_ESTCTP        VARCHAR(2),                   -- Estado emissor da CTPS
    CD_NUMRG         VARCHAR(11),                  -- Número do RG
    CD_ORGEMRG       VARCHAR(3),                   -- Órgão emissor do RG
    CD_ESTRG         VARCHAR(2),                   -- Estado emissor do RG
    CD_DTEXRG        DATETIME,                     -- Data de expedição do RG
    CD_NUMCPF        VARCHAR(11),                  -- CPF do funcionário
    CD_NPISNIT       VARCHAR(11),                  -- Número do PIS/NIT (eSocial)
    CD_NUMCNH        VARCHAR(11),                  -- Número da CNH
    CD_ESTCNH        VARCHAR(2),                   -- Estado emissor da CNH
    CD_CATCNH        VARCHAR(3),                   -- Categoria da CNH
    CD_DTEMCNH       DATETIME,                     -- Data de emissão da CNH
    CD_DTVENCNH      DATETIME,                     -- Data de vencimento da CNH
    CD_DTPRICNH      DATETIME,                     -- Data da primeira CNH
    CD_NUMTIT        VARCHAR(12),                  -- Número do título de eleitor
    CD_NUMZONA       VARCHAR(3),                   -- Número da zona eleitoral
    CD_NUMSECAO      VARCHAR(5),                   -- Número da seção eleitoral
    CD_NUMRESER      VARCHAR(15),                  -- Número do certificado de reservista
    CD_BCOCTA        VARCHAR(3),                   -- Código do banco para conta salário
    CD_AGECTA        VARCHAR(4),                   -- Agência bancária da conta salário
    CD_NUMCTA        VARCHAR(8),                   -- Número da conta salário
    CD_DIGCTA        VARCHAR(1),                   -- Dígito verificador da conta salário
    CD_DTULTF        DATETIME,                     -- Data do último pagamento
    CD_CODCEF        VARCHAR(11),                  -- Código da Caixa Econômica para FGTS
    CD_CODFGTS       VARCHAR(1),                   -- Código de FGTS
    CD_DTFGTS        DATETIME,                     -- Data de recolhimento do FGTS
    CD_BCFGTS        VARCHAR(3),                   -- Banco de recolhimento do FGTS
    CD_AGFGTS        VARCHAR(4),                   -- Agência bancária de recolhimento do FGTS
    CD_CODRES        VARCHAR(1),                   -- Código de rescisão do contrato
    CD_DTRES         DATETIME,                     -- Data de rescisão
    CD_HORSEM        FLOAT,                        -- Horas semanais trabalhadas
    CD_EXAMED        VARCHAR(4),                   -- Indicador de exame demissional
    CD_MOTAFA        VARCHAR(1),                   -- Motivo de afastamento
    CD_NUMCAR        VARCHAR(4),                   -- Número da carteira do funcionário
    CD_PERPAG        VARCHAR(6),                   -- Período de pagamento
    CD_VINEMP        VARCHAR(1),                   -- Indicador de vínculo empregatício
    CD_NUMFIC        VARCHAR(5),                   -- Número da ficha de registro do funcionário
    CD_SALMES        FLOAT,                        -- Salário mensal
    CD_SALBAS        FLOAT,                        -- Salário base
    CD_FAISAL        VARCHAR(6),                   -- Faixa salarial
    CD_FGTS01        FLOAT,                        -- FGTS referente a janeiro
    CD_FGTS02        FLOAT,                        -- FGTS referente a fevereiro
    CD_FGTS03        FLOAT,                        -- FGTS referente a março
    CD_FGTS04        FLOAT,                        -- FGTS referente a abril
    CD_FGTS05        FLOAT,                        -- FGTS referente a maio
    CD_FGTS06        FLOAT,                        -- FGTS referente a junho
    CD_FGTS07        FLOAT,                        -- FGTS referente a julho
    CD_FGTS08        FLOAT,                        -- FGTS referente a agosto
    CD_FGTS09        FLOAT,                        -- FGTS referente a setembro
    CD_FGTS10        FLOAT,                        -- FGTS referente a outubro
    CD_FGTS11        FLOAT,                        -- FGTS referente a novembro
    CD_FGTS12        FLOAT,                        -- FGTS referente a dezembro
    CD_ENDFUN        VARCHAR(40),                  -- Endereço do funcionário
    CD_COMFUN        VARCHAR(15),                  -- Complemento do endereço
    CD_BAIFUN        VARCHAR(15),                  -- Bairro do funcionário
    CD_CEPFUN        VARCHAR(8),                   -- CEP
    CD_CIDFUN        VARCHAR(20),                  -- Cidade
    CD_ESTFUN        VARCHAR(2),                   -- Estado
    CD_TELFUN        VARCHAR(11),                  -- Telefone
    CD_PERQZN        FLOAT,                        -- Percentual da quinzena
    CD_HORA          TIME(6),                      -- Horário de trabalho
    CD_HORTRB        VARCHAR(10),                  -- Descrição do horário de trabalho
    CD_INTERV        VARCHAR(10),                  -- Intervalo de trabalho
    CD_SINDICA       VARCHAR(1),                   -- Indicador de sindicalização
    CD_CONFEDE       VARCHAR(1),                   -- Indicador de contribuição confederativa
    CD_FERVEN        FLOAT,                        -- Verba de férias vencida
    CD_HORAULA       FLOAT,                        -- Valor da hora/aula
    CD_VALAULA       FLOAT,                        -- Valor da aula
    CD_QUINQUE       VARCHAR(1),                   -- Indicação de quinquênio
    CD_PERQUIN       VARCHAR(6),                   -- Período do quinquênio
    CD_SUPER         VARCHAR(1),                   -- Indicador de supervisão
    CD_PERSUP        FLOAT,                        -- Percentual de supervisão
    CD_PROVA         VARCHAR(1),                   -- Indicador de provisão
    CD_PERPROV       FLOAT,                        -- Percentual de provisão
    CD_SINDESC       VARCHAR(1),                   -- Indicador de desconto sindical
    CD_PERSIND       FLOAT,                        -- Percentual de desconto sindical
    CD_VALE          VARCHAR(1),                   -- Indicador de vale-transporte
    CD_PERVALE       FLOAT,                        -- Percentual de desconto do vale-transporte
    CD_DRCT          VARCHAR(1),                   -- Indicador de desconto de diretoria
    CD_PERDRCT       FLOAT,                        -- Percentual de desconto de diretoria
    CD_UNITRAB       VARCHAR(15),                  -- Unidade de trabalho
    CD_CODADM        VARCHAR(2),                   -- Código do administrador
    CD_DTMOVI        DATETIME,                     -- Data de movimentação
    CD_COD_MOV       VARCHAR(1),                   -- Código de movimentação
    CD_NOMEMAE       VARCHAR(40),                  -- Nome da mãe do funcionário
    CD_NOMEPAI       VARCHAR(40),                  -- Nome do pai do funcionário
    CD_NOMECONJ      VARCHAR(40),                  -- Nome do cônjuge do funcionário
    CD_CIDNASC       VARCHAR(20),                  -- Cidade de nascimento
    CD_ESTCONJ       VARCHAR(2),                   -- Estado do cônjuge
    CD_DTNACONJ      DATETIME
    
);
GO

----------------------------------------------------------------------------------------------------
-- Complemento dos cadastros para geracao de e-social;

--Estrutura da Tabela para SST.
/*
Explicação dos Campos Adicionados:
SST (Segurança e Saúde no Trabalho): Os campos adicionados relacionados ao SST permitem rastrear o monitoramento de saúde do trabalhador e qualquer exposição a condições ambientais perigosas. Isso é essencial para o cumprimento das obrigações do eSocial, como a comunicação de acidentes de trabalho (CAT).

Dependentes: Os novos campos relacionados aos dependentes do trabalhador armazenam informações adicionais, como nome, data de nascimento e grau de parentesco, necessários para gerar relatórios e realizar cálculos, como deduções no IRRF.

Contrato de Trabalho: Esses campos armazenam informações sobre o tipo de contrato e a jornada de trabalho do funcionário, conforme exigido no eSocial para o envio de eventos trabalhistas.

Desligamento: Este campo armazena o motivo do desligamento do trabalhador, o que é importante para rescisões e envios ao eSocial.

Complemento de Endereço: Este campo adicional permite armazenar informações mais detalhadas sobre o endereço do trabalhador, como complemento ou referência.

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


### 2. Tabela **FPCD_SST** (Dados de SST relacionados ao eSocial)
*/

-----------------------------------------------------------------------------------------------------
CREATE TABLE FPCD_SST (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,   -- Identificador único com auto-incremento (BIGINT) para cada registro de SST
	ID_FPEMP BIGINT REFERENCES FPEMP(ID),   -- * Empresa
	ID_FPCD BIGINT REFERENCES FPCD(ID),     -- * Funcionario
    CD_NUMMAT VARCHAR(6) NOT NULL,             -- Número da matrícula do trabalhador (ligação com FPCD)
    CD_MONITORAMENTO_SAUDE VARCHAR(1),         -- Indicador se o trabalhador está sob monitoramento de saúde ocupacional (Sim/Não)
    CD_CONDICOES_AMBIENTAIS VARCHAR(1),        -- Indica se há exposição a condições ambientais de risco (Sim/Não)
    CD_CODCAT VARCHAR(10),                     -- Código do CAT (Comunicação de Acidente de Trabalho)
    CD_DESCRICAO_ACIDENTE VARCHAR(255),        -- Descrição detalhada do acidente, se houver
    CD_DATA_ACIDENTE DATETIME,                 -- Data do acidente de trabalho, se aplicável
    CD_RESULTADO_EXAME VARCHAR(50),            -- Resultado dos exames médicos realizados no trabalhador
    CD_CIDEXAM VARCHAR(10),                    -- Código CID (Classificação Internacional de Doenças) do exame realizado
    CD_MEDICO_RESPONSAVEL VARCHAR(40),         -- Nome do médico responsável pelo exame ocupacional
    CD_DTAEXAM DATETIME,                       -- Data em que o exame ocupacional foi realizado
    CD_TIPO_EXAME VARCHAR(1),                  -- Tipo de exame (A: Admissional, P: Periódico, D: Demissional)
    CD_PROF_RISCO VARCHAR(1),                  -- Indica se o trabalhador está exposto a riscos ocupacionais (Sim/Não)
    CD_TIPO_RISCO VARCHAR(50),                 -- Tipo de risco ao qual o trabalhador está exposto (físico, químico, biológico, etc.)
    CD_GRAU_RISCO VARCHAR(1),                  -- Grau do risco (B: Baixo, M: Médio, A: Alto)
    CD_INICIO_EXPOSICAO DATETIME,              -- Data de início da exposição ao risco ocupacional
    CD_TEMPO_EXPOSICAO VARCHAR(20)             -- Tempo de exposição do trabalhador ao risco (em dias, meses ou anos)
)
GO

--Campos Adicionados à Tabela FPCD (Cadastro de Funcionários)

--1. Campos Relacionados à Segurança e Saúde no Trabalho (SST):
ALTER TABLE FPCD ADD CD_SST_MONITORAMENTO VARCHAR(1);  -- Indica se o trabalhador está sendo monitorado em relação à saúde ocupacional (Sim/Não)
ALTER TABLE FPCD ADD CD_SST_CONDICOES_TRAB VARCHAR(1); -- Indica se o trabalhador está exposto a condições ambientais no trabalho (Sim/Não)
ALTER TABLE FPCD ADD CD_SST_CIDCAT VARCHAR(10);        -- Código do CAT (Comunicação de Acidente de Trabalho) associado ao trabalhador

--2. Campos Relacionados aos Dependentes:

ALTER TABLE FPCD ADD CD_NOME_DEP VARCHAR(40);          -- Nome dos dependentes do trabalhador
ALTER TABLE FPCD ADD CD_DT_NASC_DEP DATETIME;          -- Data de nascimento dos dependentes
ALTER TABLE FPCD ADD CD_GRAU_DEP VARCHAR(1);           -- Grau de parentesco dos dependentes (P: Pai/Mãe, F: Filho/Filha, etc.)

----3. Campos Relacionados ao Contrato de Trabalho:
ALTER TABLE FPCD ADD CD_TIPO_CONTRATO VARCHAR(1);      -- Tipo de contrato de trabalho (C: CLT, T: Temporário, I: Intermitente)
ALTER TABLE FPCD ADD CD_TIPO_JORNADA VARCHAR(1);       -- Tipo de jornada de trabalho (P: Parcial, I: Integral, T: Turnos)

--4. Campo Relacionado ao Desligamento:
--SQL
ALTER TABLE FPCD ADD CD_MOTIVO_DESLIGAMENTO VARCHAR(1); -- Motivo do desligamento (D: Demissão, A: Aposentadoria, etc.)

--5. Complemento de Endereço:
 
ALTER TABLE FPCD ADD CD_COMPL_END VARCHAR(20);         -- Complemento do endereço do trabalhador (ex.: Bloco, Apartamento, etc.)
GO


--/------------------------------------------------------------------------------------------------------------------
/*
-Resumo: das Obrigacoes - analise feito abaixo para definicao de tabelas.

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
---------------------------------------------------------------------------------------------------------------------

Dentre as obrigações listadas, algumas delas foram substituídas ou integradas a novos sistemas com a implementação do eSocial, EFD-Reinf, e DCTFWeb. Aqui estão as principais mudanças e desativações:

CAGED (Cadastro Geral de Empregados e Desempregados):

Situação: Não funciona mais. Foi substituído pelo eSocial. Desde janeiro de 2020, as informações de admissões e desligamentos passaram a ser transmitidas ao governo exclusivamente por meio do eSocial.
RAIS (Relação Anual de Informações Sociais):

Situação: Parcialmente substituída. A RAIS continua existindo, mas a maior parte das informações exigidas pela RAIS é transmitida pelo eSocial. As empresas obrigadas ao eSocial não precisam mais enviar a RAIS separadamente para os anos-calendário a partir de 2019.
DIRF (Declaração do Imposto de Renda Retido na Fonte):

Situação: Substituída a partir de 2024. A DIRF será substituída por informações transmitidas ao eSocial e EFD-Reinf. Assim, a obrigação de envio da DIRF deixará de existir para o ano-base de 2024.
As demais obrigações ainda funcionam, embora algumas tenham sido integradas a outros sistemas:

FGTS: GRF (via SEFIP ou Conectividade Social): A GRF ainda pode ser enviada via SEFIP ou Conectividade Social, mas há uma tendência de integração ao eSocial.
INSS: GPS (via folha de pagamento ou SEFIP): Ainda é utilizado, mas muitas informações previdenciárias são transmitidas pelo eSocial e DCTFWeb.
IRRF: DARF (via folha de pagamento): Continua funcionando.
Contribuições ao Sistema S: GPS: Ainda em uso via GPS, mas informações estão integradas ao eSocial.
eSocial: Continua sendo a principal plataforma de envio de informações trabalhistas e previdenciárias.
EFD-Reinf: Funciona como parte do processo de envio de informações de retenção de tributos.
DCTFWeb: Continua em funcionamento como obrigação para transmissão de débitos e créditos fiscais.
GRRF: Ainda em uso para rescisões via Conectividade Social.
Portanto, as principais obrigações que não funcionam mais ou foram substituídas são:

CAGED (Substituído pelo eSocial)
RAIS (Parcialmente substituída pelo eSocial)
DIRF (Substituída pelo eSocial e EFD-Reinf a partir de 2024)



---------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------

*/
--Obrigacoes 
--Estrutura da Tabela para Geração da GPS:f
--Gps Funciona dentro do e-social e uma rubrica


CREATE TABLE GPS_GENERACAO (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,      -- Identificador único da GPS
	ID_FPEMP BIGINT REFERENCES FPEMP(ID),   -- * Empresa
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
    CD_SITUACAO  VARCHAR(1) DEFAULT 'A',       -- Situação do pagamento (A: Aberto, P: Pago)
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

ENVIADA PELA CONECTIVIDADE SOCIAL 
*/
CREATE TABLE GRF_ENVIO (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,      -- Identificador único da GRF gerada
   	ID_FPEMP BIGINT REFERENCES FPEMP(ID),   -- * Empresa
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
--continua SENDO USADA VIA FOLHA DE PAGAMENTO ]
--IRRF: DARF (via folha de pagamento)
--Obrigacoes 
--continua SENDO USADA VIA FOLHA DE PAGAMENTO ]
--IRRF: DARF (via folha de pagamento)

CREATE TABLE irrf_darf_folha_pagamento (
    id INT PRIMARY KEY IDENTITY(1,1),      -- Chave primária com auto-incremento
   	ID_FPEMP BIGINT REFERENCES FPEMP(ID),   -- * Empresa
    razao_social_empresa VARCHAR(255) NULL,      -- Razão social da empresa
    mes_competencia DATE  NULL,                   -- Mês de competência (ex.: 2024-10-01 para outubro de 2024)
    codigo_receita VARCHAR(4)  NULL,              -- Código de Receita para DARF (por exemplo, 0561)
    valor_irrf DECIMAL(15, 2)  NULL,              -- Valor do IRRF retido na fonte
    data_pagamento DATE  NULL,                    -- Data de pagamento da folha de pagamento
    nome_funcionario VARCHAR(255)  NULL,          -- Nome do funcionário
    cpf_funcionario VARCHAR(11)  NULL,            -- CPF do funcionário (11 dígitos)
    salario_bruto DECIMAL(15, 2) NULL,           -- Salário bruto do funcionário
    base_calculo_irrf DECIMAL(15, 2) NULL,       -- Base de cálculo do IRRF após deduções
    aliquota_irrf DECIMAL(5, 2) NULL,            -- Alíquota de IRRF aplicada ao funcionário
    deducoes_irrf DECIMAL(15, 2) DEFAULT 0,          -- Deduções aplicáveis para IRRF (ex: dependentes)
    valor_irrf_retido DECIMAL(15, 2)  NULL,       -- Valor efetivo do IRRF retido do funcionário
    data_envio DATE  NULL,                        -- Data do envio do DARF
    referencia_legal VARCHAR(255) DEFAULT 'Art. 70 da Lei 11.196/2005' -- Referência legal
);
-- Inserção de exemplo para um envio de DARF IRRF mensal
--INSERT INTO irrf_darf_folha_pagamento 
--(cnpj_empresa, razao_social_empresa, mes_competencia, codigo_receita, valor_irrf, data_pagamento, 
--nome_funcionario, cpf_funcionario, salario_bruto, base_calculo_irrf, aliquota_irrf, deducoes_irrf, valor_irrf_retido, data_envio)
--VALUES ('12345678000195', 'Empresa Exemplo LTDA', '2024-10-01', '0561', 1500.00, '2024-10-10', 
--'João Silva', '12345678901', 5000.00, 4500.00, 27.5, 189.59, 1262.85, '2024-10-20');

---------------------------------------------------------------------------------------------------------------
--rubrica do eSocial
CREATE TABLE rubricas_esocial (
    id INT PRIMARY KEY IDENTITY(1,1),         -- Identificador único da rubrica (auto-incremento)
    
    cod_rubrica VARCHAR(30) NOT NULL,                  -- Código da rubrica (definido pela empresa), no máximo 30 caracteres
    descricao_rubrica VARCHAR(255) NOT NULL,           -- Descrição da rubrica (nome da verba), até 255 caracteres
    nat_rubrica VARCHAR(3) NOT NULL,                   -- Natureza da rubrica, conforme tabela de natureza de rubricas do eSocial (campo codNatRubr)
    
    tipo_rubrica VARCHAR(15) NOT NULL CHECK (tipo_rubrica IN ('Provento', 'Desconto', 'Informativo')),  
                                                       -- Tipo da rubrica (provento, desconto ou informativo)
    
    inc_base_irrf VARCHAR(3) NOT NULL CHECK (inc_base_irrf IN ('Sim', 'Nao')),          -- Indicador de incidência na base do IRRF
    inc_base_inss VARCHAR(3) NOT NULL CHECK (inc_base_inss IN ('Sim', 'Nao')),          -- Indicador de incidência na base do INSS
    inc_base_fgts VARCHAR(3) NOT NULL CHECK (inc_base_fgts IN ('Sim', 'Nao')),          -- Indicador de incidência na base do FGTS
    inc_base_sindicato VARCHAR(3) NOT NULL CHECK (inc_base_sindicato IN ('Sim', 'Nao')), -- Indicador de incidência para o sindicato
    
    observacao NVARCHAR(MAX),                           -- Campo de observação para possíveis detalhes adicionais sobre a rubrica
    
    data_inicio_validade DATE NOT NULL,                -- Data de início de validade da rubrica
    data_fim_validade DATE,                            -- Data de fim de validade da rubrica (opcional)
    
    criacao DATETIME DEFAULT CURRENT_TIMESTAMP,        -- Data de criação do registro, gerado automaticamente
    ultima_atualizacao DATETIME DEFAULT CURRENT_TIMESTAMP -- Data de última atualização do registro, atualizada automaticamente
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
--INSERT INTO rubricas_esocial 
--(cod_rubrica, descricao_rubrica, nat_rubrica, tipo_rubrica, inc_base_irrf, inc_base_inss, inc_base_fgts, inc_base_sindicato, data_inicio_validade)
--VALUES ('001', 'Salário Base', '100', 'Provento', 'Sim', 'Sim', 'Sim', 'Nao', '2024-01-01'),
--('002', 'Desconto INSS', '921', 'Desconto', 'Nao', 'Sim', 'Nao', 'Nao', '2024-01-01'),
--('003', 'Adiantamento Salarial', '180', 'Provento', 'Sim', 'Sim', 'Sim', 'Nao', '2024-01-01');

-------------------------------------------------------------------------------------------------------
--Tabela de grupo conforme -
--Grupo, Grupo Pai, Nível Descrição Ocor., Chave Condição , com base 
 --no layout Versão S-1.2 (cons. até NT 02/2024 rev.) --(aprovada pela Portaria Conjunta RFB/MPS/MTE
 -- nº 44, de 11/08/2023 – DOU de -17/08/2023) em sql comentada,

CREATE TABLE resumo_registro_esocial (
    id INT PRIMARY KEY IDENTITY(1,1),         -- Identificador único do registro (auto-incremento)
    grupo VARCHAR(100) NOT NULL,                        -- Nome do grupo do layout eSocial
    grupo_pai VARCHAR(100),                             -- Nome do grupo pai (grupo superior hierárquico)
    nivel INT NOT NULL,                                 -- Nível hierárquico do grupo no layout
    descricao NVARCHAR(MAX) NOT NULL,                  -- Descrição do campo ou grupo no layout
    ocorrencia VARCHAR(50) NOT NULL,                   -- Frequência de ocorrência do registro (Ocor. Mínima/Máxima)
    chave VARCHAR(255),                                 -- Definição de chave (se aplicável, chave primária composta, etc.)
    condicao NVARCHAR(MAX),                             -- Condições ou regras aplicáveis ao registro (regras de preenchimento)
    
    data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP,    -- Data de criação do registro
    ultima_atualizacao DATETIME DEFAULT CURRENT_TIMESTAMP -- Data de última atualização do registro
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

--INSERT INTO resumo_registro_esocial 
--(grupo, grupo_pai, nivel, descricao, ocorrencia, chave, condicao)
--VALUES ('S-1010', NULL, 1, 'Informações das Rubricas', '1-1', 'Sim', 'Obrigatório o preenchimento para todas as rubricas usadas na folha de pagamento'),
--('Identificação do Trabalhador', 'S-1010', 2, 'CPF do trabalhador', '1-1', 'Sim', 'Obrigatório quando se tratar de trabalhador cadastrado'),
--('Bases de Cálculo', 'S-1010', 2, 'Base de cálculo de IRRF', '0-1', 'Não', 'Preencher apenas quando houver retenção de IRRF na folha de pagamento');

---- Outro exemplo:
--INSERT INTO resumo_registro_esocial 
--(grupo, grupo_pai, nivel, descricao, ocorrencia, chave, condicao)
--VALUES ('S-1200', NULL, 1, 'Remuneração do trabalhador', '1-1', 'Sim', 'Preenchimento obrigatório para todo trabalhador com vínculo ativo no mês de apuração'),
--('Detalhamento da Remuneração', 'S-1200', 2, 'Valor do salário', '1-1', 'Não', 'Informar o valor do salário acordado para o trabalhador'),
--('Descontos', 'S-1200', 2, 'Desconto de INSS', '0-1', 'Não', 'Preencher se houver desconto de INSS na remuneração do trabalhador');

------------------------------------------------------------------------------------------------------------------
/*CRIE TABELAS •	EFD-Reinf: Arquivo eletrônico (via sistema contábil)
•	DCTFWeb: Arquivo eletrônico (via e-CAC)
•	GRRF: Guia para rescisão (via Conectividade Social), com base  no layout Versão S-1.2 (cons. até NT 02/2024 rev.)
(aprovada pela Portaria Conjunta RFB/MPS/MTE nº 44, de 11/08/2023 – DOU de
17/08/2023) em sql comentada 

--TABELA 

*/

CREATE TABLE efd_reinf (
    id INT PRIMARY KEY IDENTITY(1,1),          -- Identificador único do registro (auto-incremento)
   	ID_FPEMP BIGINT REFERENCES FPEMP(ID),   -- * Empresa
    periodo_apuracao DATE NOT NULL,                     -- Período de apuração (mês/ano)
    tipo_evento VARCHAR(10) NOT NULL,                   -- Tipo de evento (R-1000, R-2010, etc.)
    valor_retencao FLOAT NOT NULL,                      -- Valor da retenção de impostos/contribuições
    natureza_retencao VARCHAR(10) NOT NULL,             -- Natureza da retenção (com base na tabela de natureza de retenção)
    data_envio DATE NOT NULL,                           -- Data de envio da EFD-Reinf
    status_envio VARCHAR(50) NOT NULL,                  -- Status do envio (ex: Enviado, Pendente, Processado)
    criacao DATETIME DEFAULT CURRENT_TIMESTAMP,         -- Data de criação do registro
    ultima_atualizacao DATETIME DEFAULT CURRENT_TIMESTAMP -- Data de última atualização do registro
);
GO

-- Comentários:
-- 1. "cnpj_empresa" identifica a empresa que está enviando a EFD-Reinf.
-- 2. "periodo_apuracao" define o mês e ano de referência do arquivo.
-- 3. "tipo_evento" refere-se ao tipo de evento do arquivo EFD-Reinf (ex: R-1000 - Informações de cadastro, R-2010 - Retenções de serviços tomados).
-- 4. "valor_retencao" é o valor da retenção de imposto/contribuição.
-- 5. "natureza_retencao" refere-se ao código da natureza da retenção.
-- 6. "data_envio" e "status_envio" monitoram quando o arquivo foi enviado e o status do processamento.

-- Exemplo de inserção:
--INSERT INTO efd_reinf 
--(cnpj_empresa, periodo_apuracao, tipo_evento, valor_retencao, natureza_retencao, data_envio, status_envio)
--VALUES ('12345678000195', '2024-10-01', 'R-2010', 15000.00, '804', '2024-10-20', 'Enviado');
--------------------------------------------------------------------------------------------------
--TABELA DCTF_WEB
CREATE TABLE dctf_web (
    id_declaracao INT PRIMARY KEY IDENTITY(1,1),        -- Identificador único da declaração (auto-incremento)
  	ID_FPEMP BIGINT REFERENCES FPEMP(ID),   -- * Empresa
    periodo_apuracao DATE NOT NULL,                     -- Período de apuração (mês/ano)
    valor_contribuicoes FLOAT NOT NULL,                 -- Valor total das contribuições a serem pagas
    valor_creditos FLOAT NOT NULL,                       -- Valor dos créditos que podem ser abatidos
    valor_total_devido FLOAT NOT NULL,                   -- Valor total devido após abatimento dos créditos
    data_envio DATE NOT NULL,                           -- Data de envio da DCTFWeb
    status_envio VARCHAR(50) NOT NULL,                  -- Status do envio (Enviado, Pendente, Processado)
    
    criacao DATETIME DEFAULT CURRENT_TIMESTAMP,         -- Data de criação do registro
    ultima_atualizacao DATETIME DEFAULT CURRENT_TIMESTAMP -- Data de última atualização do registro
);
GO

-- Comentários:
-- 1. "cnpj_empresa" identifica a empresa responsável pela entrega da DCTFWeb.
-- 2. "periodo_apuracao" define o mês e ano de referência do arquivo.
-- 3. "valor_contribuicoes" é o total das contribuições apuradas no período.
-- 4. "valor_creditos" refere-se aos créditos fiscais que podem ser usados para abater o valor devido.
-- 5. "valor_total_devido" é o total a pagar após o abatimento dos créditos.
-- 6. "data_envio" e "status_envio" monitoram o envio e o estado da declaração.

-- Exemplo de inserção:
--INSERT INTO dctf_web 
--(cnpj_empresa, periodo_apuracao, valor_contribuicoes, valor_creditos, valor_total_devido, data_envio, status_envio)
--VALUES ('12345678000195', '2024-09-01', 100000.00, 5000.00, 95000.00, '2024-09-30', 'Enviado');

-------------------------------------------------------------------------------------------------------------------
--TABELA GRF ENVIADA PELA CONECTIVIDADE SOCIAL E ESTA SENDO INTEGRADA PELO E-SOCIAL 
-- CREATE TABLE irrf_darf_folha_pagamento (
--    id INT PRIMARY KEY IDENTITY(1,1),      -- Chave primária com auto-incremento
--   	ID_FPEMP BIGINT REFERENCES FPEMP(ID),   -- * Empresa
--    razao_social_empresa VARCHAR(255) NOT NULL,      -- Razão social da empresa
--    mes_competencia DATE NOT NULL,                   -- Mês de competência (ex.: 2024-10-01 para outubro de 2024)
--    codigo_receita VARCHAR(4) NOT NULL,              -- Código de Receita para DARF (por exemplo, 0561)
--    valor_irrf DECIMAL(15, 2) NOT NULL,              -- Valor do IRRF retido na fonte
--    data_pagamento DATE NOT NULL,                    -- Data de pagamento da folha de pagamento
--    nome_funcionario VARCHAR(255) NOT NULL,          -- Nome do funcionário
--    cpf_funcionario VARCHAR(11) NOT NULL,            -- CPF do funcionário (11 dígitos)
--    salario_bruto DECIMAL(15, 2) NOT NULL,           -- Salário bruto do funcionário
--    base_calculo_irrf DECIMAL(15, 2) NOT NULL,       -- Base de cálculo do IRRF após deduções
--    aliquota_irrf DECIMAL(5, 2) NOT NULL,            -- Alíquota de IRRF aplicada ao funcionário
--    deducoes_irrf DECIMAL(15, 2) DEFAULT 0,          -- Deduções aplicáveis para IRRF (ex: dependentes)
--    valor_irrf_retido DECIMAL(15, 2) NOT NULL,       -- Valor efetivo do IRRF retido do funcionário
--    data_envio DATE NOT NULL,                        -- Data do envio do DARF
--    referencia_legal VARCHAR(255) DEFAULT 'Art. 70 da Lei 11.196/2005' -- Referência legal
--);

-- Comentários:
-- 1. "cnpj_empresa" identifica a empresa responsável pelo recolhimento.
-- 2. "matricula_funcionario" é o número da matrícula do funcionário cujo FGTS está sendo recolhido.
-- 3. "data_rescisao" é a data da rescisão do contrato de trabalho.
-- 4. "valor_fgts" é o valor do FGTS a ser recolhido.
-- 5. "valor_multa_fgts" representa o valor da multa rescisória (geralmente 40% sobre o saldo do FGTS).
-- 6. "data_envio" e "status_envio" monitoram o envio e o status da guia GRRF.
------------------------------------------------------------------------------------------------------------------


--TABELA GRF ENVIADA PELA CONECTIVIDADE SOCIAL E ESTA SENDO INTEGRADA PELO E-SOCIAL 
 CREATE TABLE grrf (
    id_grrf INT PRIMARY KEY IDENTITY(1,1),              -- Identificador único da GRRF (auto-incremento)
   	ID_FPEMP BIGINT REFERENCES FPEMP(ID),   -- * Empresa
    matricula_funcionario INT NOT NULL,                  -- Matrícula do funcionário cujo FGTS está sendo recolhido
    data_rescisao DATE NOT NULL,                         -- Data da rescisão do contrato de trabalho
    valor_fgts FLOAT NOT NULL,                           -- Valor do FGTS a ser recolhido
    valor_multa_fgts FLOAT NOT NULL,                     -- Valor da multa rescisória do FGTS (geralmente 40%)
    data_envio DATE NOT NULL,                            -- Data de envio da GRRF
    status_envio VARCHAR(50) NOT NULL,                   -- Status do envio (Enviado, Pendente, Processado)
    criacao DATETIME DEFAULT CURRENT_TIMESTAMP,          -- Data de criação do registro
    ultima_atualizacao DATETIME DEFAULT CURRENT_TIMESTAMP -- Data de última atualização do registro
);
GO

-- Comentários:
-- 1. "cnpj_empresa" identifica a empresa responsável pelo recolhimento.
-- 2. "matricula_funcionario" é o número da matrícula do funcionário cujo FGTS está sendo recolhido.
-- 3. "data_rescisao" é a data da rescisão do contrato de trabalho.
-- 4. "valor_fgts" é o valor do FGTS a ser recolhido.
-- 5. "valor_multa_fgts" representa o valor da multa rescisória (geralmente 40% sobre o saldo do FGTS).
-- 6. "data_envio" e "status_envio" monitoram o envio e o status da guia GRRF.

-- Exemplo de inserção:
--INSERT INTO grrf 
--(cnpj_empresa, matricula_funcionario, data_rescisao, valor_fgts, valor_multa_fgts, data_envio, status_envio)
--VALUES ('12345678000195', 12345, '2024-09-01', 3000.00, 1200.00, '2024-09-05', 'Enviado');

-------------------------------------------------------------------------------------------------------------------

--Arquivo com dados fixos - fpps
--W_FPPS:=  "F:\FOLHA\"+W_SIGEMP+"\"+W_SIGEMP+'FPPS.DBF'

---IF !FILE("&W_FPPS")   

-- // Arquivo de Empresas-- 
--Criação da tabela FPPS (Dados da Empresa Filial):

--USE PESSOAL;
--GO

--CREATE TABLE FPPS (
--    ID BIGINT IDENTITY(1,1) PRIMARY KEY, -- Identificador único do registro (chave primária com auto-incremento)
    
--    -- Campos da empresa
--    ps_SIGEMP        VARCHAR(2),                       -- Sigla da empresa (2 caracteres)
--    ps_NUMEMP        FLOAT,                            -- Número da empresa
--    ps_NFILIAL       FLOAT,                            -- Número da filial
    
--    -- Informações de endereço
--    ps_endemp        VARCHAR(30),                      -- Endereço da empresa (30 caracteres)
--    ps_BAIEMP        VARCHAR(20),                      -- Bairro da empresa (20 caracteres)
--    ps_CIDEMP        VARCHAR(20),                      -- Cidade da empresa (20 caracteres)
--    ps_CEPEMP        VARCHAR(8),                       -- CEP da empresa (8 caracteres)
--    ps_ESTEMP        VARCHAR(2),                       -- Estado da empresa (2 caracteres)
    
--    -- Identificadores fiscais
--    ps_CNPJEMP       VARCHAR(14),                      -- CNPJ da empresa (14 dígitos)
--    ps_INSEST        VARCHAR(16),                      -- Inscrição estadual da empresa (16 caracteres)
    
--    -- Atividades econômicas
--    ps_ATVPRI        VARCHAR(4),                       -- Código da atividade principal (4 caracteres)
--    ps_ATVSEC        VARCHAR(4),                       -- Código da atividade secundária (4 caracteres)
    
--    -- Quantidade de empregados e dependentes
--    ps_QTDPRO        FLOAT,                            -- Quantidade de profissionais
--    ps_QTDFAM        FLOAT,                            -- Quantidade de familiares dependentes
    
--    -- Informações financeiras e fiscais
--    ps_SENEMP        VARCHAR(15),                      -- Senha de acesso da empresa (15 caracteres)
--    ps_BAMPIS        VARCHAR(3),                       -- Banco para recolhimento de PIS
--    ps_AGEPIS        VARCHAR(4),                       -- Agência do banco para PIS
--    ps_DIGPIS        VARCHAR(1),                       -- Dígito verificador do PIS
    
--    -- Valores diversos (IRRF, FGTS, etc.)
--    ps_VALARR        FLOAT,                            -- Valor arrecadado
--    ps_PERQZN        FLOAT,                            -- Percentual aplicado para determinada zona
--    ps_DTATU         DATETIME,                         -- Data da última atualização
--    ps_DTINIPER      DATETIME,                         -- Data de início do período de apuração
    
--    -- Informações adicionais
--    ps_MENSAG        VARCHAR(50),                      -- Mensagem adicional ou aviso
--    ps_SALMES        VARCHAR(3),                       -- Salário do mês (código)
--    ps_SALFAM        VARCHAR(3),                       -- Valor de salário-família (código)
--    ps_VBRISCO       VARCHAR(3),                       -- Valor bruto de risco (código)
    
--    -- Informações fiscais adicionais
--    ps_IAPAS         VARCHAR(3),                       -- Código de recolhimento ao INSS
--    ps_CREEXEC       VARCHAR(3),                       -- Crédito executivo
--    ps_DBBEXEC       VARCHAR(3),                       -- Débito executivo
--    ps_IRFONTE       VARCHAR(3),                       -- Imposto de renda na fonte (código)
--    ps_CREARR        VARCHAR(3),                       -- Crédito arrecadado
--    ps_DEBARR        VARCHAR(3),                       -- Débito arrecadado
    
--    -- 13º Salário
--    PS_13SAL         VARCHAR(3),                       -- 13º salário
--    ps_ADI13S        VARCHAR(3),                       -- Adiantamento do 13º salário
--    ps_DESC13S       VARCHAR(3),                       -- Desconto do 13º salário
--    ps_IAPA13        VARCHAR(3),                       -- Código INSS 13º salário
--    ps_DIF13C        VARCHAR(3),                       -- Diferença de cálculo 13º salário (código)
--    ps_DIF13D        VARCHAR(3),                       -- Diferença de desconto 13º salário (código)
    
--    -- Outras informações de férias, salários e valores acumulados
--    ps_FERIAS        VARCHAR(3),                       -- Código referente a férias
--    ps_DIFSAL        VARCHAR(3),                       -- Diferença salarial (código)
--    ps_VLSALFAM      FLOAT,                            -- Valor do salário-família
--    ps_VLSALFAM1     FLOAT,                            -- Valor do salário-família 1
    
--    -- Outros valores e limites
--    ps_SALMIN        FLOAT,                            -- Salário mínimo
--    ps_TETIAP        FLOAT,                            -- Teto INSS
--    ps_ABADEP        FLOAT,                            -- Abatimento por dependente
--    ps_RECMIN        FLOAT,                            -- Recolhimento mínimo
--    ps_LIMDED        FLOAT,                            -- Limite de dedução
--    ps_VALISE        FLOAT,                            -- Valor de isenção
--    ps_PROLAB        FLOAT,                            -- Pro-labore
--    ps_VALHORA       FLOAT,                            -- Valor da hora trabalhada

--    -- Chave estrangeira para vincular FPPS à tabela FPEMP
--    CONSTRAINT FK_FPPS_FPEMP FOREIGN KEY (ps_NUMEMP) REFERENCES FPEMP(ce_NUMEMP),
    
--    -- Definição de chaves e índices
--    CONSTRAINT PK_FPPS PRIMARY KEY CLUSTERED (ps_NUMEMP), -- Chave primária com índice clusterizado
--    CONSTRAINT UNQ_FPPS_CNPJ UNIQUE NONCLUSTERED (ps_CNPJEMP) -- CNPJ deve ser único
--);
--GO
----Vinculando a tabela FPCD com FPPS (Empresa e Filial):
---- Vinculando FPCD com FPPS considerando empresa (CD_NUMEMP) e filial (CD_NFILIAL)
--ALTER TABLE FPCD 
--ADD CONSTRAINT FK_FPCD_FPPS FOREIGN KEY (CD_NUMEMP, CD_NFILIAL) REFERENCES FPPS(ps_NUMEMP, ps_NFILIAL);
--GO
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

--USE PESSOAL;
GO
-- Tabela FPRL (Valores Acumulados Quinzena)
CREATE TABLE FPRL (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,               -- Identificador único (auto-incremento)
	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde	
    ID_FPCD BIGINT REFERENCES FPCD(ID),				-- * FUNCIONÁRIOS
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
    RL_BASFGTS FLOAT)
GO

-- Tabela FPRL (Valores Acumulados Quinzena)
CREATE TABLE FPRL (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,
	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde	
    ID_FPCD BIGINT REFERENCES FPCD(ID),				-- * FUNCIONÁRIOS
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
    RL_BASFGTS FLOAT
);
GO

-- Tabela FPRLD (Valores Acumulados 2)
CREATE TABLE FPRLD (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,
  	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde	
    ID_FPCD BIGINT REFERENCES FPCD(ID),				-- * FUNCIONÁRIOS
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
    RL_BASFGTS FLOAT
);
GO

-- Tabela FPRLS (Valores Acumulados Diário/Semanal)
CREATE TABLE FPRLS (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,
   	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde	
    ID_FPCD BIGINT REFERENCES FPCD(ID),				-- * FUNCIONÁRIOS
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
    RL_BASFGTS FLOAT
);
GO

-- Tabela FPBA (Dados do Banco da Empresa)
CREATE TABLE FPBA (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,
	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde	
    BA_CODBCO VARCHAR(3),
    BA_CODAGE VARCHAR(4),
    BA_DIGITO VARCHAR(1),
    BA_NOMBCO VARCHAR(20),
    BA_NOMAGE VARCHAR(20),
    BA_CIDAGE VARCHAR(20),
    BA_ESTAGE VARCHAR(2),
    BA_CEPAGE VARCHAR(8)
);
GO

-- Tabela FPFU (Arquivo de Funções)
CREATE TABLE FPFU (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,
	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde	
    ID_FPCD BIGINT REFERENCES FPCD(ID),				-- * FUNCIONÁRIOS
    FU_CODFUN VARCHAR(7),
    FU_NOMFUN VARCHAR(20),
    FU_NUMEMP FLOAT,
    FU_NFILIAL FLOAT
);
GO

-- Vinculando a tabela FPCD com a tabela FPEMP pela empresa e filial


-- Tabela VERBAS_FER (Verbas de Férias) com vínculo à FPEMP
CREATE TABLE VERBAS_FER (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,
   	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde	
    ID_FPCD BIGINT REFERENCES FPCD(ID),				-- * FUNCIONÁRIOS
    MFF_ANOMES   VARCHAR(4),
    MFF_CODVER   VARCHAR(3),
    MFF_QTDHOR   FLOAT,
    MFF_VALVER   FLOAT
);
GO

-- Tabela VERBAS_RES (Verbas de Rescisão) com vínculo à FPEMP
CREATE TABLE VERBAS_RES (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,
  	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde	
    ID_FPCD BIGINT REFERENCES FPCD(ID),				-- * FUNCIONÁRIOS
    MR_ANOMES   VARCHAR(4),
    MR_CODVER   VARCHAR(3),
    MR_QTDHOR   FLOAT,
    MR_VALVER   FLOAT,
    MR_NUMEMP   FLOAT,
    MR_NFILIAL  FLOAT
);
GO

-- Tabela FPVB (Verbas Incidências) com vínculo à FPEMP
CREATE TABLE FPVB (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,
	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde	
    ID_FPCD BIGINT REFERENCES FPCD(ID),				-- * FUNCIONÁRIOS
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
    VB_EXPPOS    VARCHAR(70)
);
GO


-- Tabela FP13 (13º Salário) com FLOAT e DATETIME, criando chave primária por empresa e filial, 
-- e vinculando à FPEMP (pela empresa e filial) e FPCD (pela matrícula)
CREATE TABLE FP13 (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,
   	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde	
    ID_FPCD BIGINT REFERENCES FPCD(ID),				-- * FUNCIONÁRIOS
    M13_NUMLOT   VARCHAR(8), 
    M13_CODVER   VARCHAR(3), 
    M13_QTDHOR   FLOAT,
    M13_PROPOR   FLOAT,
    M13_VAL13S   FLOAT,
    M13_VALADI   FLOAT,
    M13_IAP13S   FLOAT
);
GO

 --- Tabela FPMVB (Movimento) com ID como chave primária e vínculos à FPEMP e FPCD
CREATE TABLE FPMVB (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,
	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde	
    ID_FPCD BIGINT REFERENCES FPCD(ID),				-- * FUNCIONÁRIOS
    MV_TIPMOV   VARCHAR(1),
    MV_CODVER   VARCHAR(3),
    MV_NUMLOT   VARCHAR(8),
    MV_CODRET   FLOAT,
    MV_VALMOV   FLOAT
);
GO

 --// Arquivo de Movimento
 
-- Tabela FPMV (Movimento) com ID como chave primária e vínculos à FPEMP e FPCD
CREATE TABLE FPMV (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,
  	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde	
    ID_FPCD BIGINT REFERENCES FPCD(ID),				-- * FUNCIONÁRIOS
    MV_TIPMOV   VARCHAR(1),
    MV_CODVER   VARCHAR(3),
    MV_NUMLOT   VARCHAR(8),
    MV_CODRET   FLOAT,
    MV_VALMOV   FLOAT
);
GO

 --// Arquivo de Valores Acumulados
-- Tabela FPVA (Valores Acumulados) com ID como chave primária e vínculos à FPEMP e FPCD
CREATE TABLE FPVA (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,
   	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde	
    ID_FPCD BIGINT REFERENCES FPCD(ID),				-- * FUNCIONÁRIOS
    VA_NUMLOT   VARCHAR(8),
    VA_DIA      VARCHAR(2),
    VA_ANOMES   VARCHAR(4),
    VA_CODVER   VARCHAR(3),
    VA_QTDHOR   FLOAT,
    VA_VALVER   FLOAT,
    VA_RES      VARCHAR(1),
    VA_INSIDE   VARCHAR(1),
    VA_VERBA    VARCHAR(1),
    VA_FATOR    VARCHAR(5)
);
GO



 ---// Arquivo 
  
-- Tabela FPRF com ID como chave primária, vinculando à FPEMP (pela empresa e filial) e à FPCD (pela matrícula)
CREATE TABLE FPRF (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,
   	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde	
    ID_FPCD BIGINT REFERENCES FPCD(ID),				-- * FUNCIONÁRIOS
    RF_NUMLOT   VARCHAR(8),
    RF_CODVER   VARCHAR(3),
    RF_VALVER   FLOAT,
    RF_QTDHOR   FLOAT
);
GO

 ---// Arquivo Arq. p/ rais.
  
-- Tabela FPVR com ID como chave primária, vinculando à FPEMP (pela empresa e filial) e à FPCD (pela matrícula)
CREATE TABLE FPVR (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,
   	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde	
    ID_FPCD BIGINT REFERENCES FPCD(ID),				-- * FUNCIONÁRIOS
    VR_CODVER   VARCHAR(3),
    VR_QTDHOR   FLOAT,
    VR_VALVER   FLOAT
);
GO

/*
Arquivo de base de 13 salario ..

Explicação dos campos:
ID: Campo de identificação único para cada registro. Utiliza BIGINT com auto-incremento (IDENTITY), garantindo que cada linha tenha um identificador único.
M3_NUMMAT: Representa o número de matrícula do funcionário. Definido como VARCHAR(6) para comportar até 6 caracteres alfanuméricos.
M3_CODVER: Código da verba associada ao funcionário, definido como VARCHAR(3) para códigos de até 3 caracteres.
M3_VALVER: Valor da verba. Usamos FLOAT para permitir a inserção de valores decimais.
M3_CODRET: Código de retorno, convertido para FLOAT (originalmente numérico com 2 dígitos).
M3_NUMEMP: Número da empresa. Alterado para FLOAT (substituindo NUMERIC(2,0)), facilitando a inserção de números de 2 dígitos.
M3_NFILIAL: Número da filial. Alterado para FLOAT (substituindo NUMERIC(4,0)), que permite armazenar números de até 4 dígitos.
Considerações:
FLOAT foi utilizado no lugar de NUMERIC, permitindo maior flexibilidade para armazenar números decimais e inteiros com precisão.
A chave primária foi mantida no campo M3_NUMMAT, que representa a matrícula do funcionário e é uma identificação única no contexto desta tabela.
*/


CREATE TABLE FPM3 (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,           -- Identificador único, chave primária, com auto-incremento (BIGINT)
   	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde	
    ID_FPCD BIGINT REFERENCES FPCD(ID),				-- * FUNCIONÁRIOS
    M3_NUMMAT VARCHAR(6),                          -- Número da matrícula do funcionário (6 caracteres)
    M3_CODVER VARCHAR(3),                          -- Código da verba (3 caracteres)
    M3_VALVER FLOAT,                               -- Valor da verba (FLOAT para valores com casas decimais)
    M3_CODRET FLOAT
);
GO


-- // Arquivo movimento 
/*
Explicação dos campos:
ID: Identificador único da tabela. Utilizamos BIGINT com IDENTITY(1,1) para auto-incrementar o valor em cada inserção, servindo como chave primária.
MA_NUMMAT: Número da matrícula do funcionário, armazenado como VARCHAR(6), com até 6 caracteres alfanuméricos.
MA_CODVER: Código da verba relacionada ao funcionário, definido como VARCHAR(3) para códigos com até 3 caracteres.
MA_NUMLOT: Número do lote de pagamento, armazenado como VARCHAR(8), com até 8 caracteres alfanuméricos.
MA_VALADI: Valor do adiantamento relacionado ao pagamento. FLOAT foi utilizado para permitir valores decimais com maior flexibilidade.
MA_NUMEMP: Número da empresa, anteriormente definido como NUMERIC(2,0), agora substituído por FLOAT para armazenar números de 2 dígitos.
MA_NFILIAL: Número da filial, anteriormente definido como NUMERIC(4,0), agora substituído por FLOAT para armazenar números de até 4 dígitos.
Considerações:
O uso de FLOAT em vez de NUMERIC oferece flexibilidade para armazenar tanto valores inteiros quanto decimais.
A chave primária da tabela é o campo MA_NUMMAT (número da matrícula), e está definida como PRIMARY KEY CLUSTERED para otimizar as operações de pesquisa baseadas na matrícula.
*/
CREATE TABLE FPMA (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,          -- Identificador único, chave primária, com auto-incremento (BIGINT)
	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde	
    ID_FPCD BIGINT REFERENCES FPCD(ID),				-- * FUNCIONÁRIOS
    MA_CODVER  VARCHAR(3),                        -- Código da verba (3 caracteres)
    MA_NUMLOT  VARCHAR(8),                        -- Número do lote de pagamento (8 caracteres)
    MA_VALADI  FLOAT
);
GO

  	
-------------------------------------------------------------------------------------------------------------------

 --0W_FPMadd :=  "F:\FOLHA\"+W_SIGEMP+"\"+W_SIGEMP+'FPMAdd.DBF'
  --// Arquivo movimento adiantamento 
  /*
  Explicação dos campos:
ID: Chave primária da tabela, utilizando o tipo BIGINT com auto-incremento (definido por IDENTITY(1,1)), que gera um valor único para cada registro.
MA_NUMMAT: Número da matrícula do funcionário, armazenado como VARCHAR(6) para até 6 caracteres alfanuméricos.
MA_NUMLOT: Número do lote de pagamento, definido como VARCHAR(8) para até 8 caracteres.
MA_VALADI: Valor do adiantamento, utilizando FLOAT para armazenar valores com casas decimais (anteriormente NUMERIC(13,2)).
MA_NUMEMP: Número da empresa, agora definido como FLOAT (anteriormente NUMERIC(2,0)) para armazenar números inteiros.
MA_NFILIAL: Número da filial, também utilizando FLOAT (substituindo NUMERIC(4,0)), para armazenar números inteiros de até 4 dígitos.
Considerações:
O uso de FLOAT foi escolhido por sua flexibilidade ao armazenar tanto números inteiros quanto decimais.
A chave primária PK_FPMADD foi mantida no campo MA_NUMMAT, que identifica de forma única cada funcionário.
*/
  ---IF !FILE("&W_FPMadd") 
  
  
CREATE TABLE FPMADD (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,         -- Identificador único com auto-incremento (BIGINT)
  	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde	
    ID_FPCD BIGINT REFERENCES FPCD(ID),				-- * FUNCIONÁRIOS
    MA_VALADI   FLOAT
);
GO


/*
Explicação dos campos:
ID: Chave primária da tabela, com o tipo BIGINT e auto-incremento (IDENTITY(1,1)), garantindo um identificador único para cada registro.
MA_NUMMAT: Número da matrícula do funcionário, armazenado como VARCHAR(6) para suportar até 6 caracteres alfanuméricos.
MA_NUMLOT: Número do lote de pagamento, armazenado como VARCHAR(8) para até 8 caracteres.
MA_VALADID: Valor adicional do pagamento, agora definido como FLOAT para permitir a inserção de valores decimais (anteriormente NUMERIC(13,2)).
MA_NUMEMP: Número da empresa, convertido para FLOAT (anteriormente NUMERIC(2,0)), permitindo o armazenamento de números inteiros.
MA_NFILIAL: Número da filial, também convertido para FLOAT (anteriormente NUMERIC(4,0)), permitindo a inserção de números inteiros de até 4 dígitos.
Considerações:
FLOAT foi escolhido para substituir NUMERIC em todos os campos numéricos, oferecendo flexibilidade para armazenar valores inteiros ou decimais.
A chave primária PK_FPMAD está definida no campo MA_NUMMAT, que é o identificador único de cada funcionário.
*/


CREATE TABLE FPMAD (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,         -- Identificador único com auto-incremento (BIGINT)
	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde	
    ID_FPCD BIGINT REFERENCES FPCD(ID),				-- * FUNCIONÁRIOS
    MA_VALADID  FLOAT
);
GO

/*
aruivo de movimento fpmp 
Explicação dos campos:
ID: Chave primária da tabela, definida como BIGINT com auto-incremento (IDENTITY(1,1)), que gera um identificador único para cada registro.
MP_NUMMAT: Número da matrícula do funcionário, armazenado como VARCHAR(6) para até 6 caracteres alfanuméricos.
MP_CODVER: Código da verba associada ao funcionário, armazenado como VARCHAR(3) para códigos de até 3 caracteres.
MP_CODRET: Código de retorno, agora definido como FLOAT para armazenar números inteiros de 2 dígitos (anteriormente NUMERIC(2,0)).
MP_QTDHOR: Quantidade de horas trabalhadas, agora armazenado como FLOAT para valores decimais (anteriormente NUMERIC(7,2)).
MP_VALMOV: Valor do movimento financeiro, agora armazenado como FLOAT, que suporta valores com casas decimais (anteriormente NUMERIC(13,2)).
MP_NUMEMP: Número da empresa, agora definido como FLOAT (substituindo NUMERIC(2,0)).
MP_NFILIAL: Número da filial, também convertido para FLOAT (anteriormente NUMERIC(4,0)), que pode armazenar números inteiros de até 4 dígitos.
Considerações:
FLOAT foi escolhido para todos os campos originalmente numéricos (NUMERIC), pois permite maior flexibilidade ao armazenar números inteiros ou decimais.
A chave primária PK_FPMP está definida no campo MP_NUMMAT, que identifica de forma única cada funcionário.
*/


CREATE TABLE FPMP (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,         -- Identificador único com auto-incremento (BIGINT)
	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde	
    ID_FPCD BIGINT REFERENCES FPCD(ID),				-- * FUNCIONÁRIOS
    MP_CODVER   VARCHAR(3),                      -- Código da verba (até 3 caracteres)
    MP_CODRET   FLOAT,                           -- Código de retorno, agora definido como FLOAT (anteriormente NUMERIC(2,0))
    MP_QTDHOR   FLOAT,                           -- Quantidade de horas (FLOAT, substituindo NUMERIC(7,2))
    MP_VALMOV   FLOAT
);
GO

/*
Movimento quinzenal 

Explicação dos campos:
ID: Identificador único da tabela, definido como BIGINT com auto-incremento (IDENTITY(1,1)), gerando um valor exclusivo para cada linha.
MQ_NUMMAT: Número da matrícula do funcionário, armazenado como VARCHAR(6), com até 6 caracteres alfanuméricos.
MQ_VALADI: Valor do adiantamento quinzenal, agora definido como FLOAT para permitir valores decimais (substituindo NUMERIC(13,2)).
MQ_NUMEMP: Número da empresa, agora definido como FLOAT, para armazenar valores inteiros (anteriormente NUMERIC(2,0)).
MQ_NFILIAL: Número da filial, definido como FLOAT para armazenar valores inteiros (anteriormente NUMERIC(4,0)).
Considerações:
FLOAT foi utilizado no lugar de NUMERIC para oferecer maior flexibilidade, permitindo o armazenamento de números inteiros ou decimais.
A chave primária da tabela é o campo MQ_NUMMAT, que identifica de forma única cada funcionário.
*/
CREATE TABLE FPMQ (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,         -- Identificador único com auto-incremento (BIGINT)
   	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde	
    ID_FPCD BIGINT REFERENCES FPCD(ID),				-- * FUNCIONÁRIOS
    MQ_NUMMAT  VARCHAR(6),                      -- Número da matrícula do funcionário (até 6 caracteres)
    MQ_VALADI  FLOAT
);
GO

/*

1. Tabela FPMD:

Explicação dos campos da tabela FPMD:

ID: Identificador único da tabela, gerado automaticamente (BIGINT com IDENTITY(1,1)).
MD_NUMMAT: Número da matrícula do funcionário, armazenado como VARCHAR(6).
MD_VALADID: Valor adicional identificado, agora definido como FLOAT (anteriormente NUMERIC(13,2)).
MD_NUMEMP: Número da empresa, agora armazenado como FLOAT (anteriormente NUMERIC(2,0)).
MD_NFILIAL: Número da filial, também convertido para FLOAT (anteriormente NUMERIC(4,0)).

Considerações Gerais:
FLOAT foi escolhido no lugar de NUMERIC para permitir maior flexibilidade no armazenamento de valores decimais e inteiros.
Em todas as tabelas, a chave primária foi mantida no campo de matrícula do funcionário, que identifica de forma única cada registro.

Arquivo movimento diadio 

*/


CREATE TABLE FPMD (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,         -- Identificador único com auto-incremento (BIGINT)
	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde	
    ID_FPCD BIGINT REFERENCES FPCD(ID),				-- * FUNCIONÁRIOS
    MD_VALADID  FLOAT
);
GO
/*
2. Tabela FPMS: Arquivo semanal 

Explicação dos campos da tabela FPMS:

ID: Identificador único da tabela, gerado automaticamente (BIGINT com IDENTITY(1,1)).
MS_NUMMAT: Número da matrícula do funcionário, armazenado como VARCHAR(6).
MS_VALADID: Valor adicional identificado, agora definido como FLOAT (anteriormente NUMERIC(13,2)).
MS_NUMEMP: Número da empresa, agora armazenado como FLOAT (anteriormente NUMERIC(2,0)).
MS_NFILIAL: Número da filial, também convertido para FLOAT (anteriormente NUMERIC(4,0)).

Considerações Gerais:
FLOAT foi escolhido no lugar de NUMERIC para permitir maior flexibilidade no armazenamento de valores decimais e inteiros.
Em todas as tabelas, a chave primária foi mantida no campo de matrícula do funcionário, que identifica de forma única cada registro.


*/

CREATE TABLE FPMS (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,         -- Identificador único com auto-incremento (BIGINT)
	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde	
    ID_FPCD BIGINT REFERENCES FPCD(ID),				-- * FUNCIONÁRIOS
    MS_VALADID  FLOAT
);
GO


/*
3. Tabela FPMAS: Arquivo acumulado semanal para desconto 

Explicação dos campos da tabela FPMAS:

ID: Identificador único da tabela, gerado automaticamente (BIGINT com IDENTITY(1,1)).
MA_NUMMAT: Número da matrícula do funcionário, armazenado como VARCHAR(6).
MA_NUMLOT: Número do lote de pagamento, armazenado como VARCHAR(8).
MA_VALADID: Valor adicional identificado, agora definido como FLOAT (anteriormente NUMERIC(13,2)).
MA_NUMEMP: Número da empresa, agora armazenado como FLOAT (anteriormente NUMERIC(2,0)).
MA_NFILIAL: Número da filial, também convertido para FLOAT (anteriormente NUMERIC(4,0)).

Considerações Gerais:
FLOAT foi escolhido no lugar de NUMERIC para permitir maior flexibilidade no armazenamento de valores decimais e inteiros.
Em todas as tabelas, a chave primária foi mantida no campo de matrícula do funcionário, que identifica de forma única cada registro.


*/

CREATE TABLE FPMAS (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,         -- Identificador único com auto-incremento (BIGINT)
   	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde	
    ID_FPCD BIGINT REFERENCES FPCD(ID),
    MA_NUMLOT   VARCHAR(8),                      -- Número do lote de pagamento (até 8 caracteres)
    MA_VALADID  FLOAT
);
GO

/*
Explicação dos campos:

V13_NUMMAT: Número da matrícula do funcionário, armazenado como VARCHAR(6), com até 6 caracteres alfanuméricos.
V13_CODVER: Código da verba associada ao funcionário, armazenado como VARCHAR(3), com até 3 caracteres.
V13_VALVER: Valor da verba, agora definido como FLOAT (anteriormente NUMERIC(13,2)), para permitir a inserção de valores decimais.
V13_CODRET: Código de retorno, agora definido como FLOAT (substituindo NUMERIC(2,2)), que permite o armazenamento de valores com duas casas decimais.
V13_NUMEMP: Número da empresa, agora definido como FLOAT (anteriormente NUMERIC(2,0)), para armazenar números inteiros.
V13_NFILIAL: Número da filial, agora definido como FLOAT (anteriormente NUMERIC(4,0)), para armazenar números inteiros de até 4 dígitos.
Considerações:
FLOAT foi escolhido no lugar de NUMERIC para permitir maior flexibilidade ao armazenar números inteiros e decimais.
A chave primária está definida no campo V13_NUMMAT, que é o número único de matrícula do funcionário.

// Arquivo 13 salario
*/

CREATE TABLE FPMV3 (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,
	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde	
    ID_FPCD BIGINT REFERENCES FPCD(ID),				-- * FUNCIONÁRIOS
    V13_CODVER   VARCHAR(3),                      -- Código da verba (até 3 caracteres)
    V13_VALVER   FLOAT,                           -- Valor da verba (FLOAT, substituindo NUMERIC(13,2))
    V13_CODRET   FLOAT
);
GO

/*
Tabela fpmo:
Explicação dos campos e vínculos:

ID: Identificador único da tabela, gerado automaticamente com BIGINT e IDENTITY(1,1) para auto-incrementar.
MO_NUMMAT: Número da matrícula do funcionário, definido como VARCHAR(6) para suportar até 6 caracteres.
MO_SIGEMP: Sigla da empresa, armazenada como VARCHAR(2).
MO_CODPEC: Código da peça, definido como VARCHAR(3) para até 3 caracteres.
MO_PAGMOV: Indicador de pagamento do movimento, armazenado como VARCHAR(1).
MO_PRODUC: Produção realizada, substituído por FLOAT (anteriormente NUMERIC(4,0)), para armazenar números inteiros ou decimais.
MO_HORMIN: Horas mínimas de trabalho, também substituído por FLOAT (anteriormente NUMERIC(4,0)).
MO_DATMOV: Data do movimento, definida como DATE.
MO_SEQMOV: Sequência do movimento, armazenada como VARCHAR(3) para até 3 caracteres.
MO_NUMEMP: Número da empresa, substituído por FLOAT (anteriormente NUMERIC(2,0)).
MO_NFILIAL: Número da filial, substituído por FLOAT (anteriormente NUMERIC(4,0)).
Vínculos:
Vínculo com FPEMP:
 O campo MO_NUMEMP e MO_NFILIAL estão vinculados à tabela FPEMP (que possui os campos ce_NUMEMP e ce_NFILIAL), garantindo que as informações sobre empresa e filial sejam consistentes.

Vínculo com FPCD: O campo MO_NUMMAT está vinculado à tabela FPCD (campo CD_NUMMAT), garantindo que a matrícula do funcionário seja consistente entre as tabelas.

*/

CREATE TABLE FPMO (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,         -- Identificador único com auto-incremento (BIGINT)
	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde	
    ID_FPCD BIGINT REFERENCES FPCD(ID),				-- * FUNCIONÁRIOS
    MO_CODPEC   VARCHAR(3),                      -- Código da peça (até 3 caracteres)
    MO_PAGMOV   VARCHAR(1),                      -- Indicador de pagamento do movimento (1 caractere)
    MO_PRODUC   FLOAT,                           -- Produção realizada (FLOAT, substituindo NUMERIC(4,0))
    MO_HORMIN   FLOAT,                           -- Horas mínimas de trabalho (FLOAT, substituindo NUMERIC(4,0))
    MO_DATMOV   DATE,                            -- Data do movimento
    MO_SEQMOV   VARCHAR(3)
);
GO

/*
Tabela FPFD
Explicação dos campos e vínculos:

ID: Identificador único da tabela, definido como BIGINT com auto-incremento (IDENTITY(1,1)).
FD_IDFPFD: Identificador específico da tabela FPFD, definido como INT com auto-incremento (IDENTITY(1,1)).
FD_TIPVAL: Tipo de valor, armazenado como VARCHAR(1) para até 1 caractere.
FD_NUMFAI: Número de faixas, armazenado como VARCHAR(2) para até 2 caracteres.
FD_VALFAI: Valor da faixa, armazenado como FLOAT (anteriormente NUMERIC(13,2)).
FD_ALIQUO: Alíquota aplicada, agora armazenada como FLOAT (anteriormente NUMERIC(6,2)).
FD_VALDES: Valor do desconto, também convertido para FLOAT (anteriormente NUMERIC(12,2)).
FD_NUMEMP: Número da empresa, armazenado como FLOAT (anteriormente NUMERIC(2,0)).
FD_NFILIAL: Número da filial, armazenado como FLOAT (anteriormente NUMERIC(4,0)).
Vínculos:
Vínculo com FPEMP: O campo FD_NUMEMP e FD_NFILIAL são vinculados à tabela FPEMP (que contém os campos ce_NUMEMP e ce_NFILIAL), para garantir que as informações da empresa e filial estejam corretas.

Vínculo com FPCD: O campo FD_NUMEMP está vinculado ao campo CD_NUMEMP da tabela FPCD, garantindo que a empresa vinculada ao funcionário esteja correta.

*/


CREATE TABLE FPFD (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,        -- Identificador único com auto-incremento (BIGINT)
  	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde	
    ID_FPCD BIGINT REFERENCES FPCD(ID),				-- * FUNCIONÁRIOS
    FD_IDFPFD  INT,               -- Identificador específico da tabela FPFD com auto-incremento
    FD_TIPVAL  VARCHAR(1),                      -- Tipo de valor (1 caractere)
    FD_NUMFAI  VARCHAR(2),                      -- Número de faixas (2 caracteres)
    FD_VALFAI  FLOAT,                           -- Valor da faixa (FLOAT, substituindo NUMERIC(13,2))
    FD_ALIQUO  FLOAT,                           -- Alíquota aplicada (FLOAT, substituindo NUMERIC(6,2))
    FD_VALDES  FLOAT
);
GO

/*
Tabela fptb
Explicação dos campos e vínculos:
ID: Identificador único da tabela, gerado automaticamente com BIGINT e IDENTITY(1,1) para auto-incrementar.
TB_CODPEC: Código da peça, agora definido como FLOAT (anteriormente NUMERIC(3,0)), permitindo o armazenamento de números inteiros ou decimais.
TB_PREUNI: Preço unitário da peça, agora armazenado como FLOAT (anteriormente NUMERIC(13,2)), para suportar valores com casas decimais.
TB_DESPEC: Descrição da peça, armazenada como VARCHAR(30), com até 30 caracteres.
TB_PRODIA: Produção diária, agora definida como FLOAT (anteriormente NUMERIC(6,2)), para armazenar valores decimais.
TB_NUMEMP: Número da empresa, armazenado como FLOAT (anteriormente NUMERIC(2,0)).
TB_NFILIAL: Número da filial, armazenado como FLOAT (anteriormente NUMERIC(4,0)).
Vínculos:
Vínculo com FPEMP: O campo TB_NUMEMP e TB_NFILIAL estão vinculados à tabela FPEMP (campos ce_NUMEMP e ce_NFILIAL), garantindo que as informações de empresa e filial sejam consistentes.

Vínculo com FPCD: O campo TB_NUMEMP está vinculado à tabela FPCD (campo CD_NUMEMP), garantindo que a empresa associada ao funcionário esteja correta.

*/
CREATE TABLE FPTB (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,        -- Identificador único com auto-incremento (BIGINT)
   	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde	
    ID_FPCD BIGINT REFERENCES FPCD(ID),				-- * FUNCIONÁRIOS
    TB_CODPEC   FLOAT,                          -- Código da peça (FLOAT, substituindo NUMERIC(3,0))
    TB_PREUNI   FLOAT,                          -- Preço unitário da peça (FLOAT, substituindo NUMERIC(13,2))
    TB_DESPEC   VARCHAR(30),                    -- Descrição da peça (até 30 caracteres)
    TB_PRODIA   FLOAT
);
GO

/*
TABELA FPVE
Explicação dos campos e otimizações:
ID: Identificador único da tabela, gerado automaticamente com BIGINT e IDENTITY(1,1) para garantir exclusividade e melhorar a indexação.
IDFPVE: Identificador único da tabela FPVE, com auto-incremento (IDENTITY(1,1)), utilizado para gerenciar registros de forma eficiente.
MAT: Número da matrícula do funcionário, armazenado como VARCHAR(6), com até 6 caracteres, criando um vínculo com a tabela FPCD.
VER: Código da verba, definido como VARCHAR(3) para representar até 3 caracteres.
DIA: Representa o dia do evento, armazenado como VARCHAR(2), com até 2 caracteres.
VAL: Valor da verba, agora definido como FLOAT, substituindo NUMERIC(13,2) para melhorar a flexibilidade de armazenamento de valores decimais.
SIG: Sinal do valor (positivo ou negativo), definido como FLOAT (anteriormente NUMERIC(6,0)), permitindo maior precisão.
DOC: Documento associado, armazenado como VARCHAR(10), com até 10 caracteres.
NUMEMP: Número da empresa, agora definido como FLOAT, substituindo NUMERIC(2,0) para armazenar valores inteiros.
NFILIAL: Número da filial, agora definido como FLOAT, substituindo NUMERIC(4,0).
Vínculos e Otimização de Relacionamentos:
Vínculo com FPEMP: O campo NUMEMP e NFILIAL estão vinculados à tabela FPEMP (campos ce_NUMEMP e ce_NFILIAL), garantindo que as informações da empresa e filial estejam corretas. Isso melhora a integridade referencial entre as tabelas e otimiza consultas baseadas em empresa e filial.

Vínculo com FPCD: O campo MAT está vinculado à tabela FPCD (campo CD_NUMMAT), garantindo que a matrícula do funcionário esteja correta, otimizando consultas relacionadas ao funcionário.

Considerações de Desempenho:
O uso de FLOAT em vez de NUMERIC otimiza a manipulação de valores decimais, especialmente em casos de grande volume de dados.
As chaves primárias e estrangeiras são configuradas para garantir a integridade dos dados, e a indexação clusterizada no campo IDFPVE facilita consultas rápidas e eficientes.

*/
CREATE TABLE FPVE (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,             -- Identificador único com auto-incremento (BIGINT)
	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde	
    ID_FPCD BIGINT REFERENCES FPCD(ID),				-- * FUNCIONÁRIOS
    IDFPVE INT,               -- Identificador específico da tabela FPVE com auto-incremento
    MAT VARCHAR(6) NOT NULL,                          -- Número da matrícula do funcionário (até 6 caracteres)
    VER VARCHAR(3) NOT NULL,                          -- Código da verba (até 3 caracteres)
    DIA VARCHAR(2) NOT NULL,                          -- Dia do evento (até 2 caracteres)
    VAL FLOAT NOT NULL,                               -- Valor da verba
    SIG FLOAT NOT NULL,                               -- Sinal do valor, usado para indicar positivo ou negativo
    DOC VARCHAR(10) NOT NULL
);
GO


-- Arquivo de IRF - RENDIMENTOS RETENCAO, DEDUCOES IRF MES A MES   ACUMULADO 
/*
Explicação dos Campos:
ID: Identificador único da tabela, com auto-incremento.
DF_NUMMAT: Número da matrícula do funcionário.
DF_CODRET: Código de retenção aplicado ao funcionário.
DF_ESPBEN: Espécie do benefício (por exemplo, aposentadoria, pensão).
DF_NUMCIC: Número do CPF ou CNPJ do beneficiário.
DF_NOMBEN: Nome completo do beneficiário.
Campos Mensais de Rendimento, Dedução e IRRF:

Para cada mês, existem três campos:

DF_RENXXX: Rendimento bruto no mês especificado.
DF_DEDXXX: Total de deduções no mês.
DF_IRFXXX: Valor do Imposto de Renda Retido na Fonte no mês.
Onde XXX representa:

JAN: Janeiro
FEV: Fevereiro
MAR: Março
ABR: Abril
MAI: Maio
JUN: Junho
JUL: Julho
AGO: Agosto
SET: Setembro
OUT: Outubro
NOV: Novembro
DEZ: Dezembro
Campos do 13º Salário:

DF_VAL13S: Valor bruto do 13º salário.
DF_DED13S: Deduções aplicadas no 13º salário.
DF_IRF13S: Imposto de Renda Retido na Fonte sobre o 13º salário.
Informações da Empresa e Filial:

DF_NUMEMP: Número identificador da empresa.
DF_NFILIAL: Número identificador da filial.
Vínculos Criados:
Vínculo com FPEMP: Os campos DF_NUMEMP e DF_NFILIAL referenciam a tabela FPEMP através dos campos ps_NUMEMP e ps_NFILIAL, respectivamente. Isso garante que cada registro esteja associado a uma empresa e filial existentes.

Vínculo com FPCD: O campo DF_NUMMAT referencia a tabela FPCD através do campo CD_NUMMAT, garantindo a associação correta com a matrícula do funcionário.

Considerações:
Todos os campos numéricos originalmente definidos como NUMERIC foram alterados para FLOAT para permitir maior flexibilidade no armazenamento de valores decimais.

A chave primária foi definida no campo DF_NUMMAT, que identifica unicamente cada funcionário na tabela.

Uma restrição de unicidade foi adicionada ao campo DF_NUMCIC para garantir que cada CPF ou CNPJ seja único na tabela.
*/
CREATE TABLE FPDF (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,         -- Identificador único com auto-incremento (BIGINT)
	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde	
    ID_FPCD BIGINT REFERENCES FPCD(ID),				-- * FUNCIONÁRIOS
    DF_CODRET VARCHAR(4),                        -- Código de retenção (até 4 caracteres)
    DF_ESPBEN VARCHAR(1),                        -- Espécie do benefício (1 caractere)
    DF_NUMCIC VARCHAR(14),                       -- Número do CPF ou CNPJ do beneficiário (14 caracteres)
    DF_NOMBEN VARCHAR(30),                       -- Nome do beneficiário (até 30 caracteres)
    
    -- Campos de rendimentos, deduções e IRRF por mês
    DF_RENJAN FLOAT,                             -- Rendimento de Janeiro
    DF_DEDJAN FLOAT,                             -- Deduções de Janeiro
    DF_IRFJAN FLOAT,                             -- IRRF de Janeiro

    DF_RENFEV FLOAT,                             -- Rendimento de Fevereiro
    DF_DEDFEV FLOAT,                             -- Deduções de Fevereiro
    DF_IRFFEV FLOAT,                             -- IRRF de Fevereiro

    DF_RENMAR FLOAT,                             -- Rendimento de Março
    DF_DEDMAR FLOAT,                             -- Deduções de Março
    DF_IRFMAR FLOAT,                             -- IRRF de Março

    DF_RENABR FLOAT,                             -- Rendimento de Abril
    DF_DEDABR FLOAT,                             -- Deduções de Abril
    DF_IRFABR FLOAT,                             -- IRRF de Abril

    DF_RENMAI FLOAT,                             -- Rendimento de Maio
    DF_DEDMAI FLOAT,                             -- Deduções de Maio
    DF_IRFMAI FLOAT,                             -- IRRF de Maio

    DF_RENJUN FLOAT,                             -- Rendimento de Junho
    DF_DEDJUN FLOAT,                             -- Deduções de Junho
    DF_IRFJUN FLOAT,                             -- IRRF de Junho

    DF_RENJUL FLOAT,                             -- Rendimento de Julho
    DF_DEDJUL FLOAT,                             -- Deduções de Julho
    DF_IRFJUL FLOAT,                             -- IRRF de Julho

    DF_RENAGO FLOAT,                             -- Rendimento de Agosto
    DF_DEDAGO FLOAT,                             -- Deduções de Agosto
    DF_IRFAGO FLOAT,                             -- IRRF de Agosto

    DF_RENSET FLOAT,                             -- Rendimento de Setembro
    DF_DEDSET FLOAT,                             -- Deduções de Setembro
    DF_IRFSET FLOAT,                             -- IRRF de Setembro

    DF_RENOUT FLOAT,                             -- Rendimento de Outubro
    DF_DEDOUT FLOAT,                             -- Deduções de Outubro
    DF_IRFOUT FLOAT,                             -- IRRF de Outubro

    DF_RENNOV FLOAT,                             -- Rendimento de Novembro
    DF_DEDNOV FLOAT,                             -- Deduções de Novembro
    DF_IRFNOV FLOAT,                             -- IRRF de Novembro

    DF_RENDEZ FLOAT,                             -- Rendimento de Dezembro
    DF_DEDDEZ FLOAT,                             -- Deduções de Dezembro
    DF_IRFDEZ FLOAT,                             -- IRRF de Dezembro

    -- Campos referentes ao 13º salário
    DF_VAL13S FLOAT,                             -- Valor do 13º salário
    DF_DED13S FLOAT,                             -- Deduções do 13º salário
    DF_IRF13S FLOAT
);
GO

/*
Arquivo da RAIS BASE GERADORA DE TODUS OS DADOS DO FUNCIONARIO TODO HISTORICO PRA CONSULTAS E GERACAO DE RAIS E INFORME DE RENDIMENTOS.
---// Arquivo de IRF 

Explicação dos Campos:
ID: Identificador único da tabela, com auto-incremento.
RA_NUMMAT: Número da matrícula do funcionário, chave primária.
RA_NUMPIS: Número do PIS do funcionário.
RA_NOMFUN: Nome completo do funcionário.
RA_NUMCP: Número da carteira de trabalho.
RA_SERCP: Série da carteira de trabalho.
RA_DTNASC: Data de nascimento do funcionário.
RA_DATADM: Data de admissão do funcionário.
RA_OPCFGTR: Indica se o funcionário optou pelo FGTS.
RA_DATFGT: Data de opção pelo FGTS.
RA_NUMCBO: Código CBO (Classificação Brasileira de Ocupações).
RA_VINEMP: Tipo de vínculo empregatício.
RA_CODSIT: Código da situação do contrato de trabalho.
RA_GRINST: Grau de instrução do funcionário.
RA_NACION: Nacionalidade do funcionário.
RA_ANOCHE: Ano de chegada ao Brasil (se aplicável).
RA_SALBAS: Salário base do funcionário.
RA_TIPSAL: Tipo de salário (mensal, semanal, etc.).
RA_HORSEM: Horas semanais de trabalho.
RA_DDMMRE: Data de rescisão do contrato (dia/mês).
RA_CODRES: Código do motivo de rescisão.
RA_REMANO: Remuneração anual.
RA_VLAD13: Valor do adiantamento do 13º salário.
RA_MMAD13: Mês do adiantamento do 13º salário.
RA_VAL13S: Valor do 13º salário.
RA_MES13S: Mês de pagamento do 13º salário.
RA_NUMMES: Número de meses trabalhados.
Remuneração Mensal:

RA_REMXXX: Remuneração mensal para cada mês (onde XXX indica o mês: JAN, FEV, MAR, etc.).
Vínculos:
Vínculo com FPEMP: Os campos RA_NUMEMP e RA_NFILIAL estão vinculados à tabela FPEMP (campos ce_NUMEMP e ce_NFILIAL), garantindo que as informações da empresa e filial estejam corretas.

Vínculo com FPCD: O campo RA_NUMMAT está vinculado à tabela FPCD (campo CD_NUMMAT), garantindo a associação correta com a matrícula do funcionário.

Considerações:
Os campos numéricos originalmente definidos como NUMERIC foram alterados para FLOAT, o que permite maior flexibilidade ao lidar com números decimais e inteiros.
A chave primária foi definida no campo RA_NUMMAT, garantindo que cada funcionário tenha um registro único.


*/
CREATE TABLE FPRA (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,         -- Identificador único com auto-incremento (BIGINT)
	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde	
    ID_FPCD BIGINT REFERENCES FPCD(ID),				-- * FUNCIONÁRIOS
    RA_NUMPIS  VARCHAR(11),                      -- Número do PIS do funcionário (11 caracteres)
    RA_NOMFUN  VARCHAR(30),                      -- Nome completo do funcionário (até 30 caracteres)
    RA_NUMCP   VARCHAR(6),                       -- Número da carteira de trabalho (até 6 caracteres)
    RA_SERCP   VARCHAR(5),                       -- Série da carteira de trabalho (até 5 caracteres)
    RA_DTNASC  DATE,                             -- Data de nascimento do funcionário
    RA_DATADM  DATE,                             -- Data de admissão do funcionário
    RA_OPCFGTR VARCHAR(1),                       -- Opção pelo FGTS (1 caractere)
    RA_DATFGT  VARCHAR(4),                       -- Data de opção pelo FGTS (4 caracteres)
    RA_NUMCBO  VARCHAR(7),                       -- Código CBO (7 caracteres)
    RA_VINEMP  VARCHAR(1),                       -- Tipo de vínculo empregatício (1 caractere)
    RA_CODSIT  VARCHAR(1),                       -- Código da situação do contrato (1 caractere)
    RA_GRINST  VARCHAR(1),                       -- Grau de instrução (1 caractere)
    RA_NACION  VARCHAR(2),                       -- Nacionalidade do funcionário (2 caracteres)
    RA_ANOCHE  VARCHAR(2),                       -- Ano de chegada ao Brasil, se aplicável (2 caracteres)
    RA_SALBAS  VARCHAR(9),                       -- Salário base do funcionário (9 caracteres)
    RA_TIPSAL  VARCHAR(1),                       -- Tipo de salário (1 caractere)
    RA_HORSEM  VARCHAR(2),                       -- Horas semanais trabalhadas (2 caracteres)
    RA_DDMMRE  VARCHAR(4),                       -- Data de rescisão (4 caracteres)
    RA_CODRES  VARCHAR(1),                       -- Código do motivo de rescisão (1 caractere)
    RA_REMANO  VARCHAR(10),                      -- Remuneração anual (10 caracteres)
    RA_VLAD13  VARCHAR(9),                       -- Valor do adiantamento do 13º salário (9 caracteres)
    RA_MMAD13  VARCHAR(2),                       -- Mês do adiantamento do 13º salário (2 caracteres)
    RA_VAL13S  VARCHAR(9),                       -- Valor do 13º salário integral (9 caracteres)
    RA_MES13S  VARCHAR(2),                       -- Mês de pagamento do 13º salário (2 caracteres)
    RA_NUMMES  VARCHAR(2),                       -- Número de meses trabalhados (2 caracteres)

    -- Remuneração mensal
    RA_REMJAN  VARCHAR(9),                       -- Remuneração de Janeiro (9 caracteres)
    RA_REMFEV  VARCHAR(9),                       -- Remuneração de Fevereiro (9 caracteres)
    RA_REMMAR  VARCHAR(9),                       -- Remuneração de Março (9 caracteres)
    RA_REMABR  VARCHAR(9),                       -- Remuneração de Abril (9 caracteres)
    RA_REMMAI  VARCHAR(9),                       -- Remuneração de Maio (9 caracteres)
    RA_REMJUN  VARCHAR(9),                       -- Remuneração de Junho (9 caracteres)
    RA_REMJUL  VARCHAR(9),                       -- Remuneração de Julho (9 caracteres)
    RA_REMAGO  VARCHAR(9),                       -- Remuneração de Agosto (9 caracteres)
    RA_REMSET  VARCHAR(9),                       -- Remuneração de Setembro (9 caracteres)
    RA_REMOUT  VARCHAR(9),                       -- Remuneração de Outubro (9 caracteres)
    RA_REMNOV  VARCHAR(9),                       -- Remuneração de Novembro (9 caracteres)
    RA_REMDEZ  VARCHAR(9)
);
GO

-- // Arquivo de Verbas de Rescisao
/*
Explicação dos Campos:
ID: Identificador único da tabela, com auto-incremento.
MR_NUMMAT: Número da matrícula do funcionário, chave primária.
MR_NUMLOT: Número do lote de pagamento.
MR_DIA: Dia do evento (por exemplo, dia do mês referente ao pagamento).
MR_ANOMES: Representação do ano e mês do evento, armazenado como VARCHAR(4) (por exemplo, '202312' para dezembro de 2023).
MR_CODVER: Código da verba associada ao pagamento.
MR_QTDHOR: Quantidade de horas trabalhadas, armazenado como FLOAT para valores numéricos flexíveis (substituindo NUMERIC(3,0)).
MR_FATOR: Fator de multiplicação aplicado à verba.
MR_VALVER: Valor da verba, armazenado como FLOAT para valores decimais (substituindo NUMERIC(13,2)).
MR_INSIDE: Indicador se a verba é interna ou externa.
MR_VERBA: Tipo de verba (ex: pagamento, adiantamento).
MR_RES: Indicador de resultado (resolução final do pagamento).
MR_NUMEMP: Número da empresa, armazenado como FLOAT (substituindo NUMERIC(2,0)).
MR_NFILIAL: Número da filial, armazenado como FLOAT (substituindo NUMERIC(4,0)).
Vínculos:
Vínculo com FPEMP: Os campos MR_NUMEMP e MR_NFILIAL referenciam a tabela FPEMP através dos campos ce_NUMEMP e ce_NFILIAL. Isso garante que cada registro na tabela FPMR esteja corretamente associado a uma empresa e filial válidas.

Vínculo com FPCD: O campo MR_NUMMAT referencia a tabela FPCD através do campo CD_NUMMAT, garantindo que a matrícula do funcionário esteja corretamente associada.

Considerações:
Os campos originalmente definidos como NUMERIC foram substituídos por FLOAT, permitindo maior flexibilidade no armazenamento de números decimais e inteiros.
A chave primária foi definida no campo MR_NUMMAT, que identifica de forma única cada funcionário na tabela.
*/

CREATE TABLE FPMR (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,         -- Identificador único com auto-incremento (BIGINT)
	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde	
    ID_FPCD BIGINT REFERENCES FPCD(ID),				-- * FUNCIONÁRIOS
    MR_NUMLOT VARCHAR(8),                        -- Número do lote de pagamento (até 8 caracteres)
    MR_DIA    VARCHAR(2),                        -- Dia do evento (até 2 caracteres)
    MR_ANOMES VARCHAR(4),                        -- Ano e mês do evento (até 4 caracteres, ex: '202312' para dezembro de 2023)
    MR_CODVER VARCHAR(3),                        -- Código da verba (até 3 caracteres)
    MR_QTDHOR FLOAT,                             -- Quantidade de horas (FLOAT, substituindo NUMERIC(3,0))
    MR_FATOR  VARCHAR(5),                        -- Fator aplicado (até 5 caracteres)
    MR_VALVER FLOAT,                             -- Valor da verba (FLOAT, substituindo NUMERIC(13,2))
    MR_INSIDE VARCHAR(1),                        -- Indicador de verba interna ou externa (1 caractere)
    MR_VERBA  VARCHAR(1),                        -- Tipo de verba (1 caractere)
    MR_RES    VARCHAR(1)
);
GO
/*
--  // Arquivo de  
 -- // Arquivo de Verbas de Ferias
 Explicação dos Campos:
ID: Identificador único da tabela, com auto-incremento.
RE_CODIGO: Código referente ao registro, identificado com um caractere.
RE_FAIXA: Faixa de valores a que se aplica, armazenada como FLOAT (anteriormente NUMERIC(13,2)).
RE_ALIQUOT: Alíquota aplicada, definida como VARCHAR(3) para permitir até 3 caracteres.
RE_VALOR: Valor associado ao registro, armazenado como FLOAT (anteriormente NUMERIC(13,2)).
RE_NUMEMP: Número da empresa, armazenado como FLOAT (substituindo NUMERIC(2,0)).
RE_NFILIAL: Número da filial, armazenado como FLOAT (substituindo NUMERIC(4,0)).
Vínculos:
Vínculo com FPEMP: Os campos RE_NUMEMP e RE_NFILIAL estão vinculados à tabela FPEMP (campos ce_NUMEMP e ce_NFILIAL), garantindo que as informações de empresa e filial estejam corretas.

Vínculo com FPCD: O campo RE_CODIGO está vinculado à tabela FPCD (campo CD_NUMMAT), garantindo a associação correta entre a matrícula do funcionário e os registros desta tabela.

Considerações:
FLOAT foi utilizado para substituir NUMERIC nos campos que armazenam valores financeiros, permitindo maior flexibilidade no armazenamento de valores decimais.
A chave primária foi mantida no campo ID, garantindo que cada registro tenha um identificador único.

*/

CREATE TABLE FPRE (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,         -- Identificador único com auto-incremento (BIGINT)
   	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde	
    ID_FPCD BIGINT REFERENCES FPCD(ID),				-- * FUNCIONÁRIOS
    RE_CODIGO  VARCHAR(1),                       -- Código referente ao registro (1 caractere)
    RE_FAIXA   FLOAT,                            -- Faixa de valor (FLOAT, substituindo NUMERIC(13,2))
    RE_ALIQUOT VARCHAR(3),                       -- Alíquota aplicada (até 3 caracteres)
    RE_VALOR   FLOAT
);
GO

-- // Arquivo de Valores Acumulados
  /*
  Explicação dos Campos:
VID: Identificador único da tabela, com auto-incremento.
VA_NUMMAT: Número da matrícula do funcionário, chave primária, vinculado à tabela FPCD.
VA_NUMLOT: Número do lote de pagamento.
VA_DIA: Dia do evento (por exemplo, dia do mês referente ao pagamento).
VA_ANOMES: Ano e mês do evento, armazenado como VARCHAR(4) (por exemplo, '202312' para dezembro de 2023).
VA_CODVER: Código da verba associada ao pagamento.
VA_QTDHOR: Quantidade de horas trabalhadas, armazenada como FLOAT (substituindo NUMERIC(3,0)).
VA_VALVER: Valor da verba, armazenado como FLOAT (substituindo NUMERIC(13,2)).
VA_RES: Indicador de resultado (resolução final do pagamento).
VA_INSIDE: Indicador de verba interna ou externa.
VA_VERBA: Tipo de verba (ex: pagamento, adiantamento).
VA_FATOR: Fator de multiplicação aplicado à verba.
VA_NUMEMP: Número da empresa, armazenado como FLOAT (substituindo NUMERIC(2,0)).
VA_NFILIAL: Número da filial, armazenado como FLOAT (substituindo NUMERIC(4,0)).
Vínculos:
Vínculo com FPEMP: Os campos VA_NUMEMP e VA_NFILIAL referenciam a tabela FPEMP através dos campos ce_NUMEMP e ce_NFILIAL, garantindo que cada registro na tabela FPRES esteja corretamente associado a uma empresa e filial válidas.

Vínculo com FPCD: O campo VA_NUMMAT referencia a tabela FPCD através do campo CD_NUMMAT, garantindo que a matrícula do funcionário esteja corretamente associada.

Considerações:
Os campos originalmente definidos como NUMERIC foram substituídos por FLOAT, permitindo maior flexibilidade no armazenamento de números decimais e inteiros.
A chave primária foi definida no campo VA_NUMMAT, garantindo que cada funcionário tenha um registro único.


*/
CREATE TABLE FPRES (
    ID BIGINT IDENTITY(1,1) PRIMARY KEY,       -- Identificador único com auto-incremento (BIGINT)
   	ID_FPEMP BIGINT REFERENCES FPEMP(ID),       -- * Referenciar a empresa que estar um vível acima, nos casos de empresas Matriz ou Rolde	
    ID_FPCD BIGINT REFERENCES FPCD(ID),				-- * FUNCIONÁRIOS
    VA_NUMLOT  VARCHAR(8),                      -- Número do lote de pagamento (até 8 caracteres)
    VA_DIA     VARCHAR(2),                      -- Dia do evento (até 2 caracteres)
    VA_ANOMES  VARCHAR(4),                      -- Ano e mês do evento (até 4 caracteres, ex: '202312' para dezembro de 2023)
    VA_CODVER  VARCHAR(3),                      -- Código da verba (até 3 caracteres)
    VA_QTDHOR  FLOAT,                           -- Quantidade de horas (FLOAT, substituindo NUMERIC(3,0))
    VA_VALVER  FLOAT,                           -- Valor da verba (FLOAT, substituindo NUMERIC(13,2))
    VA_RES     VARCHAR(1),                      -- Indicador de resultado (1 caractere)
    VA_INSIDE  VARCHAR(1),                      -- Indicador de verba interna ou externa (1 caractere)
    VA_VERBA   VARCHAR(1),                      -- Tipo de verba (1 caractere)
    VA_FATOR   VARCHAR(5)
);
GO



