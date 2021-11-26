USE [TESTE]
GO
/****** Object:  Table [dbo].[Alunos]    Script Date: 25/11/2021 22:36:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alunos](
	[idAluno] [bigint] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](100) NOT NULL,
	[telefone] [varchar](40) NULL,
 CONSTRAINT [PK_Alunos] PRIMARY KEY CLUSTERED 
(
	[idAluno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Telefone]    Script Date: 25/11/2021 22:36:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Telefone](
	[idTelefone] [int] IDENTITY(1,1) NOT NULL,
	[numeroTelefone] [varchar](15) NOT NULL,
	[idAluno] [bigint] NOT NULL,
 CONSTRAINT [PK_Telefone] PRIMARY KEY CLUSTERED 
(
	[idTelefone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Telefone]  WITH CHECK ADD  CONSTRAINT [FK_Telefone_Alunos] FOREIGN KEY([idAluno])
REFERENCES [dbo].[Alunos] ([idAluno])
GO
ALTER TABLE [dbo].[Telefone] CHECK CONSTRAINT [FK_Telefone_Alunos]
GO
/****** Object:  StoredProcedure [dbo].[consultarTelefone]    Script Date: 25/11/2021 22:36:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[consultarTelefone]
	@idAluno BIGINT
AS
	SELECT * FROM [Telefone] WHERE [idAluno] = @idAluno

GO
/****** Object:  StoredProcedure [dbo].[removeAluno]    Script Date: 25/11/2021 22:36:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[removeAluno] (
    @idAluno BIGINT
)
AS
    BEGIN TRANSACTION
        DELETE FROM 
            [Telefone] 
        WHERE 
            [idAluno] = @idAluno

        DELETE FROM 
            [Alunos] 
        WHERE 
            [IdAluno] = @idAluno
    COMMIT
GO
