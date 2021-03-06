USE [db_hosp_brasil]
GO
/****** Object:  Table [dbo].[tb_exame_cliente]    Script Date: 05/24/2012 19:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_exame_cliente](
	[id_exame_cliente] [int] IDENTITY(1,1) NOT NULL,
	[ds_nome] [varchar](200) NULL,
	[dt_nascimento] [datetime] NULL,
	[id_identificacao] [int] NULL,
 CONSTRAINT [PK_tb_exame_cliente] PRIMARY KEY CLUSTERED 
(
	[id_exame_cliente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_exame_profissional_saude]    Script Date: 05/24/2012 19:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_exame_profissional_saude](
	[id_exame_profissional_saude] [int] IDENTITY(1,1) NOT NULL,
	[nu_registro] [int] NOT NULL,
	[ds_nome] [varchar](200) NOT NULL,
	[id_estado] [char](2) NOT NULL,
	[ds_tipo_conselho] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tb_exame_profissional_saude] PRIMARY KEY CLUSTERED 
(
	[id_exame_profissional_saude] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_exame_ficha]    Script Date: 05/24/2012 19:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_exame_ficha](
	[id_exame_ficha] [int] IDENTITY(1,1) NOT NULL,
	[nu_cliente] [int] NULL,
	[nu_internacao] [int] NULL,
	[nu_requisicao] [int] NULL,
	[nu_unidade] [int] NULL,
	[id_exame_cliente] [int] NULL,
	[nu_ficha] [int] NULL,
 CONSTRAINT [PK_tb_exame_ficha] PRIMARY KEY CLUSTERED 
(
	[id_exame_ficha] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spExameProfissionalSaudeInserir]    Script Date: 05/24/2012 19:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spExameProfissionalSaudeInserir]
	@id_exame_profissional_saude INT OUTPUT,
	@nu_registro INT,
	@ds_nome VARCHAR(200),
	@id_estado CHAR(2),
	@ds_tipo_conselho VARCHAR(50)
AS
BEGIN
	SET @id_exame_profissional_saude = (SELECT id_exame_profissional_saude FROM tb_exame_profissional_saude WHERE nu_registro = @nu_registro AND id_estado = @id_estado AND ds_tipo_conselho = @ds_tipo_conselho)
	IF @id_exame_profissional_saude IS NULL BEGIN
		INSERT tb_exame_profissional_saude VALUES (@nu_registro, @ds_nome, @id_estado, @ds_tipo_conselho)
		SET @id_exame_profissional_saude = @@IDENTITY
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spExameClienteInserir]    Script Date: 05/24/2012 19:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spExameClienteInserir]
	@id_exame_cliente INT OUTPUT,
	@ds_nome VARCHAR(200),
	@dt_nascimento DATETIME,
	@id_identificacao INT
AS
BEGIN
	SET @id_exame_cliente = (SELECT id_exame_cliente FROM tb_exame_cliente WHERE id_identificacao = @id_identificacao)
	IF @id_exame_cliente IS NOT NULL BEGIN
		UPDATE tb_exame_cliente SET ds_nome = @ds_nome, dt_nascimento = @dt_nascimento WHERE id_exame_cliente = @id_exame_cliente
	END
	ELSE BEGIN
		INSERT tb_exame_cliente VALUES (@ds_nome, @dt_nascimento, @id_identificacao)
		SET @id_exame_cliente = @@IDENTITY
	END
END
GO
/****** Object:  Table [dbo].[tb_exame]    Script Date: 05/24/2012 19:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_exame](
	[id_exame] [int] IDENTITY(1,1) NOT NULL,
	[id_exame_profissional_saude] [int] NULL,
	[ds_laudo] [varchar](max) NULL,
	[ds_evolutivo] [varchar](max) NULL,
	[dt_exame] [datetime] NULL,
	[ds_sigla_exame] [varchar](30) NULL,
	[id_exame_externo] [int] NULL,
	[id_exame_ficha] [int] NULL,
 CONSTRAINT [PK_tb_exame] PRIMARY KEY CLUSTERED 
(
	[id_exame] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[spExameFichaInserir]    Script Date: 05/24/2012 19:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spExameFichaInserir]
	@id_exame_ficha INT OUTPUT,
	@nu_cliente INT,
	@nu_internacao INT,
	@nu_requisicao INT,
	@nu_unidade INT,
	@id_exame_cliente INT,
	@nu_ficha INT
AS
BEGIN
	SET @id_exame_ficha = (SELECT id_exame_ficha FROM tb_exame_ficha WHERE nu_ficha = @nu_ficha)
	IF @id_exame_ficha IS NULL BEGIN
		INSERT tb_exame_ficha VALUES (@nu_cliente, @nu_internacao, @nu_requisicao, @nu_unidade, @id_exame_cliente, @nu_ficha)
		SET @id_exame_ficha = @@IDENTITY
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spExameInserir]    Script Date: 05/24/2012 19:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spExameInserir]
	@id_exame INT OUTPUT,
	@id_exame_profissional_saude INT,
	@ds_laudo VARCHAR(MAX),
	@ds_evolutivo VARCHAR(MAX),
	@dt_exame DATETIME,
	@ds_sigla_exame VARCHAR(50),
	@id_exame_externo INT,
	@id_exame_ficha INT
AS
BEGIN
	SET @id_exame = (SELECT id_exame FROM tb_exame WHERE id_exame_ficha = @id_exame_ficha AND id_exame_externo = @id_exame_externo)
	IF @id_exame IS NULL BEGIN
		INSERT tb_exame VALUES (@id_exame_profissional_saude, @ds_laudo, @ds_evolutivo, @dt_exame, @ds_sigla_exame, @id_exame_externo, @id_exame_ficha)
		SET @id_exame_profissional_saude = @@IDENTITY
	END
END
GO
/****** Object:  ForeignKey [FK_tb_exame_tb_exame_ficha]    Script Date: 05/24/2012 19:30:26 ******/
ALTER TABLE [dbo].[tb_exame]  WITH CHECK ADD  CONSTRAINT [FK_tb_exame_tb_exame_ficha] FOREIGN KEY([id_exame_ficha])
REFERENCES [dbo].[tb_exame_ficha] ([id_exame_ficha])
GO
ALTER TABLE [dbo].[tb_exame] CHECK CONSTRAINT [FK_tb_exame_tb_exame_ficha]
GO
/****** Object:  ForeignKey [FK_tb_exame_tb_exame_profissional_saude]    Script Date: 05/24/2012 19:30:26 ******/
ALTER TABLE [dbo].[tb_exame]  WITH CHECK ADD  CONSTRAINT [FK_tb_exame_tb_exame_profissional_saude] FOREIGN KEY([id_exame_profissional_saude])
REFERENCES [dbo].[tb_exame_profissional_saude] ([id_exame_profissional_saude])
GO
ALTER TABLE [dbo].[tb_exame] CHECK CONSTRAINT [FK_tb_exame_tb_exame_profissional_saude]
GO
/****** Object:  ForeignKey [FK_tb_exame_ficha_tb_exame_cliente]    Script Date: 05/24/2012 19:30:26 ******/
ALTER TABLE [dbo].[tb_exame_ficha]  WITH CHECK ADD  CONSTRAINT [FK_tb_exame_ficha_tb_exame_cliente] FOREIGN KEY([id_exame_cliente])
REFERENCES [dbo].[tb_exame_cliente] ([id_exame_cliente])
GO
ALTER TABLE [dbo].[tb_exame_ficha] CHECK CONSTRAINT [FK_tb_exame_ficha_tb_exame_cliente]
GO
