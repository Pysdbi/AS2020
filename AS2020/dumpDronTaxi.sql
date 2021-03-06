
USE [master]
GO
/****** Object:  Database [DronTaxi]    Script Date: 31.07.2020 4:38:19 ******/
CREATE DATABASE [DronTaxi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DronTaxi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DronTaxi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DronTaxi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DronTaxi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DronTaxi] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DronTaxi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DronTaxi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DronTaxi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DronTaxi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DronTaxi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DronTaxi] SET ARITHABORT OFF 
GO
ALTER DATABASE [DronTaxi] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DronTaxi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DronTaxi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DronTaxi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DronTaxi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DronTaxi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DronTaxi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DronTaxi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DronTaxi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DronTaxi] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DronTaxi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DronTaxi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DronTaxi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DronTaxi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DronTaxi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DronTaxi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DronTaxi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DronTaxi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DronTaxi] SET  MULTI_USER 
GO
ALTER DATABASE [DronTaxi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DronTaxi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DronTaxi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DronTaxi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DronTaxi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DronTaxi] SET QUERY_STORE = OFF
GO
USE [DronTaxi]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 31.07.2020 4:38:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Number] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProviderID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
	[TransportID] [int] NOT NULL,
	[StartPoint] [nvarchar](100) NOT NULL,
	[EndPoint] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 31.07.2020 4:38:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Privs]    Script Date: 31.07.2020 4:38:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Privs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Comment] [nvarchar](100) NULL,
 CONSTRAINT [PK_Privs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolePriv]    Script Date: 31.07.2020 4:38:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolePriv](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[PrivID] [int] NOT NULL,
 CONSTRAINT [PK_RolePriv] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 31.07.2020 4:38:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[SysName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transport]    Script Date: 31.07.2020 4:38:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transport](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Brand] [nvarchar](50) NOT NULL,
	[Model] [nvarchar](50) NOT NULL,
	[ProductionYear] [nvarchar](4) NOT NULL,
	[RegisterNum] [nvarchar](15) NOT NULL,
	[RegisterDate] [datetime] NOT NULL,
	[DeductionDate] [datetime] NULL,
 CONSTRAINT [PK_Transport] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransportPhoto]    Script Date: 31.07.2020 4:38:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransportPhoto](
	[TransportID] [int] NOT NULL,
	[Photo] [varbinary](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserPhoto]    Script Date: 31.07.2020 4:38:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPhoto](
	[UserID] [int] NOT NULL,
	[Photo] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserPriv]    Script Date: 31.07.2020 4:38:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPriv](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[PrivID] [int] NOT NULL,
 CONSTRAINT [PK_UserPriv] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 31.07.2020 4:38:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 31.07.2020 4:38:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NOT NULL,
	[DataBirth] [datetime] NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Privs] ON 

INSERT [dbo].[Privs] ([ID], [Name], [Comment]) VALUES (1, N'Профиль', N'Просмотр и изменение профиля пользователя')
INSERT [dbo].[Privs] ([ID], [Name], [Comment]) VALUES (2, N'Управление пользователями', N'Удаление, Добавление, Изменение пользователей')
INSERT [dbo].[Privs] ([ID], [Name], [Comment]) VALUES (3, N'Управление ролями', N'Удаление, Добавление, Изменение ролей')
SET IDENTITY_INSERT [dbo].[Privs] OFF
GO
SET IDENTITY_INSERT [dbo].[RolePriv] ON 

INSERT [dbo].[RolePriv] ([ID], [RoleID], [PrivID]) VALUES (1, 1, 1)
INSERT [dbo].[RolePriv] ([ID], [RoleID], [PrivID]) VALUES (2, 1, 2)
INSERT [dbo].[RolePriv] ([ID], [RoleID], [PrivID]) VALUES (3, 1, 3)
INSERT [dbo].[RolePriv] ([ID], [RoleID], [PrivID]) VALUES (4, 2, 1)
INSERT [dbo].[RolePriv] ([ID], [RoleID], [PrivID]) VALUES (5, 2, 2)
INSERT [dbo].[RolePriv] ([ID], [RoleID], [PrivID]) VALUES (6, 3, 1)
SET IDENTITY_INSERT [dbo].[RolePriv] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([ID], [Name], [SysName]) VALUES (1, N'Бог', N'god')
INSERT [dbo].[Roles] ([ID], [Name], [SysName]) VALUES (2, N'Администратор', N'admin')
INSERT [dbo].[Roles] ([ID], [Name], [SysName]) VALUES (3, N'Пользователь', N'user')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[UserPriv] ON 

