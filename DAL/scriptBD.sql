-- 1. Si la base de datos no existe, la crea
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'Proyecto_Ing_softw')
BEGIN
    CREATE DATABASE [Proyecto_Ing_softw];
END
GO
-- 2. se conecta a la base de datos recién creada o existente
USE [Proyecto_Ing_softw]
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 10/7/2026 23:58:38 ******/
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
/****** Object:  Table [dbo].[DVV]    Script Date: 10/7/2026 23:58:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DVV](
	[ID] [int] NOT NULL,
	[Nombre_tabla] [varchar](50) NULL,
	[Suma] [numeric](18, 0) NULL,
 CONSTRAINT [PK_DVV] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Etiqueta]    Script Date: 10/7/2026 23:58:38 ******/
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
/****** Object:  Table [dbo].[Familia_Hijo]    Script Date: 10/7/2026 23:58:38 ******/
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
/****** Object:  Table [dbo].[Historial]    Script Date: 10/7/2026 23:58:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historial](
	[Historial_Id] [int] IDENTITY(1,1) NOT NULL,
	[Usuario_Id] [int] NOT NULL,
	[Historial_mail] [varchar](50) NULL,
	[Historial_fecha] [datetime] NULL,
 CONSTRAINT [PK_Historial] PRIMARY KEY CLUSTERED 
(
	[Historial_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Idioma]    Script Date: 10/7/2026 23:58:38 ******/
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
/****** Object:  Table [dbo].[Perfil]    Script Date: 10/7/2026 23:58:38 ******/
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
/****** Object:  Table [dbo].[Traduccion]    Script Date: 10/7/2026 23:58:38 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 10/7/2026 23:58:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Usuario_ID] [int] IDENTITY(1,1) NOT NULL,
	[Usuario_Username] [nvarchar](max) NULL,
	[Usuario_Password] [nvarchar](max) NULL,
	[Usuario_Mail] [nvarchar](50) NULL,
	[Usuario_IntentosFallidos] [numeric](18, 0) NULL,
	[Usuario_Bloqueado] [bit] NULL,
	[DVH] [bigint] NULL,
	[Usuario_IdiomaDefault] [int] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Usuario_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario_Perfil]    Script Date: 10/7/2026 23:58:38 ******/
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
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T03:26:13.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T03:26:27.0000000' AS DateTime2), 1, N'test', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 2)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T12:55:56.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 3)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T12:56:01.0000000' AS DateTime2), 1, N'test', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T12:57:52.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T12:57:54.0000000' AS DateTime2), 1, N'test', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T12:58:00.0000000' AS DateTime2), 1, N'test', N'Credenciales Erroneas', N'Se actualiza intento fallido', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T13:03:46.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T13:03:48.0000000' AS DateTime2), 1, N'test', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T13:03:53.0000000' AS DateTime2), 1, N'test', N'Credenciales Erroneas', N'Se actualiza intento fallido', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 2)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T13:04:13.0000000' AS DateTime2), 1, N'test', N'Bloqueado', N'Alcanzo 3 intentos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 2)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T13:09:33.0000000' AS DateTime2), 1, N'test', N'Bloqueado', N'No puede ingresar', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 2)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T13:14:01.0000000' AS DateTime2), 1, N'test', N'Bloqueado', N'No puede ingresar', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 3)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T13:17:13.0000000' AS DateTime2), 1, N'test', N'Credenciales Erroneas', N'Se actualiza intento fallido', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T13:17:48.0000000' AS DateTime2), 1, N'test', N'Credenciales Erroneas', N'Se actualiza intento fallido', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T13:18:02.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 2)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T13:22:07.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T14:07:24.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T14:07:50.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 2)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T14:07:54.0000000' AS DateTime2), 1, N'test', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T14:08:13.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T14:08:32.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T14:08:49.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T14:08:55.0000000' AS DateTime2), 1, N'test', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T14:10:42.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T14:10:44.0000000' AS DateTime2), 1, N'test', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T14:11:01.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T14:11:02.0000000' AS DateTime2), 1, N'test', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T14:58:39.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T14:58:45.0000000' AS DateTime2), 1, N'test', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T14:59:36.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T14:59:38.0000000' AS DateTime2), 1, N'test', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T15:00:38.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T15:00:46.0000000' AS DateTime2), 1, N'test', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T15:03:09.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 2)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-24T15:03:14.0000000' AS DateTime2), 1, N'test', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 3)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T15:07:10.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 3)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T15:18:38.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 3)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T15:18:41.0000000' AS DateTime2), 1, N'test', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 2)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T15:31:18.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 3)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T15:31:21.0000000' AS DateTime2), 1, N'test', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T16:16:06.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T16:17:12.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T16:21:03.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T16:23:42.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T16:29:29.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T16:40:22.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T16:43:09.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 2)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T16:48:48.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 2)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T21:13:55.0000000' AS DateTime2), 2, N'prueba', N'Nuevo Usuario', N'usuario creado con exito', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 2)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T21:14:06.0000000' AS DateTime2), 2, N'prueba', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 2)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T21:19:36.0000000' AS DateTime2), 3, N'rr', N'Nuevo Usuario', N'usuario creado con exito', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T21:19:46.0000000' AS DateTime2), 3, N'rr', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 3)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T21:19:50.0000000' AS DateTime2), 3, N'rr', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T21:37:52.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T21:39:19.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T21:39:36.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 2)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T21:39:53.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 3)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T21:40:24.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T21:40:44.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T22:00:37.0000000' AS DateTime2), 3, N'rr', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 3)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T22:01:05.0000000' AS DateTime2), 3, N'rr', N'ActualizarContraseña', N'Contraseña actualizada', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 2)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T22:01:56.0000000' AS DateTime2), 3, N'rr', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T22:02:05.0000000' AS DateTime2), 3, N'rr', N'ActualizarContraseña', N'Contraseña actualizada', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 3)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T22:02:11.0000000' AS DateTime2), 3, N'rr', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T22:02:16.0000000' AS DateTime2), 1, N'test', N'Credenciales Erroneas', N'Se actualiza intento fallido', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 2)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T22:05:04.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T22:05:19.0000000' AS DateTime2), 1, N'test', N'ActualizarContraseña', N'Contraseña actualizada', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 2)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T22:05:30.0000000' AS DateTime2), 1, N'test', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T22:05:48.0000000' AS DateTime2), 4, N'nuevo', N'Nuevo Usuario', N'usuario creado con exito', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T22:05:59.0000000' AS DateTime2), 4, N'nuevo', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 2)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-05-27T22:06:03.0000000' AS DateTime2), 4, N'nuevo', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-08T21:27:38.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-08T21:27:44.0000000' AS DateTime2), 1, N'test', N'ActualizarContraseña', N'Contraseña actualizada', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-08T21:27:47.0000000' AS DateTime2), 1, N'test', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-08T21:50:48.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-08T21:54:27.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-08T21:55:14.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-12T14:52:12.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-12T14:57:25.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-12T15:10:23.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-12T15:11:43.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-12T15:13:37.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-12T15:14:06.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-12T15:14:41.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-12T15:19:52.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-13T10:13:52.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-19T04:07:03.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-19T04:07:15.0000000' AS DateTime2), 1, N'test', N'ActualizarContraseña', N'Contraseña actualizada', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-19T04:08:53.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-19T04:08:55.0000000' AS DateTime2), 1, N'test', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-19T04:10:29.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-19T04:11:14.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-19T04:11:31.0000000' AS DateTime2), 1, N'test', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-19T13:05:24.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-19T13:05:46.0000000' AS DateTime2), 1, N'test', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-20T12:38:01.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-20T12:43:26.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-20T12:43:32.0000000' AS DateTime2), 1, N'test', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-20T13:19:02.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
GO
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-20T13:26:05.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-20T13:26:27.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-20T13:26:53.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-20T13:27:33.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-20T13:28:28.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-20T22:38:44.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-20T22:41:03.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-20T22:49:40.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-20T23:32:44.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-20T23:33:55.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-20T23:35:16.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-20T23:46:11.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-20T23:47:15.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-20T23:49:31.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-20T23:50:10.0000000' AS DateTime2), 1, N'test', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-21T01:03:29.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-21T01:04:32.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-21T01:05:17.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-21T20:56:37.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-21T20:57:38.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-21T21:04:38.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-21T21:05:37.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-21T21:07:14.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-21T21:44:38.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-21T22:01:13.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-21T22:02:28.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-21T22:05:17.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-21T22:17:08.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-21T22:39:46.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-21T23:03:44.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-21T23:08:52.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-21T23:13:43.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-21T23:16:09.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-21T23:18:25.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-21T23:19:53.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-21T23:35:55.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-21T23:41:29.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-22T00:10:20.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-22T00:14:36.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-22T00:25:32.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-22T00:27:10.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-22T22:11:40.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-22T22:14:36.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-22T22:28:59.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-22T22:36:55.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-22T22:40:55.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-22T22:41:12.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-22T22:42:09.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-22T22:45:11.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-22T22:47:26.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-22T22:55:22.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-22T22:55:49.0000000' AS DateTime2), 1, N'test', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-22T23:09:08.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T00:00:06.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T00:01:53.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T00:03:41.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T00:07:25.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T00:09:12.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T00:10:41.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T00:12:51.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T00:13:51.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T00:16:29.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T00:20:04.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T00:29:31.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T00:30:52.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T00:33:35.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T00:35:01.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T02:17:32.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T02:23:02.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T02:25:14.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T02:27:59.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T02:43:03.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T02:44:56.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T02:47:59.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T03:08:58.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T03:18:14.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T03:23:37.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T03:36:28.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T03:36:43.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T18:00:42.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T18:01:06.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T19:01:52.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T19:20:15.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T19:29:35.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T19:34:02.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T20:18:25.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T20:19:47.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T22:06:14.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T22:07:13.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T22:07:35.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T22:21:16.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T22:24:46.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T22:55:17.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T23:06:19.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T23:07:20.0000000' AS DateTime2), 5, N'admin', N'Nuevo Usuario', N'usuario creado con exito', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T23:09:27.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T23:12:08.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T23:17:15.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T23:19:44.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T23:20:19.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
GO
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T23:21:17.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-23T23:22:46.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T00:17:50.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T03:20:04.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T03:22:08.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T03:25:20.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T03:29:40.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T03:31:22.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T03:31:39.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T03:33:51.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T03:36:10.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T03:36:54.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T03:41:13.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T03:46:58.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T03:49:07.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T03:52:32.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T03:53:01.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T04:05:56.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T04:06:44.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T04:14:12.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T04:15:05.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T04:16:18.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T04:17:56.0000000' AS DateTime2), 7, N'gerente', N'Nuevo Usuario', N'usuario creado con exito', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T04:18:02.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T04:18:13.0000000' AS DateTime2), 7, N'gerente', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T04:18:49.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T04:20:37.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T11:32:05.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T19:39:55.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T19:50:53.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T19:51:31.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T20:07:20.0000000' AS DateTime2), 8, N'user', N'Nuevo Usuario', N'usuario creado con exito', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T20:07:54.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T20:08:01.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T21:21:04.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T21:41:31.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T21:41:55.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T21:42:03.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T21:49:02.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T21:49:42.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T21:50:30.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T21:51:00.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T21:54:39.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T22:09:24.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T22:09:53.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T22:10:31.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T22:10:56.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T22:27:57.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T22:28:59.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T22:34:29.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T22:47:44.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T22:48:00.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T22:48:18.0000000' AS DateTime2), 8, N'user', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T22:48:33.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T22:50:03.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T22:50:29.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T22:51:10.0000000' AS DateTime2), 8, N'user', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T22:51:22.0000000' AS DateTime2), 8, N'user', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T22:53:11.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T23:25:41.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T23:26:28.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-24T23:43:33.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-25T00:06:03.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-25T00:09:19.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-25T00:16:29.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-25T00:18:46.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-25T22:15:42.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-25T22:16:46.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-25T22:29:37.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-25T22:30:56.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-25T22:31:44.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-25T22:32:42.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-25T22:59:05.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-25T23:20:29.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-26T00:10:41.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-26T00:11:57.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-29T00:19:12.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-29T00:19:35.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-29T00:20:01.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-29T00:29:19.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-29T00:35:07.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-29T03:40:30.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-29T03:42:39.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-29T03:46:37.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-29T03:48:20.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-29T03:58:45.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-29T04:08:55.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-29T04:11:33.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-29T18:46:09.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-29T18:47:00.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-29T18:48:46.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-29T19:09:35.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-29T19:19:47.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-29T22:32:30.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-29T22:39:41.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-29T22:41:33.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-29T22:41:46.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-29T22:58:59.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-29T22:59:23.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-29T22:59:32.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
GO
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-29T22:59:37.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-29T22:59:43.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-29T23:02:49.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-29T23:12:46.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-29T23:15:59.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-30T23:04:48.0000000' AS DateTime2), 5, N'admin', N'Credenciales Erroneas', N'Se actualiza intento fallido', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-30T23:05:46.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-30T23:07:01.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-30T23:08:51.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-30T23:09:23.0000000' AS DateTime2), 1, N'test', N'Credenciales Erroneas', N'Se actualiza intento fallido', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-30T23:09:26.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-30T23:09:50.0000000' AS DateTime2), 2, N'prueba', N'Credenciales Erroneas', N'Se actualiza intento fallido', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-30T23:10:08.0000000' AS DateTime2), 3, N'rr', N'Credenciales Erroneas', N'Se actualiza intento fallido', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-30T23:10:20.0000000' AS DateTime2), 4, N'nuevo', N'Credenciales Erroneas', N'Se actualiza intento fallido', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-30T23:10:31.0000000' AS DateTime2), 7, N'gerente', N'Credenciales Erroneas', N'Se actualiza intento fallido', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-06-30T23:10:39.0000000' AS DateTime2), 8, N'user', N'Credenciales Erroneas', N'Se actualiza intento fallido', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-01T22:55:16.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-02T18:28:32.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T13:36:15.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T13:37:17.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T13:37:23.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T13:39:01.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T13:41:08.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T14:18:30.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T14:20:35.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T14:23:44.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T14:29:17.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T14:42:59.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T14:47:42.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T14:48:18.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T14:48:32.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T14:49:11.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T14:56:14.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T14:56:17.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T14:56:21.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T14:56:39.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T14:57:03.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T14:57:06.0000000' AS DateTime2), 1, N'test', N'Credenciales Erroneas', N'Se actualiza intento fallido', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T14:57:10.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T14:59:33.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T15:05:38.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T15:06:41.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T15:14:33.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T15:14:44.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T15:26:11.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T15:26:22.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T15:29:28.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T15:30:29.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T15:30:32.0000000' AS DateTime2), 1, N'test', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T15:30:38.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T16:07:25.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T16:07:27.0000000' AS DateTime2), 5, N'admin', N'ADMIN_FULL', N'Acceso denegado al usuario:admin', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T16:10:36.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T16:11:11.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T16:11:22.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T16:11:28.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T16:11:29.0000000' AS DateTime2), 1, N'test', N'HORARIO_ATENCION', N'Acceso denegado al usuario:test', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T18:00:02.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T18:05:48.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T18:07:42.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T18:07:44.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T18:07:51.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T18:09:46.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T18:11:52.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T18:16:49.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T18:18:22.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T18:52:11.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T18:54:46.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T18:58:45.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-03T19:00:00.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-07T21:34:19.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-07T21:34:22.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-07T21:35:19.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-07T21:35:22.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-07T21:38:22.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-07T21:38:24.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-07T21:40:05.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-07T21:40:08.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-07T21:41:28.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-07T21:41:31.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-07T22:21:37.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-07T22:21:38.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-07T22:21:48.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-08T00:55:02.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-08T00:55:52.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-08T02:29:52.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-08T02:32:46.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-08T02:32:56.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-08T02:33:29.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-08T02:33:36.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-08T02:34:40.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-08T02:35:16.0000000' AS DateTime2), 5, N'admin', N'Credenciales Erroneas', N'Se actualiza intento fallido', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 1)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-08T02:35:20.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-08T02:37:18.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-08T02:37:44.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-08T02:41:03.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-08T02:41:06.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-08T02:41:54.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-08T02:42:03.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-08T02:42:49.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
GO
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-08T02:44:49.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-08T02:45:39.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-08T02:46:07.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-08T03:31:57.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-08T03:32:00.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-08T03:32:08.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-08T03:32:19.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-08T03:51:21.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-08T03:51:29.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-08T03:52:05.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-08T03:52:17.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T14:22:10.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T14:23:17.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T14:29:44.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T14:30:48.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T14:31:44.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T14:33:45.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T14:34:00.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T14:35:10.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T14:35:17.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T14:50:03.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T14:50:57.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T14:55:12.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T14:55:22.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T18:46:57.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T18:47:00.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T18:47:11.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T18:47:14.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T18:47:19.0000000' AS DateTime2), 1, N'test', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T18:47:23.0000000' AS DateTime2), 1, N'test', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T18:47:57.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T19:27:29.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T19:27:50.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T19:28:47.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T19:29:17.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T19:29:34.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T19:49:57.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T19:51:18.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T19:51:35.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T19:56:11.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T19:56:35.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T19:57:20.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T19:58:28.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T19:58:47.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T19:58:58.0000000' AS DateTime2), 3, N'rr', N'Se modifico el mail', N'operacion exitosa', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T19:59:27.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T20:34:13.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T20:34:16.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T20:35:31.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T20:35:38.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T20:37:26.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T20:37:32.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T20:42:08.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T20:42:15.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T20:44:14.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T20:44:21.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T20:44:54.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T20:44:58.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T20:45:58.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T20:46:01.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T20:46:35.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T20:46:53.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T20:46:55.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T21:36:07.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T21:36:11.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T22:14:20.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T22:14:33.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T22:18:12.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T22:18:49.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T22:47:23.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-09T22:47:34.0000000' AS DateTime2), 5, N'admin', N'Se cierra sesion', N'', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-11T00:06:17.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
INSERT [dbo].[Bitacora] ([FechaUTC], [Usuario_ID], [Usuario_Username], [Accion], [Mensaje], [Detalle], [Origen], [Host], [IP], [Severidad]) VALUES (CAST(N'2026-07-11T00:08:14.0000000' AS DateTime2), 5, N'admin', N'Ingreso Exitoso', N'Se blanquea intentos fallidos', N'', N'SistemaTurnos', N'WIN-O7CAF1FNCVK', N'127.0.0.1', 0)
GO
INSERT [dbo].[DVV] ([ID], [Nombre_tabla], [Suma]) VALUES (1, N'Usuario', CAST(1985891 AS Numeric(18, 0)))
GO
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'AdministrarPerfilesForm')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'AdmPerfEditEditar')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'AdmPerfEditEliminar')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'AdmPerfEditNombre')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'AdmPerfNuevoAgregar')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'AdmPerfNuevoCombo')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'AdmPerfNuevoLimpiar')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'AdmPerfNuevoNombre')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'AdmPerfNuevoPanel')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'AdmPerfNuevoTipo')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'AdmPerfNuevoTipoFamilia')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'AdmPerfNuevoTipoSimple')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'AdmPerfPanelEdit')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'AIAgregarIdioma')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'AIEliminar')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'AIEliminarIdioma')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'AIEliminarNombre')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'AIForm')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'AINombre')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'AINuevoIdioma')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'AsigAgregarPerfil')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'AsigBuscarPerfiles')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'AsigEliminarPerfil')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'ASIGNAR_FAMILIAS')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'ASIGNAR_USUARIO_PERFIL')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'AsignarPerfilesUsuarioForm')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'AsigNombreUsuario')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'AsigPerfilesDisp')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'BITACORA')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'BitacoraForm')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'BitacoraTipoSev')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'CambiarClaveForm')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'CERRAR_SESION')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'ClaveActual')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'ClaveCancelar')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'ClaveNueva')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'ClaveText')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'ClaveUpdate')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'CREAR_USUARIO')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'DESBLOQUEAR_USUARIO')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'GESTION_PERFILES')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'GESTION_PERFILES_MENU')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'GESTION_USUARIOS_MENU')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'GESTIONAR_IDIOMA')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'HCBuscar')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'HCCambiarMail')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'HCForm')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'HCNombreUsr')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'HCTextGroup')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'HISTORIAL_CONTROL_CAMBIOS')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'IDIOMA_MENU')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'IdiomaForm')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'IdiomaTexto')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'Login')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'loginBtnIniciar')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'loginNombre')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'loginPass')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'loginSubtitulo')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'LoginTitulo')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'MenuForm')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'MODIFICAR_CLAVE')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'MODIFICAR_MAIL')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'ModMailCambiar')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'ModMailForm')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'ModMailMail')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'ModMailNombre')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'ModMailVolver')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'PerfilesAgregar')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'PerfilesFamiliaPanel')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'PerfilesForm')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'PerfilesPosibles')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'PerfilesQuitar')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'RegistrarUsuarioForm')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'RegUsuarioPanel')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'RegUsuBoton')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'RegUsuFamilia')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'RegUsuMail')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'RegUsuNombre')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'RegUsuPass')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'RESTAURAR_INTEGRIDAD')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'SELECCION_IDIOMA')
INSERT [dbo].[Etiqueta] ([Etiqueta_Clave]) VALUES (N'USUARIO_BASICO')
GO
INSERT [dbo].[Familia_Hijo] ([Familia_ID], [Hijo_ID]) VALUES (7, 9)
INSERT [dbo].[Familia_Hijo] ([Familia_ID], [Hijo_ID]) VALUES (15, 2)
INSERT [dbo].[Familia_Hijo] ([Familia_ID], [Hijo_ID]) VALUES (15, 3)
INSERT [dbo].[Familia_Hijo] ([Familia_ID], [Hijo_ID]) VALUES (15, 12)
INSERT [dbo].[Familia_Hijo] ([Familia_ID], [Hijo_ID]) VALUES (16, 1)
INSERT [dbo].[Familia_Hijo] ([Familia_ID], [Hijo_ID]) VALUES (16, 4)
INSERT [dbo].[Familia_Hijo] ([Familia_ID], [Hijo_ID]) VALUES (16, 5)
INSERT [dbo].[Familia_Hijo] ([Familia_ID], [Hijo_ID]) VALUES (17, 8)
INSERT [dbo].[Familia_Hijo] ([Familia_ID], [Hijo_ID]) VALUES (17, 10)
INSERT [dbo].[Familia_Hijo] ([Familia_ID], [Hijo_ID]) VALUES (17, 11)
INSERT [dbo].[Familia_Hijo] ([Familia_ID], [Hijo_ID]) VALUES (17, 14)
INSERT [dbo].[Familia_Hijo] ([Familia_ID], [Hijo_ID]) VALUES (18, 16)
INSERT [dbo].[Familia_Hijo] ([Familia_ID], [Hijo_ID]) VALUES (18, 19)
INSERT [dbo].[Familia_Hijo] ([Familia_ID], [Hijo_ID]) VALUES (19, 6)
INSERT [dbo].[Familia_Hijo] ([Familia_ID], [Hijo_ID]) VALUES (19, 7)
INSERT [dbo].[Familia_Hijo] ([Familia_ID], [Hijo_ID]) VALUES (19, 13)
INSERT [dbo].[Familia_Hijo] ([Familia_ID], [Hijo_ID]) VALUES (19, 15)
INSERT [dbo].[Familia_Hijo] ([Familia_ID], [Hijo_ID]) VALUES (19, 17)
INSERT [dbo].[Familia_Hijo] ([Familia_ID], [Hijo_ID]) VALUES (20, 6)
INSERT [dbo].[Familia_Hijo] ([Familia_ID], [Hijo_ID]) VALUES (20, 17)
INSERT [dbo].[Familia_Hijo] ([Familia_ID], [Hijo_ID]) VALUES (21, 4)
INSERT [dbo].[Familia_Hijo] ([Familia_ID], [Hijo_ID]) VALUES (21, 22)
INSERT [dbo].[Familia_Hijo] ([Familia_ID], [Hijo_ID]) VALUES (22, 4)
INSERT [dbo].[Familia_Hijo] ([Familia_ID], [Hijo_ID]) VALUES (23, 10)
GO
SET IDENTITY_INSERT [dbo].[Historial] ON 

