USE [master]
GO
/****** Object:  Database [web_asp]    Script Date: 1/15/2025 2:06:01 PM ******/
CREATE DATABASE [web_asp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'web_asp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\web_asp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'web_asp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\web_asp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [web_asp] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [web_asp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [web_asp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [web_asp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [web_asp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [web_asp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [web_asp] SET ARITHABORT OFF 
GO
ALTER DATABASE [web_asp] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [web_asp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [web_asp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [web_asp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [web_asp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [web_asp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [web_asp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [web_asp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [web_asp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [web_asp] SET  ENABLE_BROKER 
GO
ALTER DATABASE [web_asp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [web_asp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [web_asp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [web_asp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [web_asp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [web_asp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [web_asp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [web_asp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [web_asp] SET  MULTI_USER 
GO
ALTER DATABASE [web_asp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [web_asp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [web_asp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [web_asp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [web_asp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [web_asp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [web_asp] SET QUERY_STORE = ON
GO
ALTER DATABASE [web_asp] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [web_asp]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 1/15/2025 2:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Slug] [nvarchar](255) NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
	[Deleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 1/15/2025 2:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Slug] [nvarchar](255) NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[Deleted] [bit] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 1/15/2025 2:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[UserId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 1/15/2025 2:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 1/15/2025 2:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Avatar] [nvarchar](255) NULL,
	[CategoryId] [int] NULL,
	[ShortDes] [nvarchar](255) NULL,
	[FullDescription] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NULL,
	[PriceDiscount] [decimal](18, 2) NULL,
	[TypeId] [int] NULL,
	[Slug] [nvarchar](255) NULL,
	[BrandId] [int] NULL,
	[Deleted] [bit] NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 1/15/2025 2:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] NOT NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NULL,
	[IsAdmin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (1, N'Apple', N'Apple.png', N'apple', 1, 1, CAST(N'2024-12-18T13:48:35.370' AS DateTime), CAST(N'2024-12-18T13:48:35.370' AS DateTime), 0)
INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (2, N'Samsung', N'Samsung.png', N'samsung', 1, 2, CAST(N'2024-12-18T13:48:35.370' AS DateTime), CAST(N'2024-12-18T13:48:35.370' AS DateTime), 0)
GO
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (0, N'Áo thun', N'aothun.jpg', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1, N'Tai nghe', N'headphone.jpg', N'tai-nghe', 1, 1, 0, CAST(N'2024-12-18T13:48:41.203' AS DateTime), CAST(N'2024-12-18T13:48:41.203' AS DateTime))
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (2, N'Phụ kiện', N'watch.jpg', N'đồng hồ', 1, 2, 0, CAST(N'2024-12-18T13:48:41.203' AS DateTime), CAST(N'2024-12-18T13:48:41.203' AS DateTime))
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (4, N'Quần', N'jeans.jpg', N'quầnn', 1, 4, 0, CAST(N'2024-12-18T13:48:41.203' AS DateTime), CAST(N'2024-12-18T13:48:41.203' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (1, N'DonHang-20250108133754', 0, 17, CAST(N'2025-01-08T13:37:54.297' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (2, N'DonHang-20250108133802', 0, 17, CAST(N'2025-01-08T13:38:02.903' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (3, N'DonHang-20250108153938', 0, 17, CAST(N'2025-01-08T15:39:38.793' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (4, N'DonHang-20250114184038', 0, 17, CAST(N'2025-01-14T18:40:38.347' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (5, N'DonHang-20250115135648', 12, 17, CAST(N'2025-01-15T13:56:48.027' AS DateTime))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1, 1, 4, 2)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (2, 2, 1, 2)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (3, 3, 5, 9)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (4, 4, 4, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (5, 5, 3, 2)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (0, N'Áo thun', N'OIP.jpg', 0, N'Áo thun xám', N'Áo thun là món đồ thời trang không thể thiếu trong tủ đồ của bất kỳ ai. Với chất liệu cotton mềm mại, thấm hút mồ hôi tốt, áo thun mang lại cảm giác thoáng mát và dễ chịu cả ngày dài. Thiết kế đơn giản nhưng đa dạng về màu sắc và họa tiết, áo thun phù hợp cho mọi dịp, từ đi làm, đi chơi, cho đến các buổi dạo phố cùng bạn bè.', CAST(100000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1, N'Tai nghe', N'headphone.jpg', 1, N'Tai nghe không dây', N'Tai nghe là phụ kiện không thể thiếu cho những ai yêu thích âm nhạc và công nghệ. Với thiết kế hiện đại, nhỏ gọn, tai nghe mang lại sự tiện lợi tối đa khi sử dụng, dù là trong các buổi tập luyện, học tập hay thư giãn. Âm thanh sống động, chân thực cùng khả năng chống ồn vượt trội giúp bạn tận hưởng trọn vẹn từng giai điệu.', CAST(1000.00 AS Decimal(18, 2)), CAST(900.00 AS Decimal(18, 2)), 1, N'tai-nghe', 1, 0, 1, 1, CAST(N'2024-12-18T13:48:56.000' AS DateTime), CAST(N'2024-12-18T13:48:56.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (3, N'Áo thun', N'tshirt.jpg', 0, N'Áo thun ', N'Áo thun là món đồ thời trang không thể thiếu trong tủ đồ của bất kỳ ai. Với chất liệu cotton mềm mại, thấm hút mồ hôi tốt, áo thun mang lại cảm giác thoáng mát và dễ chịu cả ngày dài. Thiết kế đơn giản nhưng đa dạng về màu sắc và họa tiết, áo thun phù hợp cho mọi dịp, từ đi làm, đi chơi, cho đến các buổi dạo phố cùng bạn bè.', CAST(1200.00 AS Decimal(18, 2)), CAST(1100.00 AS Decimal(18, 2)), 1, N'ao-thun', 1, 0, 1, 3, CAST(N'2024-12-18T13:48:56.600' AS DateTime), CAST(N'2024-12-18T13:48:56.600' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (4, N'Đồng hồ', N'watch.jpg', 2, N'Đồng hồ thông minh', N'Đồng hồ thông minh là sự kết hợp hoàn hảo giữa công nghệ và thời trang, mang đến cho bạn một trải nghiệm hoàn toàn mới trong việc quản lý cuộc sống hàng ngày. Với thiết kế sang trọng, mỏng nhẹ và đa dạng màu sắc, đồng hồ thông minh phù hợp cho mọi lứa tuổi và phong cách.', CAST(50.00 AS Decimal(18, 2)), CAST(45.00 AS Decimal(18, 2)), 1, N'logitech-mouse', 2, 0, 1, 4, CAST(N'2024-12-18T13:48:56.600' AS DateTime), CAST(N'2024-12-18T13:48:56.600' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (5, N'Giày', N'shoe.jpg', 2, N'Giày thể thao phong cách, bền bỉ và thoải mái.', N' Đôi giày này kết hợp giữa thiết kế thời thượng và chất liệu cao cấp, mang lại sự thoải mái và độ bền vượt trội. Với đế giày được thiết kế chống trượt và đàn hồi tốt, sản phẩm thích hợp cho các hoạt động hàng ngày và thể thao.', CAST(1500.00 AS Decimal(18, 2)), CAST(1300.00 AS Decimal(18, 2)), 1, N'sneakers', 3, 0, 1, 5, CAST(N'2024-12-25T00:00:00.000' AS DateTime), CAST(N'2024-12-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (6, N'Balo', N'bag.jpg', 2, N'Balo siêu sịn', N'Balo là loại túi đeo sau lưng, thiết kế tiện lợi với hai dây đeo vai điều chỉnh được, giúp phân tán trọng lượng đều. ', CAST(2000.00 AS Decimal(18, 2)), CAST(1800.00 AS Decimal(18, 2)), 1, N'bag', 4, 0, 1, 6, CAST(N'2024-12-25T00:00:00.000' AS DateTime), CAST(N'2024-12-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (7, N'Áo khoác ', N'jacket.jpg', 0, N'Áo khoác', N'Áo khoác ấm áp, phong cách mùa dông.', CAST(2500.00 AS Decimal(18, 2)), CAST(2200.00 AS Decimal(18, 2)), 1, N'jacket', 1, 0, 1, 7, CAST(N'2024-12-25T00:00:00.000' AS DateTime), CAST(N'2024-12-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (9, N'Quần dài', N'quan.jpg', 4, N'Quần dài', N'Quần là trang phục che phần thân dưới, thiết kế với hai ống quần dành cho mỗi chân.', CAST(500.00 AS Decimal(18, 2)), CAST(450.00 AS Decimal(18, 2)), 1, N'cap', 1, 0, 1, 9, CAST(N'2024-12-25T00:00:00.000' AS DateTime), CAST(N'2024-12-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (10, N'Quần', N'jeans.jpg', 4, N'Quần', N'Quần là trang phục che phần thân dưới, thiết kế với hai ống quần dành cho mỗi chân.', CAST(15000.00 AS Decimal(18, 2)), CAST(14000.00 AS Decimal(18, 2)), 1, N'laptop', 8, 0, 1, 10, CAST(N'2024-12-25T00:00:00.000' AS DateTime), CAST(N'2024-12-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (1, N'John', N'Doe', N'john.doe@example.com', N'password123', 1)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (2, N'Jane', N'Smith', N'jane.smith@example.com', N'password123', 0)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (4, N'Huy', N'Nguyen', N'quanghuyyy0402@gmail.com', N'338ce9f1d8cbbe2d669f6fadc6add8bb', 1)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (6, N'Huyy', N'Nguyen', N'quanghuy12@gmail.com', N'338ce9f1d8cbbe2d669f6fadc6add8bb', 0)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (7, N'Huy', N'Nguyen', N'quanghuy3@gmail.com', N'338ce9f1d8cbbe2d669f6fadc6add8bb', NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (8, N'Huy', N'Nguyen', N'quanghuyyy6@gmail.com', N'b8dc042d8cf7deefb0ec6a264c930b02', NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (9, N'Huy', N'Nguyen', N'quangaa@gmail.com', N'0b4e7a0e5fe84ad35fb5f95b9ceeac79', NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (10, N'Huy', N'Nguyen', N'quangaaaaaa@gmail.com', N'0b4e7a0e5fe84ad35fb5f95b9ceeac79', NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (11, N'Huy', N'Nguyen', N'quanghuy777@gmail.com', N'338ce9f1d8cbbe2d669f6fadc6add8bb', NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (12, N'Huy', N'Nguyen', N'quanghuy678@gmail.com', N'338ce9f1d8cbbe2d669f6fadc6add8bb', NULL)
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Giảm giá, 2: Đề xuất' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'TypeId'
GO
USE [master]
GO
ALTER DATABASE [web_asp] SET  READ_WRITE 
GO
