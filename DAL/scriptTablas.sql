USE [Proyecto_Ing_softw]
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 3/7/2026 18:44:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitacora](
	[FechaUTC] [datetime2](7) NOT NULL,
	[Usuario_ID] [int] NOT NULL,
	[Usuario_Username] [nvarchar](150) NULL,
	[Accion] [nvarchar](100) NULL,
	[Mensaje] [nvarchar](500) NULL,
	[Detalle] [nvarchar](max) NULL,
	[Origen] [nvarchar](150) NULL,
	[Host] [nvarchar](100) NULL,
	[IP] [varchar](45) NULL,
	[Severidad] [int] NULL,
 CONSTRAINT [PK_Bitacora] PRIMARY KEY CLUSTERED 
(
	[FechaUTC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Etiqueta]    Script Date: 3/7/2026 18:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Etiqueta](
	[Etiqueta_Clave] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Etiqueta] PRIMARY KEY CLUSTERED 
(
	[Etiqueta_Clave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Familia_Hijo]    Script Date: 3/7/2026 18:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Familia_Hijo](
	[Familia_ID] [int] NOT NULL,
	[Hijo_ID] [int] NOT NULL,
 CONSTRAINT [PK_Familia_Hijo] PRIMARY KEY CLUSTERED 
(
	[Familia_ID] ASC,
	[Hijo_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Idioma]    Script Date: 3/7/2026 18:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Idioma](
	[Idioma_Id] [int] IDENTITY(1,1) NOT NULL,
	[Idioma_Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Idioma] PRIMARY KEY CLUSTERED 
(
	[Idioma_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfil]    Script Date: 3/7/2026 18:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfil](
	[Perfil_ID] [int] IDENTITY(1,1) NOT NULL,
	[Perfil_Nombre] [varchar](50) NULL,
	[Perfil_Tag] [varchar](50) NULL,
	[Perfil_Tipo] [varchar](50) NULL,
 CONSTRAINT [PK_Perfil] PRIMARY KEY CLUSTERED 
(
	[Perfil_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Traduccion]    Script Date: 3/7/2026 18:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Traduccion](
	[Traduccion_IdiomaId] [int] NOT NULL,
	[Traduccion_EtiquetaClave] [varchar](100) NOT NULL,
	[Traduccion_Texto] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Traduccion] PRIMARY KEY CLUSTERED 
(
	[Traduccion_IdiomaId] ASC,
	[Traduccion_EtiquetaClave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 3/7/2026 18:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Usuario_ID] [int] IDENTITY(1,1) NOT NULL,
	[Usuario_Username] [nvarchar](50) NULL,
	[Usuario_Password] [nvarchar](50) NULL,
	[Usuario_Mail] [nvarchar](50) NULL,
	[Usuario_IntentosFallidos] [numeric](18, 0) NULL,
	[Usuario_Bloqueado] [bit] NULL,
	[DVH] [bigint] NULL,
	[Usuario_IdiomaDefault] [int] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Usuario_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario_Perfil]    Script Date: 3/7/2026 18:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario_Perfil](
	[Usuario_ID] [int] NOT NULL,
	[Perfil_ID] [int] NOT NULL,
 CONSTRAINT [PK_Usuario_Perfil] PRIMARY KEY CLUSTERED 
(
	[Usuario_ID] ASC,
	[Perfil_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bitacora]  WITH CHECK ADD  CONSTRAINT [FK_Bitacora_Usuario] FOREIGN KEY([Usuario_ID])
REFERENCES [dbo].[Usuario] ([Usuario_ID])
GO
ALTER TABLE [dbo].[Bitacora] CHECK CONSTRAINT [FK_Bitacora_Usuario]
GO
ALTER TABLE [dbo].[Familia_Hijo]  WITH CHECK ADD  CONSTRAINT [FK_Familia_Hijo_Perfil] FOREIGN KEY([Familia_ID])
REFERENCES [dbo].[Perfil] ([Perfil_ID])
GO
ALTER TABLE [dbo].[Familia_Hijo] CHECK CONSTRAINT [FK_Familia_Hijo_Perfil]
GO
ALTER TABLE [dbo].[Familia_Hijo]  WITH CHECK ADD  CONSTRAINT [FK_Familia_Hijo_Perfil1] FOREIGN KEY([Hijo_ID])
REFERENCES [dbo].[Perfil] ([Perfil_ID])
GO
ALTER TABLE [dbo].[Familia_Hijo] CHECK CONSTRAINT [FK_Familia_Hijo_Perfil1]
GO
ALTER TABLE [dbo].[Traduccion]  WITH CHECK ADD  CONSTRAINT [FK_Traduccion_Etiqueta] FOREIGN KEY([Traduccion_EtiquetaClave])
REFERENCES [dbo].[Etiqueta] ([Etiqueta_Clave])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Traduccion] CHECK CONSTRAINT [FK_Traduccion_Etiqueta]
GO
ALTER TABLE [dbo].[Traduccion]  WITH CHECK ADD  CONSTRAINT [FK_Traduccion_Idioma] FOREIGN KEY([Traduccion_IdiomaId])
REFERENCES [dbo].[Idioma] ([Idioma_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Traduccion] CHECK CONSTRAINT [FK_Traduccion_Idioma]
GO
ALTER TABLE [dbo].[Usuario_Perfil]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Perfil_Perfil] FOREIGN KEY([Perfil_ID])
REFERENCES [dbo].[Perfil] ([Perfil_ID])
GO
ALTER TABLE [dbo].[Usuario_Perfil] CHECK CONSTRAINT [FK_Usuario_Perfil_Perfil]
GO
ALTER TABLE [dbo].[Usuario_Perfil]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Perfil_Usuario] FOREIGN KEY([Usuario_ID])
REFERENCES [dbo].[Usuario] ([Usuario_ID])
GO
ALTER TABLE [dbo].[Usuario_Perfil] CHECK CONSTRAINT [FK_Usuario_Perfil_Usuario]
GO