INSERT [dbo].[UserPriv] ([ID], [UserID], [PrivID]) VALUES (1, 1, 1)
INSERT [dbo].[UserPriv] ([ID], [UserID], [PrivID]) VALUES (2, 2, 1)
INSERT [dbo].[UserPriv] ([ID], [UserID], [PrivID]) VALUES (3, 3, 1)
SET IDENTITY_INSERT [dbo].[UserPriv] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([ID], [UserID], [RoleID], [StartDate], [EndDate]) VALUES (1, 1, 3, CAST(N'2020-07-31T03:23:16.000' AS DateTime), NULL)
INSERT [dbo].[UserRole] ([ID], [UserID], [RoleID], [StartDate], [EndDate]) VALUES (3, 1, 2, CAST(N'2000-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[UserRole] ([ID], [UserID], [RoleID], [StartDate], [EndDate]) VALUES (4, 2, 3, CAST(N'2020-07-31T04:09:15.000' AS DateTime), NULL)
INSERT [dbo].[UserRole] ([ID], [UserID], [RoleID], [StartDate], [EndDate]) VALUES (5, 2, 1, CAST(N'2020-07-31T04:09:15.000' AS DateTime), NULL)
INSERT [dbo].[UserRole] ([ID], [UserID], [RoleID], [StartDate], [EndDate]) VALUES (6, 3, 3, CAST(N'2020-07-31T04:15:11.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[UserRole] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [Login], [Password], [LastName], [FirstName], [MiddleName], [DataBirth], [Gender], [Email], [Phone]) VALUES (1, N'GeneralDirector', N'Dron123ceb20772e0c9d240Taxi123', N'Богов', N'Андрей', N'Дронович', CAST(N'1986-07-31T00:00:00.000' AS DateTime), N'М', N'god@satana.com', N'')
INSERT [dbo].[Users] ([ID], [Login], [Password], [LastName], [FirstName], [MiddleName], [DataBirth], [Gender], [Email], [Phone]) VALUES (2, N'ChiefOfWorld', N'Chiefceb20772e0c9d240123', N'Он', N'Просто', N'Бог', CAST(N'2020-07-31T00:00:00.000' AS DateTime), N'М', N'satana@god.com', N'')
INSERT [dbo].[Users] ([ID], [Login], [Password], [LastName], [FirstName], [MiddleName], [DataBirth], [Gender], [Email], [Phone]) VALUES (3, N'Satana', N'1Shceb20772e0c9d240aitan4', N'Вельзевулов', N'Люцифер', N'Иблисович', CAST(N'1900-07-31T00:00:00.000' AS DateTime), N'Ж', N'IamChiefOfGod@satana.com', N'6 666-666-6666')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_OrderStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[OrderStatus] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_OrderStatus]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Transport] FOREIGN KEY([TransportID])
REFERENCES [dbo].[Transport] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Transport]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users1] FOREIGN KEY([ProviderID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users1]
GO
ALTER TABLE [dbo].[RolePriv]  WITH CHECK ADD  CONSTRAINT [FK_RolePriv_Privs] FOREIGN KEY([PrivID])
REFERENCES [dbo].[Privs] ([ID])
GO
ALTER TABLE [dbo].[RolePriv] CHECK CONSTRAINT [FK_RolePriv_Privs]
GO
ALTER TABLE [dbo].[RolePriv]  WITH CHECK ADD  CONSTRAINT [FK_RolePriv_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[RolePriv] CHECK CONSTRAINT [FK_RolePriv_Roles]
GO
ALTER TABLE [dbo].[TransportPhoto]  WITH CHECK ADD  CONSTRAINT [FK_TransportPhoto_Transport] FOREIGN KEY([TransportID])
REFERENCES [dbo].[Transport] ([ID])
GO
ALTER TABLE [dbo].[TransportPhoto] CHECK CONSTRAINT [FK_TransportPhoto_Transport]
GO
ALTER TABLE [dbo].[UserPhoto]  WITH CHECK ADD  CONSTRAINT [FK_UserPhoto_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[UserPhoto] CHECK CONSTRAINT [FK_UserPhoto_Users]
GO
ALTER TABLE [dbo].[UserPriv]  WITH CHECK ADD  CONSTRAINT [FK_UserPriv_Privs] FOREIGN KEY([PrivID])
REFERENCES [dbo].[Privs] ([ID])
GO
ALTER TABLE [dbo].[UserPriv] CHECK CONSTRAINT [FK_UserPriv_Privs]
GO
ALTER TABLE [dbo].[UserPriv]  WITH CHECK ADD  CONSTRAINT [FK_UserPriv_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[UserPriv] CHECK CONSTRAINT [FK_UserPriv_Users]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Roles]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Users]
GO
USE [master]
GO
ALTER DATABASE [DronTaxi] SET  READ_WRITE 
GO
