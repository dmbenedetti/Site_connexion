
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/30/2015 10:32:36
-- Generated from EDMX file: C:\Daniel\PortalDor\App_Code\modelagem_portal.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [db_rede_dor];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[fk_arquivo_conteudo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_PORTAL_ARQUIVO] DROP CONSTRAINT [fk_arquivo_conteudo];
GO
IF OBJECT_ID(N'[dbo].[fk_arquivo_status]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_PORTAL_ARQUIVO] DROP CONSTRAINT [fk_arquivo_status];
GO
IF OBJECT_ID(N'[dbo].[FK_banner_idioma]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_PORTAL_BANNER] DROP CONSTRAINT [FK_banner_idioma];
GO
IF OBJECT_ID(N'[dbo].[fk_banner_status]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_PORTAL_BANNER] DROP CONSTRAINT [fk_banner_status];
GO
IF OBJECT_ID(N'[dbo].[FK_cidades]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[cidades] DROP CONSTRAINT [FK_cidades];
GO
IF OBJECT_ID(N'[dbo].[fk_controle_noticia_status]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_CONTROLE_NOTICIA] DROP CONSTRAINT [fk_controle_noticia_status];
GO
IF OBJECT_ID(N'[dbo].[fk_edicao_revista_status]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_PORTAL_EDICAO_REVISTA] DROP CONSTRAINT [fk_edicao_revista_status];
GO
IF OBJECT_ID(N'[dbo].[fk_especialidade_hospital_id_especialidade]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_ESPECIALIDADE_HOSPITAL] DROP CONSTRAINT [fk_especialidade_hospital_id_especialidade];
GO
IF OBJECT_ID(N'[dbo].[fk_especialidade_hospital_id_hospital]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_ESPECIALIDADE_HOSPITAL] DROP CONSTRAINT [fk_especialidade_hospital_id_hospital];
GO
IF OBJECT_ID(N'[dbo].[fk_estado_hosp]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_HOSPITAL] DROP CONSTRAINT [fk_estado_hosp];
GO
IF OBJECT_ID(N'[dbo].[fk_exame_hospital_id_exame]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_EXAME_HOSPITAL] DROP CONSTRAINT [fk_exame_hospital_id_exame];
GO
IF OBJECT_ID(N'[dbo].[fk_exame_hospital_id_hospital]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_EXAME_HOSPITAL] DROP CONSTRAINT [fk_exame_hospital_id_hospital];
GO
IF OBJECT_ID(N'[dbo].[fk_formulario_hospital]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_FORMULARIOS] DROP CONSTRAINT [fk_formulario_hospital];
GO
IF OBJECT_ID(N'[dbo].[fk_formulario_status]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_FORMULARIOS] DROP CONSTRAINT [fk_formulario_status];
GO
IF OBJECT_ID(N'[dbo].[fk_interna_edicao]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_PORTAL_CONTEUDO] DROP CONSTRAINT [fk_interna_edicao];
GO
IF OBJECT_ID(N'[dbo].[fk_interna_idioma]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_PORTAL_CONTEUDO] DROP CONSTRAINT [fk_interna_idioma];
GO
IF OBJECT_ID(N'[dbo].[fk_interna_noticia]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_PORTAL_CONTEUDO] DROP CONSTRAINT [fk_interna_noticia];
GO
IF OBJECT_ID(N'[dbo].[fk_interna_sessao]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_PORTAL_CONTEUDO] DROP CONSTRAINT [fk_interna_sessao];
GO
IF OBJECT_ID(N'[dbo].[fk_interna_status]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_PORTAL_CONTEUDO] DROP CONSTRAINT [fk_interna_status];
GO
IF OBJECT_ID(N'[dbo].[fk_interna_tipo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_PORTAL_CONTEUDO] DROP CONSTRAINT [fk_interna_tipo];
GO
IF OBJECT_ID(N'[dbo].[fk_newsletter_hospital]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_NEWSLETTER] DROP CONSTRAINT [fk_newsletter_hospital];
GO
IF OBJECT_ID(N'[dbo].[fk_permissoes_hospital]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_PERMISSAO_ADMIN] DROP CONSTRAINT [fk_permissoes_hospital];
GO
IF OBJECT_ID(N'[dbo].[fk_permissoes_user]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_PERMISSAO_ADMIN] DROP CONSTRAINT [fk_permissoes_user];
GO
IF OBJECT_ID(N'[dbo].[fk_portal_especialistas_status]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_PORTAL_ESPECIALISTA] DROP CONSTRAINT [fk_portal_especialistas_status];
GO
IF OBJECT_ID(N'[dbo].[fk_portal_programente_status]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_PORTAL_PROGRAMETES] DROP CONSTRAINT [fk_portal_programente_status];
GO
IF OBJECT_ID(N'[dbo].[fk_portal_saude_especialista]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_PORTAL_SAUDE_HSL_DOR] DROP CONSTRAINT [fk_portal_saude_especialista];
GO
IF OBJECT_ID(N'[dbo].[fk_portal_saude_status]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_PORTAL_SAUDE_HSL_DOR] DROP CONSTRAINT [fk_portal_saude_status];
GO
IF OBJECT_ID(N'[dbo].[fk_portal_saude_tema]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_PORTAL_SAUDE_HSL_DOR] DROP CONSTRAINT [fk_portal_saude_tema];
GO
IF OBJECT_ID(N'[dbo].[fk_portal_tema_status]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_PORTAL_TEMA] DROP CONSTRAINT [fk_portal_tema_status];
GO
IF OBJECT_ID(N'[dbo].[fk_prontosocorro_hospital_id_hospital]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_PRONTOSOCORRO_HOSPITAL] DROP CONSTRAINT [fk_prontosocorro_hospital_id_hospital];
GO
IF OBJECT_ID(N'[dbo].[fk_prontosocorro_hospital_prontosocorro]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_PRONTOSOCORRO_HOSPITAL] DROP CONSTRAINT [fk_prontosocorro_hospital_prontosocorro];
GO
IF OBJECT_ID(N'[dbo].[fk_sessao_status]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_PORTAL_SESSAO] DROP CONSTRAINT [fk_sessao_status];
GO
IF OBJECT_ID(N'[dbo].[fk_sessao_tipo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_PORTAL_TIPO] DROP CONSTRAINT [fk_sessao_tipo];
GO
IF OBJECT_ID(N'[dbo].[FK_slider_idioma]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_PORTAL_SLIDER] DROP CONSTRAINT [FK_slider_idioma];
GO
IF OBJECT_ID(N'[dbo].[fk_slider_status]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_PORTAL_SLIDER] DROP CONSTRAINT [fk_slider_status];
GO
IF OBJECT_ID(N'[dbo].[fk_status_especialidade]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_EPSECIALIDADE] DROP CONSTRAINT [fk_status_especialidade];
GO
IF OBJECT_ID(N'[dbo].[fk_status_exame]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_EXAME] DROP CONSTRAINT [fk_status_exame];
GO
IF OBJECT_ID(N'[dbo].[fk_status_hosp]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_HOSPITAL] DROP CONSTRAINT [fk_status_hosp];
GO
IF OBJECT_ID(N'[dbo].[fk_status_idioma]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_IDIOMA] DROP CONSTRAINT [fk_status_idioma];
GO
IF OBJECT_ID(N'[dbo].[fk_status_prontosocorro]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_PRONTOSOCORRO] DROP CONSTRAINT [fk_status_prontosocorro];
GO
IF OBJECT_ID(N'[dbo].[fk_status_user]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_ADMIN_USER] DROP CONSTRAINT [fk_status_user];
GO
IF OBJECT_ID(N'[dbo].[FK_TB_AREA_MEDICA_CURSO_ESPECIALIDADE_TB_AREA_MEDICA_CURSO]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_AREA_MEDICA_CURSO_ESPECIALIDADE] DROP CONSTRAINT [FK_TB_AREA_MEDICA_CURSO_ESPECIALIDADE_TB_AREA_MEDICA_CURSO];
GO
IF OBJECT_ID(N'[dbo].[FK_TB_AREA_MEDICA_CURSO_ESPECIALIDADE_TB_EPSECIALIDADE]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_AREA_MEDICA_CURSO_ESPECIALIDADE] DROP CONSTRAINT [FK_TB_AREA_MEDICA_CURSO_ESPECIALIDADE_TB_EPSECIALIDADE];
GO
IF OBJECT_ID(N'[dbo].[FK_TB_AREA_MEDICA_CURSO_HOSPITAL_TB_AREA_MEDICA_CURSO_HOSPITAL]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_AREA_MEDICA_CURSO_HOSPITAL] DROP CONSTRAINT [FK_TB_AREA_MEDICA_CURSO_HOSPITAL_TB_AREA_MEDICA_CURSO_HOSPITAL];
GO
IF OBJECT_ID(N'[dbo].[FK_TB_AREA_MEDICA_CURSO_HOSPITAL_TB_HOSPITAL]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_AREA_MEDICA_CURSO_HOSPITAL] DROP CONSTRAINT [FK_TB_AREA_MEDICA_CURSO_HOSPITAL_TB_HOSPITAL];
GO
IF OBJECT_ID(N'[dbo].[FK_TB_AREA_MEDICA_CURSO_TB_HOSPITAL]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_AREA_MEDICA_CURSO] DROP CONSTRAINT [FK_TB_AREA_MEDICA_CURSO_TB_HOSPITAL];
GO
IF OBJECT_ID(N'[dbo].[FK_TB_AREA_MEDICA_CURSO_TB_STATUS]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_AREA_MEDICA_CURSO] DROP CONSTRAINT [FK_TB_AREA_MEDICA_CURSO_TB_STATUS];
GO
IF OBJECT_ID(N'[dbo].[FK_TB_HOSPITAL_CORPO_CLINICO_HOSPITAL_TB_HOSPITAL]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_HOSPITAL_CORPO_CLINICO_HOSPITAL] DROP CONSTRAINT [FK_TB_HOSPITAL_CORPO_CLINICO_HOSPITAL_TB_HOSPITAL];
GO
IF OBJECT_ID(N'[dbo].[FK_TB_HOSPITAL_CORPO_CLINICO_HOSPITAL_TB_HOSPITAL_CORPO_CLINICO]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_HOSPITAL_CORPO_CLINICO_HOSPITAL] DROP CONSTRAINT [FK_TB_HOSPITAL_CORPO_CLINICO_HOSPITAL_TB_HOSPITAL_CORPO_CLINICO];
GO
IF OBJECT_ID(N'[dbo].[FK_TB_PORTAL_BANNER_TB_HOSPITAL]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_PORTAL_BANNER] DROP CONSTRAINT [FK_TB_PORTAL_BANNER_TB_HOSPITAL];
GO
IF OBJECT_ID(N'[dbo].[FK_TB_PORTAL_CONTEUDO_HOSPITAL_TB_HOSPITAL]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_PORTAL_CONTEUDO_HOSPITAL] DROP CONSTRAINT [FK_TB_PORTAL_CONTEUDO_HOSPITAL_TB_HOSPITAL];
GO
IF OBJECT_ID(N'[dbo].[FK_TB_PORTAL_CONTEUDO_HOSPITAL_TB_PORTAL_CONTEUDO]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_PORTAL_CONTEUDO_HOSPITAL] DROP CONSTRAINT [FK_TB_PORTAL_CONTEUDO_HOSPITAL_TB_PORTAL_CONTEUDO];
GO
IF OBJECT_ID(N'[dbo].[FK_TB_PORTAL_CONTEUDO_TB_HOSPITAL]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_PORTAL_CONTEUDO] DROP CONSTRAINT [FK_TB_PORTAL_CONTEUDO_TB_HOSPITAL];
GO
IF OBJECT_ID(N'[dbo].[FK_TB_PORTAL_SLIDER_TB_HOSPITAL]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_PORTAL_SLIDER] DROP CONSTRAINT [FK_TB_PORTAL_SLIDER_TB_HOSPITAL];
GO
IF OBJECT_ID(N'[dbo].[FK_TB_PORTAL_VIDEO_TB_IDIOMA]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_PORTAL_VIDEO] DROP CONSTRAINT [FK_TB_PORTAL_VIDEO_TB_IDIOMA];
GO
IF OBJECT_ID(N'[dbo].[FK_TB_PORTAL_VIDEO_TB_STATUS]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_PORTAL_VIDEO] DROP CONSTRAINT [FK_TB_PORTAL_VIDEO_TB_STATUS];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[cidades]', 'U') IS NOT NULL
    DROP TABLE [dbo].[cidades];
GO
IF OBJECT_ID(N'[dbo].[TB_ADMIN_USER]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_ADMIN_USER];
GO
IF OBJECT_ID(N'[dbo].[TB_AREA_MEDICA_CURSO]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_AREA_MEDICA_CURSO];
GO
IF OBJECT_ID(N'[dbo].[TB_AREA_MEDICA_CURSO_ESPECIALIDADE]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_AREA_MEDICA_CURSO_ESPECIALIDADE];
GO
IF OBJECT_ID(N'[dbo].[TB_AREA_MEDICA_CURSO_HOSPITAL]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_AREA_MEDICA_CURSO_HOSPITAL];
GO
IF OBJECT_ID(N'[dbo].[TB_CONTEUDO_METATAGS]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_CONTEUDO_METATAGS];
GO
IF OBJECT_ID(N'[dbo].[TB_CONTEUDO_PAGINA_FIXA]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_CONTEUDO_PAGINA_FIXA];
GO
IF OBJECT_ID(N'[dbo].[TB_CONTROLE_NOTICIA]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_CONTROLE_NOTICIA];
GO
IF OBJECT_ID(N'[dbo].[TB_DEMOSTRATIVO_FINANCEIRO]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_DEMOSTRATIVO_FINANCEIRO];
GO
IF OBJECT_ID(N'[dbo].[TB_EPSECIALIDADE]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_EPSECIALIDADE];
GO
IF OBJECT_ID(N'[dbo].[TB_ESPECIALIDADE_HOSPITAL]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_ESPECIALIDADE_HOSPITAL];
GO
IF OBJECT_ID(N'[dbo].[TB_EXAME]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_EXAME];
GO
IF OBJECT_ID(N'[dbo].[TB_EXAME_HOSPITAL]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_EXAME_HOSPITAL];
GO
IF OBJECT_ID(N'[dbo].[TB_FORMULARIOS]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_FORMULARIOS];
GO
IF OBJECT_ID(N'[dbo].[TB_FOTO_BEBE]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_FOTO_BEBE];
GO
IF OBJECT_ID(N'[dbo].[TB_HOSPITAL]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_HOSPITAL];
GO
IF OBJECT_ID(N'[dbo].[TB_HOSPITAL_CORPO_CLINICO]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_HOSPITAL_CORPO_CLINICO];
GO
IF OBJECT_ID(N'[dbo].[TB_HOSPITAL_CORPO_CLINICO_HOSPITAL]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_HOSPITAL_CORPO_CLINICO_HOSPITAL];
GO
IF OBJECT_ID(N'[db_rede_dorModelStoreContainer].[TB_HOSPITAL_DEPT_CONTATO]', 'U') IS NOT NULL
    DROP TABLE [db_rede_dorModelStoreContainer].[TB_HOSPITAL_DEPT_CONTATO];
GO
IF OBJECT_ID(N'[dbo].[TB_HOSPITAL_PORTAL]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_HOSPITAL_PORTAL];
GO
IF OBJECT_ID(N'[dbo].[TB_HOSPTIAL_FOTO_BEBE]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_HOSPTIAL_FOTO_BEBE];
GO
IF OBJECT_ID(N'[dbo].[TB_IDIOMA]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_IDIOMA];
GO
IF OBJECT_ID(N'[dbo].[TB_NEWSLETTER]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_NEWSLETTER];
GO
IF OBJECT_ID(N'[dbo].[TB_PERMISSAO_ADMIN]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_PERMISSAO_ADMIN];
GO
IF OBJECT_ID(N'[dbo].[TB_PORTAL_ARQUIVO]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_PORTAL_ARQUIVO];
GO
IF OBJECT_ID(N'[dbo].[TB_PORTAL_BANNER]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_PORTAL_BANNER];
GO
IF OBJECT_ID(N'[dbo].[TB_PORTAL_BANNER_CSS_TYPE]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_PORTAL_BANNER_CSS_TYPE];
GO
IF OBJECT_ID(N'[dbo].[TB_PORTAL_CONTEUDO]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_PORTAL_CONTEUDO];
GO
IF OBJECT_ID(N'[dbo].[TB_PORTAL_CONTEUDO_HOSPITAL]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_PORTAL_CONTEUDO_HOSPITAL];
GO
IF OBJECT_ID(N'[dbo].[TB_PORTAL_EDICAO_REVISTA]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_PORTAL_EDICAO_REVISTA];
GO
IF OBJECT_ID(N'[dbo].[TB_PORTAL_ESPECIALISTA]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_PORTAL_ESPECIALISTA];
GO
IF OBJECT_ID(N'[dbo].[TB_PORTAL_PROGRAMETES]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_PORTAL_PROGRAMETES];
GO
IF OBJECT_ID(N'[dbo].[TB_PORTAL_PROGRAMETES_DESTAQUE]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_PORTAL_PROGRAMETES_DESTAQUE];
GO
IF OBJECT_ID(N'[dbo].[TB_PORTAL_PROGRAMETES_TEXTO]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_PORTAL_PROGRAMETES_TEXTO];
GO
IF OBJECT_ID(N'[dbo].[TB_PORTAL_SAUDE_HSL_DOR]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_PORTAL_SAUDE_HSL_DOR];
GO
IF OBJECT_ID(N'[dbo].[TB_PORTAL_SESSAO]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_PORTAL_SESSAO];
GO
IF OBJECT_ID(N'[dbo].[TB_PORTAL_SLIDER]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_PORTAL_SLIDER];
GO
IF OBJECT_ID(N'[dbo].[TB_PORTAL_TEMA]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_PORTAL_TEMA];
GO
IF OBJECT_ID(N'[dbo].[TB_PORTAL_TIPO]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_PORTAL_TIPO];
GO
IF OBJECT_ID(N'[dbo].[TB_PORTAL_VIDEO]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_PORTAL_VIDEO];
GO
IF OBJECT_ID(N'[dbo].[TB_PRONTOSOCORRO]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_PRONTOSOCORRO];
GO
IF OBJECT_ID(N'[dbo].[TB_PRONTOSOCORRO_HOSPITAL]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_PRONTOSOCORRO_HOSPITAL];
GO
IF OBJECT_ID(N'[dbo].[TB_STATUS]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_STATUS];
GO
IF OBJECT_ID(N'[dbo].[uf]', 'U') IS NOT NULL
    DROP TABLE [dbo].[uf];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'TB_IDIOMA'
CREATE TABLE [dbo].[TB_IDIOMA] (
    [id_idioma] int IDENTITY(1,1) NOT NULL,
    [nm_idioma] varchar(50)  NULL,
    [ds_flag] varchar(50)  NULL,
    [id_status] int  NULL
);
GO

-- Creating table 'cidades'
CREATE TABLE [dbo].[cidades] (
    [cd_uf] int  NULL,
    [cd_cidade] int  NOT NULL,
    [ds_cidade_nome] varchar(200)  NULL
);
GO

-- Creating table 'TB_ADMIN_USER'
CREATE TABLE [dbo].[TB_ADMIN_USER] (
    [id_user] int IDENTITY(1,1) NOT NULL,
    [nm_user] varchar(200)  NULL,
    [ds_login] varchar(200)  NULL,
    [ds_password] varchar(24)  NULL,
    [ds_email] varchar(200)  NULL,
    [id_status] int  NULL
);
GO

-- Creating table 'TB_EPSECIALIDADE'
CREATE TABLE [dbo].[TB_EPSECIALIDADE] (
    [id_especialidade] int IDENTITY(1,1) NOT NULL,
    [nm_especialidade] varchar(100)  NULL,
    [ds_especialidade] varchar(max)  NULL,
    [id_status] int  NULL
);
GO

-- Creating table 'TB_ESPECIALIDADE_HOSPITAL'
CREATE TABLE [dbo].[TB_ESPECIALIDADE_HOSPITAL] (
    [id_especialidade_hospital] int IDENTITY(1,1) NOT NULL,
    [id_hospital] int  NOT NULL,
    [id_especialidade] int  NOT NULL
);
GO

-- Creating table 'TB_EXAME'
CREATE TABLE [dbo].[TB_EXAME] (
    [id_exame] int IDENTITY(1,1) NOT NULL,
    [nm_exame] varchar(100)  NULL,
    [ds_exame] varchar(max)  NULL,
    [id_status] int  NULL
);
GO

-- Creating table 'TB_EXAME_HOSPITAL'
CREATE TABLE [dbo].[TB_EXAME_HOSPITAL] (
    [id_exame_hospital] int IDENTITY(1,1) NOT NULL,
    [id_hospital] int  NOT NULL,
    [id_exame] int  NOT NULL
);
GO

-- Creating table 'TB_HOSPITAL'
CREATE TABLE [dbo].[TB_HOSPITAL] (
    [id_hospital] int IDENTITY(1,1) NOT NULL,
    [nm_hospital] varchar(100)  NOT NULL,
    [ds_hospital] varchar(max)  NULL,
    [ds_site_hospital] varchar(250)  NULL,
    [ds_endereco_hospital] varchar(max)  NULL,
    [nr_telefone_hospital] varchar(100)  NULL,
    [id_estado] int  NOT NULL,
    [id_status] int  NOT NULL
);
GO

-- Creating table 'TB_PERMISSAO_ADMIN'
CREATE TABLE [dbo].[TB_PERMISSAO_ADMIN] (
    [id_permissao] int IDENTITY(1,1) NOT NULL,
    [id_user] int  NULL,
    [id_hospital] int  NULL
);
GO

-- Creating table 'TB_PRONTOSOCORRO'
CREATE TABLE [dbo].[TB_PRONTOSOCORRO] (
    [id_prontosocorro] int IDENTITY(1,1) NOT NULL,
    [nm_prontosocorro] varchar(100)  NULL,
    [ds_prontosocorro] varchar(max)  NULL,
    [id_status] int  NULL
);
GO

-- Creating table 'TB_PRONTOSOCORRO_HOSPITAL'
CREATE TABLE [dbo].[TB_PRONTOSOCORRO_HOSPITAL] (
    [id_prontosocorro_hospital] int IDENTITY(1,1) NOT NULL,
    [id_hospital] int  NOT NULL,
    [id_prontosocorro] int  NOT NULL
);
GO

-- Creating table 'TB_STATUS'
CREATE TABLE [dbo].[TB_STATUS] (
    [id_status] int IDENTITY(1,1) NOT NULL,
    [nm_status] varchar(50)  NULL
);
GO

-- Creating table 'uf'
CREATE TABLE [dbo].[uf] (
    [cd_uf] int  NOT NULL,
    [ds_uf_sigla] varchar(3)  NULL,
    [ds_uf_nome] varchar(200)  NULL
);
GO

-- Creating table 'TB_PORTAL_SLIDER'
CREATE TABLE [dbo].[TB_PORTAL_SLIDER] (
    [id_slider] int IDENTITY(1,1) NOT NULL,
    [ds_imagem] varchar(200)  NULL,
    [ds_link] varchar(max)  NULL,
    [id_status] int  NULL,
    [id_idioma] int  NULL,
    [id_hospital] int  NULL,
    [nu_ordem] int  NULL
);
GO

-- Creating table 'TB_CONTROLE_NOTICIA'
CREATE TABLE [dbo].[TB_CONTROLE_NOTICIA] (
    [id_noticia] int IDENTITY(1,1) NOT NULL,
    [dt_noticia] datetime  NULL,
    [id_status] int  NULL,
    [id_usuario] int  NULL
);
GO

-- Creating table 'TB_PORTAL_ARQUIVO'
CREATE TABLE [dbo].[TB_PORTAL_ARQUIVO] (
    [id_arquivo] int IDENTITY(1,1) NOT NULL,
    [id_conteudo] int  NULL,
    [mn_arquivo] varchar(200)  NULL,
    [ds_arquivo] varchar(200)  NULL,
    [dt_arquivo] datetime  NULL,
    [id_status] int  NULL
);
GO

-- Creating table 'TB_PORTAL_CONTEUDO'
CREATE TABLE [dbo].[TB_PORTAL_CONTEUDO] (
    [id_conteudo] int IDENTITY(1,1) NOT NULL,
    [id_idioma] int  NULL,
    [id_status] int  NULL,
    [id_sessao] int  NULL,
    [id_tipo] int  NULL,
    [dt_conteudo] datetime  NULL,
    [ds_visivel] bit  NULL,
    [nm_titulo] varchar(200)  NULL,
    [ds_resumo] varchar(max)  NULL,
    [ds_conteudo] varchar(max)  NULL,
    [ds_imgDestaque] varchar(200)  NULL,
    [ds_url] varchar(200)  NULL,
    [id_noticia] int  NULL,
    [nr_edicaorevista] int  NULL,
    [ds_sessao_revista] varchar(200)  NULL,
    [ds_materiaDestaque] bit  NULL,
    [ds_file] varchar(200)  NULL,
    [nm_titulo_fonetico] varchar(400)  NULL,
    [ds_resumo_fonetico] varchar(max)  NULL,
    [ds_conteudo_fonetico] varchar(max)  NULL,
    [id_hospital] int  NULL,
    [ds_email_form] varchar(200)  NULL
);
GO

-- Creating table 'TB_PORTAL_EDICAO_REVISTA'
CREATE TABLE [dbo].[TB_PORTAL_EDICAO_REVISTA] (
    [id_edicao] int IDENTITY(1,1) NOT NULL,
    [nr_edicao] int  NOT NULL,
    [dt_edicao] datetime  NULL,
    [id_status] int  NULL,
    [ds_descricao] varchar(2000)  NULL,
    [ds_destaque] varchar(2000)  NULL,
    [ds_imagem] varchar(200)  NULL,
    [ds_arquivo] varchar(200)  NULL
);
GO

-- Creating table 'TB_PORTAL_SESSAO'
CREATE TABLE [dbo].[TB_PORTAL_SESSAO] (
    [id_sessao] int IDENTITY(1,1) NOT NULL,
    [nm_sessao] varchar(50)  NULL,
    [id_status] int  NULL
);
GO

-- Creating table 'TB_PORTAL_TIPO'
CREATE TABLE [dbo].[TB_PORTAL_TIPO] (
    [id_tipo] int IDENTITY(1,1) NOT NULL,
    [nm_tipo] varchar(50)  NULL,
    [id_status] int  NULL
);
GO

-- Creating table 'TB_FORMULARIOS'
CREATE TABLE [dbo].[TB_FORMULARIOS] (
    [id_formulario] int IDENTITY(1,1) NOT NULL,
    [id_hospital] int  NULL,
    [id_status] int  NULL,
    [nm_formulário] varchar(100)  NULL,
    [ds_arquivo] varchar(100)  NULL
);
GO

-- Creating table 'TB_PORTAL_ESPECIALISTA'
CREATE TABLE [dbo].[TB_PORTAL_ESPECIALISTA] (
    [id_especialista] int IDENTITY(1,1) NOT NULL,
    [nm_especialista] varchar(200)  NULL,
    [id_status] int  NULL
);
GO

-- Creating table 'TB_PORTAL_SAUDE_HSL_DOR'
CREATE TABLE [dbo].[TB_PORTAL_SAUDE_HSL_DOR] (
    [id_saude] int IDENTITY(1,1) NOT NULL,
    [nm_titulo] varchar(200)  NULL,
    [id_espedcialista] int  NULL,
    [id_tema] int  NULL,
    [id_status] int  NULL,
    [ds_audio] varchar(200)  NULL
);
GO

-- Creating table 'TB_PORTAL_TEMA'
CREATE TABLE [dbo].[TB_PORTAL_TEMA] (
    [id_tema] int IDENTITY(1,1) NOT NULL,
    [nm_tema] varchar(200)  NULL,
    [id_status] int  NULL
);
GO

-- Creating table 'TB_PORTAL_PROGRAMETES'
CREATE TABLE [dbo].[TB_PORTAL_PROGRAMETES] (
    [id_programete] int IDENTITY(1,1) NOT NULL,
    [nm_titulo] varchar(200)  NULL,
    [ds_video] varchar(max)  NULL,
    [id_status] int  NULL
);
GO

-- Creating table 'TB_PORTAL_PROGRAMETES_DESTAQUE'
CREATE TABLE [dbo].[TB_PORTAL_PROGRAMETES_DESTAQUE] (
    [id_programete] int IDENTITY(1,1) NOT NULL,
    [nm_titulo] varchar(200)  NULL,
    [ds_video] varchar(max)  NULL
);
GO

-- Creating table 'TB_PORTAL_PROGRAMETES_TEXTO'
CREATE TABLE [dbo].[TB_PORTAL_PROGRAMETES_TEXTO] (
    [id_programete] int IDENTITY(1,1) NOT NULL,
    [ds_texto] varchar(max)  NULL
);
GO

-- Creating table 'TB_PORTAL_VIDEO'
CREATE TABLE [dbo].[TB_PORTAL_VIDEO] (
    [id_video] int IDENTITY(1,1) NOT NULL,
    [ds_nome] varchar(200)  NOT NULL,
    [ds_video] varchar(2000)  NOT NULL,
    [id_status] int  NOT NULL,
    [id_idioma] int  NOT NULL
);
GO

-- Creating table 'TB_NEWSLETTER'
CREATE TABLE [dbo].[TB_NEWSLETTER] (
    [id_newsletter] int IDENTITY(1,1) NOT NULL,
    [id_hospital] int  NULL,
    [dt_data] datetime  NULL,
    [ds_email] varchar(250)  NULL
);
GO

-- Creating table 'TB_AREA_MEDICA_CURSO_ESPECIALIDADE'
CREATE TABLE [dbo].[TB_AREA_MEDICA_CURSO_ESPECIALIDADE] (
    [id_curso_especialidade] int IDENTITY(1,1) NOT NULL,
    [id_area_medica_curso] int  NOT NULL,
    [id_especialidade] int  NOT NULL
);
GO

-- Creating table 'TB_AREA_MEDICA_CURSO'
CREATE TABLE [dbo].[TB_AREA_MEDICA_CURSO] (
    [id] int IDENTITY(1,1) NOT NULL,
    [ds_curso] varchar(200)  NOT NULL,
    [id_hospital] int  NOT NULL,
    [dt_curso] datetime  NOT NULL,
    [vl_curso] varchar(100)  NULL,
    [ds_descricao] varchar(max)  NULL,
    [id_status] int  NOT NULL,
    [ds_horario] varchar(200)  NULL,
    [dt_inscricao] datetime  NULL,
    [ds_local] varchar(200)  NULL,
    [ds_link_curso] varchar(200)  NULL,
    [ds_minidesc] varchar(300)  NULL,
    [ds_email] varchar(200)  NULL,
    [ds_telefone] varchar(50)  NULL,
    [ds_box2_titulo] varchar(50)  NULL,
    [ds_box2_desc] varchar(200)  NULL
);
GO

-- Creating table 'TB_DEMOSTRATIVO_FINANCEIRO'
CREATE TABLE [dbo].[TB_DEMOSTRATIVO_FINANCEIRO] (
    [idDemostrativo] int IDENTITY(1,1) NOT NULL,
    [dsDemostrativo] varchar(200)  NOT NULL,
    [dsArquivo] varchar(200)  NOT NULL,
    [idStatus] int  NOT NULL
);
GO

-- Creating table 'TB_HOSPITAL_PORTAL'
CREATE TABLE [dbo].[TB_HOSPITAL_PORTAL] (
    [id_hospital_portal] int IDENTITY(1,1) NOT NULL,
    [id_hospital] int  NOT NULL,
    [ds_dominio] varchar(200)  NOT NULL,
    [ds_imagem_logo] varchar(200)  NULL,
    [ds_titulo_pagina] varchar(255)  NULL,
    [ds_telefone] varchar(50)  NULL,
    [ds_endereco_rodape] varchar(200)  NULL,
    [ds_link_facebook] varchar(200)  NULL,
    [ds_link_twitter] varchar(200)  NULL,
    [ds_google_analytics] varchar(30)  NULL,
    [ds_maps] varchar(4000)  NULL,
    [fg_exibir] bit  NULL,
    [ds_icone] varchar(200)  NULL
);
GO

-- Creating table 'TB_PORTAL_CONTEUDO_HOSPITAL'
CREATE TABLE [dbo].[TB_PORTAL_CONTEUDO_HOSPITAL] (
    [id_Conteudo_Hospital] int IDENTITY(1,1) NOT NULL,
    [id_conteudo] int  NOT NULL,
    [id_hospital] int  NOT NULL
);
GO

-- Creating table 'TB_AREA_MEDICA_CURSO_HOSPITAL'
CREATE TABLE [dbo].[TB_AREA_MEDICA_CURSO_HOSPITAL] (
    [id_curso_hospital] int IDENTITY(1,1) NOT NULL,
    [id_curso] int  NOT NULL,
    [id_hospital] int  NOT NULL
);
GO

-- Creating table 'TB_PORTAL_BANNER_CSS_TYPE'
CREATE TABLE [dbo].[TB_PORTAL_BANNER_CSS_TYPE] (
    [id_banner_css_type] int IDENTITY(1,1) NOT NULL,
    [ds_titulo] varchar(200)  NULL,
    [ds_css] varchar(200)  NULL
);
GO

-- Creating table 'TB_PORTAL_BANNER'
CREATE TABLE [dbo].[TB_PORTAL_BANNER] (
    [id_banner] int IDENTITY(1,1) NOT NULL,
    [ds_imagem] varchar(200)  NULL,
    [ds_link] varchar(max)  NULL,
    [ds_descrição] varchar(200)  NULL,
    [id_status] int  NULL,
    [id_idioma] int  NULL,
    [id_hospital] int  NULL,
    [id_posicao] int  NULL,
    [css_type] varchar(200)  NULL
);
GO

-- Creating table 'TB_CONTEUDO_PAGINA_FIXA'
CREATE TABLE [dbo].[TB_CONTEUDO_PAGINA_FIXA] (
    [id_pagina_fixa] int IDENTITY(1,1) NOT NULL,
    [id_sessao] int  NOT NULL,
    [id_hospital] int  NOT NULL,
    [ds_link] varchar(255)  NOT NULL,
    [ds_desc_menu] varchar(200)  NOT NULL,
    [ds_titulo] varchar(200)  NOT NULL,
    [ds_visivel] bit  NOT NULL
);
GO

-- Creating table 'TB_HOSPITAL_CORPO_CLINICO'
CREATE TABLE [dbo].[TB_HOSPITAL_CORPO_CLINICO] (
    [id_corpo_clinico] int IDENTITY(1,1) NOT NULL,
    [nm_medico] varchar(200)  NOT NULL,
    [nm_cargo] varchar(200)  NOT NULL,
    [id_especialidade] int  NOT NULL
);
GO

-- Creating table 'TB_HOSPITAL_CORPO_CLINICO_HOSPITAL'
CREATE TABLE [dbo].[TB_HOSPITAL_CORPO_CLINICO_HOSPITAL] (
    [id_corpo_clinico_hospital] int IDENTITY(1,1) NOT NULL,
    [id_corpo_clinico] int  NOT NULL,
    [id_hospital] int  NOT NULL
);
GO

-- Creating table 'TB_FOTO_BEBE'
CREATE TABLE [dbo].[TB_FOTO_BEBE] (
    [id_foto] int IDENTITY(1,1) NOT NULL,
    [dt_nascimento] datetime  NOT NULL,
    [dt_cadastro] datetime  NOT NULL,
    [ds_nome_mae] varchar(200)  NOT NULL,
    [ds_nome_pai] varchar(200)  NOT NULL,
    [ds_nome_bebe] varchar(200)  NOT NULL,
    [nu_peso] float  NOT NULL,
    [nu_estatura] float  NOT NULL,
    [ds_obstreta] varchar(200)  NOT NULL,
    [ds_pediatra] varchar(200)  NOT NULL,
    [id_hospital] int  NOT NULL,
    [ds_foto_bebe] varchar(200)  NOT NULL,
    [ds_foto_retrato] varchar(200)  NOT NULL,
    [ds_foto_thumb] varchar(200)  NOT NULL,
    [fg_status] int  NOT NULL
);
GO

-- Creating table 'TB_HOSPTIAL_FOTO_BEBE'
CREATE TABLE [dbo].[TB_HOSPTIAL_FOTO_BEBE] (
    [id_hospital] int  NOT NULL,
    [fg_foto_bebe] bit  NOT NULL,
    [ds_moldura] varchar(200)  NULL,
    [ds_banner] varchar(200)  NULL,
    [ds_linkbanner] varchar(200)  NULL
);
GO

-- Creating table 'TB_HOSPITAL_DEPT_CONTATO'
CREATE TABLE [dbo].[TB_HOSPITAL_DEPT_CONTATO] (
    [id_hospital] int  NOT NULL,
    [ds_departamento] varchar(30)  NOT NULL,
    [ds_contato] varchar(250)  NOT NULL
);
GO

-- Creating table 'TB_CONTEUDO_METATAGS'
CREATE TABLE [dbo].[TB_CONTEUDO_METATAGS] (
    [id_metatag] int IDENTITY(1,1) NOT NULL,
    [id_conteudo] int  NOT NULL,
    [ds_description] varchar(2000)  NOT NULL,
    [ds_keywords] varchar(2000)  NOT NULL,
    [ds_pagina] varchar(50)  NOT NULL,
    [id_hospital] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [id_idioma] in table 'TB_IDIOMA'
ALTER TABLE [dbo].[TB_IDIOMA]
ADD CONSTRAINT [PK_TB_IDIOMA]
    PRIMARY KEY CLUSTERED ([id_idioma] ASC);
GO

-- Creating primary key on [cd_cidade] in table 'cidades'
ALTER TABLE [dbo].[cidades]
ADD CONSTRAINT [PK_cidades]
    PRIMARY KEY CLUSTERED ([cd_cidade] ASC);
GO

-- Creating primary key on [id_user] in table 'TB_ADMIN_USER'
ALTER TABLE [dbo].[TB_ADMIN_USER]
ADD CONSTRAINT [PK_TB_ADMIN_USER]
    PRIMARY KEY CLUSTERED ([id_user] ASC);
GO

-- Creating primary key on [id_especialidade] in table 'TB_EPSECIALIDADE'
ALTER TABLE [dbo].[TB_EPSECIALIDADE]
ADD CONSTRAINT [PK_TB_EPSECIALIDADE]
    PRIMARY KEY CLUSTERED ([id_especialidade] ASC);
GO

-- Creating primary key on [id_especialidade_hospital] in table 'TB_ESPECIALIDADE_HOSPITAL'
ALTER TABLE [dbo].[TB_ESPECIALIDADE_HOSPITAL]
ADD CONSTRAINT [PK_TB_ESPECIALIDADE_HOSPITAL]
    PRIMARY KEY CLUSTERED ([id_especialidade_hospital] ASC);
GO

-- Creating primary key on [id_exame] in table 'TB_EXAME'
ALTER TABLE [dbo].[TB_EXAME]
ADD CONSTRAINT [PK_TB_EXAME]
    PRIMARY KEY CLUSTERED ([id_exame] ASC);
GO

-- Creating primary key on [id_exame_hospital] in table 'TB_EXAME_HOSPITAL'
ALTER TABLE [dbo].[TB_EXAME_HOSPITAL]
ADD CONSTRAINT [PK_TB_EXAME_HOSPITAL]
    PRIMARY KEY CLUSTERED ([id_exame_hospital] ASC);
GO

-- Creating primary key on [id_hospital] in table 'TB_HOSPITAL'
ALTER TABLE [dbo].[TB_HOSPITAL]
ADD CONSTRAINT [PK_TB_HOSPITAL]
    PRIMARY KEY CLUSTERED ([id_hospital] ASC);
GO

-- Creating primary key on [id_permissao] in table 'TB_PERMISSAO_ADMIN'
ALTER TABLE [dbo].[TB_PERMISSAO_ADMIN]
ADD CONSTRAINT [PK_TB_PERMISSAO_ADMIN]
    PRIMARY KEY CLUSTERED ([id_permissao] ASC);
GO

-- Creating primary key on [id_prontosocorro] in table 'TB_PRONTOSOCORRO'
ALTER TABLE [dbo].[TB_PRONTOSOCORRO]
ADD CONSTRAINT [PK_TB_PRONTOSOCORRO]
    PRIMARY KEY CLUSTERED ([id_prontosocorro] ASC);
GO

-- Creating primary key on [id_prontosocorro_hospital] in table 'TB_PRONTOSOCORRO_HOSPITAL'
ALTER TABLE [dbo].[TB_PRONTOSOCORRO_HOSPITAL]
ADD CONSTRAINT [PK_TB_PRONTOSOCORRO_HOSPITAL]
    PRIMARY KEY CLUSTERED ([id_prontosocorro_hospital] ASC);
GO

-- Creating primary key on [id_status] in table 'TB_STATUS'
ALTER TABLE [dbo].[TB_STATUS]
ADD CONSTRAINT [PK_TB_STATUS]
    PRIMARY KEY CLUSTERED ([id_status] ASC);
GO

-- Creating primary key on [cd_uf] in table 'uf'
ALTER TABLE [dbo].[uf]
ADD CONSTRAINT [PK_uf]
    PRIMARY KEY CLUSTERED ([cd_uf] ASC);
GO

-- Creating primary key on [id_slider] in table 'TB_PORTAL_SLIDER'
ALTER TABLE [dbo].[TB_PORTAL_SLIDER]
ADD CONSTRAINT [PK_TB_PORTAL_SLIDER]
    PRIMARY KEY CLUSTERED ([id_slider] ASC);
GO

-- Creating primary key on [id_noticia] in table 'TB_CONTROLE_NOTICIA'
ALTER TABLE [dbo].[TB_CONTROLE_NOTICIA]
ADD CONSTRAINT [PK_TB_CONTROLE_NOTICIA]
    PRIMARY KEY CLUSTERED ([id_noticia] ASC);
GO

-- Creating primary key on [id_arquivo] in table 'TB_PORTAL_ARQUIVO'
ALTER TABLE [dbo].[TB_PORTAL_ARQUIVO]
ADD CONSTRAINT [PK_TB_PORTAL_ARQUIVO]
    PRIMARY KEY CLUSTERED ([id_arquivo] ASC);
GO

-- Creating primary key on [id_conteudo] in table 'TB_PORTAL_CONTEUDO'
ALTER TABLE [dbo].[TB_PORTAL_CONTEUDO]
ADD CONSTRAINT [PK_TB_PORTAL_CONTEUDO]
    PRIMARY KEY CLUSTERED ([id_conteudo] ASC);
GO

-- Creating primary key on [id_edicao] in table 'TB_PORTAL_EDICAO_REVISTA'
ALTER TABLE [dbo].[TB_PORTAL_EDICAO_REVISTA]
ADD CONSTRAINT [PK_TB_PORTAL_EDICAO_REVISTA]
    PRIMARY KEY CLUSTERED ([id_edicao] ASC);
GO

-- Creating primary key on [id_sessao] in table 'TB_PORTAL_SESSAO'
ALTER TABLE [dbo].[TB_PORTAL_SESSAO]
ADD CONSTRAINT [PK_TB_PORTAL_SESSAO]
    PRIMARY KEY CLUSTERED ([id_sessao] ASC);
GO

-- Creating primary key on [id_tipo] in table 'TB_PORTAL_TIPO'
ALTER TABLE [dbo].[TB_PORTAL_TIPO]
ADD CONSTRAINT [PK_TB_PORTAL_TIPO]
    PRIMARY KEY CLUSTERED ([id_tipo] ASC);
GO

-- Creating primary key on [id_formulario] in table 'TB_FORMULARIOS'
ALTER TABLE [dbo].[TB_FORMULARIOS]
ADD CONSTRAINT [PK_TB_FORMULARIOS]
    PRIMARY KEY CLUSTERED ([id_formulario] ASC);
GO

-- Creating primary key on [id_especialista] in table 'TB_PORTAL_ESPECIALISTA'
ALTER TABLE [dbo].[TB_PORTAL_ESPECIALISTA]
ADD CONSTRAINT [PK_TB_PORTAL_ESPECIALISTA]
    PRIMARY KEY CLUSTERED ([id_especialista] ASC);
GO

-- Creating primary key on [id_saude] in table 'TB_PORTAL_SAUDE_HSL_DOR'
ALTER TABLE [dbo].[TB_PORTAL_SAUDE_HSL_DOR]
ADD CONSTRAINT [PK_TB_PORTAL_SAUDE_HSL_DOR]
    PRIMARY KEY CLUSTERED ([id_saude] ASC);
GO

-- Creating primary key on [id_tema] in table 'TB_PORTAL_TEMA'
ALTER TABLE [dbo].[TB_PORTAL_TEMA]
ADD CONSTRAINT [PK_TB_PORTAL_TEMA]
    PRIMARY KEY CLUSTERED ([id_tema] ASC);
GO

-- Creating primary key on [id_programete] in table 'TB_PORTAL_PROGRAMETES'
ALTER TABLE [dbo].[TB_PORTAL_PROGRAMETES]
ADD CONSTRAINT [PK_TB_PORTAL_PROGRAMETES]
    PRIMARY KEY CLUSTERED ([id_programete] ASC);
GO

-- Creating primary key on [id_programete] in table 'TB_PORTAL_PROGRAMETES_DESTAQUE'
ALTER TABLE [dbo].[TB_PORTAL_PROGRAMETES_DESTAQUE]
ADD CONSTRAINT [PK_TB_PORTAL_PROGRAMETES_DESTAQUE]
    PRIMARY KEY CLUSTERED ([id_programete] ASC);
GO

-- Creating primary key on [id_programete] in table 'TB_PORTAL_PROGRAMETES_TEXTO'
ALTER TABLE [dbo].[TB_PORTAL_PROGRAMETES_TEXTO]
ADD CONSTRAINT [PK_TB_PORTAL_PROGRAMETES_TEXTO]
    PRIMARY KEY CLUSTERED ([id_programete] ASC);
GO

-- Creating primary key on [id_video] in table 'TB_PORTAL_VIDEO'
ALTER TABLE [dbo].[TB_PORTAL_VIDEO]
ADD CONSTRAINT [PK_TB_PORTAL_VIDEO]
    PRIMARY KEY CLUSTERED ([id_video] ASC);
GO

-- Creating primary key on [id_newsletter] in table 'TB_NEWSLETTER'
ALTER TABLE [dbo].[TB_NEWSLETTER]
ADD CONSTRAINT [PK_TB_NEWSLETTER]
    PRIMARY KEY CLUSTERED ([id_newsletter] ASC);
GO

-- Creating primary key on [id_curso_especialidade] in table 'TB_AREA_MEDICA_CURSO_ESPECIALIDADE'
ALTER TABLE [dbo].[TB_AREA_MEDICA_CURSO_ESPECIALIDADE]
ADD CONSTRAINT [PK_TB_AREA_MEDICA_CURSO_ESPECIALIDADE]
    PRIMARY KEY CLUSTERED ([id_curso_especialidade] ASC);
GO

-- Creating primary key on [id] in table 'TB_AREA_MEDICA_CURSO'
ALTER TABLE [dbo].[TB_AREA_MEDICA_CURSO]
ADD CONSTRAINT [PK_TB_AREA_MEDICA_CURSO]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [idDemostrativo] in table 'TB_DEMOSTRATIVO_FINANCEIRO'
ALTER TABLE [dbo].[TB_DEMOSTRATIVO_FINANCEIRO]
ADD CONSTRAINT [PK_TB_DEMOSTRATIVO_FINANCEIRO]
    PRIMARY KEY CLUSTERED ([idDemostrativo] ASC);
GO

-- Creating primary key on [id_hospital_portal] in table 'TB_HOSPITAL_PORTAL'
ALTER TABLE [dbo].[TB_HOSPITAL_PORTAL]
ADD CONSTRAINT [PK_TB_HOSPITAL_PORTAL]
    PRIMARY KEY CLUSTERED ([id_hospital_portal] ASC);
GO

-- Creating primary key on [id_Conteudo_Hospital] in table 'TB_PORTAL_CONTEUDO_HOSPITAL'
ALTER TABLE [dbo].[TB_PORTAL_CONTEUDO_HOSPITAL]
ADD CONSTRAINT [PK_TB_PORTAL_CONTEUDO_HOSPITAL]
    PRIMARY KEY CLUSTERED ([id_Conteudo_Hospital] ASC);
GO

-- Creating primary key on [id_curso_hospital] in table 'TB_AREA_MEDICA_CURSO_HOSPITAL'
ALTER TABLE [dbo].[TB_AREA_MEDICA_CURSO_HOSPITAL]
ADD CONSTRAINT [PK_TB_AREA_MEDICA_CURSO_HOSPITAL]
    PRIMARY KEY CLUSTERED ([id_curso_hospital] ASC);
GO

-- Creating primary key on [id_banner_css_type] in table 'TB_PORTAL_BANNER_CSS_TYPE'
ALTER TABLE [dbo].[TB_PORTAL_BANNER_CSS_TYPE]
ADD CONSTRAINT [PK_TB_PORTAL_BANNER_CSS_TYPE]
    PRIMARY KEY CLUSTERED ([id_banner_css_type] ASC);
GO

-- Creating primary key on [id_banner] in table 'TB_PORTAL_BANNER'
ALTER TABLE [dbo].[TB_PORTAL_BANNER]
ADD CONSTRAINT [PK_TB_PORTAL_BANNER]
    PRIMARY KEY CLUSTERED ([id_banner] ASC);
GO

-- Creating primary key on [id_pagina_fixa] in table 'TB_CONTEUDO_PAGINA_FIXA'
ALTER TABLE [dbo].[TB_CONTEUDO_PAGINA_FIXA]
ADD CONSTRAINT [PK_TB_CONTEUDO_PAGINA_FIXA]
    PRIMARY KEY CLUSTERED ([id_pagina_fixa] ASC);
GO

-- Creating primary key on [id_corpo_clinico] in table 'TB_HOSPITAL_CORPO_CLINICO'
ALTER TABLE [dbo].[TB_HOSPITAL_CORPO_CLINICO]
ADD CONSTRAINT [PK_TB_HOSPITAL_CORPO_CLINICO]
    PRIMARY KEY CLUSTERED ([id_corpo_clinico] ASC);
GO

-- Creating primary key on [id_corpo_clinico_hospital] in table 'TB_HOSPITAL_CORPO_CLINICO_HOSPITAL'
ALTER TABLE [dbo].[TB_HOSPITAL_CORPO_CLINICO_HOSPITAL]
ADD CONSTRAINT [PK_TB_HOSPITAL_CORPO_CLINICO_HOSPITAL]
    PRIMARY KEY CLUSTERED ([id_corpo_clinico_hospital] ASC);
GO

-- Creating primary key on [id_foto] in table 'TB_FOTO_BEBE'
ALTER TABLE [dbo].[TB_FOTO_BEBE]
ADD CONSTRAINT [PK_TB_FOTO_BEBE]
    PRIMARY KEY CLUSTERED ([id_foto] ASC);
GO

-- Creating primary key on [id_hospital] in table 'TB_HOSPTIAL_FOTO_BEBE'
ALTER TABLE [dbo].[TB_HOSPTIAL_FOTO_BEBE]
ADD CONSTRAINT [PK_TB_HOSPTIAL_FOTO_BEBE]
    PRIMARY KEY CLUSTERED ([id_hospital] ASC);
GO

-- Creating primary key on [id_hospital], [ds_departamento], [ds_contato] in table 'TB_HOSPITAL_DEPT_CONTATO'
ALTER TABLE [dbo].[TB_HOSPITAL_DEPT_CONTATO]
ADD CONSTRAINT [PK_TB_HOSPITAL_DEPT_CONTATO]
    PRIMARY KEY CLUSTERED ([id_hospital], [ds_departamento], [ds_contato] ASC);
GO

-- Creating primary key on [id_metatag] in table 'TB_CONTEUDO_METATAGS'
ALTER TABLE [dbo].[TB_CONTEUDO_METATAGS]
ADD CONSTRAINT [PK_TB_CONTEUDO_METATAGS]
    PRIMARY KEY CLUSTERED ([id_metatag] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [cd_uf] in table 'cidades'
ALTER TABLE [dbo].[cidades]
ADD CONSTRAINT [FK_cidades]
    FOREIGN KEY ([cd_uf])
    REFERENCES [dbo].[uf]
        ([cd_uf])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_cidades'
CREATE INDEX [IX_FK_cidades]
ON [dbo].[cidades]
    ([cd_uf]);
GO

-- Creating foreign key on [id_user] in table 'TB_PERMISSAO_ADMIN'
ALTER TABLE [dbo].[TB_PERMISSAO_ADMIN]
ADD CONSTRAINT [fk_permissoes_user]
    FOREIGN KEY ([id_user])
    REFERENCES [dbo].[TB_ADMIN_USER]
        ([id_user])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_permissoes_user'
CREATE INDEX [IX_fk_permissoes_user]
ON [dbo].[TB_PERMISSAO_ADMIN]
    ([id_user]);
GO

-- Creating foreign key on [id_status] in table 'TB_ADMIN_USER'
ALTER TABLE [dbo].[TB_ADMIN_USER]
ADD CONSTRAINT [fk_status_user]
    FOREIGN KEY ([id_status])
    REFERENCES [dbo].[TB_STATUS]
        ([id_status])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_status_user'
CREATE INDEX [IX_fk_status_user]
ON [dbo].[TB_ADMIN_USER]
    ([id_status]);
GO

-- Creating foreign key on [id_especialidade] in table 'TB_ESPECIALIDADE_HOSPITAL'
ALTER TABLE [dbo].[TB_ESPECIALIDADE_HOSPITAL]
ADD CONSTRAINT [fk_especialidade_hospital_id_especialidade]
    FOREIGN KEY ([id_especialidade])
    REFERENCES [dbo].[TB_EPSECIALIDADE]
        ([id_especialidade])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_especialidade_hospital_id_especialidade'
CREATE INDEX [IX_fk_especialidade_hospital_id_especialidade]
ON [dbo].[TB_ESPECIALIDADE_HOSPITAL]
    ([id_especialidade]);
GO

-- Creating foreign key on [id_status] in table 'TB_EPSECIALIDADE'
ALTER TABLE [dbo].[TB_EPSECIALIDADE]
ADD CONSTRAINT [fk_status_especialidade]
    FOREIGN KEY ([id_status])
    REFERENCES [dbo].[TB_STATUS]
        ([id_status])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_status_especialidade'
CREATE INDEX [IX_fk_status_especialidade]
ON [dbo].[TB_EPSECIALIDADE]
    ([id_status]);
GO

-- Creating foreign key on [id_hospital] in table 'TB_ESPECIALIDADE_HOSPITAL'
ALTER TABLE [dbo].[TB_ESPECIALIDADE_HOSPITAL]
ADD CONSTRAINT [fk_especialidade_hospital_id_hospital]
    FOREIGN KEY ([id_hospital])
    REFERENCES [dbo].[TB_HOSPITAL]
        ([id_hospital])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_especialidade_hospital_id_hospital'
CREATE INDEX [IX_fk_especialidade_hospital_id_hospital]
ON [dbo].[TB_ESPECIALIDADE_HOSPITAL]
    ([id_hospital]);
GO

-- Creating foreign key on [id_exame] in table 'TB_EXAME_HOSPITAL'
ALTER TABLE [dbo].[TB_EXAME_HOSPITAL]
ADD CONSTRAINT [fk_exame_hospital_id_exame]
    FOREIGN KEY ([id_exame])
    REFERENCES [dbo].[TB_EXAME]
        ([id_exame])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_exame_hospital_id_exame'
CREATE INDEX [IX_fk_exame_hospital_id_exame]
ON [dbo].[TB_EXAME_HOSPITAL]
    ([id_exame]);
GO

-- Creating foreign key on [id_status] in table 'TB_EXAME'
ALTER TABLE [dbo].[TB_EXAME]
ADD CONSTRAINT [fk_status_exame]
    FOREIGN KEY ([id_status])
    REFERENCES [dbo].[TB_STATUS]
        ([id_status])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_status_exame'
CREATE INDEX [IX_fk_status_exame]
ON [dbo].[TB_EXAME]
    ([id_status]);
GO

-- Creating foreign key on [id_hospital] in table 'TB_EXAME_HOSPITAL'
ALTER TABLE [dbo].[TB_EXAME_HOSPITAL]
ADD CONSTRAINT [fk_exame_hospital_id_hospital]
    FOREIGN KEY ([id_hospital])
    REFERENCES [dbo].[TB_HOSPITAL]
        ([id_hospital])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_exame_hospital_id_hospital'
CREATE INDEX [IX_fk_exame_hospital_id_hospital]
ON [dbo].[TB_EXAME_HOSPITAL]
    ([id_hospital]);
GO

-- Creating foreign key on [id_estado] in table 'TB_HOSPITAL'
ALTER TABLE [dbo].[TB_HOSPITAL]
ADD CONSTRAINT [fk_estado_hosp]
    FOREIGN KEY ([id_estado])
    REFERENCES [dbo].[uf]
        ([cd_uf])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_estado_hosp'
CREATE INDEX [IX_fk_estado_hosp]
ON [dbo].[TB_HOSPITAL]
    ([id_estado]);
GO

-- Creating foreign key on [id_hospital] in table 'TB_PERMISSAO_ADMIN'
ALTER TABLE [dbo].[TB_PERMISSAO_ADMIN]
ADD CONSTRAINT [fk_permissoes_hospital]
    FOREIGN KEY ([id_hospital])
    REFERENCES [dbo].[TB_HOSPITAL]
        ([id_hospital])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_permissoes_hospital'
CREATE INDEX [IX_fk_permissoes_hospital]
ON [dbo].[TB_PERMISSAO_ADMIN]
    ([id_hospital]);
GO

-- Creating foreign key on [id_hospital] in table 'TB_PRONTOSOCORRO_HOSPITAL'
ALTER TABLE [dbo].[TB_PRONTOSOCORRO_HOSPITAL]
ADD CONSTRAINT [fk_prontosocorro_hospital_id_hospital]
    FOREIGN KEY ([id_hospital])
    REFERENCES [dbo].[TB_HOSPITAL]
        ([id_hospital])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_prontosocorro_hospital_id_hospital'
CREATE INDEX [IX_fk_prontosocorro_hospital_id_hospital]
ON [dbo].[TB_PRONTOSOCORRO_HOSPITAL]
    ([id_hospital]);
GO

-- Creating foreign key on [id_status] in table 'TB_HOSPITAL'
ALTER TABLE [dbo].[TB_HOSPITAL]
ADD CONSTRAINT [fk_status_hosp]
    FOREIGN KEY ([id_status])
    REFERENCES [dbo].[TB_STATUS]
        ([id_status])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_status_hosp'
CREATE INDEX [IX_fk_status_hosp]
ON [dbo].[TB_HOSPITAL]
    ([id_status]);
GO

-- Creating foreign key on [id_status] in table 'TB_IDIOMA'
ALTER TABLE [dbo].[TB_IDIOMA]
ADD CONSTRAINT [fk_status_idioma]
    FOREIGN KEY ([id_status])
    REFERENCES [dbo].[TB_STATUS]
        ([id_status])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_status_idioma'
CREATE INDEX [IX_fk_status_idioma]
ON [dbo].[TB_IDIOMA]
    ([id_status]);
GO

-- Creating foreign key on [id_prontosocorro] in table 'TB_PRONTOSOCORRO_HOSPITAL'
ALTER TABLE [dbo].[TB_PRONTOSOCORRO_HOSPITAL]
ADD CONSTRAINT [fk_prontosocorro_hospital_prontosocorro]
    FOREIGN KEY ([id_prontosocorro])
    REFERENCES [dbo].[TB_PRONTOSOCORRO]
        ([id_prontosocorro])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_prontosocorro_hospital_prontosocorro'
CREATE INDEX [IX_fk_prontosocorro_hospital_prontosocorro]
ON [dbo].[TB_PRONTOSOCORRO_HOSPITAL]
    ([id_prontosocorro]);
GO

-- Creating foreign key on [id_status] in table 'TB_PRONTOSOCORRO'
ALTER TABLE [dbo].[TB_PRONTOSOCORRO]
ADD CONSTRAINT [fk_status_prontosocorro]
    FOREIGN KEY ([id_status])
    REFERENCES [dbo].[TB_STATUS]
        ([id_status])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_status_prontosocorro'
CREATE INDEX [IX_fk_status_prontosocorro]
ON [dbo].[TB_PRONTOSOCORRO]
    ([id_status]);
GO

-- Creating foreign key on [id_idioma] in table 'TB_PORTAL_SLIDER'
ALTER TABLE [dbo].[TB_PORTAL_SLIDER]
ADD CONSTRAINT [FK_slider_idioma]
    FOREIGN KEY ([id_idioma])
    REFERENCES [dbo].[TB_IDIOMA]
        ([id_idioma])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_slider_idioma'
CREATE INDEX [IX_FK_slider_idioma]
ON [dbo].[TB_PORTAL_SLIDER]
    ([id_idioma]);
GO

-- Creating foreign key on [id_status] in table 'TB_PORTAL_SLIDER'
ALTER TABLE [dbo].[TB_PORTAL_SLIDER]
ADD CONSTRAINT [fk_slider_status]
    FOREIGN KEY ([id_status])
    REFERENCES [dbo].[TB_STATUS]
        ([id_status])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_slider_status'
CREATE INDEX [IX_fk_slider_status]
ON [dbo].[TB_PORTAL_SLIDER]
    ([id_status]);
GO

-- Creating foreign key on [id_status] in table 'TB_CONTROLE_NOTICIA'
ALTER TABLE [dbo].[TB_CONTROLE_NOTICIA]
ADD CONSTRAINT [fk_controle_noticia_status]
    FOREIGN KEY ([id_status])
    REFERENCES [dbo].[TB_STATUS]
        ([id_status])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_controle_noticia_status'
CREATE INDEX [IX_fk_controle_noticia_status]
ON [dbo].[TB_CONTROLE_NOTICIA]
    ([id_status]);
GO

-- Creating foreign key on [id_noticia] in table 'TB_PORTAL_CONTEUDO'
ALTER TABLE [dbo].[TB_PORTAL_CONTEUDO]
ADD CONSTRAINT [fk_interna_noticia]
    FOREIGN KEY ([id_noticia])
    REFERENCES [dbo].[TB_CONTROLE_NOTICIA]
        ([id_noticia])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_interna_noticia'
CREATE INDEX [IX_fk_interna_noticia]
ON [dbo].[TB_PORTAL_CONTEUDO]
    ([id_noticia]);
GO

-- Creating foreign key on [id_idioma] in table 'TB_PORTAL_CONTEUDO'
ALTER TABLE [dbo].[TB_PORTAL_CONTEUDO]
ADD CONSTRAINT [fk_interna_idioma]
    FOREIGN KEY ([id_idioma])
    REFERENCES [dbo].[TB_IDIOMA]
        ([id_idioma])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_interna_idioma'
CREATE INDEX [IX_fk_interna_idioma]
ON [dbo].[TB_PORTAL_CONTEUDO]
    ([id_idioma]);
GO

-- Creating foreign key on [id_conteudo] in table 'TB_PORTAL_ARQUIVO'
ALTER TABLE [dbo].[TB_PORTAL_ARQUIVO]
ADD CONSTRAINT [fk_arquivo_conteudo]
    FOREIGN KEY ([id_conteudo])
    REFERENCES [dbo].[TB_PORTAL_CONTEUDO]
        ([id_conteudo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_arquivo_conteudo'
CREATE INDEX [IX_fk_arquivo_conteudo]
ON [dbo].[TB_PORTAL_ARQUIVO]
    ([id_conteudo]);
GO

-- Creating foreign key on [id_status] in table 'TB_PORTAL_ARQUIVO'
ALTER TABLE [dbo].[TB_PORTAL_ARQUIVO]
ADD CONSTRAINT [fk_arquivo_status]
    FOREIGN KEY ([id_status])
    REFERENCES [dbo].[TB_STATUS]
        ([id_status])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_arquivo_status'
CREATE INDEX [IX_fk_arquivo_status]
ON [dbo].[TB_PORTAL_ARQUIVO]
    ([id_status]);
GO

-- Creating foreign key on [nr_edicaorevista] in table 'TB_PORTAL_CONTEUDO'
ALTER TABLE [dbo].[TB_PORTAL_CONTEUDO]
ADD CONSTRAINT [fk_interna_edicao]
    FOREIGN KEY ([nr_edicaorevista])
    REFERENCES [dbo].[TB_PORTAL_EDICAO_REVISTA]
        ([id_edicao])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_interna_edicao'
CREATE INDEX [IX_fk_interna_edicao]
ON [dbo].[TB_PORTAL_CONTEUDO]
    ([nr_edicaorevista]);
GO

-- Creating foreign key on [id_sessao] in table 'TB_PORTAL_CONTEUDO'
ALTER TABLE [dbo].[TB_PORTAL_CONTEUDO]
ADD CONSTRAINT [fk_interna_sessao]
    FOREIGN KEY ([id_sessao])
    REFERENCES [dbo].[TB_PORTAL_SESSAO]
        ([id_sessao])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_interna_sessao'
CREATE INDEX [IX_fk_interna_sessao]
ON [dbo].[TB_PORTAL_CONTEUDO]
    ([id_sessao]);
GO

-- Creating foreign key on [id_status] in table 'TB_PORTAL_CONTEUDO'
ALTER TABLE [dbo].[TB_PORTAL_CONTEUDO]
ADD CONSTRAINT [fk_interna_status]
    FOREIGN KEY ([id_status])
    REFERENCES [dbo].[TB_STATUS]
        ([id_status])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_interna_status'
CREATE INDEX [IX_fk_interna_status]
ON [dbo].[TB_PORTAL_CONTEUDO]
    ([id_status]);
GO

-- Creating foreign key on [id_tipo] in table 'TB_PORTAL_CONTEUDO'
ALTER TABLE [dbo].[TB_PORTAL_CONTEUDO]
ADD CONSTRAINT [fk_interna_tipo]
    FOREIGN KEY ([id_tipo])
    REFERENCES [dbo].[TB_PORTAL_TIPO]
        ([id_tipo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_interna_tipo'
CREATE INDEX [IX_fk_interna_tipo]
ON [dbo].[TB_PORTAL_CONTEUDO]
    ([id_tipo]);
GO

-- Creating foreign key on [id_status] in table 'TB_PORTAL_EDICAO_REVISTA'
ALTER TABLE [dbo].[TB_PORTAL_EDICAO_REVISTA]
ADD CONSTRAINT [fk_edicao_revista_status]
    FOREIGN KEY ([id_status])
    REFERENCES [dbo].[TB_STATUS]
        ([id_status])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_edicao_revista_status'
CREATE INDEX [IX_fk_edicao_revista_status]
ON [dbo].[TB_PORTAL_EDICAO_REVISTA]
    ([id_status]);
GO

-- Creating foreign key on [id_status] in table 'TB_PORTAL_SESSAO'
ALTER TABLE [dbo].[TB_PORTAL_SESSAO]
ADD CONSTRAINT [fk_sessao_status]
    FOREIGN KEY ([id_status])
    REFERENCES [dbo].[TB_STATUS]
        ([id_status])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_sessao_status'
CREATE INDEX [IX_fk_sessao_status]
ON [dbo].[TB_PORTAL_SESSAO]
    ([id_status]);
GO

-- Creating foreign key on [id_status] in table 'TB_PORTAL_TIPO'
ALTER TABLE [dbo].[TB_PORTAL_TIPO]
ADD CONSTRAINT [fk_sessao_tipo]
    FOREIGN KEY ([id_status])
    REFERENCES [dbo].[TB_STATUS]
        ([id_status])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_sessao_tipo'
CREATE INDEX [IX_fk_sessao_tipo]
ON [dbo].[TB_PORTAL_TIPO]
    ([id_status]);
GO

-- Creating foreign key on [id_hospital] in table 'TB_FORMULARIOS'
ALTER TABLE [dbo].[TB_FORMULARIOS]
ADD CONSTRAINT [fk_formulario_hospital]
    FOREIGN KEY ([id_hospital])
    REFERENCES [dbo].[TB_HOSPITAL]
        ([id_hospital])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_formulario_hospital'
CREATE INDEX [IX_fk_formulario_hospital]
ON [dbo].[TB_FORMULARIOS]
    ([id_hospital]);
GO

-- Creating foreign key on [id_status] in table 'TB_FORMULARIOS'
ALTER TABLE [dbo].[TB_FORMULARIOS]
ADD CONSTRAINT [fk_formulario_status]
    FOREIGN KEY ([id_status])
    REFERENCES [dbo].[TB_STATUS]
        ([id_status])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_formulario_status'
CREATE INDEX [IX_fk_formulario_status]
ON [dbo].[TB_FORMULARIOS]
    ([id_status]);
GO

-- Creating foreign key on [id_status] in table 'TB_PORTAL_ESPECIALISTA'
ALTER TABLE [dbo].[TB_PORTAL_ESPECIALISTA]
ADD CONSTRAINT [fk_portal_especialistas_status]
    FOREIGN KEY ([id_status])
    REFERENCES [dbo].[TB_STATUS]
        ([id_status])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_portal_especialistas_status'
CREATE INDEX [IX_fk_portal_especialistas_status]
ON [dbo].[TB_PORTAL_ESPECIALISTA]
    ([id_status]);
GO

-- Creating foreign key on [id_espedcialista] in table 'TB_PORTAL_SAUDE_HSL_DOR'
ALTER TABLE [dbo].[TB_PORTAL_SAUDE_HSL_DOR]
ADD CONSTRAINT [fk_portal_saude_especialista]
    FOREIGN KEY ([id_espedcialista])
    REFERENCES [dbo].[TB_PORTAL_ESPECIALISTA]
        ([id_especialista])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_portal_saude_especialista'
CREATE INDEX [IX_fk_portal_saude_especialista]
ON [dbo].[TB_PORTAL_SAUDE_HSL_DOR]
    ([id_espedcialista]);
GO

-- Creating foreign key on [id_status] in table 'TB_PORTAL_SAUDE_HSL_DOR'
ALTER TABLE [dbo].[TB_PORTAL_SAUDE_HSL_DOR]
ADD CONSTRAINT [fk_portal_saude_status]
    FOREIGN KEY ([id_status])
    REFERENCES [dbo].[TB_STATUS]
        ([id_status])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_portal_saude_status'
CREATE INDEX [IX_fk_portal_saude_status]
ON [dbo].[TB_PORTAL_SAUDE_HSL_DOR]
    ([id_status]);
GO

-- Creating foreign key on [id_tema] in table 'TB_PORTAL_SAUDE_HSL_DOR'
ALTER TABLE [dbo].[TB_PORTAL_SAUDE_HSL_DOR]
ADD CONSTRAINT [fk_portal_saude_tema]
    FOREIGN KEY ([id_tema])
    REFERENCES [dbo].[TB_PORTAL_TEMA]
        ([id_tema])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_portal_saude_tema'
CREATE INDEX [IX_fk_portal_saude_tema]
ON [dbo].[TB_PORTAL_SAUDE_HSL_DOR]
    ([id_tema]);
GO

-- Creating foreign key on [id_status] in table 'TB_PORTAL_TEMA'
ALTER TABLE [dbo].[TB_PORTAL_TEMA]
ADD CONSTRAINT [fk_portal_tema_status]
    FOREIGN KEY ([id_status])
    REFERENCES [dbo].[TB_STATUS]
        ([id_status])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_portal_tema_status'
CREATE INDEX [IX_fk_portal_tema_status]
ON [dbo].[TB_PORTAL_TEMA]
    ([id_status]);
GO

-- Creating foreign key on [id_status] in table 'TB_PORTAL_PROGRAMETES'
ALTER TABLE [dbo].[TB_PORTAL_PROGRAMETES]
ADD CONSTRAINT [fk_portal_programente_status]
    FOREIGN KEY ([id_status])
    REFERENCES [dbo].[TB_STATUS]
        ([id_status])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_portal_programente_status'
CREATE INDEX [IX_fk_portal_programente_status]
ON [dbo].[TB_PORTAL_PROGRAMETES]
    ([id_status]);
GO

-- Creating foreign key on [id_idioma] in table 'TB_PORTAL_VIDEO'
ALTER TABLE [dbo].[TB_PORTAL_VIDEO]
ADD CONSTRAINT [FK_TB_PORTAL_VIDEO_TB_IDIOMA]
    FOREIGN KEY ([id_idioma])
    REFERENCES [dbo].[TB_IDIOMA]
        ([id_idioma])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TB_PORTAL_VIDEO_TB_IDIOMA'
CREATE INDEX [IX_FK_TB_PORTAL_VIDEO_TB_IDIOMA]
ON [dbo].[TB_PORTAL_VIDEO]
    ([id_idioma]);
GO

-- Creating foreign key on [id_status] in table 'TB_PORTAL_VIDEO'
ALTER TABLE [dbo].[TB_PORTAL_VIDEO]
ADD CONSTRAINT [FK_TB_PORTAL_VIDEO_TB_STATUS]
    FOREIGN KEY ([id_status])
    REFERENCES [dbo].[TB_STATUS]
        ([id_status])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TB_PORTAL_VIDEO_TB_STATUS'
CREATE INDEX [IX_FK_TB_PORTAL_VIDEO_TB_STATUS]
ON [dbo].[TB_PORTAL_VIDEO]
    ([id_status]);
GO

-- Creating foreign key on [id_hospital] in table 'TB_NEWSLETTER'
ALTER TABLE [dbo].[TB_NEWSLETTER]
ADD CONSTRAINT [fk_newsletter_hospital]
    FOREIGN KEY ([id_hospital])
    REFERENCES [dbo].[TB_HOSPITAL]
        ([id_hospital])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_newsletter_hospital'
CREATE INDEX [IX_fk_newsletter_hospital]
ON [dbo].[TB_NEWSLETTER]
    ([id_hospital]);
GO

-- Creating foreign key on [id_especialidade] in table 'TB_AREA_MEDICA_CURSO_ESPECIALIDADE'
ALTER TABLE [dbo].[TB_AREA_MEDICA_CURSO_ESPECIALIDADE]
ADD CONSTRAINT [FK_TB_AREA_MEDICA_CURSO_ESPECIALIDADE_TB_EPSECIALIDADE]
    FOREIGN KEY ([id_especialidade])
    REFERENCES [dbo].[TB_EPSECIALIDADE]
        ([id_especialidade])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TB_AREA_MEDICA_CURSO_ESPECIALIDADE_TB_EPSECIALIDADE'
CREATE INDEX [IX_FK_TB_AREA_MEDICA_CURSO_ESPECIALIDADE_TB_EPSECIALIDADE]
ON [dbo].[TB_AREA_MEDICA_CURSO_ESPECIALIDADE]
    ([id_especialidade]);
GO

-- Creating foreign key on [id_area_medica_curso] in table 'TB_AREA_MEDICA_CURSO_ESPECIALIDADE'
ALTER TABLE [dbo].[TB_AREA_MEDICA_CURSO_ESPECIALIDADE]
ADD CONSTRAINT [FK_TB_AREA_MEDICA_CURSO_ESPECIALIDADE_TB_AREA_MEDICA_CURSO]
    FOREIGN KEY ([id_area_medica_curso])
    REFERENCES [dbo].[TB_AREA_MEDICA_CURSO]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TB_AREA_MEDICA_CURSO_ESPECIALIDADE_TB_AREA_MEDICA_CURSO'
CREATE INDEX [IX_FK_TB_AREA_MEDICA_CURSO_ESPECIALIDADE_TB_AREA_MEDICA_CURSO]
ON [dbo].[TB_AREA_MEDICA_CURSO_ESPECIALIDADE]
    ([id_area_medica_curso]);
GO

-- Creating foreign key on [id_hospital] in table 'TB_AREA_MEDICA_CURSO'
ALTER TABLE [dbo].[TB_AREA_MEDICA_CURSO]
ADD CONSTRAINT [FK_TB_AREA_MEDICA_CURSO_TB_HOSPITAL]
    FOREIGN KEY ([id_hospital])
    REFERENCES [dbo].[TB_HOSPITAL]
        ([id_hospital])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TB_AREA_MEDICA_CURSO_TB_HOSPITAL'
CREATE INDEX [IX_FK_TB_AREA_MEDICA_CURSO_TB_HOSPITAL]
ON [dbo].[TB_AREA_MEDICA_CURSO]
    ([id_hospital]);
GO

-- Creating foreign key on [id_status] in table 'TB_AREA_MEDICA_CURSO'
ALTER TABLE [dbo].[TB_AREA_MEDICA_CURSO]
ADD CONSTRAINT [FK_TB_AREA_MEDICA_CURSO_TB_STATUS]
    FOREIGN KEY ([id_status])
    REFERENCES [dbo].[TB_STATUS]
        ([id_status])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TB_AREA_MEDICA_CURSO_TB_STATUS'
CREATE INDEX [IX_FK_TB_AREA_MEDICA_CURSO_TB_STATUS]
ON [dbo].[TB_AREA_MEDICA_CURSO]
    ([id_status]);
GO

-- Creating foreign key on [id_hospital] in table 'TB_PORTAL_CONTEUDO'
ALTER TABLE [dbo].[TB_PORTAL_CONTEUDO]
ADD CONSTRAINT [FK_TB_PORTAL_CONTEUDO_TB_HOSPITAL]
    FOREIGN KEY ([id_hospital])
    REFERENCES [dbo].[TB_HOSPITAL]
        ([id_hospital])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TB_PORTAL_CONTEUDO_TB_HOSPITAL'
CREATE INDEX [IX_FK_TB_PORTAL_CONTEUDO_TB_HOSPITAL]
ON [dbo].[TB_PORTAL_CONTEUDO]
    ([id_hospital]);
GO

-- Creating foreign key on [id_hospital] in table 'TB_PORTAL_CONTEUDO_HOSPITAL'
ALTER TABLE [dbo].[TB_PORTAL_CONTEUDO_HOSPITAL]
ADD CONSTRAINT [FK_TB_PORTAL_CONTEUDO_HOSPITAL_TB_HOSPITAL]
    FOREIGN KEY ([id_hospital])
    REFERENCES [dbo].[TB_HOSPITAL]
        ([id_hospital])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TB_PORTAL_CONTEUDO_HOSPITAL_TB_HOSPITAL'
CREATE INDEX [IX_FK_TB_PORTAL_CONTEUDO_HOSPITAL_TB_HOSPITAL]
ON [dbo].[TB_PORTAL_CONTEUDO_HOSPITAL]
    ([id_hospital]);
GO

-- Creating foreign key on [id_conteudo] in table 'TB_PORTAL_CONTEUDO_HOSPITAL'
ALTER TABLE [dbo].[TB_PORTAL_CONTEUDO_HOSPITAL]
ADD CONSTRAINT [FK_TB_PORTAL_CONTEUDO_HOSPITAL_TB_PORTAL_CONTEUDO]
    FOREIGN KEY ([id_conteudo])
    REFERENCES [dbo].[TB_PORTAL_CONTEUDO]
        ([id_conteudo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TB_PORTAL_CONTEUDO_HOSPITAL_TB_PORTAL_CONTEUDO'
CREATE INDEX [IX_FK_TB_PORTAL_CONTEUDO_HOSPITAL_TB_PORTAL_CONTEUDO]
ON [dbo].[TB_PORTAL_CONTEUDO_HOSPITAL]
    ([id_conteudo]);
GO

-- Creating foreign key on [id_curso] in table 'TB_AREA_MEDICA_CURSO_HOSPITAL'
ALTER TABLE [dbo].[TB_AREA_MEDICA_CURSO_HOSPITAL]
ADD CONSTRAINT [FK_TB_AREA_MEDICA_CURSO_HOSPITAL_TB_AREA_MEDICA_CURSO_HOSPITAL]
    FOREIGN KEY ([id_curso])
    REFERENCES [dbo].[TB_AREA_MEDICA_CURSO]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TB_AREA_MEDICA_CURSO_HOSPITAL_TB_AREA_MEDICA_CURSO_HOSPITAL'
CREATE INDEX [IX_FK_TB_AREA_MEDICA_CURSO_HOSPITAL_TB_AREA_MEDICA_CURSO_HOSPITAL]
ON [dbo].[TB_AREA_MEDICA_CURSO_HOSPITAL]
    ([id_curso]);
GO

-- Creating foreign key on [id_hospital] in table 'TB_AREA_MEDICA_CURSO_HOSPITAL'
ALTER TABLE [dbo].[TB_AREA_MEDICA_CURSO_HOSPITAL]
ADD CONSTRAINT [FK_TB_AREA_MEDICA_CURSO_HOSPITAL_TB_HOSPITAL]
    FOREIGN KEY ([id_hospital])
    REFERENCES [dbo].[TB_HOSPITAL]
        ([id_hospital])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TB_AREA_MEDICA_CURSO_HOSPITAL_TB_HOSPITAL'
CREATE INDEX [IX_FK_TB_AREA_MEDICA_CURSO_HOSPITAL_TB_HOSPITAL]
ON [dbo].[TB_AREA_MEDICA_CURSO_HOSPITAL]
    ([id_hospital]);
GO

-- Creating foreign key on [id_hospital] in table 'TB_PORTAL_SLIDER'
ALTER TABLE [dbo].[TB_PORTAL_SLIDER]
ADD CONSTRAINT [FK_TB_PORTAL_SLIDER_TB_HOSPITAL]
    FOREIGN KEY ([id_hospital])
    REFERENCES [dbo].[TB_HOSPITAL]
        ([id_hospital])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TB_PORTAL_SLIDER_TB_HOSPITAL'
CREATE INDEX [IX_FK_TB_PORTAL_SLIDER_TB_HOSPITAL]
ON [dbo].[TB_PORTAL_SLIDER]
    ([id_hospital]);
GO

-- Creating foreign key on [id_hospital] in table 'TB_PORTAL_BANNER'
ALTER TABLE [dbo].[TB_PORTAL_BANNER]
ADD CONSTRAINT [FK_TB_PORTAL_BANNER_TB_HOSPITAL]
    FOREIGN KEY ([id_hospital])
    REFERENCES [dbo].[TB_HOSPITAL]
        ([id_hospital])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TB_PORTAL_BANNER_TB_HOSPITAL'
CREATE INDEX [IX_FK_TB_PORTAL_BANNER_TB_HOSPITAL]
ON [dbo].[TB_PORTAL_BANNER]
    ([id_hospital]);
GO

-- Creating foreign key on [id_idioma] in table 'TB_PORTAL_BANNER'
ALTER TABLE [dbo].[TB_PORTAL_BANNER]
ADD CONSTRAINT [FK_banner_idioma]
    FOREIGN KEY ([id_idioma])
    REFERENCES [dbo].[TB_IDIOMA]
        ([id_idioma])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_banner_idioma'
CREATE INDEX [IX_FK_banner_idioma]
ON [dbo].[TB_PORTAL_BANNER]
    ([id_idioma]);
GO

-- Creating foreign key on [id_status] in table 'TB_PORTAL_BANNER'
ALTER TABLE [dbo].[TB_PORTAL_BANNER]
ADD CONSTRAINT [fk_banner_status]
    FOREIGN KEY ([id_status])
    REFERENCES [dbo].[TB_STATUS]
        ([id_status])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_banner_status'
CREATE INDEX [IX_fk_banner_status]
ON [dbo].[TB_PORTAL_BANNER]
    ([id_status]);
GO

-- Creating foreign key on [id_hospital] in table 'TB_HOSPITAL_CORPO_CLINICO_HOSPITAL'
ALTER TABLE [dbo].[TB_HOSPITAL_CORPO_CLINICO_HOSPITAL]
ADD CONSTRAINT [FK_TB_HOSPITAL_CORPO_CLINICO_HOSPITAL_TB_HOSPITAL]
    FOREIGN KEY ([id_hospital])
    REFERENCES [dbo].[TB_HOSPITAL]
        ([id_hospital])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TB_HOSPITAL_CORPO_CLINICO_HOSPITAL_TB_HOSPITAL'
CREATE INDEX [IX_FK_TB_HOSPITAL_CORPO_CLINICO_HOSPITAL_TB_HOSPITAL]
ON [dbo].[TB_HOSPITAL_CORPO_CLINICO_HOSPITAL]
    ([id_hospital]);
GO

-- Creating foreign key on [id_corpo_clinico] in table 'TB_HOSPITAL_CORPO_CLINICO_HOSPITAL'
ALTER TABLE [dbo].[TB_HOSPITAL_CORPO_CLINICO_HOSPITAL]
ADD CONSTRAINT [FK_TB_HOSPITAL_CORPO_CLINICO_HOSPITAL_TB_HOSPITAL_CORPO_CLINICO]
    FOREIGN KEY ([id_corpo_clinico])
    REFERENCES [dbo].[TB_HOSPITAL_CORPO_CLINICO]
        ([id_corpo_clinico])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TB_HOSPITAL_CORPO_CLINICO_HOSPITAL_TB_HOSPITAL_CORPO_CLINICO'
CREATE INDEX [IX_FK_TB_HOSPITAL_CORPO_CLINICO_HOSPITAL_TB_HOSPITAL_CORPO_CLINICO]
ON [dbo].[TB_HOSPITAL_CORPO_CLINICO_HOSPITAL]
    ([id_corpo_clinico]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------