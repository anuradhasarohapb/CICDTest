USE [master]
GO
/****** Object:  Database [FarmManager]    Script Date: 11/25/2016 9:50:49 AM ******/
CREATE DATABASE [FarmManager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FarmManager', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\FarmManager.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FarmManager_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\FarmManager_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FarmManager] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FarmManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FarmManager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FarmManager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FarmManager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FarmManager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FarmManager] SET ARITHABORT OFF 
GO
ALTER DATABASE [FarmManager] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FarmManager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FarmManager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FarmManager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FarmManager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FarmManager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FarmManager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FarmManager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FarmManager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FarmManager] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FarmManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FarmManager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FarmManager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FarmManager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FarmManager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FarmManager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FarmManager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FarmManager] SET RECOVERY FULL 
GO
ALTER DATABASE [FarmManager] SET  MULTI_USER 
GO
ALTER DATABASE [FarmManager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FarmManager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FarmManager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FarmManager] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FarmManager] SET DELAYED_DURABILITY = DISABLED 
GO
USE [FarmManager]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MTDMenu]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MTDMenu](
	[MenuID] [bigint] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](100) NULL,
	[MenuURL] [nvarchar](1000) NULL,
	[RoleID] [int] NULL,
 CONSTRAINT [PK_MTDMenu] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MTDMenuSave]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MTDMenuSave](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[MenuID] [bigint] NULL,
	[MenuName] [nvarchar](100) NULL,
	[MRead] [int] NULL,
	[MWrite] [int] NULL,
	[MBoth] [int] NULL,
	[UID] [int] NULL,
	[RID] [int] NULL,
 CONSTRAINT [PK_MTDMenuSave] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MTDroles]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MTDroles](
	[RolesID] [int] IDENTITY(1,1) NOT NULL,
	[RolesName] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_MTDroles_CreateDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_MTDroles] PRIMARY KEY CLUSTERED 
(
	[RolesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MTDSubMenu]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MTDSubMenu](
	[SubmenuID] [bigint] IDENTITY(1,1) NOT NULL,
	[SubmenuName] [nvarchar](200) NULL,
	[SubMenuURL] [nvarchar](max) NULL,
	[MenuID] [int] NULL,
	[RoleID] [int] NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_MTDSubMenu_CreateDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_MTDSubMenu] PRIMARY KEY CLUSTERED 
