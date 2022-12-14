USE [master]
GO
/****** Object:  Database [Contests]    Script Date: 11/6/2022 5:29:55 PM ******/
CREATE DATABASE [Contests]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Contests', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Contests.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Contests_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Contests_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Contests] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Contests].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Contests] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Contests] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Contests] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Contests] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Contests] SET ARITHABORT OFF 
GO
ALTER DATABASE [Contests] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Contests] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Contests] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Contests] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Contests] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Contests] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Contests] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Contests] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Contests] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Contests] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Contests] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Contests] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Contests] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Contests] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Contests] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Contests] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Contests] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Contests] SET RECOVERY FULL 
GO
ALTER DATABASE [Contests] SET  MULTI_USER 
GO
ALTER DATABASE [Contests] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Contests] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Contests] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Contests] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Contests] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Contests', N'ON'
GO
ALTER DATABASE [Contests] SET QUERY_STORE = OFF
GO
USE [Contests]
GO
/****** Object:  UserDefinedFunction [dbo].[fnValidateUser]    Script Date: 11/6/2022 5:29:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[fnValidateUser]
(@IdUsuario INT)
RETURNS INT
 
AS
BEGIN
	RETURN (
				SELECT IdRol FROM [dbo].[tbUsuarios] WITH (NOLOCK) WHERE IdUsuario = @IdUsuario
			)
END
GO
/****** Object:  Table [dbo].[tbActividades]    Script Date: 11/6/2022 5:29:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbActividades](
	[IdActividad] [int] IDENTITY(1,1) NOT NULL,
	[NombreActividad] [varchar](100) NOT NULL,
	[IdConcurso] [int] NOT NULL,
 CONSTRAINT [PK_tbActividades] PRIMARY KEY CLUSTERED 
(
	[IdActividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbCiudades]    Script Date: 11/6/2022 5:29:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbCiudades](
	[IdCiudad] [int] IDENTITY(1,1) NOT NULL,
	[CodigoCiudad] [varchar](50) NULL,
	[NombreCiudad] [varchar](100) NOT NULL,
 CONSTRAINT [PK_tbCiudades] PRIMARY KEY CLUSTERED 
(
	[IdCiudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbConcursoCiudad]    Script Date: 11/6/2022 5:29:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbConcursoCiudad](
	[IdConcursoCiudad] [int] IDENTITY(1,1) NOT NULL,
	[IdConcurso] [int] NOT NULL,
	[IdCiudad] [int] NOT NULL,
 CONSTRAINT [PK_tbConcursoCiudad] PRIMARY KEY CLUSTERED 
(
	[IdConcursoCiudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbConcursos]    Script Date: 11/6/2022 5:29:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbConcursos](
	[IdConcurso] [int] IDENTITY(1,1) NOT NULL,
	[NombreConcurso] [varchar](200) NOT NULL,
	[LimiteParticipantes] [int] NULL,
	[FechaConcurso] [date] NULL,
	[Estado] [varchar](10) NULL,
 CONSTRAINT [PK_tbConcursos] PRIMARY KEY CLUSTERED 
(
	[IdConcurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbLogs]    Script Date: 11/6/2022 5:29:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbLogs](
	[IdLog] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdConcurso] [int] NOT NULL,
	[FechaRegistro] [date] NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
 CONSTRAINT [PK_tbLogs] PRIMARY KEY CLUSTERED 
(
	[IdLog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbRoles]    Script Date: 11/6/2022 5:29:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbRoles](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[RolName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_tbRoles] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbSedes]    Script Date: 11/6/2022 5:29:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbSedes](
	[IdSede] [int] IDENTITY(1,1) NOT NULL,
	[NombreSede] [varchar](200) NOT NULL,
	[IdCiudad] [int] NOT NULL,
 CONSTRAINT [PK_tbSedes] PRIMARY KEY CLUSTERED 
(
	[IdSede] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbSexos]    Script Date: 11/6/2022 5:29:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbSexos](
	[IdSexo] [int] IDENTITY(1,1) NOT NULL,
	[NombreSexo] [varchar](100) NOT NULL,
 CONSTRAINT [PK_tbSexos] PRIMARY KEY CLUSTERED 
(
	[IdSexo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbUsuarioConcurso]    Script Date: 11/6/2022 5:29:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbUsuarioConcurso](
	[IdUsuarioConcurso] [int] IDENTITY(1,1) NOT NULL,
	[IdConcurso] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Puntuacion] [int] NULL,
 CONSTRAINT [PK_tbUsuarioConcurso] PRIMARY KEY CLUSTERED 
(
	[IdUsuarioConcurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbUsuarios]    Script Date: 11/6/2022 5:29:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbUsuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[IdCcms] [int] NOT NULL,
	[IdRol] [int] NOT NULL,
	[Nombre] [varchar](300) NOT NULL,
	[Cedula] [bigint] NOT NULL,
	[IdCiudad] [int] NOT NULL,
	[IdSexo] [int] NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Contrasena] [varchar](100) NOT NULL,
 CONSTRAINT [PK_tbUsers] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbActividades] ON 

INSERT [dbo].[tbActividades] ([IdActividad], [NombreActividad], [IdConcurso]) VALUES (1, N'Canto', 3)
INSERT [dbo].[tbActividades] ([IdActividad], [NombreActividad], [IdConcurso]) VALUES (2, N'Baile', 3)
INSERT [dbo].[tbActividades] ([IdActividad], [NombreActividad], [IdConcurso]) VALUES (3, N'Ilustración', 3)
SET IDENTITY_INSERT [dbo].[tbActividades] OFF
GO
SET IDENTITY_INSERT [dbo].[tbCiudades] ON 

INSERT [dbo].[tbCiudades] ([IdCiudad], [CodigoCiudad], [NombreCiudad]) VALUES (1, N'11001', N'BOGOTÁ, D.C.')
INSERT [dbo].[tbCiudades] ([IdCiudad], [CodigoCiudad], [NombreCiudad]) VALUES (2, N'05001', N'MEDELLÍN')
SET IDENTITY_INSERT [dbo].[tbCiudades] OFF
GO
SET IDENTITY_INSERT [dbo].[tbConcursos] ON 

INSERT [dbo].[tbConcursos] ([IdConcurso], [NombreConcurso], [LimiteParticipantes], [FechaConcurso], [Estado]) VALUES (1, N'Concurso I', 15, CAST(N'2022-11-30' AS Date), N'A')
INSERT [dbo].[tbConcursos] ([IdConcurso], [NombreConcurso], [LimiteParticipantes], [FechaConcurso], [Estado]) VALUES (2, N'Concurso II', 30, CAST(N'2022-11-14' AS Date), N'A')
INSERT [dbo].[tbConcursos] ([IdConcurso], [NombreConcurso], [LimiteParticipantes], [FechaConcurso], [Estado]) VALUES (3, N'Concurso III', 15, CAST(N'2022-11-01' AS Date), N'C')
SET IDENTITY_INSERT [dbo].[tbConcursos] OFF
GO
SET IDENTITY_INSERT [dbo].[tbLogs] ON 

INSERT [dbo].[tbLogs] ([IdLog], [IdUsuario], [IdConcurso], [FechaRegistro], [Descripcion]) VALUES (1, 30, 1, CAST(N'2022-11-06' AS Date), N'Intento de doble suscripción')
INSERT [dbo].[tbLogs] ([IdLog], [IdUsuario], [IdConcurso], [FechaRegistro], [Descripcion]) VALUES (2, 32, 1, CAST(N'2022-11-06' AS Date), N'Intento de doble suscripción')
INSERT [dbo].[tbLogs] ([IdLog], [IdUsuario], [IdConcurso], [FechaRegistro], [Descripcion]) VALUES (3, 32, 1, CAST(N'2022-11-06' AS Date), N'Intento de doble suscripción')
INSERT [dbo].[tbLogs] ([IdLog], [IdUsuario], [IdConcurso], [FechaRegistro], [Descripcion]) VALUES (4, 33, 2, CAST(N'2022-11-06' AS Date), N'Intento de doble suscripción')
SET IDENTITY_INSERT [dbo].[tbLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[tbRoles] ON 

INSERT [dbo].[tbRoles] ([IdRol], [RolName]) VALUES (1, N'Director')
INSERT [dbo].[tbRoles] ([IdRol], [RolName]) VALUES (2, N'Asesor')
SET IDENTITY_INSERT [dbo].[tbRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[tbSexos] ON 

INSERT [dbo].[tbSexos] ([IdSexo], [NombreSexo]) VALUES (1, N'Masculino')
INSERT [dbo].[tbSexos] ([IdSexo], [NombreSexo]) VALUES (2, N'Femenino')
INSERT [dbo].[tbSexos] ([IdSexo], [NombreSexo]) VALUES (3, N'Otro')
SET IDENTITY_INSERT [dbo].[tbSexos] OFF
GO
SET IDENTITY_INSERT [dbo].[tbUsuarioConcurso] ON 

INSERT [dbo].[tbUsuarioConcurso] ([IdUsuarioConcurso], [IdConcurso], [IdUsuario], [Puntuacion]) VALUES (1, 1, 30, NULL)
INSERT [dbo].[tbUsuarioConcurso] ([IdUsuarioConcurso], [IdConcurso], [IdUsuario], [Puntuacion]) VALUES (2, 3, 30, 50)
INSERT [dbo].[tbUsuarioConcurso] ([IdUsuarioConcurso], [IdConcurso], [IdUsuario], [Puntuacion]) VALUES (4, 3, 32, 35)
INSERT [dbo].[tbUsuarioConcurso] ([IdUsuarioConcurso], [IdConcurso], [IdUsuario], [Puntuacion]) VALUES (5, 3, 33, 20)
INSERT [dbo].[tbUsuarioConcurso] ([IdUsuarioConcurso], [IdConcurso], [IdUsuario], [Puntuacion]) VALUES (6, 2, 29, NULL)
INSERT [dbo].[tbUsuarioConcurso] ([IdUsuarioConcurso], [IdConcurso], [IdUsuario], [Puntuacion]) VALUES (7, 1, 32, NULL)
INSERT [dbo].[tbUsuarioConcurso] ([IdUsuarioConcurso], [IdConcurso], [IdUsuario], [Puntuacion]) VALUES (8, 2, 33, NULL)
SET IDENTITY_INSERT [dbo].[tbUsuarioConcurso] OFF
GO
SET IDENTITY_INSERT [dbo].[tbUsuarios] ON 

INSERT [dbo].[tbUsuarios] ([IdUsuario], [IdCcms], [IdRol], [Nombre], [Cedula], [IdCiudad], [IdSexo], [FechaNacimiento], [Contrasena]) VALUES (29, 6322510, 2, N'Maria Alonso', 1544778542, 1, 2, CAST(N'1999-07-09' AS Date), N'$2b$10$S632qqM0vei9MHyAlW7qoOQEsSTC.aCPEasTens/SFI/8t7maPHuq')
INSERT [dbo].[tbUsuarios] ([IdUsuario], [IdCcms], [IdRol], [Nombre], [Cedula], [IdCiudad], [IdSexo], [FechaNacimiento], [Contrasena]) VALUES (30, 4584652, 2, N'Pablo Perez', 1544698525, 1, 1, CAST(N'1993-03-24' AS Date), N'$2b$10$7J.gpOZD6XpjM3/w6jvz6ukCr5NdcoxU6Lt3JcB/INNq512s2Egaa')
INSERT [dbo].[tbUsuarios] ([IdUsuario], [IdCcms], [IdRol], [Nombre], [Cedula], [IdCiudad], [IdSexo], [FechaNacimiento], [Contrasena]) VALUES (31, 4525632, 1, N'Alberto Perez', 1255636985, 2, 1, CAST(N'1992-02-18' AS Date), N'$2b$10$HBlwzGI5QcMGdxxHejBYbuTRSxAzxCG0QKfMgPmWQ4MEVXCD2nlQu')
INSERT [dbo].[tbUsuarios] ([IdUsuario], [IdCcms], [IdRol], [Nombre], [Cedula], [IdCiudad], [IdSexo], [FechaNacimiento], [Contrasena]) VALUES (32, 7845741, 2, N'Ana Barrera', 1054744541, 1, 2, CAST(N'1996-03-14' AS Date), N'$2b$10$BOu8kBQo86JsmhEwNRVIHuBYSnf6FtTlSitNnWlr5MM/ESKkWIRK6')
INSERT [dbo].[tbUsuarios] ([IdUsuario], [IdCcms], [IdRol], [Nombre], [Cedula], [IdCiudad], [IdSexo], [FechaNacimiento], [Contrasena]) VALUES (33, 6585985, 2, N'Jorge Sarmiento', 32566858, 2, 1, CAST(N'1984-06-12' AS Date), N'$2b$10$kmXQWaQT4hpfgN/eb4FATeOkaykwjvk.XyhsljHZCHlEucYAmX6Ma')
SET IDENTITY_INSERT [dbo].[tbUsuarios] OFF
GO
ALTER TABLE [dbo].[tbLogs] ADD  CONSTRAINT [DF_tbLogs_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[tbActividades]  WITH CHECK ADD  CONSTRAINT [FK_tbActividades_tbConcursos] FOREIGN KEY([IdConcurso])
REFERENCES [dbo].[tbConcursos] ([IdConcurso])
GO
ALTER TABLE [dbo].[tbActividades] CHECK CONSTRAINT [FK_tbActividades_tbConcursos]
GO
ALTER TABLE [dbo].[tbConcursoCiudad]  WITH CHECK ADD  CONSTRAINT [FK_tbConcursoCiudad_tbCiudades] FOREIGN KEY([IdCiudad])
REFERENCES [dbo].[tbCiudades] ([IdCiudad])
GO
ALTER TABLE [dbo].[tbConcursoCiudad] CHECK CONSTRAINT [FK_tbConcursoCiudad_tbCiudades]
GO
ALTER TABLE [dbo].[tbConcursoCiudad]  WITH CHECK ADD  CONSTRAINT [FK_tbConcursoCiudad_tbConcursos] FOREIGN KEY([IdConcurso])
REFERENCES [dbo].[tbConcursos] ([IdConcurso])
GO
ALTER TABLE [dbo].[tbConcursoCiudad] CHECK CONSTRAINT [FK_tbConcursoCiudad_tbConcursos]
GO
ALTER TABLE [dbo].[tbLogs]  WITH CHECK ADD  CONSTRAINT [FK_tbLogs_tbConcursos] FOREIGN KEY([IdConcurso])
REFERENCES [dbo].[tbConcursos] ([IdConcurso])
GO
ALTER TABLE [dbo].[tbLogs] CHECK CONSTRAINT [FK_tbLogs_tbConcursos]
GO
ALTER TABLE [dbo].[tbLogs]  WITH CHECK ADD  CONSTRAINT [FK_tbLogs_tbUsuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[tbUsuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[tbLogs] CHECK CONSTRAINT [FK_tbLogs_tbUsuarios]
GO
ALTER TABLE [dbo].[tbSedes]  WITH CHECK ADD  CONSTRAINT [FK_tbSedes_tbCiudades] FOREIGN KEY([IdCiudad])
REFERENCES [dbo].[tbCiudades] ([IdCiudad])
GO
ALTER TABLE [dbo].[tbSedes] CHECK CONSTRAINT [FK_tbSedes_tbCiudades]
GO
ALTER TABLE [dbo].[tbUsuarioConcurso]  WITH CHECK ADD  CONSTRAINT [FK_tbUsuarioConcurso_tbConcursos] FOREIGN KEY([IdConcurso])
REFERENCES [dbo].[tbConcursos] ([IdConcurso])
GO
ALTER TABLE [dbo].[tbUsuarioConcurso] CHECK CONSTRAINT [FK_tbUsuarioConcurso_tbConcursos]
GO
ALTER TABLE [dbo].[tbUsuarioConcurso]  WITH CHECK ADD  CONSTRAINT [FK_tbUsuarioConcurso_tbUsuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[tbUsuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[tbUsuarioConcurso] CHECK CONSTRAINT [FK_tbUsuarioConcurso_tbUsuarios]
GO
ALTER TABLE [dbo].[tbUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_tbUsuarios_tbCiudades] FOREIGN KEY([IdCiudad])
REFERENCES [dbo].[tbCiudades] ([IdCiudad])
GO
ALTER TABLE [dbo].[tbUsuarios] CHECK CONSTRAINT [FK_tbUsuarios_tbCiudades]
GO
ALTER TABLE [dbo].[tbUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_tbUsuarios_tbRoles] FOREIGN KEY([IdRol])
REFERENCES [dbo].[tbRoles] ([IdRol])
GO
ALTER TABLE [dbo].[tbUsuarios] CHECK CONSTRAINT [FK_tbUsuarios_tbRoles]
GO
ALTER TABLE [dbo].[tbUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_tbUsuarios_tbSexos] FOREIGN KEY([IdSexo])
REFERENCES [dbo].[tbSexos] ([IdSexo])
GO
ALTER TABLE [dbo].[tbUsuarios] CHECK CONSTRAINT [FK_tbUsuarios_tbSexos]
GO
/****** Object:  StoredProcedure [dbo].[spContests]    Script Date: 11/6/2022 5:29:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spContests]
	@Case INT,
	@IdUsuario INT = NULL,
	@IdCcms INT = NULL,
	---Create Contest----
	@NombreConcurso VARCHAR(300) = NULL,
	@LimiteParticipantes INT = NULL,
	---Create Contest for Users----
	@IdConcurso INT = NULL,
	---Create Contest for Users by City----
	@IdCiudad INT = NULL,
	@FechaConcurso DATE = NULL
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Result VARCHAR(MAX)
	DECLARE @IdUsuarioInsert INT
	SET @IdUsuarioInsert = (SELECT IdUsuario FROM tbUsuarios WHERE IdCcms = @IdCcms)
	BEGIN TRY
	DECLARE @Rol INT
	SET @Rol = (SELECT dbo.fnValidateUser(@IdUsuario))

	
	BEGIN
		IF @Case = 1 -- List Contest Only
		BEGIN

			SET @Result = (SELECT IdConcurso, NombreConcurso, LimiteParticipantes, FechaConcurso, Estado, DATEDIFF(DAY, GETDATE(), FechaConcurso) Dias FROM tbConcursos WITH (NOLOCK) 
				FOR JSON PATH, INCLUDE_NULL_VALUES, ROOT ('ContestList'))

			SELECT @Result Result
		END
	ELSE IF @Case = 2 -- List Contest Incription
		BEGIN
			SET @Result = (SELECT cn.NombreConcurso, cn.FechaConcurso,
							us.Nombre, us.Cedula, us.IdCcms
							FROM tbUsuarioConcurso uc 
							LEFT OUTER JOIN tbConcursos cn ON uc.IdConcurso = cn.IdConcurso
							LEFT OUTER JOIN tbUsuarios us ON uc.IdUsuario = us.IdUsuario
							WHERE us.IdCcms = @IdCcms
				FOR JSON PATH, INCLUDE_NULL_VALUES, ROOT ('ContestList'))
			SELECT @Result AS Result
		END
	ELSE IF @Case = 3 -- List Contest Incription
		BEGIN
			SET @Result = (SELECT cs.NombreConcurso, cs.FechaConcurso, us.Nombre, us.Cedula, us.IdCcms 
							FROM tbConcursos cs 
							LEFT OUTER JOIN tbUsuarioConcurso uc ON uc.IdConcurso = cs.IdConcurso
							LEFT OUTER JOIN tbUsuarios us ON us.IdUsuario = uc.IdUsuario
				FOR JSON PATH, INCLUDE_NULL_VALUES, ROOT ('ContestList'))

			SELECT @Result Result
		END	
	ELSE IF @Case = 4 -- Insert Contest Incription
		BEGIN
		IF (SELECT COUNT(IdUsuario) FROM tbUsuarioConcurso WHERE IdUsuario = @IdUsuarioInsert and IdConcurso = @IdConcurso ) = 0
		BEGIN
			INSERT INTO tbUsuarioConcurso
					   (IdConcurso
					   ,IdUsuario)
				 VALUES
					   (@IdConcurso,
						@IdUsuarioInsert)

			SET @Result = '{"Result": "Contest Inscription Inserted"}'	
			SELECT @Result AS Result
		END
			ELSE
			BEGIN
				INSERT INTO tbLogs
					   (IdConcurso
					   ,IdUsuario
					   ,Descripcion)
				 VALUES
					   (@IdConcurso,
						@IdUsuarioInsert,
						'Intento de doble suscripción')

				SET @Result = '{"Result": "User already registered"}'	
				SELECT @Result AS Result
			END
		END
	ELSE IF @Case = 5 -- List Contest Ranking
		BEGIN
			SET @Result = (SELECT TOP 10 us.IdUsuario, us.Nombre, us.IdCcms, us.Cedula, usc.Puntuacion, cn.NombreConcurso  
							FROM tbUsuarioConcurso usc 
							LEFT OUTER JOIN tbConcursos cn ON usc.IdConcurso = cn.IdConcurso
							LEFT OUTER JOIN tbUsuarios us ON usc.IdUsuario = us.IdUsuario
							WHERE cn.Estado = 'C' ORDER BY Puntuacion DESC
				FOR JSON PATH, INCLUDE_NULL_VALUES, ROOT ('ContestListRanking'))

			SELECT @Result Result
		END	
	ELSE IF @Case = 6 -- List Contest Ranking
		BEGIN
			UPDATE tbConcursos SET FechaConcurso = @FechaConcurso WHERE IdConcurso = @IdConcurso

			SET @Result = '{"Result": "Date Contest Updated"}'	
			SELECT @Result AS Result
		END
	ELSE IF @Case = 7 -- List Contest Ranking
		BEGIN
			SET @Result = (SELECT lg.FechaRegistro, lg.Descripcion, us.Nombre, us.IdCcms, cn.NombreConcurso 
							FROM tbLogs lg 
							LEFT OUTER JOIN tbConcursos cn ON lg.IdConcurso = cn.IdConcurso
							LEFT OUTER JOIN tbUsuarios us ON lg.IdUsuario = us.IdUsuario
				FOR JSON PATH, INCLUDE_NULL_VALUES, ROOT ('LogList'))

			SELECT @Result Result
		END
	END
	
	END TRY
	BEGIN CATCH
		     DECLARE 
             @ERROR_NUMBER       INT                = ERROR_NUMBER()
            ,@ERROR_SEVERITY     INT                = ERROR_SEVERITY()
            ,@ERROR_STATE        INT                = ERROR_STATE() 
            ,@ERROR_PROCEDURE    NVARCHAR(128)      = ERROR_PROCEDURE()
            ,@ERROR_LINE         INT                = ERROR_LINE()
            ,@ERROR_MESSAGE      NVARCHAR(4000)     = ERROR_MESSAGE() 
        SELECT 
             @ERROR_NUMBER      [ERROR_NUMBER]    
            ,@ERROR_SEVERITY    [ERROR_SEVERITY]
            ,@ERROR_STATE       [ERROR_STATE]
            ,@ERROR_PROCEDURE   [ERROR_PROCEDURE]
            ,@ERROR_LINE        [ERROR_LINE]
            ,@ERROR_MESSAGE     [ERROR_MESSAGE]
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spUsers]    Script Date: 11/6/2022 5:29:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUsers]
	@Case INT,
	@IdUsuario INT = NULL,
	@IdCcms INT = NULL,
	@IdRol INT = NULL,
	@Nombre VARCHAR(200) = NULL,
	@Cedula BIGINT = NULL,
	@IdCiudad INT = NULL,
	@IdSexo INT = NULL,
	@FechaNacimiento DATE =  NULL,
	@Contrasena VARCHAR(100) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Result VARCHAR(MAX)
	BEGIN TRY
	DECLARE @Rol INT
	SET @Rol = (SELECT dbo.fnValidateUser(@IdUsuario))
	
	BEGIN
		IF @Case = 1 -- List Users
		BEGIN

			SET @Result = (SELECT IdUsuario, IdCcms, IdRol, IdCiudad, Nombre, FechaNacimiento, Contrasena FROM tbUsuarios WHERE IdCcms = @IdCcms 
				FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)

			SELECT @Result Result
		END
	ELSE IF @Case = 2 -- Insert User
		BEGIN
		IF (SELECT COUNT(IdUsuario) FROM tbUsuarios WHERE IdCcms = @IdCcms) = 0
		BEGIN
			INSERT INTO tbUsuarios
					   (IdCcms
					   ,IdRol
					   ,Nombre
					   ,Cedula
					   ,IdCiudad
					   ,IdSexo
					   ,FechaNacimiento
					   ,Contrasena)
				 VALUES
					   (@IdCcms,
						@IdRol,
						@Nombre,
						@Cedula,
						@IdCiudad,
						@IdSexo,
						@FechaNacimiento,
						@Contrasena)

			SET @Result = '{"Result": "User Inserted"}'	
			SELECT @Result AS Result
			END
			ELSE
			BEGIN
				SET @Result = '{"Result": "User already registered"}'	
				SELECT @Result AS Result
			END
		END
	ELSE IF @Case = 3 -- Lista de Ciudades
		BEGIN
			SET @Result = (SELECT IdCiudad, NombreCiudad FROM tbCiudades WITH (NOLOCK) 
				FOR JSON PATH, INCLUDE_NULL_VALUES, ROOT ('CitysList'))

			SELECT @Result Result
		END
	ELSE IF @Case = 4 -- Lista de Roles
		BEGIN
			SET @Result = (SELECT IdRol, RolName FROM tbRoles WITH (NOLOCK) 
				FOR JSON PATH, INCLUDE_NULL_VALUES, ROOT ('RolesList'))

			SELECT @Result Result
		END
	ELSE IF @Case = 5 -- Lista de Sexos
		BEGIN
			SET @Result = (SELECT IdSexo, NombreSexo FROM tbSexos WITH (NOLOCK) 
				FOR JSON PATH, INCLUDE_NULL_VALUES, ROOT ('GenderList'))

			SELECT @Result Result
		END
	END
	
	END TRY
	BEGIN CATCH
		     DECLARE 
             @ERROR_NUMBER       INT                = ERROR_NUMBER()
            ,@ERROR_SEVERITY     INT                = ERROR_SEVERITY()
            ,@ERROR_STATE        INT                = ERROR_STATE() 
            ,@ERROR_PROCEDURE    NVARCHAR(128)      = ERROR_PROCEDURE()
            ,@ERROR_LINE         INT                = ERROR_LINE()
            ,@ERROR_MESSAGE      NVARCHAR(4000)     = ERROR_MESSAGE() 
        SELECT 
             @ERROR_NUMBER      [ERROR_NUMBER]    
            ,@ERROR_SEVERITY    [ERROR_SEVERITY]
            ,@ERROR_STATE       [ERROR_STATE]
            ,@ERROR_PROCEDURE   [ERROR_PROCEDURE]
            ,@ERROR_LINE        [ERROR_LINE]
            ,@ERROR_MESSAGE     [ERROR_MESSAGE]
	END CATCH
END
GO
USE [master]
GO
ALTER DATABASE [Contests] SET  READ_WRITE 
GO
