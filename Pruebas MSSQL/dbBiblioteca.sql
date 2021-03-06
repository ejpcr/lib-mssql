USE [master]
GO
/****** Object:  Database [biblioteca]    Script Date: 24/02/2016 04:29:57 p.m. ******/
CREATE DATABASE [biblioteca]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'biblioteca', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\biblioteca.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'biblioteca_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\biblioteca_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [biblioteca] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [biblioteca].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [biblioteca] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [biblioteca] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [biblioteca] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [biblioteca] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [biblioteca] SET ARITHABORT OFF 
GO
ALTER DATABASE [biblioteca] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [biblioteca] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [biblioteca] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [biblioteca] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [biblioteca] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [biblioteca] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [biblioteca] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [biblioteca] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [biblioteca] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [biblioteca] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [biblioteca] SET  ENABLE_BROKER 
GO
ALTER DATABASE [biblioteca] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [biblioteca] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [biblioteca] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [biblioteca] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [biblioteca] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [biblioteca] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [biblioteca] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [biblioteca] SET RECOVERY FULL 
GO
ALTER DATABASE [biblioteca] SET  MULTI_USER 
GO
ALTER DATABASE [biblioteca] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [biblioteca] SET DB_CHAINING OFF 
GO
ALTER DATABASE [biblioteca] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [biblioteca] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'biblioteca', N'ON'
GO
USE [biblioteca]
GO
/****** Object:  Table [dbo].[Autores]    Script Date: 24/02/2016 04:29:57 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Autores](
	[id_autor] [int] NOT NULL,
	[nombre] [char](10) NULL,
 CONSTRAINT [PK_Autores] PRIMARY KEY CLUSTERED 
(
	[id_autor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Direcciones]    Script Date: 24/02/2016 04:29:57 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Direcciones](
	[id_direccion] [int] NOT NULL,
	[calle] [varchar](25) NULL,
	[codigo_postal] [int] NULL,
	[colonia] [varchar](25) NULL,
	[fk_persona] [int] NOT NULL,
 CONSTRAINT [PK_Direccion] PRIMARY KEY CLUSTERED 
(
	[id_direccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Generos]    Script Date: 24/02/2016 04:29:57 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Generos](
	[id_genero] [int] NOT NULL,
	[nombre] [char](10) NULL,
 CONSTRAINT [PK_Generos] PRIMARY KEY CLUSTERED 
(
	[id_genero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Libros]    Script Date: 24/02/2016 04:29:57 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Libros](
	[isbn] [int] NOT NULL,
	[nombre] [varchar](30) NULL,
	[fk_genero] [int] NULL,
	[fk_autor] [int] NULL,
 CONSTRAINT [PK_Libros] PRIMARY KEY CLUSTERED 
(
	[isbn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Personas]    Script Date: 24/02/2016 04:29:57 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Personas](
	[id_persona] [int] NOT NULL,
	[nombre] [char](12) NULL,
	[apellido_paterno] [char](12) NULL,
	[apellido_materno] [char](12) NULL,
	[fecha_nacimiento] [date] NULL,
	[sexo] [char](1) NULL,
	[dias_prestamo] [int] NULL,
 CONSTRAINT [PK_Personas] PRIMARY KEY CLUSTERED 
(
	[id_persona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Prestamos]    Script Date: 24/02/2016 04:29:57 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prestamos](
	[id_prestamo] [int] NOT NULL,
	[fecha_prestamo] [date] NULL,
	[fecha_expiracion] [date] NULL,
	[libro_devuelto] [bit] NULL,
	[fk_isbn] [int] NULL,
	[fk_persona] [int] NULL,
 CONSTRAINT [PK_Prestamos] PRIMARY KEY CLUSTERED 
(
	[id_prestamo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Telefonos]    Script Date: 24/02/2016 04:29:57 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Telefonos](
	[num_telefono] [varchar](12) NULL,
	[fk_persona] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Direcciones]  WITH CHECK ADD  CONSTRAINT [FK_Direcciones_Personas] FOREIGN KEY([fk_persona])
REFERENCES [dbo].[Personas] ([id_persona])
GO
ALTER TABLE [dbo].[Direcciones] CHECK CONSTRAINT [FK_Direcciones_Personas]
GO
ALTER TABLE [dbo].[Libros]  WITH CHECK ADD  CONSTRAINT [FK_Libros_Autores] FOREIGN KEY([fk_autor])
REFERENCES [dbo].[Autores] ([id_autor])
GO
ALTER TABLE [dbo].[Libros] CHECK CONSTRAINT [FK_Libros_Autores]
GO
ALTER TABLE [dbo].[Libros]  WITH CHECK ADD  CONSTRAINT [FK_Libros_Generos] FOREIGN KEY([fk_genero])
REFERENCES [dbo].[Generos] ([id_genero])
GO
ALTER TABLE [dbo].[Libros] CHECK CONSTRAINT [FK_Libros_Generos]
GO
ALTER TABLE [dbo].[Prestamos]  WITH CHECK ADD  CONSTRAINT [FK_Prestamos_Libros] FOREIGN KEY([fk_isbn])
REFERENCES [dbo].[Libros] ([isbn])
GO
ALTER TABLE [dbo].[Prestamos] CHECK CONSTRAINT [FK_Prestamos_Libros]
GO
ALTER TABLE [dbo].[Prestamos]  WITH CHECK ADD  CONSTRAINT [FK_Prestamos_Personas] FOREIGN KEY([fk_persona])
REFERENCES [dbo].[Personas] ([id_persona])
GO
ALTER TABLE [dbo].[Prestamos] CHECK CONSTRAINT [FK_Prestamos_Personas]
GO
ALTER TABLE [dbo].[Telefonos]  WITH CHECK ADD  CONSTRAINT [FK_Telefonos_Personas] FOREIGN KEY([fk_persona])
REFERENCES [dbo].[Personas] ([id_persona])
GO
ALTER TABLE [dbo].[Telefonos] CHECK CONSTRAINT [FK_Telefonos_Personas]
GO
USE [master]
GO
ALTER DATABASE [biblioteca] SET  READ_WRITE 
GO
