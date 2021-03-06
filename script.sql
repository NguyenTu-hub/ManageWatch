USE [master]
GO
/****** Object:  Database [ManageWatch]    Script Date: 12/10/2020 6:23:21 AM ******/
CREATE DATABASE [ManageWatch]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ManageWatch', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ManageWatch.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ManageWatch_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ManageWatch_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ManageWatch] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ManageWatch].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ManageWatch] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ManageWatch] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ManageWatch] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ManageWatch] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ManageWatch] SET ARITHABORT OFF 
GO
ALTER DATABASE [ManageWatch] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ManageWatch] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ManageWatch] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ManageWatch] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ManageWatch] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ManageWatch] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ManageWatch] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ManageWatch] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ManageWatch] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ManageWatch] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ManageWatch] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ManageWatch] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ManageWatch] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ManageWatch] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ManageWatch] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ManageWatch] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ManageWatch] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ManageWatch] SET RECOVERY FULL 
GO
ALTER DATABASE [ManageWatch] SET  MULTI_USER 
GO
ALTER DATABASE [ManageWatch] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ManageWatch] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ManageWatch] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ManageWatch] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ManageWatch] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ManageWatch', N'ON'
GO
USE [ManageWatch]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/10/2020 6:23:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [varchar](30) NOT NULL,
	[Password] [varchar](16) NULL,
	[Images] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 12/10/2020 6:23:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bill](
	[IdBill] [varchar](10) NOT NULL,
	[IdCustomer] [char](10) NULL,
	[OrderDate] [smalldatetime] NULL,
	[DeliveryDate] [smalldatetime] NULL,
	[FullName] [nvarchar](20) NULL,
	[Address_rec] [nvarchar](30) NULL,
	[PhoneNumber] [varchar](15) NULL,
	[TotalAmount] [money] NULL,
 CONSTRAINT [PK__Bill__24A2D64DC389A7DA] PRIMARY KEY CLUSTERED 
(
	[IdBill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 12/10/2020 6:23:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Brand](
	[IdBrand] [varchar](10) NOT NULL,
	[Name] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdBrand] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Caterogy]    Script Date: 12/10/2020 6:23:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Caterogy](
	[IdCaterogy] [char](10) NOT NULL,
	[NameCaterogy] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCaterogy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/10/2020 6:23:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[MaKH] [char](10) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[PhoneNumber] [varchar](10) NULL,
	[UserName] [varchar](15) NULL,
	[Password] [varchar](15) NULL,
	[DateBorn] [smalldatetime] NULL,
	[Sex] [bit] NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK__Customer__2725CF1E9D826176] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Detail_Bill]    Script Date: 12/10/2020 6:23:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Detail_Bill](
	[IdBill] [varchar](10) NOT NULL,
	[idProduct] [char](10) NULL,
	[price] [money] NULL,
	[Amount] [int] NULL,
 CONSTRAINT [PK__Detail_B__24A2D64DBF907A73] PRIMARY KEY CLUSTERED 
(
	[IdBill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/10/2020 6:23:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [char](10) NOT NULL,
	[NamePrduct] [nvarchar](100) NULL,
	[Price] [decimal](18, 0) NULL,
	[Dcription] [ntext] NULL,
	[Amount] [int] NULL,
	[Images] [text] NULL,
	[IDCaterogy] [char](10) NULL,
	[IDBrand] [varchar](10) NULL,
 CONSTRAINT [PK__Product__3214EC278AE4815B] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Account] ([Username], [Password], [Images]) VALUES (N'Admin123@gmail.com', N'123', N'https://static.wikia.nocookie.net/9de6fe70-1dc1-40aa-bf1f-0f6a74344bef')
INSERT [dbo].[Brand] ([IdBrand], [Name]) VALUES (N'Elle', N'Elle')
INSERT [dbo].[Brand] ([IdBrand], [Name]) VALUES (N'IC', N'ICE WATCH')
INSERT [dbo].[Brand] ([IdBrand], [Name]) VALUES (N'MVMT', N'MVMT')
INSERT [dbo].[Brand] ([IdBrand], [Name]) VALUES (N'RL', N'RoLex')
INSERT [dbo].[Brand] ([IdBrand], [Name]) VALUES (N'RM', N'ROAMER')
INSERT [dbo].[Brand] ([IdBrand], [Name]) VALUES (N'RT', N'ROTARY')
INSERT [dbo].[Caterogy] ([IdCaterogy], [NameCaterogy]) VALUES (N'FEMALE    ', N'Nữ')
INSERT [dbo].[Caterogy] ([IdCaterogy], [NameCaterogy]) VALUES (N'MALE      ', N'Nam')
INSERT [dbo].[Product] ([ID], [NamePrduct], [Price], [Dcription], [Amount], [Images], [IDCaterogy], [IDBrand]) VALUES (N'ELLE01    ', N'Đồng hồ Nữ ELLE - ELL21001 - Dây Kim Loại', CAST(20000000 AS Decimal(18, 0)), N'Đồng Hồ Nữ Elle - ELL21001 - Dây Kim Loại
-Thương hiêu: Elle
-Bộ Sưu Tập: FALL
-Mã sản phẩm: ELL21001
-Xuất xứ: PHÁP
-Giới tính: Nữ
-Dây Kim Loại
-Bảo hành quốc tế: Máy 02 năm, Pin 01 năm
-Kính Khoáng
-Đường kính mặt số: 22mm
-Chất liệu vỏ: Thép không gỉ
-Màu Dây: Bạc
-Chống nước: 3ATM
-Chức năng: Pin (Quartz)/3 Kim', 10, N'https://product.hstatic.net/1000193894/product/elle_el20327b01m_large.jpg', N'FEMALE    ', N'Elle')
INSERT [dbo].[Product] ([ID], [NamePrduct], [Price], [Dcription], [Amount], [Images], [IDCaterogy], [IDBrand]) VALUES (N'ELLE02    ', N'Đồng hồ Nữ ELLE - ELL21007 - Dây Da', CAST(17000000 AS Decimal(18, 0)), N'Đồng Hồ Nữ Elle - ELL21007 - Dây Da
-Thương hiêu: Elle
-Bộ Sưu Tập: FALL
-Mã sản phẩm: ELL21007
-Xuất xứ: PHÁP
-Giới tính: Nữ
-Dây Da
-Bảo hành quốc tế: Máy 02 năm, Pin 01 năm
-Kính Khoáng
-Đường kính mặt số: 26mm
-Chất liệu vỏ: Thép không gỉ
-Màu Dây: Xanh
-Chống nước: 3ATM
-Chức năng: Pin (Quartz)/3 Kim', 6, N'https://shopdongho.com/wp-content/uploads/2018/09/dong-ho-elle-es20054b02x-nu-pin-day-inox-a.jpg', N'FEMALE    ', N'Elle')
INSERT [dbo].[Product] ([ID], [NamePrduct], [Price], [Dcription], [Amount], [Images], [IDCaterogy], [IDBrand]) VALUES (N'ELLE03    ', N'ĐỒNG HỒ NỮ ELLE - ELL21020 - DÂY KIM LOẠI', CAST(24000000 AS Decimal(18, 0)), N'Đồng Hồ Nữ Elle - ELL21020 - Dây Kim Loại
-Thương hiêu: Elle
-Bộ Sưu Tập: FALL
-Mã sản phẩm: ELL21020
-Xuất xứ: PHÁP
-Giới tính: Nữ
-Dây Kim Loại
-Bảo hành quốc tế: Máy 02 năm, Pin 01 năm
-Kính Khoáng
-Đường kính mặt số: 32mm
-Chất liệu vỏ: Thép không gỉ
-Màu Dây: Bạc
-Chống nước: 3ATM
-Chức năng: Pin (Quartz)/3 Kim', 7, N'https://product.hstatic.net/1000269795/product/upload_908f1f1d6f8249e58abb39e0be652303_master.jpg', N'FEMALE    ', N'Elle')
INSERT [dbo].[Product] ([ID], [NamePrduct], [Price], [Dcription], [Amount], [Images], [IDCaterogy], [IDBrand]) VALUES (N'ELLE04    ', N'ĐỒNG HỒ NỮ ELLE - ELL21018 - DÂY KIM LOẠI', CAST(23000000 AS Decimal(18, 0)), N'Đồng Hồ Nữ Elle - ELL21018 - Dây Kim Loại
-Thương hiêu: Elle
-Bộ Sưu Tập: FALL
-Mã sản phẩm: ELL21018
-Xuất xứ: PHÁP
-Giới tính: Nữ
-Dây Kim Loại
-Bảo hành quốc tế: Máy 02 năm, Pin 01 năm
-Kính Khoáng
-Đường kính mặt số: 23mm', 6, N'https://product.hstatic.net/200000126361/product/ell21018_c8236e25f10f45119b49c6ad7f1c90d7_4d88b17699e24674a486bd8ff1ec3793_1024x1024.jpg', N'FEMALE    ', N'Elle')
INSERT [dbo].[Product] ([ID], [NamePrduct], [Price], [Dcription], [Amount], [Images], [IDCaterogy], [IDBrand]) VALUES (N'IC01      ', N'ĐỒNG HỒ NAM ICE WATCH - 000133 - DÂY SILICONE', CAST(23200000 AS Decimal(18, 0)), N'Đồng Hồ Nam ICE WATCH - 000133 - Dây Silicone
-Thương hiêu: 000133
-Bộ Sưu Tập: ICE forever
-Mã sản phẩm: 000133
-Xuất xứ: Bỉ
-Giới tính: Nam
-Kính Khoáng
-Bảo hành quốc tế: Máy 02 năm, Pin 01 năm
-Dây Silicone
-Đường kính mặt số: 40MM
-Chất liệu vỏ: Nhựa
-Màu Dây: Đen
-Chống nước: 10ATM
-Chức năng: 3 Kim, Ngày', 6, N'https://cf.shopee.vn/file/cb90366c7b213fe512451ef8d8d51cfb', N'MALE      ', N'IC')
INSERT [dbo].[Product] ([ID], [NamePrduct], [Price], [Dcription], [Amount], [Images], [IDCaterogy], [IDBrand]) VALUES (N'IC02      ', N'ĐỒNG HỒ NAM ICE WATCH - 007265 - DÂY SILICONE', CAST(20000000 AS Decimal(18, 0)), N'Đồng Hồ Nam ICE WATCH - 007265 - Dây Silicone
-Thương hiêu: 007265
-Bộ Sưu Tập: ICE sixty nine
-Mã sản phẩm: 007265
-Xuất xứ: Bỉ
-Giới tính: Nam
-Kính Khoáng
-Bảo hành quốc tế: Máy 02 năm, Pin 01 năm
-Dây Silicone
-Đường kính mặt số: 44MM', 6, N'https://cdn.tgdd.vn/Products/Images/7264/201423/ice-ice007265-den-6-org.jpg', N'MALE      ', N'IC')
INSERT [dbo].[Product] ([ID], [NamePrduct], [Price], [Dcription], [Amount], [Images], [IDCaterogy], [IDBrand]) VALUES (N'IC05      ', N'ĐỒNG HỒ NAM ICE WATCH - 013618 - DÂY SILICONE', CAST(23000000 AS Decimal(18, 0)), N'không có', 5, N'https://salt.tikicdn.com/cache/280x280/ts/product/4b/57/85/c76800e3c9e01f6e9971974713c8c4f7.jpg', N'MALE      ', N'IC')
INSERT [dbo].[Product] ([ID], [NamePrduct], [Price], [Dcription], [Amount], [Images], [IDCaterogy], [IDBrand]) VALUES (N'RM01      ', N'ROAMER 709856411207 DÂY DA', CAST(42000000 AS Decimal(18, 0)), N'Đồng Hồ Nam Roamer 709856 41 12 07 Dây DaThương hiêu: RoamerBộ Sưu Tập: Classic Line GentsMã sản phẩm: 709856 41 12 07Xuất xứ: Thụy SĩGiới tính: NamDây DaBảo hành quốc tế: Máy 02 năm, Pin 01 nămKính SapphireĐường kính mặt số: 40 mmChất liệu vỏ: Thép không gỉMàu Dây: ĐenChống nước: 5 ATMChức năng: 3 Kim, Ngày', 10, N'https://roamerwatch.vn/uploads/products/roamer-709856-41-22-07.png', N'MALE      ', N'RM')
INSERT [dbo].[Product] ([ID], [NamePrduct], [Price], [Dcription], [Amount], [Images], [IDCaterogy], [IDBrand]) VALUES (N'RM02      ', N'ROAMER - 101663 41 55 05N - DÂY DA', CAST(14152000 AS Decimal(18, 0)), N'Đồng Hồ Nam Roamer 709856 41 12 07 Dây Da
Thương hiêu: Roamer
Bộ Sưu Tập: Classic Line Gents
Mã sản phẩm: 709856 41 12 07
Xuất xứ: Thụy Sĩ
Giới tính: Nam
Dây Da
Bảo hành quốc tế: Máy 02 năm, Pin 01 năm
Kính Sapphire
Đường kính mặt số: 40 mm
Chất liệu vỏ: Thép không gỉ
Màu Dây: Đen
Chống nước: 5 ATM
Chức năng: 3 Kim, Ngày', 4, N'https://product.hstatic.net/200000126361/product/101663_41_55_05_cdca506b9f854bcc86b8a2938dd4baaf_59b2e824e1d54b29a0ca4c7bc215970c.png', N'MALE      ', N'RM')
INSERT [dbo].[Product] ([ID], [NamePrduct], [Price], [Dcription], [Amount], [Images], [IDCaterogy], [IDBrand]) VALUES (N'RM03      ', N'ĐỒNG HỒ NAM ROAMER - 101663 47 15 10 - DÂY KIM LOẠI', CAST(17904000 AS Decimal(18, 0)), N'Đồng Hồ Nam Roamer 709856 41 12 07 Dây Da
Thương hiêu: Roamer
Bộ Sưu Tập: Classic Line Gents
Mã sản phẩm: 709856 41 12 07
Xuất xứ: Thụy Sĩ
Giới tính: Nam
Dây Da
Bảo hành quốc tế: Máy 02 năm, Pin 01 năm
Kính Sapphire
Đường kính mặt số: 40 mm
Chất liệu vỏ: Thép không gỉ
Màu Dây: Đen
Chống nước: 5 ATM
Chức năng: 3 Kim, Ngày', 3, N'https://product.hstatic.net/200000126361/product/roamer-101663-47-15-10_ca46c31733514170b72016240348da53_bd4d65bd2c0f4ac98ecb87858839ff24_1024x1024.png', N'MALE      ', N'RM')
INSERT [dbo].[Product] ([ID], [NamePrduct], [Price], [Dcription], [Amount], [Images], [IDCaterogy], [IDBrand]) VALUES (N'RT01      ', N'ĐỒNG HỒ NAM ROTARY - GB05131/05 - DÂY KIM LOẠI', CAST(20000000 AS Decimal(18, 0)), N'Đồng Hồ Nam Rotary - GB05131/05 - Dây Kim Loại
-Thương hiêu: Rotary
-Bộ Sưu Tập: Henley
-Mã sản phẩm: GB05131/05
-Xuất xứ: Vương Quốc Anh
-Giới tính: Nam
-Dây Kim Loại
-Bảo hành quốc tế: Máy 02 năm, Pin 01 năm
-Kính Sapphire
-Đường kính mặt số: 41.5 mm
-Chất liệu vỏ: Thép không gỉ
-Màu Dây: Demi (Bạc-Vàng)
-Chống nước: 10 ATM', 10, N'https://product.hstatic.net/200000126361/product/gb05092-53_ccc36331556a434dace195e298f20a29_80c2b33416d5437685f054f30bb69694_1024x1024.jpg', N'MALE      ', N'RT')
/****** Object:  StoredProcedure [dbo].[sp_Account_Login]    Script Date: 12/10/2020 6:23:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Account_Login] @Username VARCHAR(30), @Password VARCHAR(30)
AS
BEGIN
DECLARE @Count INT
DECLARE @Res BIT
 SET @Count=(SELECT COUNT(*) FROM dbo.Account WHERE Username=@Username AND Password=@Password)
IF(@Count>0)
SET @Res=1
ELSE
SET @Res=0
SELECT @Res
END

GO
USE [master]
GO
ALTER DATABASE [ManageWatch] SET  READ_WRITE 
GO
