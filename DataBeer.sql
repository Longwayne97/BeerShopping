USE [master]
GO
/****** Object:  Database [BeerData]    Script Date: 22/2/2024 8:38:42 PM ******/
CREATE DATABASE [BeerData]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BeerData', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BeerData.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BeerData_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BeerData_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BeerData] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BeerData].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BeerData] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BeerData] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BeerData] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BeerData] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BeerData] SET ARITHABORT OFF 
GO
ALTER DATABASE [BeerData] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BeerData] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BeerData] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BeerData] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BeerData] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BeerData] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BeerData] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BeerData] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BeerData] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BeerData] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BeerData] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BeerData] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BeerData] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BeerData] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BeerData] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BeerData] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BeerData] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BeerData] SET RECOVERY FULL 
GO
ALTER DATABASE [BeerData] SET  MULTI_USER 
GO
ALTER DATABASE [BeerData] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BeerData] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BeerData] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BeerData] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BeerData] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BeerData] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BeerData', N'ON'
GO
ALTER DATABASE [BeerData] SET QUERY_STORE = ON
GO
ALTER DATABASE [BeerData] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BeerData]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 22/2/2024 8:38:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[idChiTiet] [int] IDENTITY(1,1) NOT NULL,
	[idDonHang] [int] NULL,
	[idSanPham] [int] NULL,
	[SoLuongChiTiet] [int] NULL,
	[ThanhTien] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[idChiTiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 22/2/2024 8:38:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[idDonHang] [int] IDENTITY(1,1) NOT NULL,
	[tenTK] [varchar](15) NULL,
	[NgayDatHang] [datetime] NULL,
	[TongTienDonHang] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[idDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 22/2/2024 8:38:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[tenTK] [varchar](15) NOT NULL,
	[passTK] [varchar](max) NULL,
	[hotenTK] [nvarchar](255) NULL,
	[ngaySinhTK] [date] NULL,
	[gioiTinhTK] [bit] NULL,
	[sdtTK] [varchar](10) NULL,
	[emailTK] [varchar](100) NULL,
	[diachiTK] [nvarchar](255) NULL,
	[RoleKhachHang] [bit] NULL,
	[hinhTK] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[tenTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NoiSanXuat]    Script Date: 22/2/2024 8:38:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NoiSanXuat](
	[idNSX] [varchar](20) NOT NULL,
	[tenNSX] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idNSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 22/2/2024 8:38:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[idSanPham] [int] IDENTITY(1,1) NOT NULL,
	[tenSanPham] [nvarchar](max) NULL,
	[giaSanPham] [decimal](18, 2) NULL,
	[hinhSanPham] [varchar](max) NULL,
	[soLuongSanPham] [int] NULL,
	[mieuTaSanPham] [nvarchar](max) NULL,
	[nongDoSanPham] [varchar](10) NULL,
	[idNSX] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[idSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietDonHang] ON 

INSERT [dbo].[ChiTietDonHang] ([idChiTiet], [idDonHang], [idSanPham], [SoLuongChiTiet], [ThanhTien]) VALUES (50, 56, 13, 1, CAST(335000.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonHang] ([idChiTiet], [idDonHang], [idSanPham], [SoLuongChiTiet], [ThanhTien]) VALUES (51, 57, 1, 5, CAST(1350000.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonHang] ([idChiTiet], [idDonHang], [idSanPham], [SoLuongChiTiet], [ThanhTien]) VALUES (55, 60, 1, 1, CAST(270000.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonHang] ([idChiTiet], [idDonHang], [idSanPham], [SoLuongChiTiet], [ThanhTien]) VALUES (56, 61, 2, 1, CAST(290000.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonHang] ([idChiTiet], [idDonHang], [idSanPham], [SoLuongChiTiet], [ThanhTien]) VALUES (57, 62, 2, 1, CAST(290000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[ChiTietDonHang] OFF
GO
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([idDonHang], [tenTK], [NgayDatHang], [TongTienDonHang]) VALUES (56, N'philongwayne', CAST(N'2024-02-22T00:00:00.000' AS DateTime), CAST(605000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHang] ([idDonHang], [tenTK], [NgayDatHang], [TongTienDonHang]) VALUES (57, N'philongwayne', CAST(N'2024-02-22T00:00:00.000' AS DateTime), CAST(1350000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHang] ([idDonHang], [tenTK], [NgayDatHang], [TongTienDonHang]) VALUES (60, N'philongwayne', CAST(N'2024-02-22T00:00:00.000' AS DateTime), CAST(540000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHang] ([idDonHang], [tenTK], [NgayDatHang], [TongTienDonHang]) VALUES (61, N'philongwayne', CAST(N'2024-02-22T00:00:00.000' AS DateTime), CAST(560000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHang] ([idDonHang], [tenTK], [NgayDatHang], [TongTienDonHang]) VALUES (62, N'philongwayne', CAST(N'2024-02-22T00:00:00.000' AS DateTime), CAST(560000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[DonHang] OFF
GO
INSERT [dbo].[KhachHang] ([tenTK], [passTK], [hotenTK], [ngaySinhTK], [gioiTinhTK], [sdtTK], [emailTK], [diachiTK], [RoleKhachHang], [hinhTK]) VALUES (N'philong14410', N'$2a$10$GBki53jTngos1iA3aZY4Cu6kja8Mxd8Zxc5jgKZzP6KMTdIUc0mKK', N'Nguyễn Hồng Phi Ngựa', CAST(N'1998-02-19' AS Date), 1, N'0961354183', N'philong14410@gmail.com', N'Hóc Môn,TP Hồ Chí Minh', 0, N'tri.jpg')
INSERT [dbo].[KhachHang] ([tenTK], [passTK], [hotenTK], [ngaySinhTK], [gioiTinhTK], [sdtTK], [emailTK], [diachiTK], [RoleKhachHang], [hinhTK]) VALUES (N'philongwayne', N'$2a$10$wD/yJK/8n.iV4h/zgXfAtu5khyhUPHB.UI/CwzVU7ngM1Bho5KaUe', N'Nguyễn Hồng Phi Long', CAST(N'1997-02-20' AS Date), 1, N'0961354192', N'philongwayne@gmail.com', N'E10/19A Thới Hoà', 1, N'philong.jpg')
GO
INSERT [dbo].[NoiSanXuat] ([idNSX], [tenNSX]) VALUES (N'BEL', N'Bỉ')
INSERT [dbo].[NoiSanXuat] ([idNSX], [tenNSX]) VALUES (N'GER', N'Đức')
INSERT [dbo].[NoiSanXuat] ([idNSX], [tenNSX]) VALUES (N'MEX', N'Mexico')
INSERT [dbo].[NoiSanXuat] ([idNSX], [tenNSX]) VALUES (N'NED', N'Hà Lan')
INSERT [dbo].[NoiSanXuat] ([idNSX], [tenNSX]) VALUES (N'SIN', N'Singapore')
INSERT [dbo].[NoiSanXuat] ([idNSX], [tenNSX]) VALUES (N'THA', N'Thái Lan')
INSERT [dbo].[NoiSanXuat] ([idNSX], [tenNSX]) VALUES (N'VIE', N'Việt Nam')
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([idSanPham], [tenSanPham], [giaSanPham], [hinhSanPham], [soLuongSanPham], [mieuTaSanPham], [nongDoSanPham], [idNSX]) VALUES (1, N'Thùng bia Sài Gòn Lager 24 Lon x 330ml', CAST(270000.00 AS Decimal(18, 2)), N'sgbeer.jpg', 1493, N'Bia Sài Gòn Lager được sản xuất tại Việt Nam từ nước, malt đại mạch, ngũ cốc và hoa bia. Bia Sài Gòn Lager có hương vị đậm đà, thơm ngon, cùng hương thơm ngũ cốc dễ chịu giúp bạn thăng hoa hơn, sản khoái hơn tỏng những cuộc vui cùng gia đình và bạn bè.', N'5.0%', N'VIE')
INSERT [dbo].[SanPham] ([idSanPham], [tenSanPham], [giaSanPham], [hinhSanPham], [soLuongSanPham], [mieuTaSanPham], [nongDoSanPham], [idNSX]) VALUES (2, N'Thùng bia Sài Gòn Premium 24 Lon x 330ml', CAST(290000.00 AS Decimal(18, 2)), N'biasaigondo.jpg', 392, N'Bia Sài Gòn Export Premium Lon 330ml có nồng độ cồn là 4.8% được sản xuất theo quy trình hiện đại với công thức truyền thống lâu đời, mang đến cho người tiêu dùng trải nghiệm thích thú khi thưởng thức.', N'5.0%', N'VIE')
INSERT [dbo].[SanPham] ([idSanPham], [tenSanPham], [giaSanPham], [hinhSanPham], [soLuongSanPham], [mieuTaSanPham], [nongDoSanPham], [idNSX]) VALUES (3, N'Thùng bia Sài Gòn Chill 330ml x 24 Lon', CAST(380000.00 AS Decimal(18, 2)), N'saigonchillbeer.jpg', 390, N'Giới thiệu Bia Saigon Chill được lên men lạnh ở âm 2 độ C, nhiệt độ cực thấp để giữ vị bia luôn tươi mới.  Cảm giác sảng khoái và hậu vị mát lạnh của Bia Saigon Chill sẽ đánh thức mọi giác quan của bạn, để từng ngụm bia đều mang đến sự sảng khoái tức thì, mang trọn vẹn con người bạn về tận hưởng cuộc vui.', N'4.6%', N'VIE')
INSERT [dbo].[SanPham] ([idSanPham], [tenSanPham], [giaSanPham], [hinhSanPham], [soLuongSanPham], [mieuTaSanPham], [nongDoSanPham], [idNSX]) VALUES (4, N'Thùng bia Hà Nội 24 Lon x 330ml', CAST(276000.00 AS Decimal(18, 2)), N'biahn.jpg', 549, N'Bia Hà Nội Habeco có màu vàng óng, mùi thơm đặc trưng, hương vị đậm đà. Sản phẩm chắc chắn sẽ đem đến cho những buổi tụ tập, liên hoan, hội họp bạn bè thêm phần thú vị.', N'4.6%', N'VIE')
INSERT [dbo].[SanPham] ([idSanPham], [tenSanPham], [giaSanPham], [hinhSanPham], [soLuongSanPham], [mieuTaSanPham], [nongDoSanPham], [idNSX]) VALUES (5, N'Thùng bia Huda 24 Lon x 330ml', CAST(270000.00 AS Decimal(18, 2)), N'huda.jpg', 1, N'Bia Huda Carlsberg​ có màu vàng óng, mùi thơm đặc trưng, hương vị đậm đà, hấp dẫn vị giác. Bên cạnh đó, bia là loại thức uống giàu vitamin B3, B5, axit folid... giúp tái tạo tế bào và có thể ngăn ngừa ung thư ruột kết. Một ly bia mỗi ngày, tương ứng với một lượng cồn vừa phải có thể giúp bạn giảm stress và giảm nguy cơ đau tim, đột quỵ.', N'4.6%', N'VIE')
INSERT [dbo].[SanPham] ([idSanPham], [tenSanPham], [giaSanPham], [hinhSanPham], [soLuongSanPham], [mieuTaSanPham], [nongDoSanPham], [idNSX]) VALUES (6, N'Thùng bia Heineken 24 Lon cao x 330ml', CAST(450000.00 AS Decimal(18, 2)), N'heinekenbeer.png', 16, N'Bia Heineken, hoặc đơn giản là Ken là một loại bia nhẹ có nồng độ cồn 5% được sản xuất bởi công ty sản xuất bia Hà Lan Heineken N.V. Bia Heineken được bán trong chai màu xanh lá cây với một ngôi sao màu đỏ.', N'4.5%', N'NED')
INSERT [dbo].[SanPham] ([idSanPham], [tenSanPham], [giaSanPham], [hinhSanPham], [soLuongSanPham], [mieuTaSanPham], [nongDoSanPham], [idNSX]) VALUES (7, N'Thùng bia Heineken Silver 24 Lon cao x 330ml', CAST(460000.00 AS Decimal(18, 2)), N'heinekensilver.jpg', 3, N'Chất lượng từ thương hiệu bia được ưa chuộng tại hơn 192 quốc gia trên thế giới đến từ Hà Lan. Bia Heineken Silver mang hương vị đặc trưng thơm ngon hương vị bia tuyệt hảo, cân bằng và êm dịu. Bên cạnh đó là thiết kế đẹp mắt, cho người dùng cảm giác sang trọng, nâng tầm đẳng cấp.', N'4.0%', N'NED')
INSERT [dbo].[SanPham] ([idSanPham], [tenSanPham], [giaSanPham], [hinhSanPham], [soLuongSanPham], [mieuTaSanPham], [nongDoSanPham], [idNSX]) VALUES (8, N'Thùng bia Tiger lon cao 330ml x 24 lon', CAST(360000.00 AS Decimal(18, 2)), N'tigerbeer.jpg', 24, N'Bia Tiger nổi tiếng được nhiều người yêu thích, lên men tự nhiên từ các thành phần chính nước, đại mạch, ngũ cốc và hoa bia. Thùng 24 lon bia Tiger nâu 330ml đậm đà thơm ngon cho bạn ly bia hấp dẫn và cảm giác uống sảng khoái', N'5.0%', N'SIN')
INSERT [dbo].[SanPham] ([idSanPham], [tenSanPham], [giaSanPham], [hinhSanPham], [soLuongSanPham], [mieuTaSanPham], [nongDoSanPham], [idNSX]) VALUES (9, N'Thùng bia Tiger Crystal 330ml x 24 lon', CAST(400000.00 AS Decimal(18, 2)), N'tigercrystal.jpg', 10, N'Sản phẩm còn có tên gọi là bia Tiger bạc được sản xuất theo quy trình Cold Suspension làm lạnh sâu đến -1 độ. Thùng 24 lon bia Tiger Bạc 330ml với hoa bia được tinh chế đặc biệt, giữ trọn vẹn hương vị tuyệt hảo của bia. Cam kết bia chính hãng, chất lượng và an toàn', N'4.5%', N'SIN')
INSERT [dbo].[SanPham] ([idSanPham], [tenSanPham], [giaSanPham], [hinhSanPham], [soLuongSanPham], [mieuTaSanPham], [nongDoSanPham], [idNSX]) VALUES (10, N'Thùng bia Corona Extra 24 chai 300ml', CAST(780000.00 AS Decimal(18, 2)), N'coronabeer.jpg', 50, N'Corona Extra là tên một hãng bia lager của công ty Cervecería Modelo, México. Corona là một trong những thương hiệu bia bán chạy nhất trên toàn thế giới. ', N'4.5%', N'MEX')
INSERT [dbo].[SanPham] ([idSanPham], [tenSanPham], [giaSanPham], [hinhSanPham], [soLuongSanPham], [mieuTaSanPham], [nongDoSanPham], [idNSX]) VALUES (11, N'Thùng bia Budweiser 330ml x 24 lon', CAST(410000.00 AS Decimal(18, 2)), N'bud.png', 15, N'Với công nghệ ủ bia trong gỗ sồi suốt 3 tuần, giúp làm sạch men bia trong quá trình trưởng thành và cho ra vị bia thơm ngon độc nhất. Bia Mỹ Budweiser được ủ với mạch nha tốt nhất, gạo, hoa bia và sử dụng một loại men nguyên bản được giữ gìn từ hơn 140 năm về trước. Hương vị tươi mát của bia Budweiser bắt nguồn từ thành phần gạo.', N'5.0%', N'BEL')
INSERT [dbo].[SanPham] ([idSanPham], [tenSanPham], [giaSanPham], [hinhSanPham], [soLuongSanPham], [mieuTaSanPham], [nongDoSanPham], [idNSX]) VALUES (12, N'Thùng bia Chang 330mlx 24 lon', CAST(530000.00 AS Decimal(18, 2)), N'chang.jpg', 3, N'Bia Chang Thái Lan chai 320ml 5% – Thùng 24 chai là một trong những thương hiệu bia số một của Thái Lan. Xuất khẩu đi khắp thế giới trong đó có Việt Nam. Bia Chang từ lâu đã nổi tiếng khắp thế giới với hương vị đặc trưng. Hấp dẫn người sử dụng và dễ uống cho mọi tầng lớp.', N'5.0%', N'THA')
INSERT [dbo].[SanPham] ([idSanPham], [tenSanPham], [giaSanPham], [hinhSanPham], [soLuongSanPham], [mieuTaSanPham], [nongDoSanPham], [idNSX]) VALUES (13, N'Thùng bia Tuborg 330mlx24 lon', CAST(335000.00 AS Decimal(18, 2)), N'tuborg.jpg', 4, N'Thiết kế nổi bật ấn tượng, chắt lọc tinh túy từ năm 1880 từ nguồn nguyên liệu thượng hạng cùng công nghệ sản xuất bia hiện đại. 24 lon bia Tuborg 330ml hương vị thơm ngon hấp dẫn, uống cực sảng khoái. Bia Tuborg cam kết chính hãng, chất lượng và an toàn', N'4.6%', N'VIE')
INSERT [dbo].[SanPham] ([idSanPham], [tenSanPham], [giaSanPham], [hinhSanPham], [soLuongSanPham], [mieuTaSanPham], [nongDoSanPham], [idNSX]) VALUES (14, N'Thùng bia Bia Việt 330mlx24 lon', CAST(240000.00 AS Decimal(18, 2)), N'biaviet.jpg', 4, N'Bia Việt là dòng bia lager mới với 4,3% độ cồn, được nấu từ những nguyên liệu tự nhiên bao gồm nước, đại mạch, hoa bia, ngũ cốc và men bia. Công nghệ lên men lạnh ở nhiệt độ 8 - 10 độ C giúp Bia Việt lưu giữ tinh túy của hoa bia và mang đến cảm giác sảng khoái bất tận khi thưởng thức.', N'4.3%', N'VIE')
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KhachHan__212F0AD728A1DB37]    Script Date: 22/2/2024 8:38:43 PM ******/
ALTER TABLE [dbo].[KhachHang] ADD UNIQUE NONCLUSTERED 
(
	[sdtTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KhachHan__87357634A9753720]    Script Date: 22/2/2024 8:38:43 PM ******/
ALTER TABLE [dbo].[KhachHang] ADD UNIQUE NONCLUSTERED 
(
	[emailTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ((0)) FOR [soLuongSanPham]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([idDonHang])
REFERENCES [dbo].[DonHang] ([idDonHang])
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([idSanPham])
REFERENCES [dbo].[SanPham] ([idSanPham])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([tenTK])
REFERENCES [dbo].[KhachHang] ([tenTK])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([idNSX])
REFERENCES [dbo].[NoiSanXuat] ([idNSX])
GO
USE [master]
GO
ALTER DATABASE [BeerData] SET  READ_WRITE 
GO