(
	[SubmenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MTDSubMenuSave]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MTDSubMenuSave](
	[SUBTID] [int] IDENTITY(1,1) NOT NULL,
	[SubMenuID] [bigint] NULL,
	[SubMenuName] [nvarchar](100) NULL,
	[SubMRead] [int] NULL,
	[SubMWrite] [int] NULL,
	[SubMBoth] [int] NULL,
	[SubUID] [int] NULL,
	[SubRID] [int] NULL,
	[MainMenuID] [int] NULL,
 CONSTRAINT [PK_MTDSubMenuSave] PRIMARY KEY CLUSTERED 
(
	[SUBTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MTDUsers]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MTDUsers](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[UserDetails] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_MTDUsers_CreateDate]  DEFAULT (getdate()),
	[Password] [varchar](max) NULL,
	[RoleID] [int] NULL,
 CONSTRAINT [PK_MTDUsers] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[SubCategoryID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[SubCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.SubCategory] PRIMARY KEY CLUSTERED 
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201611250512379_InitialCreate', N'ManagingMultijQueryForm.Models.ProductDbContext', 0x1F8B0800000000000400E55ADB6EE336107D2FD07F10F45864ADC48B026D60EF22B593C2E8E6D22859F42DA0A5B1A396A254920A6C14FDB23EF493FA0B1D5D2D91922C2B4E9C6EB140B016398773E7F8C8FFFCF5F7E8E3CAA7C61370E1056C6C9E0C8E4D039813B81E5B8ECD482EDE7D677EFCF0F557A373D75F199FF37DEFE37D28C9C4D87C94323CB52CE13C824FC4C0F71C1E886021074EE05BC40DACE1F1F1F7D6C9890508612296618C6E23263D1F920FF8711230074219117A19B84045F61C57EC04D5B8223E88903830362F09234BD4EE32A2D2FBF5E708F8FA22E0FE2095348D33EA11D4CA06BA300DC2582089449D4FEF05D892076C6987F880D0BB7508B86F41A880CC96D3CDF6AE661D0F63B3AC8D600EE5444206FE8E8027EF333F59AA782F6F9B851FD193E7E871B98EAD4EBC39362744C232E06BD3500F3B9D501E6FDCE6EC410E7164346C3C2A5206332BFE77644C7047C461CC20929CD023E3269A53CFF909D677C16FC0C62CA2B4AC38AA8E6B9507F8E886072170B9BE858562CE6C6A1A5655DE52010AF11AD9D4F01993EF87A67185CA903985224F4A4EB265C0E14760C051DABD215202C730CF5C483CAD69A19C19FFCD4FC3C444DF99E8C5D527604BF93836BFC502BBF056E0E60F3205EE9987D58932924750A360F9D091B5097A6B2AA06A6EE4C867644286F016122153A54F1E9444BFA034D00F9D8270B817A68DA5F1ECE1CB1C6E47F3EEF5A6405D91276F99F8BD19D4346E81267BC4A317A637419E9F0F957D173CF06F03BA097C79F9C10E22EEC4B1099AF7DC11BE04D9B3EA2ABAF4AEBC12CA5BA83E25BABB56E04EC9B1BF2AEC9D9007A9E6C62A682D8172DED6D540DDBA5604B59B76A982332102C74B74D343BED1AB6AF039738D2E4AA67E578CC508C4D5106276A33E63F31BCD9F5BE073F34AF04DD827A65A21D76C0A142418674E3A064E887088AB0715FDE5569F6051018FF397501C900596A9C7A45E811E73BC90D00E1628B23B8E51B18EC569EACA14426071B17588D3F3D5284E535CB8CD6323AB947EED5959776134654DEBEDB1499A62CAEA9E8F6D774EB76C3F7C46B6D8D025135A2F949D72B2254C7B5164EF5999765094912801BC9A99D379BC00ABBAA91DBFEB66E383C8EE1435C162601BA4766F6C9AB6D6E9B424AD6214D9AD41142B5B102A59ACA1545615A492FF6AE14AF75D696BDBBDA806B7E30D5498A458A3254BC72BA784D768BC55B5BE83676A8761DD315B5B60E7265832A321193A77BD6E1E6E714A3E981465B5219BAC946DCA5929AB81961A5D9230C4D1AE4453654F0C3BE5A826EFECDD091B3FC5B01C51C3DB14DA1627E1C04B96A0ACE2D1A8E985C7859C1249E6249E1E27AEAF6DD39A484369E6C7297D428F5D5EADB940FCFF54A8238754D38333AC0B34D48FDB7832E4D79584269A30878412DE32E74F021AF96CFBB8D18C964EFB659CF4898E30B2145BB4CB43F3A076175723D2295E79B1ED315C0D901DA2D528D9E4DE121B53F67123BFB39F503521543893325065A13B9E324E9411B74C1A074BA7F68BA0774AB5C07648AB56E99770FEFFAAB768B7A5BAA538BDB83595DB7194DD54DBDFEC685757BAC534D0354F9E1B5F5BF65A48F007F18681FD3B9D500FEDDD6CC044F31620644A6199C3E393A1F242E8EDBC9CB1847069C73734077F1DE2C55EDECAB13D832C634F843B8F846B74D97E5F701CF875C21B7563A71704B5D0C31ED8B5146FE219ED7BEC0CBF4EAFC6E61F89E4A931FBE5A1227C645C73ACFA53E3D8F8735F99D2CCF71C8CFE7E91ACE91F825EFE7FCDEA7F26C5BCF94EF9DA846F2D29D09FD6EEC5D6B54C62AF41167F79E4708F50BE505215D44B1F4EFAB92F230EC3F5FEA7885D9DBAD9036B9BCED063D39D0718F8B497EE93D3ADC37F01C2B7EE98B7C208AB36B4D2B5CDBDE1D9CCE6ABD2BD3D54AF6F46DBB9E1FD90B9FAD7502CE0D2CF10B185086FB981887F94C8C0A9946EB167C61641DE48148DF22DCAB8730992B858D7675C7A0BE2485C764088E417029F098D70CBB93F0777C6AE231946124D067F4E2B4E8C3B51DBF909635DD579749D0CF1621F26A09A1E9A00D7EC87C8A36EA1F745CD68D60011B7B86C888D6329E36176B92E90AE02D61128735FD199EFC00F2982896B669327E8A3DBBD804FB024CE3A67139A41B607A2EAF6D1D4234B4E7C91616CE4F123E6B0EBAF3EFC0B2866B8358D2B0000, N'6.1.0-30225')
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (1, N'Food')
INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (2, N'Electronics')
INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (3, N'Beverages')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[MTDMenu] ON 

INSERT [dbo].[MTDMenu] ([MenuID], [MenuName], [MenuURL], [RoleID]) VALUES (1, N'Add Menu', N'AddMenu.aspx', 1)
INSERT [dbo].[MTDMenu] ([MenuID], [MenuName], [MenuURL], [RoleID]) VALUES (2, N'Add Roles', N'AddRoles.aspx', 1)
INSERT [dbo].[MTDMenu] ([MenuID], [MenuName], [MenuURL], [RoleID]) VALUES (3, N'Add Users', N'CreateUsers.aspx', 1)
INSERT [dbo].[MTDMenu] ([MenuID], [MenuName], [MenuURL], [RoleID]) VALUES (4, N'Register Client', N'.', 1)
INSERT [dbo].[MTDMenu] ([MenuID], [MenuName], [MenuURL], [RoleID]) VALUES (5, N'Manage Login', N'.', 1)
INSERT [dbo].[MTDMenu] ([MenuID], [MenuName], [MenuURL], [RoleID]) VALUES (6, N'Supply Name', N'.', 1)
SET IDENTITY_INSERT [dbo].[MTDMenu] OFF
SET IDENTITY_INSERT [dbo].[MTDMenuSave] ON 

INSERT [dbo].[MTDMenuSave] ([TID], [MenuID], [MenuName], [MRead], [MWrite], [MBoth], [UID], [RID]) VALUES (1, 1, N'Add Menu', 0, 0, 1, 0, 1)
INSERT [dbo].[MTDMenuSave] ([TID], [MenuID], [MenuName], [MRead], [MWrite], [MBoth], [UID], [RID]) VALUES (2, 2, N'Add Roles', 0, 0, 1, 0, 1)
INSERT [dbo].[MTDMenuSave] ([TID], [MenuID], [MenuName], [MRead], [MWrite], [MBoth], [UID], [RID]) VALUES (3, 3, N'Add Users', 0, 0, 1, 0, 1)
INSERT [dbo].[MTDMenuSave] ([TID], [MenuID], [MenuName], [MRead], [MWrite], [MBoth], [UID], [RID]) VALUES (4, 1, N'Add Menu', 1, 1, 1, 1, 1)
INSERT [dbo].[MTDMenuSave] ([TID], [MenuID], [MenuName], [MRead], [MWrite], [MBoth], [UID], [RID]) VALUES (5, 2, N'Add Roles', 1, 1, 1, 1, 1)
INSERT [dbo].[MTDMenuSave] ([TID], [MenuID], [MenuName], [MRead], [MWrite], [MBoth], [UID], [RID]) VALUES (6, 3, N'Add Users', 1, 1, 1, 1, 1)
INSERT [dbo].[MTDMenuSave] ([TID], [MenuID], [MenuName], [MRead], [MWrite], [MBoth], [UID], [RID]) VALUES (7, 1, N'Add Menu', 1, 1, 1, 1, 1)
INSERT [dbo].[MTDMenuSave] ([TID], [MenuID], [MenuName], [MRead], [MWrite], [MBoth], [UID], [RID]) VALUES (8, 2, N'Add Roles', 1, 1, 1, 1, 1)
INSERT [dbo].[MTDMenuSave] ([TID], [MenuID], [MenuName], [MRead], [MWrite], [MBoth], [UID], [RID]) VALUES (9, 3, N'Add Users', 1, 1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[MTDMenuSave] OFF
SET IDENTITY_INSERT [dbo].[MTDroles] ON 

INSERT [dbo].[MTDroles] ([RolesID], [RolesName], [CreateDate]) VALUES (1, N'Admin', CAST(N'2016-11-22 22:35:47.250' AS DateTime))
INSERT [dbo].[MTDroles] ([RolesID], [RolesName], [CreateDate]) VALUES (2, N'Finance', CAST(N'2016-11-22 22:36:08.453' AS DateTime))
INSERT [dbo].[MTDroles] ([RolesID], [RolesName], [CreateDate]) VALUES (3, N'User', CAST(N'2016-11-22 22:36:28.100' AS DateTime))
SET IDENTITY_INSERT [dbo].[MTDroles] OFF
SET IDENTITY_INSERT [dbo].[MTDSubMenu] ON 

INSERT [dbo].[MTDSubMenu] ([SubmenuID], [SubmenuName], [SubMenuURL], [MenuID], [RoleID], [CreateDate]) VALUES (1, N'CurrentMenu', N'', 1, 1, CAST(N'2016-11-22 22:44:11.167' AS DateTime))
INSERT [dbo].[MTDSubMenu] ([SubmenuID], [SubmenuName], [SubMenuURL], [MenuID], [RoleID], [CreateDate]) VALUES (2, N'CurrentMenu', N'', 1, 1, CAST(N'2016-11-22 22:44:16.680' AS DateTime))
INSERT [dbo].[MTDSubMenu] ([SubmenuID], [SubmenuName], [SubMenuURL], [MenuID], [RoleID], [CreateDate]) VALUES (3, N'CurrentMenu', N'', 1, 1, CAST(N'2016-11-22 22:44:17.980' AS DateTime))
INSERT [dbo].[MTDSubMenu] ([SubmenuID], [SubmenuName], [SubMenuURL], [MenuID], [RoleID], [CreateDate]) VALUES (4, N'CurrentMenu', N'', 1, 1, CAST(N'2016-11-22 22:44:18.923' AS DateTime))
INSERT [dbo].[MTDSubMenu] ([SubmenuID], [SubmenuName], [SubMenuURL], [MenuID], [RoleID], [CreateDate]) VALUES (5, N'CurrentMenu', N'', 2, 1, CAST(N'2016-11-22 22:44:37.883' AS DateTime))
INSERT [dbo].[MTDSubMenu] ([SubmenuID], [SubmenuName], [SubMenuURL], [MenuID], [RoleID], [CreateDate]) VALUES (6, N'CurrentMenu', N'', 2, 1, CAST(N'2016-11-22 22:44:38.950' AS DateTime))
INSERT [dbo].[MTDSubMenu] ([SubmenuID], [SubmenuName], [SubMenuURL], [MenuID], [RoleID], [CreateDate]) VALUES (7, N'CurrentMenu', N'', 2, 1, CAST(N'2016-11-22 22:44:39.920' AS DateTime))
INSERT [dbo].[MTDSubMenu] ([SubmenuID], [SubmenuName], [SubMenuURL], [MenuID], [RoleID], [CreateDate]) VALUES (8, N'CurrentMenu', N'', 2, 1, CAST(N'2016-11-22 22:44:44.870' AS DateTime))
SET IDENTITY_INSERT [dbo].[MTDSubMenu] OFF
SET IDENTITY_INSERT [dbo].[MTDSubMenuSave] ON 

INSERT [dbo].[MTDSubMenuSave] ([SUBTID], [SubMenuID], [SubMenuName], [SubMRead], [SubMWrite], [SubMBoth], [SubUID], [SubRID], [MainMenuID]) VALUES (1, 1, N'CurrentMenu', 0, 0, 1, 0, 1, 1)
INSERT [dbo].[MTDSubMenuSave] ([SUBTID], [SubMenuID], [SubMenuName], [SubMRead], [SubMWrite], [SubMBoth], [SubUID], [SubRID], [MainMenuID]) VALUES (2, 2, N'CurrentMenu', 0, 0, 1, 0, 1, 1)
INSERT [dbo].[MTDSubMenuSave] ([SUBTID], [SubMenuID], [SubMenuName], [SubMRead], [SubMWrite], [SubMBoth], [SubUID], [SubRID], [MainMenuID]) VALUES (3, 3, N'CurrentMenu', 0, 0, 1, 0, 1, 1)
INSERT [dbo].[MTDSubMenuSave] ([SUBTID], [SubMenuID], [SubMenuName], [SubMRead], [SubMWrite], [SubMBoth], [SubUID], [SubRID], [MainMenuID]) VALUES (4, 4, N'CurrentMenu', 0, 0, 1, 0, 1, 1)
INSERT [dbo].[MTDSubMenuSave] ([SUBTID], [SubMenuID], [SubMenuName], [SubMRead], [SubMWrite], [SubMBoth], [SubUID], [SubRID], [MainMenuID]) VALUES (5, 5, N'CurrentMenu', 0, 0, 1, 0, 1, 2)
INSERT [dbo].[MTDSubMenuSave] ([SUBTID], [SubMenuID], [SubMenuName], [SubMRead], [SubMWrite], [SubMBoth], [SubUID], [SubRID], [MainMenuID]) VALUES (6, 6, N'CurrentMenu', 0, 0, 1, 0, 1, 2)
INSERT [dbo].[MTDSubMenuSave] ([SUBTID], [SubMenuID], [SubMenuName], [SubMRead], [SubMWrite], [SubMBoth], [SubUID], [SubRID], [MainMenuID]) VALUES (7, 7, N'CurrentMenu', 0, 0, 1, 0, 1, 2)
INSERT [dbo].[MTDSubMenuSave] ([SUBTID], [SubMenuID], [SubMenuName], [SubMRead], [SubMWrite], [SubMBoth], [SubUID], [SubRID], [MainMenuID]) VALUES (8, 8, N'CurrentMenu', 0, 0, 1, 0, 1, 2)
INSERT [dbo].[MTDSubMenuSave] ([SUBTID], [SubMenuID], [SubMenuName], [SubMRead], [SubMWrite], [SubMBoth], [SubUID], [SubRID], [MainMenuID]) VALUES (9, 1, N'CurrentMenu', 1, 1, 1, 1, 1, 1)
INSERT [dbo].[MTDSubMenuSave] ([SUBTID], [SubMenuID], [SubMenuName], [SubMRead], [SubMWrite], [SubMBoth], [SubUID], [SubRID], [MainMenuID]) VALUES (10, 2, N'CurrentMenu', 1, 1, 1, 1, 1, 1)
INSERT [dbo].[MTDSubMenuSave] ([SUBTID], [SubMenuID], [SubMenuName], [SubMRead], [SubMWrite], [SubMBoth], [SubUID], [SubRID], [MainMenuID]) VALUES (11, 3, N'CurrentMenu', 1, 1, 1, 1, 1, 1)
INSERT [dbo].[MTDSubMenuSave] ([SUBTID], [SubMenuID], [SubMenuName], [SubMRead], [SubMWrite], [SubMBoth], [SubUID], [SubRID], [MainMenuID]) VALUES (12, 4, N'CurrentMenu', 1, 1, 1, 1, 1, 1)
INSERT [dbo].[MTDSubMenuSave] ([SUBTID], [SubMenuID], [SubMenuName], [SubMRead], [SubMWrite], [SubMBoth], [SubUID], [SubRID], [MainMenuID]) VALUES (13, 5, N'CurrentMenu', 1, 1, 1, 1, 1, 2)
INSERT [dbo].[MTDSubMenuSave] ([SUBTID], [SubMenuID], [SubMenuName], [SubMRead], [SubMWrite], [SubMBoth], [SubUID], [SubRID], [MainMenuID]) VALUES (14, 6, N'CurrentMenu', 1, 1, 1, 1, 1, 2)
INSERT [dbo].[MTDSubMenuSave] ([SUBTID], [SubMenuID], [SubMenuName], [SubMRead], [SubMWrite], [SubMBoth], [SubUID], [SubRID], [MainMenuID]) VALUES (15, 7, N'CurrentMenu', 1, 1, 1, 1, 1, 2)
INSERT [dbo].[MTDSubMenuSave] ([SUBTID], [SubMenuID], [SubMenuName], [SubMRead], [SubMWrite], [SubMBoth], [SubUID], [SubRID], [MainMenuID]) VALUES (16, 8, N'CurrentMenu', 1, 1, 1, 1, 1, 2)
INSERT [dbo].[MTDSubMenuSave] ([SUBTID], [SubMenuID], [SubMenuName], [SubMRead], [SubMWrite], [SubMBoth], [SubUID], [SubRID], [MainMenuID]) VALUES (17, 1, N'CurrentMenu', 1, 1, 1, 1, 1, 1)
INSERT [dbo].[MTDSubMenuSave] ([SUBTID], [SubMenuID], [SubMenuName], [SubMRead], [SubMWrite], [SubMBoth], [SubUID], [SubRID], [MainMenuID]) VALUES (18, 2, N'CurrentMenu', 1, 1, 1, 1, 1, 1)
INSERT [dbo].[MTDSubMenuSave] ([SUBTID], [SubMenuID], [SubMenuName], [SubMRead], [SubMWrite], [SubMBoth], [SubUID], [SubRID], [MainMenuID]) VALUES (19, 3, N'CurrentMenu', 1, 1, 1, 1, 1, 1)
INSERT [dbo].[MTDSubMenuSave] ([SUBTID], [SubMenuID], [SubMenuName], [SubMRead], [SubMWrite], [SubMBoth], [SubUID], [SubRID], [MainMenuID]) VALUES (20, 4, N'CurrentMenu', 1, 1, 1, 1, 1, 1)
INSERT [dbo].[MTDSubMenuSave] ([SUBTID], [SubMenuID], [SubMenuName], [SubMRead], [SubMWrite], [SubMBoth], [SubUID], [SubRID], [MainMenuID]) VALUES (21, 5, N'CurrentMenu', 1, 1, 1, 1, 1, 2)
INSERT [dbo].[MTDSubMenuSave] ([SUBTID], [SubMenuID], [SubMenuName], [SubMRead], [SubMWrite], [SubMBoth], [SubUID], [SubRID], [MainMenuID]) VALUES (22, 6, N'CurrentMenu', 1, 1, 1, 1, 1, 2)
INSERT [dbo].[MTDSubMenuSave] ([SUBTID], [SubMenuID], [SubMenuName], [SubMRead], [SubMWrite], [SubMBoth], [SubUID], [SubRID], [MainMenuID]) VALUES (23, 7, N'CurrentMenu', 1, 1, 1, 1, 1, 2)
INSERT [dbo].[MTDSubMenuSave] ([SUBTID], [SubMenuID], [SubMenuName], [SubMRead], [SubMWrite], [SubMBoth], [SubUID], [SubRID], [MainMenuID]) VALUES (24, 8, N'CurrentMenu', 1, 1, 1, 1, 1, 2)
SET IDENTITY_INSERT [dbo].[MTDSubMenuSave] OFF
SET IDENTITY_INSERT [dbo].[MTDUsers] ON 

INSERT [dbo].[MTDUsers] ([UserID], [UserName], [UserDetails], [CreateDate], [Password], [RoleID]) VALUES (1, N'shiundu', N'shiundu jonathan', CAST(N'2016-11-22 22:39:31.350' AS DateTime), N'admin', 1)
INSERT [dbo].[MTDUsers] ([UserID], [UserName], [UserDetails], [CreateDate], [Password], [RoleID]) VALUES (2, N'boss', N'shiundu jonathan', CAST(N'2016-11-22 22:39:45.170' AS DateTime), N'admin', NULL)
INSERT [dbo].[MTDUsers] ([UserID], [UserName], [UserDetails], [CreateDate], [Password], [RoleID]) VALUES (3, N'Dubeez', N'shiundu jonathan', CAST(N'2016-11-22 22:40:24.940' AS DateTime), N'admin', NULL)
SET IDENTITY_INSERT [dbo].[MTDUsers] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [Name], [Description], [SubCategoryID]) VALUES (7, N'sss', N'dscs', 5)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [SubCategoryID]) VALUES (8, N'cdsc', N'dcd', 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name]) VALUES (1, 1, N'Vegetables')
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name]) VALUES (2, 1, N'Fruits')
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name]) VALUES (3, 2, N'Computer')
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name]) VALUES (4, 2, N'Television')
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name]) VALUES (5, 3, N'Cold Drinks')
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name]) VALUES (6, 3, N'Beer')
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name]) VALUES (7, 1, N'sc')
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
/****** Object:  Index [IX_SubCategoryID]    Script Date: 11/25/2016 9:50:49 AM ******/
CREATE NONCLUSTERED INDEX [IX_SubCategoryID] ON [dbo].[Product]
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CategoryID]    Script Date: 11/25/2016 9:50:49 AM ******/
CREATE NONCLUSTERED INDEX [IX_CategoryID] ON [dbo].[SubCategory]
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Product_dbo.SubCategory_SubCategoryID] FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[SubCategory] ([SubCategoryID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_dbo.Product_dbo.SubCategory_SubCategoryID]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SubCategory_dbo.Category_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_dbo.SubCategory_dbo.Category_CategoryID]
GO
/****** Object:  StoredProcedure [dbo].[MTDGetdata]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[MTDGetdata]


as

begin

select * from MTDUsers
end

GO
/****** Object:  StoredProcedure [dbo].[MTDUserRolesInsert]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[MTDUserRolesInsert]
@RolesName	nvarchar(50)	
as 

begin
insert into MTDroles
(
RolesName
)

values 
(
@RolesName

)


end

GO
/****** Object:  StoredProcedure [dbo].[UserInsert]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[UserInsert]  
@UserName nvarchar(50) ,  
@UserDetails nvarchar(50),   
@Password nvarchar(max)  
as   
  
begin
 

if exists (SELECT
	UserID
FROM MTDUsers
WHERE UserName = @UserName)
 BEGIN
SELECT
	'Already User exits'
 END
 else
 
 begin
INSERT INTO MTDUsers (UserName,
UserDetails,
Password)

	VALUES (@UserName, @UserDetails, @Password)
  
  select 'Created Successfully'
  end
end

GO
/****** Object:  StoredProcedure [dbo].[Usp_checklogin]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_checklogin]  
--exec Usp_checklogin 'sai',123  
@username nvarchar(100),  
@password nvarchar(100)  
as  
  
begin  
declare @UID bigint 
declare @RID bigint 
 
select @UID= MU.UserID ,@RID= MU.RoleID from MTDUsers MU where MU.UserName=@username and MU.Password =@password  
  
  
IF(@@rowcount > 0)  
begin  
select @UID as UserID , @RID as RoleID
end  
else  
begin  
select 0 as UserID  
end  
  
  
end

GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteMTDMenu]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_DeleteMTDMenu]  
@MenuID int   
as  
begin  
Declare @msg varchar(100)  
IF exists(SELECT mM.MenuID FROM MTDMenu mM where mM.RoleID = @MenuID)  
BEGIN  
 set @msg = 'The role id Cannot be delete because it is in use'  
 select @msg  
END  
else if exists(SELECT mM.MenuID FROM MTDMenuSave mM where mM.MenuID = @MenuID)  
BEGIN  
set @msg = 'The role id Cannot be delete because it is in use'  
 select @msg  
end  
  
else if exists(SELECT mM.MenuID FROM MTDSubMenu mM where mM.MenuID = @MenuID)  
BEGIN  
set @msg = 'The role id Cannot be delete because it is in use'  
 select @msg  
end  
  
else if exists(SELECT mM.MainMenuID FROM MTDSubMenuSave mM where mM.MainMenuID = @MenuID)  
BEGIN  
set @msg = 'The role id Cannot be delete because it is in use'  
  
 select @msg  
end  
  
else  
begin  
delete FROM MTDMenu where MenuID = @MenuID  
set @msg = 'Delete successfully!'  
select @msg
end  
end

GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteMTDSubMenu]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_DeleteMTDSubMenu]
@SubmenuID int 
as
begin
Declare @msg varchar(100)

 if exists(SELECT mM.SubMenuID FROM MTDSubMenu mM where mM.SubmenuID = @SubmenuID)
BEGIN
set @msg = 'The role id Cannot be delete because it is in use'
 select @msg
end

else if exists(SELECT mM.SubMenuID FROM MTDSubMenuSave mM where mM.SubmenuID = @SubmenuID)
BEGIN
set @msg = 'The role id Cannot be delete because it is in use'
 select @msg
end

else
begin
delete FROM MTDSubMenu where SubmenuID = @SubmenuID
end
end

GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteRoles]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_DeleteRoles] 
@RolesID int   
as  
begin  
Declare @msg varchar(100)  
IF exists(SELECT mM.RoleID FROM MTDMenu mM where mM.RoleID = @RolesID)  
BEGIN  
 set @msg = 'The role id Cannot be delete because it is in use' 
 select @msg
RETURN   
END  
else if exists(SELECT mM.RoleID FROM MTDMenu mM where mM.RoleID = @RolesID)  
BEGIN  
set @msg = 'The role id Cannot be delete because it is in use'  
select @msg
end  
  
else if exists(SELECT mM.RID FROM MTDMenuSave mM where mM.RID = @RolesID)  
BEGIN  
set @msg = 'The role id Cannot be delete because it is in use'  
select @msg
end  
  
else if exists(SELECT mM.RoleID FROM MTDSubMenu mM where mM.RoleID = @RolesID)  
BEGIN  
set @msg = 'The role id Cannot be delete because it is in use'  
select @msg
end  
  
else if exists(SELECT mM.RoleID FROM MTDSubMenu mM where mM.RoleID = @RolesID)  
BEGIN  
set @msg = 'The role id Cannot be delete because it is in use'  
select @msg
end  
  
else if exists(SELECT mM.SubRID FROM MTDSubMenuSave mM where mM.SubRID = @RolesID)  
BEGIN  
set @msg = 'The role id Cannot be delete because it is in use'  
select @msg
end    
else  
begin  
delete FROM MTDroles where RolesID = @RolesID  
set @msg = 'Delete successfully!'  
select @msg
end  

end

GO
/****** Object:  StoredProcedure [dbo].[Usp_GetAllMenuofRole]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_GetAllMenuofRole]          
--exec Usp_GetAllMenuofRole 1           
@UserID1 bigint   
as           
          
begin
          
SELECT
	MT.MenuName,
	MT.MenuURL,
	CAST(MD.MenuID AS nvarchar(10)) + 'M' AS MenuIDx,
	MD.MenuID,
	MD.UID
FROM dbo.MTDMenuSave MD
INNER JOIN MTDMenu MT
	ON MD.MenuID = MT.MenuID
WHERE MD.UID = @UserID1
          
          
end

GO
/****** Object:  StoredProcedure [dbo].[Usp_GetAllRoles]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_GetAllRoles]        
@Menutype char(1) ,      
@ID bigint ,
@RID bigint ,
@UID bigint     
as      
begin      
      
      
IF(@Menutype = 'M')
begin
select MRead,
MWrite,
MBoth from dbo.MTDMenuSave MD where MD.MenuID =@ID and  MD.RID =@RID and MD.UID =@UID  
end

else if(@Menutype = 'S') 
begin

select MS.SubMRead ,MS.SubMWrite,MS.SubMBoth from  MTDSubMenuSave MS

where MS.SubMenuID =@ID and  MS.SubRID =@RID and MS.SubUID =@UID  
end
      
end

GO
/****** Object:  StoredProcedure [dbo].[usp_getallusers]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_getallusers]
@UserID bigint
as
begin

SELECT
	MU.UserName,
	MU.UserID,
	MT.RolesName
FROM MTDUsers MU
INNER JOIN MTDroles MT
	ON MU.RoleID = MT.RolesID
	WHERE MU.UserID =@UserID
end

GO
/****** Object:  StoredProcedure [dbo].[usp_getPageRoles]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_getPageRoles]
@rolesID int
as

begin

select * from MTDMenuSave ms where ms.RID  =@rolesID
end

GO
/****** Object:  StoredProcedure [dbo].[Usp_getSubuserbyUserID]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Usp_getSubuserbyUserID]      
      
@Menuid int ,
@role int      
   
as       
      
begin    
    
SELECT    
 *,MS.SubmenuName,MS.SubMenuURL    
FROM MTDSubMenuSave    
inner JOIN MTDSubMenu MS ON MTDSubMenuSave.SubMenuID =MS.SubmenuID    
WHERE MTDSubMenuSave.MainMenuID =@Menuid  
and MTDSubMenuSave.SubRID =@role

end

GO
/****** Object:  StoredProcedure [dbo].[Usp_getuserbyUserID]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_getuserbyUserID]
@userid bigint

as

begin

select * from dbo.MTDMenuSave m where m.UID=@userid
end

GO
/****** Object:  StoredProcedure [dbo].[Usp_InsertMTDMenu]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_InsertMTDMenu]  
  
@MenuID bigint ,  
@MenuName nvarchar(100) ,  
@MRead int ,  
@MWrite int ,  
@MBoth int ,  
@UID int ,  
@RID int   
    
AS  
BEGIN  

 INSERT INTO MTDMenuSave (  
MenuID,  
MenuName,  
MRead,  
MWrite,  
MBoth,  
UID,  
RID  
  )  
 VALUES (  
    
@MenuID,  
@MenuName,  
@MRead,  
@MWrite,  
@MBoth,  
@UID,  
@RID  
  
  )  
  end

GO
/****** Object:  StoredProcedure [dbo].[Usp_InsertMTDSubMenu]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_InsertMTDSubMenu]  
  
@SubMenuID bigint ,  
@SubMenuName nvarchar(100) ,  
@SubMRead int ,  
@SubMWrite int ,  
@SubMBoth int ,  
@SubUID int ,  
@SubRID int ,  
@MainMenuID int  
    
AS  
BEGIN  



 INSERT INTO MTDSubMenuSave (  
SubMenuID  ,  
SubMenuName ,  
SubMRead  ,  
SubMWrite  ,  
SubMBoth  ,  
SubUID  ,  
SubRID  ,  
MainMenuID   
  )  
 VALUES (  
    
@SubMenuID  ,  
@SubMenuName ,  
@SubMRead  ,  
@SubMWrite  ,  
@SubMBoth  ,  
@SubUID  ,  
@SubRID  ,  
@MainMenuID   
  
  )  
  
END

GO
/****** Object:  StoredProcedure [dbo].[Usp_MTDgetMenu]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc  [dbo].[Usp_MTDgetMenu]

as



begin

select * , MR.RolesName as RolesName from MTDMenu MD  inner join MTDroles MR on MD.RoleID = MR.RolesID

Select * from MTDroles

end

GO
/****** Object:  StoredProcedure [dbo].[Usp_MTDGetMenuByRoles]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create  proc [dbo].[Usp_MTDGetMenuByRoles]
@roleID int
as

begin

Select * from MTDMenu where MTDMenu.RoleID = @roleID
End

GO
/****** Object:  StoredProcedure [dbo].[Usp_MTDgetroles]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc  [dbo].[Usp_MTDgetroles]

as

begin

select * from MTDroles
end

GO
/****** Object:  StoredProcedure [dbo].[Usp_MTDgetSubMenu]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_MTDgetSubMenu]
AS
BEGIN
	SELECT MS.SubmenuName
		,MS.SubMenuURL AS SubMenuURL
		,MS.SubmenuID
		,MR.RolesName AS RolesName
		,MM.MenuName AS MenuName
	FROM MTDSubMenu MS
	INNER JOIN MTDMenu MM ON MS.RoleID = MM.RoleID and MS.MenuID = MM.MenuID
	INNER JOIN MTDroles MR ON MS.RoleID = MR.RolesID
END

GO
/****** Object:  StoredProcedure [dbo].[Usp_MTDgetSubMenuBymenu]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Usp_MTDgetSubMenuBymenu]

@MenuID int ,
@role int
as 

begin

select 
SubmenuID,
Rtrim(lTrim(SubmenuName)) as SubmenuName,
Rtrim(lTrim(SubMenuURL)) as  SubMenuURL
from MTDSubMenu where MTDSubMenu.MenuID = @MenuID
and MTDSubMenu.RoleID =@role
end

GO
/****** Object:  StoredProcedure [dbo].[Usp_MTDMTDMenuInsert]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Usp_MTDMTDMenuInsert]
@MenuName Nvarchar(200),
@MenuURL Nvarchar(2000),
@RoleID int
as 

begin
insert into MTDMenu
(
MenuName,
MenuURL,
RoleID
)

values 
(
@MenuName,
@MenuURL,
@RoleID
)


end

GO
/****** Object:  StoredProcedure [dbo].[Usp_MTDMTDMTDSubMenuInsert]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Usp_MTDMTDMTDSubMenuInsert]

@SubmenuName	nvarchar(200)	,
@SubMenuURL	nvarchar(MAX)	,
@MenuID	int	,
@RoleID	int	

as 



begin

insert into MTDSubMenu

(

SubmenuName,
SubMenuURL		,
MenuID		,
RoleID		

)



values 

(
@SubmenuName,
@SubMenuURL		,
@MenuID		,
@RoleID		


)





end

GO
/****** Object:  StoredProcedure [dbo].[Usp_Submenu]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_Submenu]      
---exec Usp_Submenu  1,1     
@userID bigint ,      
@MenuID bigint      
as      
begin      
      
      
select MD.SubmenuName,MD.SubMenuURL,cast(MD.MenuID AS Nvarchar(10))+'S' as subMenuIDx ,MD.MenuID from dbo.MTDSubMenu MD       
where MD.MenuID =@MenuID    
      
      
end

GO
/****** Object:  StoredProcedure [dbo].[Usp_UpdateMTDMenu]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_UpdateMTDMenu]  
  
@MenuID bigint ,  
@MenuName nvarchar(100) ,  
@MRead int ,  
@MWrite int ,  
@MBoth int ,  
@UID int ,  
@RID int   
    
AS  
BEGIN  
 update MTDMenuSave
 set    
MRead =@MRead,  
MWrite=@MWrite,  
MBoth=@MBoth 
 where MenuID = @MenuID
select 'recordupdated'
END

GO
/****** Object:  StoredProcedure [dbo].[Usp_UpdateMTDSubMenu]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_UpdateMTDSubMenu]    
    
@SubMenuID bigint ,    
@SubMenuName nvarchar(100) ,    
@SubMRead int ,    
@SubMWrite int ,    
@SubMBoth int ,    
@SubUID int ,    
@SubRID int ,    
@MainMenuID int    
      
AS    
BEGIN    
update MTDSubMenuSave set    
SubMRead =@SubMRead ,    
SubMWrite =@SubMWrite ,    
SubMBoth  =@SubMBoth    
 where MTDSubMenuSave.SubRID =@SubRID  
 and MTDSubMenuSave.SubUID =@SubRID
 and MTDSubMenuSave.MainMenuID =@MainMenuID
END

GO
/****** Object:  StoredProcedure [dbo].[usp_updateuserRole]    Script Date: 11/25/2016 9:50:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_updateuserRole]  
@RoleID bigint,  
@UserID bigint  
as  
  
begin
  
  
  IF exists (SELECT
	m.UserID
FROM MTDUsers m
WHERE m.RoleID = @RoleID
AND m.UserID = @UserID)
  begin
SELECT
	'Already assign'
  

  end
  else
  begin
UPDATE MTDUsers
SET MTDUsers.RoleID = @RoleID
WHERE UserID = @UserID
SELECT
	'Updated Successfully'
  

end

end

GO
USE [master]
GO
ALTER DATABASE [FarmManager] SET  READ_WRITE 
GO