INSERT [dbo].[Historial] ([Historial_Id], [Usuario_Id], [Historial_mail], [Historial_fecha]) VALUES (1, 5, N'prueba@prueba.com', CAST(N'2026-07-09T11:31:24.630' AS DateTime))
INSERT [dbo].[Historial] ([Historial_Id], [Usuario_Id], [Historial_mail], [Historial_fecha]) VALUES (2, 5, N'test@prueba.com', CAST(N'2026-07-09T11:31:57.857' AS DateTime))
INSERT [dbo].[Historial] ([Historial_Id], [Usuario_Id], [Historial_mail], [Historial_fecha]) VALUES (3, 5, N'mail@noExiste.com', CAST(N'2026-07-09T11:34:34.107' AS DateTime))
INSERT [dbo].[Historial] ([Historial_Id], [Usuario_Id], [Historial_mail], [Historial_fecha]) VALUES (4, 5, N'prueba3@prueba.com', CAST(N'2026-07-09T11:50:30.740' AS DateTime))
INSERT [dbo].[Historial] ([Historial_Id], [Usuario_Id], [Historial_mail], [Historial_fecha]) VALUES (5, 5, N'', CAST(N'2026-07-09T11:55:20.253' AS DateTime))
INSERT [dbo].[Historial] ([Historial_Id], [Usuario_Id], [Historial_mail], [Historial_fecha]) VALUES (6, 1, N'luciana.dev@gmail.com', CAST(N'2026-03-15T10:30:00.000' AS DateTime))
INSERT [dbo].[Historial] ([Historial_Id], [Usuario_Id], [Historial_mail], [Historial_fecha]) VALUES (7, 1, N'luly.impollino@hotmail.com', CAST(N'2026-05-20T14:15:00.000' AS DateTime))
INSERT [dbo].[Historial] ([Historial_Id], [Usuario_Id], [Historial_mail], [Historial_fecha]) VALUES (8, 2, N'carlos.gomez@gmail.com', CAST(N'2026-01-10T09:00:00.000' AS DateTime))
INSERT [dbo].[Historial] ([Historial_Id], [Usuario_Id], [Historial_mail], [Historial_fecha]) VALUES (9, 2, N'carli_gomez99@yahoo.com', CAST(N'2026-04-02T18:22:00.000' AS DateTime))
INSERT [dbo].[Historial] ([Historial_Id], [Usuario_Id], [Historial_mail], [Historial_fecha]) VALUES (10, 3, N'ana.martinez@outlook.com', CAST(N'2025-11-12T11:45:00.000' AS DateTime))
INSERT [dbo].[Historial] ([Historial_Id], [Usuario_Id], [Historial_mail], [Historial_fecha]) VALUES (11, 3, N'anam_tech@gmail.com', CAST(N'2026-02-28T08:30:00.000' AS DateTime))
INSERT [dbo].[Historial] ([Historial_Id], [Usuario_Id], [Historial_mail], [Historial_fecha]) VALUES (12, 4, N'javier.lopez@hotmail.com', CAST(N'2026-02-14T16:40:00.000' AS DateTime))
INSERT [dbo].[Historial] ([Historial_Id], [Usuario_Id], [Historial_mail], [Historial_fecha]) VALUES (13, 4, N'javi.dev.solutions@gmail.com', CAST(N'2026-06-01T10:05:00.000' AS DateTime))
INSERT [dbo].[Historial] ([Historial_Id], [Usuario_Id], [Historial_mail], [Historial_fecha]) VALUES (14, 5, N'sofia.rodriguez@gmail.com', CAST(N'2025-12-25T20:15:00.000' AS DateTime))
INSERT [dbo].[Historial] ([Historial_Id], [Usuario_Id], [Historial_mail], [Historial_fecha]) VALUES (15, 5, N'sofi_rod_gaming@outlook.com', CAST(N'2026-03-18T13:12:00.000' AS DateTime))
INSERT [dbo].[Historial] ([Historial_Id], [Usuario_Id], [Historial_mail], [Historial_fecha]) VALUES (16, 6, N'marcos.paz@yahoo.com.ar', CAST(N'2026-01-05T07:50:00.000' AS DateTime))
INSERT [dbo].[Historial] ([Historial_Id], [Usuario_Id], [Historial_mail], [Historial_fecha]) VALUES (17, 6, N'marcos.paz.info@gmail.com', CAST(N'2026-04-30T19:40:00.000' AS DateTime))
INSERT [dbo].[Historial] ([Historial_Id], [Usuario_Id], [Historial_mail], [Historial_fecha]) VALUES (18, 7, N'valentina.silva@outlook.com', CAST(N'2026-02-10T12:00:00.000' AS DateTime))
INSERT [dbo].[Historial] ([Historial_Id], [Usuario_Id], [Historial_mail], [Historial_fecha]) VALUES (19, 7, N'valen_silva_rec@gmail.com', CAST(N'2026-05-14T15:55:00.000' AS DateTime))
INSERT [dbo].[Historial] ([Historial_Id], [Usuario_Id], [Historial_mail], [Historial_fecha]) VALUES (20, 8, N'esteban.quito@gmail.com', CAST(N'2025-10-30T09:15:00.000' AS DateTime))
INSERT [dbo].[Historial] ([Historial_Id], [Usuario_Id], [Historial_mail], [Historial_fecha]) VALUES (21, 8, N'equito_oficial@hotmail.com', CAST(N'2026-01-22T11:20:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Historial] OFF
GO
SET IDENTITY_INSERT [dbo].[Idioma] ON 

INSERT [dbo].[Idioma] ([Idioma_Id], [Idioma_Nombre]) VALUES (1, N'Español')
INSERT [dbo].[Idioma] ([Idioma_Id], [Idioma_Nombre]) VALUES (2, N'English')
SET IDENTITY_INSERT [dbo].[Idioma] OFF
GO
SET IDENTITY_INSERT [dbo].[Perfil] ON 

INSERT [dbo].[Perfil] ([Perfil_ID], [Perfil_Nombre], [Perfil_Tag], [Perfil_Tipo]) VALUES (1, N'abm_perfiles', N'GESTION_PERFILES', N'Patente')
INSERT [dbo].[Perfil] ([Perfil_ID], [Perfil_Nombre], [Perfil_Tag], [Perfil_Tipo]) VALUES (2, N'desbloquearUsuario', N'DESBLOQUEAR_USUARIO', N'Patente')
INSERT [dbo].[Perfil] ([Perfil_ID], [Perfil_Nombre], [Perfil_Tag], [Perfil_Tipo]) VALUES (3, N'crear_usuarios', N'CREAR_USUARIO', N'Patente')
INSERT [dbo].[Perfil] ([Perfil_ID], [Perfil_Nombre], [Perfil_Tag], [Perfil_Tipo]) VALUES (4, N'asignacion_familia', N'ASIGNAR_FAMILIAS', N'Patente')
INSERT [dbo].[Perfil] ([Perfil_ID], [Perfil_Nombre], [Perfil_Tag], [Perfil_Tipo]) VALUES (5, N'asignacion_usuario_perfil', N'ASIGNAR_USUARIO_PERFIL', N'Patente')
INSERT [dbo].[Perfil] ([Perfil_ID], [Perfil_Nombre], [Perfil_Tag], [Perfil_Tipo]) VALUES (6, N'bitacora', N'BITACORA', N'Patente')
INSERT [dbo].[Perfil] ([Perfil_ID], [Perfil_Nombre], [Perfil_Tag], [Perfil_Tipo]) VALUES (7, N'menu_idioma', N'IDIOMA_MENU', N'Familia')
INSERT [dbo].[Perfil] ([Perfil_ID], [Perfil_Nombre], [Perfil_Tag], [Perfil_Tipo]) VALUES (8, N'seleccion_idioma', N'SELECCION_IDIOMA', N'Patente')
INSERT [dbo].[Perfil] ([Perfil_ID], [Perfil_Nombre], [Perfil_Tag], [Perfil_Tipo]) VALUES (9, N'abm_idioma', N'GESTIONAR_IDIOMA', N'Patente')
INSERT [dbo].[Perfil] ([Perfil_ID], [Perfil_Nombre], [Perfil_Tag], [Perfil_Tipo]) VALUES (10, N'modificar_mail', N'MODIFICAR_MAIL', N'Patente')
INSERT [dbo].[Perfil] ([Perfil_ID], [Perfil_Nombre], [Perfil_Tag], [Perfil_Tipo]) VALUES (11, N'modificar_clave', N'MODIFICAR_CLAVE', N'Patente')
INSERT [dbo].[Perfil] ([Perfil_ID], [Perfil_Nombre], [Perfil_Tag], [Perfil_Tipo]) VALUES (12, N'control_cambios', N'HISTORIAL_CONTROL_CAMBIOS', N'Patente')
INSERT [dbo].[Perfil] ([Perfil_ID], [Perfil_Nombre], [Perfil_Tag], [Perfil_Tipo]) VALUES (13, N'restaurar_integridad', N'RESTAURAR_INTEGRIDAD', N'Patente')
INSERT [dbo].[Perfil] ([Perfil_ID], [Perfil_Nombre], [Perfil_Tag], [Perfil_Tipo]) VALUES (14, N'cerrar_sesion', N'CERRAR_SESION', N'Patente')
INSERT [dbo].[Perfil] ([Perfil_ID], [Perfil_Nombre], [Perfil_Tag], [Perfil_Tipo]) VALUES (15, N'menu_gestion_usuarios', N'GESTION_USUARIOS_MENU', N'Familia')
INSERT [dbo].[Perfil] ([Perfil_ID], [Perfil_Nombre], [Perfil_Tag], [Perfil_Tipo]) VALUES (16, N'menu_gestion_perfiles', N'GESTION_PERFILES_MENU', N'Familia')
INSERT [dbo].[Perfil] ([Perfil_ID], [Perfil_Nombre], [Perfil_Tag], [Perfil_Tipo]) VALUES (17, N'menu_usuario', N'USUARIO_BASICO', N'Familia')
INSERT [dbo].[Perfil] ([Perfil_ID], [Perfil_Nombre], [Perfil_Tag], [Perfil_Tipo]) VALUES (18, N'admin_full', N'ADMIN_FULL', N'Familia')
INSERT [dbo].[Perfil] ([Perfil_ID], [Perfil_Nombre], [Perfil_Tag], [Perfil_Tipo]) VALUES (19, N'admin_basico', N'ADMIN_BASICO', N'Familia')
INSERT [dbo].[Perfil] ([Perfil_ID], [Perfil_Nombre], [Perfil_Tag], [Perfil_Tipo]) VALUES (20, N'gerencial', N'GERENCIAL', N'Familia')
INSERT [dbo].[Perfil] ([Perfil_ID], [Perfil_Nombre], [Perfil_Tag], [Perfil_Tipo]) VALUES (21, N'Prueba', N'ADMIN_BASICO', N'Familia')
INSERT [dbo].[Perfil] ([Perfil_ID], [Perfil_Nombre], [Perfil_Tag], [Perfil_Tipo]) VALUES (22, N'test1', N'USUARIO_BASICO', N'Familia')
INSERT [dbo].[Perfil] ([Perfil_ID], [Perfil_Nombre], [Perfil_Tag], [Perfil_Tipo]) VALUES (23, N'test2', N'ADMIN_BASICO', N'Familia')
INSERT [dbo].[Perfil] ([Perfil_ID], [Perfil_Nombre], [Perfil_Tag], [Perfil_Tipo]) VALUES (24, N'horarioAtencion', N'HORARIO_ATENCION', N'Patente')
SET IDENTITY_INSERT [dbo].[Perfil] OFF
GO
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'AdministrarPerfilesForm', N'Administrar Perfiles')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'AdmPerfEditEditar', N'Editar Perfil')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'AdmPerfEditEliminar', N'Eliminar Perfil')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'AdmPerfEditNombre', N'Nombre')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'AdmPerfNuevoAgregar', N'Agregar')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'AdmPerfNuevoCombo', N'Seleccionar al permiso que corresponda')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'AdmPerfNuevoLimpiar', N'Limpiar')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'AdmPerfNuevoNombre', N'Nombre')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'AdmPerfNuevoPanel', N'Nuevo Perfil')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'AdmPerfNuevoTipo', N'Tipo:')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'AdmPerfNuevoTipoFamilia', N'Perfil Simple')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'AdmPerfNuevoTipoSimple', N'Perfil Simple')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'AdmPerfPanelEdit', N'Perfiles Para Elegir')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'AIAgregarIdioma', N'Agregar Idioma')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'AIEliminar', N'Eliminar')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'AIEliminarIdioma', N'Eliminar Idioma')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'AIEliminarNombre', N'Idioma')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'AIForm', N'Agregar Idioma')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'AINombre', N'Nombre')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'AINuevoIdioma', N'Nuevo Idioma')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'AsigAgregarPerfil', N'Agregar Perfil')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'AsigBuscarPerfiles', N'Buscar perfiles disponibles')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'AsigEliminarPerfil', N'Eliminar Perfil')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'ASIGNAR_FAMILIAS', N'Asignar Familias')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'ASIGNAR_USUARIO_PERFIL', N'Asignar Perfiles a usuario')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'AsignarPerfilesUsuarioForm', N'Asignar perfiles usuario')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'AsigNombreUsuario', N'Nombre de Usuario')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'AsigPerfilesDisp', N'Permisos disponibles')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'BITACORA', N'Bitacora')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'BitacoraForm', N'Bitacora')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'BitacoraTipoSev', N'Tipo Severidad')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'CambiarClaveForm', N'Cambiar Clave')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'CERRAR_SESION', N'Cerrar Sesion')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'ClaveActual', N'Contraseña actual')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'ClaveCancelar', N'Cancelar')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'ClaveNueva', N'Contraseña nueva')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'ClaveText', N'Para cambiar la clave debera completar lo siguiente:')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'ClaveUpdate', N'Actualizar Contraseña')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'CREAR_USUARIO', N'Crear Usuarios')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'DESBLOQUEAR_USUARIO', N'Desbloqueo de Usuarios')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'GESTION_PERFILES', N'Administrar Perfiles')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'GESTION_PERFILES_MENU', N'Gestion Perfiles')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'GESTION_USUARIOS_MENU', N'Gestion usuarios')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'GESTIONAR_IDIOMA', N'Gestionar Idioma')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'HCBuscar', N'Buscar')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'HCCambiarMail', N'Cambiar Mail')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'HCForm', N'Cambiar Mail')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'HCNombreUsr', N'Nombre Usuario')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'HCTextGroup', N'Historial Mails de usuarios')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'HISTORIAL_CONTROL_CAMBIOS', N'Restaurar Mail Anterior')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'IDIOMA_MENU', N'Idioma')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'IdiomaForm', N'Selección de idioma')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'IdiomaTexto', N'¿En qué idioma querés trabajar?')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'Login', N'Sistema de Gestión de Salud - Ingreso')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'loginBtnIniciar', N'Iniciar Sesion')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'loginNombre', N'Nombre usuario')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'loginPass', N'Contraseña')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'loginSubtitulo', N'Introduce tus credenciales para continuar')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'LoginTitulo', N'Sagrado Corazón')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'MenuForm', N'Menu Principal')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'MODIFICAR_CLAVE', N'Cambiar Clave')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'MODIFICAR_MAIL', N'Modificar Mail')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'ModMailCambiar', N'Cambiar')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'ModMailForm', N'Modfificar Mail')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'ModMailMail', N'Mail')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'ModMailNombre', N'Nombre')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'ModMailVolver', N'Volver')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'PerfilesAgregar', N'<< Agregar al Perfil Seleccionado')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'PerfilesFamiliaPanel', N'Seleccione la Familia de perfiles para editar')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'PerfilesForm', N'Gestionar Familias')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'PerfilesPosibles', N'Perfiles posibles de elegir')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'PerfilesQuitar', N'>> Quitar del Perfil Seleccionado')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'RegistrarUsuarioForm', N'Registrar Usuario')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'RegUsuarioPanel', N'Ingresar Nuevo Usuario')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'RegUsuBoton', N'Registrar usuario')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'RegUsuFamilia', N'Elegir una familia de permisos para asignar')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'RegUsuMail', N'Mail')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'RegUsuNombre', N'Nombre usuario')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'RegUsuPass', N'Contraseña')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'RESTAURAR_INTEGRIDAD', N'Restaurar Integridad')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'SELECCION_IDIOMA', N'Seleccionar Idioma')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (1, N'USUARIO_BASICO', N'Usuario')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'AdministrarPerfilesForm', N'Manage Profiles')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'AdmPerfEditEditar', N'Edit Profile')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'AdmPerfEditEliminar', N'Delete Profile')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'AdmPerfEditNombre', N'Name')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'AdmPerfNuevoAgregar', N'Add')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'AdmPerfNuevoCombo', N'Select corresponding permission')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'AdmPerfNuevoLimpiar', N'Clear')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'AdmPerfNuevoNombre', N'Name')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'AdmPerfNuevoPanel', N'New Profile')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'AdmPerfNuevoTipo', N'Type:')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'AdmPerfNuevoTipoFamilia', N'Family Profile')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'AdmPerfNuevoTipoSimple', N'Simple Profile')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'AdmPerfPanelEdit', N'Profiles to Choose From')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'AIAgregarIdioma', N'Add Language')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'AIEliminar', N'Delete')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'AIEliminarIdioma', N'Delete Language')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'AIEliminarNombre', N'Language')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'AIForm', N'Add Language')
GO
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'AINombre', N'Name')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'AINuevoIdioma', N'New Language')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'AsigAgregarPerfil', N'Add Profile')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'AsigBuscarPerfiles', N'Search Available Profiles')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'AsigEliminarPerfil', N'Remove Profile')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'ASIGNAR_FAMILIAS', N'Assign Families')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'ASIGNAR_USUARIO_PERFIL', N'Assign Profiles to User')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'AsignarPerfilesUsuarioForm', N'Assign User Profiles')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'AsigNombreUsuario', N'Username')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'AsigPerfilesDisp', N'Available Permissions')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'BITACORA', N'Logs')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'BitacoraForm', N'Logs')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'BitacoraTipoSev', N'Severity Type')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'CambiarClaveForm', N'Change Password')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'CERRAR_SESION', N'Log Out')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'ClaveActual', N'Current password')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'ClaveCancelar', N'Cancel')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'ClaveNueva', N'New password')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'ClaveText', N'To change your password you must complete the following:')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'ClaveUpdate', N'Update Password')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'CREAR_USUARIO', N'Create Users')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'DESBLOQUEAR_USUARIO', N'Unlock Users')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'GESTION_PERFILES', N'Manage Profiles')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'GESTION_PERFILES_MENU', N'Profile Management')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'GESTION_USUARIOS_MENU', N'User Management')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'GESTIONAR_IDIOMA', N'Manage Language')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'HCBuscar', N'Search')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'HCCambiarMail', N'Change Email')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'HCForm', N'Change Email')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'HCNombreUsr', N'Username')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'HCTextGroup', N'User Email History')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'HISTORIAL_CONTROL_CAMBIOS', N'Restore Previous Email')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'IDIOMA_MENU', N'Language')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'IdiomaForm', N'Language Selection')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'IdiomaTexto', N'Which language do you want to work in?')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'Login', N'Health Management System - Login')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'loginBtnIniciar', N'Log In')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'loginNombre', N'Username')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'loginPass', N'Password')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'loginSubtitulo', N'Enter your credentials to continue')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'LoginTitulo', N'Sacred Heart')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'MenuForm', N'Main Menu')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'MODIFICAR_CLAVE', N'Change Password')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'MODIFICAR_MAIL', N'Modify Email')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'ModMailCambiar', N'Change')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'ModMailForm', N'Modify Email')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'ModMailMail', N'Email')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'ModMailNombre', N'Name')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'ModMailVolver', N'Back')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'PerfilesAgregar', N'<< Add to Selected Profile')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'PerfilesFamiliaPanel', N'Select the Profile Family to edit')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'PerfilesForm', N'Manage Families')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'PerfilesPosibles', N'Available Profiles to Choose')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'PerfilesQuitar', N'>> Remove from Selected Profile')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'RegistrarUsuarioForm', N'Register User')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'RegUsuarioPanel', N'Enter New User')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'RegUsuBoton', N'Register user')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'RegUsuFamilia', N'Choose a permission family to assign')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'RegUsuMail', N'Email')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'RegUsuNombre', N'Username')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'RegUsuPass', N'Password')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'RESTAURAR_INTEGRIDAD', N'Restore Integrity')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'SELECCION_IDIOMA', N'Select Language')
INSERT [dbo].[Traduccion] ([Traduccion_IdiomaId], [Traduccion_EtiquetaClave], [Traduccion_Texto]) VALUES (2, N'USUARIO_BASICO', N'User')
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([Usuario_ID], [Usuario_Username], [Usuario_Password], [Usuario_Mail], [Usuario_IntentosFallidos], [Usuario_Bloqueado], [DVH], [Usuario_IdiomaDefault]) VALUES (1, N'test', N'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', N'', CAST(0 AS Numeric(18, 0)), 0, 215081, 0)
INSERT [dbo].[Usuario] ([Usuario_ID], [Usuario_Username], [Usuario_Password], [Usuario_Mail], [Usuario_IntentosFallidos], [Usuario_Bloqueado], [DVH], [Usuario_IdiomaDefault]) VALUES (2, N'prueba', N'b89eaac7e61417341b710b727768294d0e6a277b4c9730e3fec2584ec6754c0d', N'', CAST(1 AS Numeric(18, 0)), 0, 219382, 0)
INSERT [dbo].[Usuario] ([Usuario_ID], [Usuario_Username], [Usuario_Password], [Usuario_Mail], [Usuario_IntentosFallidos], [Usuario_Bloqueado], [DVH], [Usuario_IdiomaDefault]) VALUES (3, N'rr', N'b696a583e7cf17b3ebecda1076f62bdfa67710bc8d74ca75a89e81b67f137e5c', N'ana.martinez@outlook.com', CAST(1 AS Numeric(18, 0)), 0, 415316, 0)
INSERT [dbo].[Usuario] ([Usuario_ID], [Usuario_Username], [Usuario_Password], [Usuario_Mail], [Usuario_IntentosFallidos], [Usuario_Bloqueado], [DVH], [Usuario_IdiomaDefault]) VALUES (4, N'nuevo', N'7b52009b64fd0a2a49e6d8a939753077792b0554abc338dbd2e1c3a6473070d6', N'', CAST(1 AS Numeric(18, 0)), 0, 210897, 0)
INSERT [dbo].[Usuario] ([Usuario_ID], [Usuario_Username], [Usuario_Password], [Usuario_Mail], [Usuario_IntentosFallidos], [Usuario_Bloqueado], [DVH], [Usuario_IdiomaDefault]) VALUES (5, N'admin', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', N'', CAST(0 AS Numeric(18, 0)), 0, 224454, 1)
INSERT [dbo].[Usuario] ([Usuario_ID], [Usuario_Username], [Usuario_Password], [Usuario_Mail], [Usuario_IntentosFallidos], [Usuario_Bloqueado], [DVH], [Usuario_IdiomaDefault]) VALUES (7, N'gerente', N'ec2e7686ca5c160b777a837e2cf17c06283b544e66c7ca3a62d029528f80424a', N'gerente@gerente.com', CAST(1 AS Numeric(18, 0)), 0, 389217, 0)
INSERT [dbo].[Usuario] ([Usuario_ID], [Usuario_Username], [Usuario_Password], [Usuario_Mail], [Usuario_IntentosFallidos], [Usuario_Bloqueado], [DVH], [Usuario_IdiomaDefault]) VALUES (8, N'user', N'b30d271de260127e274bc936521a0dae45398534f37bc4c69d7482b6840715ac', N'user@user.com', CAST(1 AS Numeric(18, 0)), 0, 311544, 0)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
INSERT [dbo].[Usuario_Perfil] ([Usuario_ID], [Perfil_ID]) VALUES (1, 24)
INSERT [dbo].[Usuario_Perfil] ([Usuario_ID], [Perfil_ID]) VALUES (5, 18)
INSERT [dbo].[Usuario_Perfil] ([Usuario_ID], [Perfil_ID]) VALUES (7, 20)
INSERT [dbo].[Usuario_Perfil] ([Usuario_ID], [Perfil_ID]) VALUES (8, 17)
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
