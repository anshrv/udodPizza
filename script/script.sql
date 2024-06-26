USE [master]
GO
/****** Object:  Database [UdodPizza]    Script Date: 17.04.2024 8:03:10 ******/
CREATE DATABASE [UdodPizza]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UdodPizza', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\UdodPizza.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UdodPizza_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\UdodPizza_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [UdodPizza] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UdodPizza].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UdodPizza] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UdodPizza] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UdodPizza] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UdodPizza] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UdodPizza] SET ARITHABORT OFF 
GO
ALTER DATABASE [UdodPizza] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UdodPizza] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UdodPizza] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UdodPizza] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UdodPizza] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UdodPizza] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UdodPizza] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UdodPizza] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UdodPizza] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UdodPizza] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UdodPizza] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UdodPizza] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UdodPizza] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UdodPizza] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UdodPizza] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UdodPizza] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UdodPizza] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UdodPizza] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UdodPizza] SET  MULTI_USER 
GO
ALTER DATABASE [UdodPizza] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UdodPizza] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UdodPizza] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UdodPizza] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UdodPizza] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UdodPizza] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [UdodPizza] SET QUERY_STORE = ON
GO
ALTER DATABASE [UdodPizza] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [UdodPizza]
GO
/****** Object:  Table [dbo].[category]    Script Date: 17.04.2024 8:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id_c] [int] IDENTITY(1,1) NOT NULL,
	[name_c] [nvarchar](250) NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[id_c] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 17.04.2024 8:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[id_ct] [int] IDENTITY(1,1) NOT NULL,
	[date_o] [date] NULL,
	[time_o] [time](7) NULL,
	[name_ct] [nvarchar](250) NULL,
	[adress] [nvarchar](250) NULL,
	[tel] [nvarchar](50) NULL,
	[total_price] [decimal](18, 2) NULL,
	[comment] [nvarchar](250) NULL,
 CONSTRAINT [PK_customers] PRIMARY KEY CLUSTERED 
(
	[id_ct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[food]    Script Date: 17.04.2024 8:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[food](
	[id_f] [int] IDENTITY(1,1) NOT NULL,
	[name_f] [nvarchar](250) NULL,
	[price] [decimal](18, 2) NULL,
	[id_c] [int] NULL,
 CONSTRAINT [PK_food] PRIMARY KEY CLUSTERED 
(
	[id_f] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 17.04.2024 8:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id_o] [int] IDENTITY(1,1) NOT NULL,
	[count] [int] NULL,
	[id_f] [int] NULL,
	[id_ct] [int] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id_o] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[promo]    Script Date: 17.04.2024 8:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promo](
	[id_p] [int] IDENTITY(1,1) NOT NULL,
	[total_price] [decimal](18, 2) NULL,
	[procent] [int] NULL,
 CONSTRAINT [PK_promo] PRIMARY KEY CLUSTERED 
(
	[id_p] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id_c], [name_c]) VALUES (1, N'Пицца')
INSERT [dbo].[category] ([id_c], [name_c]) VALUES (2, N'Напиток')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[food] ON 

INSERT [dbo].[food] ([id_f], [name_f], [price], [id_c]) VALUES (1, N'Маргарита', CAST(300.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[food] ([id_f], [name_f], [price], [id_c]) VALUES (2, N'Пеперони', CAST(500.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[food] ([id_f], [name_f], [price], [id_c]) VALUES (3, N'Баварская', CAST(550.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[food] ([id_f], [name_f], [price], [id_c]) VALUES (4, N'Ветчина  и сыр', CAST(350.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[food] ([id_f], [name_f], [price], [id_c]) VALUES (5, N'Гавайская', CAST(400.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[food] ([id_f], [name_f], [price], [id_c]) VALUES (6, N'Кока-кола', CAST(130.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[food] ([id_f], [name_f], [price], [id_c]) VALUES (7, N'Компот', CAST(90.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[food] ([id_f], [name_f], [price], [id_c]) VALUES (8, N'Сок Яблочный', CAST(100.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[food] ([id_f], [name_f], [price], [id_c]) VALUES (9, N'Морс Клюквенный', CAST(90.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[food] ([id_f], [name_f], [price], [id_c]) VALUES (10, N'Сок Апельсиновый', CAST(100.00 AS Decimal(18, 2)), 2)
SET IDENTITY_INSERT [dbo].[food] OFF
GO
ALTER TABLE [dbo].[food]  WITH CHECK ADD  CONSTRAINT [FK_food_category] FOREIGN KEY([id_c])
REFERENCES [dbo].[category] ([id_c])
GO
ALTER TABLE [dbo].[food] CHECK CONSTRAINT [FK_food_category]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_customers] FOREIGN KEY([id_ct])
REFERENCES [dbo].[customers] ([id_ct])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_customers]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_food] FOREIGN KEY([id_f])
REFERENCES [dbo].[food] ([id_f])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_food]
GO
USE [master]
GO
ALTER DATABASE [UdodPizza] SET  READ_WRITE 
GO
