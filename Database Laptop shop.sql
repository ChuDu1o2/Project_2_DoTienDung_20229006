USE [master]
GO
/****** Object:  Database [shop]    Script Date: 8/2/2023 5:28:56 PM ******/
CREATE DATABASE [shop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'shop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\shop.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'shop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\shop_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [shop] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [shop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [shop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [shop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [shop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [shop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [shop] SET ARITHABORT OFF 
GO
ALTER DATABASE [shop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [shop] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [shop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [shop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [shop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [shop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [shop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [shop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [shop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [shop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [shop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [shop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [shop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [shop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [shop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [shop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [shop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [shop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [shop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [shop] SET  MULTI_USER 
GO
ALTER DATABASE [shop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [shop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [shop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [shop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [shop]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 8/2/2023 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[fullName] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[user] [varchar](255) NULL,
	[pass] [varchar](255) NULL,
	[isAdmin] [int] NULL,
 CONSTRAINT [PK__Account__DD771E3CA1B0D61B] PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 8/2/2023 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] NOT NULL,
	[cname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 8/2/2023 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[oid] [int] NOT NULL,
	[date] [datetime] NULL,
	[aid] [int] NULL,
	[totalmoney] [money] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 8/2/2023 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[ProductID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [money] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product]    Script Date: 8/2/2023 5:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[cateID] [int] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([uID], [fullName], [email], [user], [pass], [isAdmin]) VALUES (1, N'do dung', N'dodung@gmail.com', N'dung123', N'123', 0)
INSERT [dbo].[Account] ([uID], [fullName], [email], [user], [pass], [isAdmin]) VALUES (27, N'Do Tien Dung', N'dungvtpt99@gmail.com', N'admin', N'123', 1)
INSERT [dbo].[Account] ([uID], [fullName], [email], [user], [pass], [isAdmin]) VALUES (1035, N'dung123', N'dung123@gmail.com', N'dung123', N'123', 0)
INSERT [dbo].[Account] ([uID], [fullName], [email], [user], [pass], [isAdmin]) VALUES (2036, N'do hung', N'hung@gmail', N'hung22', N'123', 0)
INSERT [dbo].[Account] ([uID], [fullName], [email], [user], [pass], [isAdmin]) VALUES (3036, N'dung', N'dung@gmail.com', N'dung', N'123', 0)
INSERT [dbo].[Account] ([uID], [fullName], [email], [user], [pass], [isAdmin]) VALUES (3037, N'dung456', N'dungt@gami', N'dung2341', N'123', 0)
INSERT [dbo].[Account] ([uID], [fullName], [email], [user], [pass], [isAdmin]) VALUES (3038, N'do viet hung', N'ads@gmail.com', N'ads', N'123', 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'ACER')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'ASUS')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'DELL')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (4, N'LENOVO')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (5, N'MSI')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (6, N'HP')
INSERT [dbo].[Order] ([oid], [date], [aid], [totalmoney]) VALUES (1, CAST(N'2000-01-01 00:00:00.000' AS DateTime), 1, 20000.0000)
INSERT [dbo].[Order] ([oid], [date], [aid], [totalmoney]) VALUES (2, CAST(N'2000-01-01 00:00:00.000' AS DateTime), 1, 20000.0000)
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [quantity]) VALUES (1017, N'ACER ASPIRE 3 A314-23M-R4TX', N'https://hanoicomputercdn.com/media/product/72093_laptop_acer_aspire_3_a314_23m_11.png', 12.2880, N'LAPTOP ACER ASPIRE 3 A314-23M-R4TX (NX.KEXSV.001) (R5 7520U/8GB RAM/512GB SSD/14.0 INCH FHD/WIN 11/BẠC/VỎ NHÔM)', N'...', 1, 5)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [quantity]) VALUES (1020, N'ACER NITRO 5 EAGLE AN515-57-53F9', N'https://hanoicomputercdn.com/media/product/72386_laptop_acer_nitro_5_eagle_an515_57_18.png', 19.0990, N'LAPTOP ACER NITRO 5 EAGLE AN515-57-53F9 (NH.QENSV.008) (I5 11400H/8GB RAM/512GB SSD/RTX3050 4G/15.6 INCH FHD 144HZ/WIN 11/ĐEN)', N'Laptop Acer Nitro 5 Gaming khơi nguồn cảm hứng của game thủ với những tựa game lôi cuốn khi sở hữu thiết kế phong cách, sức mạnh đến từ con chip Intel thế hệ 11 và card đồ họa tân tiến, sẽ là một người bạn đồng hành đắc lực trong mọi trận đấu.

Thiết kế hiện đại, phong cách
Laptop Acer Nitro 5 sở hữu lớp vỏ nhựa chắc chắn, tạo ấn tượng với những đường góc cạnh cắt gọt tinh tế. Máy có độ dày thân là 23.9 mm, trọng lượng là 2.2 kg, tương xứng cho một thiết kế gaming, không quá nhẹ nhàng nhưng vẫn thoải mái để bạn mang theo cả ngày dài.', 1, 3)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [quantity]) VALUES (1021, N'ASUS GAMING TUF FX506HF-HN014W', N'https://hanoicomputercdn.com/media/product/71270_asus_gaming_tuf_fx506_19.jpg', 12.2780, N'LAPTOP ASUS GAMING TUF FX506HF-HN014W (I5 11400H/8GB RAM/512GB SSD/15.6 FHD 144HZ/RTX 2050 4GB/WIN11/ĐEN)', N'Laptop ASUS TUF Gaming Dash F15 là một chiếc laptop gaming hạng nặng với bộ vi xử lý Intel Gen 11 kết hợp với GPU Nvidia RTX 3000 mới nhất và một thiết lập âm thanh tổng thể tuyệt vời. 

Trong thời điểm hiện nay việc tìm mua được một chiếc card RTX 3000 cho PC cũng khá là khó khăn nhưng TUF 2021 sẽ là một lựa chọn hoàn hảo.

Thiết kế của ASUS TUF DASH 
Laptop Asus Gaming TUF FX506 sở hữu thiết kế được thay đổi hoàn toàn so với những người anh em trước đó thuộc dòng TUF Gaming. Bề ngoài góc cạnh cùng màu Eclipse Gray tạo cảm giác chắc chắn và đậm chất gaming.', 1, 4)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [quantity]) VALUES (1022, N'LAPTOP ASUS GAMING ROG STRIX G614JV-N4455W', N'https://hanoicomputercdn.com/media/product/72063_laptop_asus_gaming_rog_strix_g16_g614_18.png', 47.3490, N'LAPTOP ASUS GAMING ROG STRIX G614JV-N4455W (I7 13650HX/16GB RAM/512GB SSD/16 QHD 240HZ/RTX 4060 8GB/WIN11/BALO/XÁM)', N'Làm chủ cuộc chơi với ROG Strix G16/18 siêu mạnh mẽ, được trang bị bộ vi xử lý lên đến Intel® Core™ i9 thế hệ 13 mới nhất cùng đồ họa lên đến NVIDIA® GeForce RTX™ 4090 mang đến hiệu năng vượt trội, thoải mái chiến các tựa game nặng hay các công việc sáng tạo đòi hỏi khả năng đồ họa cao cấp. Kết hợp với màn hình ROG Nebula lên đến 2K 240Hz/3ms siêu mượt cùng hệ thống tản nhiệt thông minh ROG Intelligent Cooling nâng cấp, công nghệ tản nhiệt 3 quạt với keo tản nhiệt kim loại lỏng, đảm bảo duy trì nhiệt độ mát mẻ cho máy.

Khai phá sức mạnh gaming vượt trội
Tự tin chiến game với sức mạnh gaming vượt trội trên ROG Strix G16/18 khi được trang bị bộ vi xử lý lên đến Intel® Core™ i9-13980HX thế hệ thứ 13 và GPU lên đến NVIDIA GeForce RTX 4090 có TGP tối đa 175W với Dynamic Boost thống trị đối thủ trong tất cả tựa game mới nhất. Tăng cường sức mạnh gaming bằng MUX Switch chuyên dụng và NVIDIA Advanced Optimus cho phép ROG Strix G16/18 giải phóng tiềm năng thực sự trên phần cứng, cung cấp hiệu năng tuyệt vời. Bộ lưu trữ SSD PCIe Gen 4 và RAM DDR5 4800MHz lên đến 32GB, kho game đa dạng và các phiên đa nhiệm cường độ cao sẽ trở nên dễ dàng đối với cỗ máy chơi game này.', 2, 9)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [quantity]) VALUES (1024, N'ASUS VIVOBOOK S3405VA-KM071W', N'https://hanoicomputercdn.com/media/product/73334_laptop_asus_vivobook_s3405va_km071w__i9_13900h___1_.png', 22.9990, N'LAPTOP ASUS VIVOBOOK S3405VA-KM071W (I9 13900H/16GB RAM/512GB SSD/14 2.8K OLED/WIN11/ĐEN)', N'Tỏa sáng với cả thế giới cùng ASUS Vivobook 14/15 OLED mạnh mẽ, chiếc laptop tích hợp nhiều tính năng với màn hình OLED rực rỡ, gam màu DCI-P3 đẳng cấp điện ảnh. Mọi thứ trở nên dễ dàng hơn nhờ những tiện ích thân thiện với người dùng bao gồm bản lề mở phẳng 180°, nắp che webcam vật lý và các phím chức năng chuyên dụng. Bảo vệ sức khỏe an toàn với ASUS kháng khuẩn Guard Plus trên các bề mặt thường xuyên chạm vào. Bắt đầu ngày mới đầy hứng khởi với ASUS Vivobook 14/15 OLED!', 1, 7)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [quantity]) VALUES (1025, N'LAPTOP ASUS X1504VA-NJ069W', N'https://hanoicomputercdn.com/media/product/71806_nj069w.jpg', 12.7990, N'LAPTOP ASUS X1504VA-NJ069W (I3 1315U/8GB RAM/512GB SSD/15.6 FHD/WIN11/BẠC)', N'Bắt đầu ngày mới năng động cùng laptop ASUS Vivobook 14/15 biến những công việc hàng ngày trở nên dễ dàng hơn với sự trang bị vi xử lý Intel thế hệ 13 mới nhất cùng nhiều công cụ thiết yếu giúp việc hoàn thành đa tác vụ một cách nhanh chóng ở mọi nơi. Thiết kế thân thiện với người dùng, sử dụng bản lề duỗi thẳng 180° sẵn sàng chia sẻ màn hình, nắp che webcam vật lý đảm bảo quyền riêng tư và bảo mật vân tay một chạm tiện lợi, an toàn. ASUS Vivobook 14/15 còn được trang bị ASUS Antibacterial Guard Plus giúp bảo vệ các bề mặt thường xuyên chạm vào khỏi vi khuẩn có hại, bảo vệ sức khỏe người dùng.

Hiệu năng mạnh mẽ, hoàn thành công việc nhanh chóng
Với ASUS Vivobook 14/15 (X1404/X1504), bạn luôn sẵn sàng đảm nhiệm mọi tác vụ hàng ngày khi máy được trang bị bộ xử lý Intel® Core™ thế hệ thứ 13, bộ nhớ RAM lên đến 16GB, bộ nhớ lưu trữ SSD tốc độ cao lên đến 512GB và công nghệ WiFi 6E kết nối mạng không dây toàn diện cho phép bạn tải xuống nội dung trực tuyến trong chớp mắt. Dù là làm việc hay giải trí ASUS Vivobook 14/15 đều có thể giúp bạn hoàn thành dễ dàng, đáp ứng đầy đủ nhu cầu cần thiết, mang đến trải nghiệm giải trí tuyệt vời.', 2, 5)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [quantity]) VALUES (1026, N'DELL WORKSTATION MOBILE PRECISION 5560', N'https://hanoicomputercdn.com/media/product/63715_laptop_dell_workstation_mobile_precision_5560_7.jpg', 63.8490, N'LAPTOP DELL WORKSTATION MOBILE PRECISION 5560 (01MTXT556011850H.02) VPRO (I7 11850H/16GB RAM/256GB SSD/RTX A2000 4G/15.6 INCH FHD 100%RGB/UBUNTU/XÁM)', N'Dell Precision 5560 được coi là một phiên bản dành cho người dùng chuyên nghiệp của XPS 15. Với thiết kế bền bỉ, màn hình độ phân giải sắc nét và đặc biệt là hiệu năng mạnh mẽ, đây sẽ là mẫu Laptop dành riêng cho những ai đang cần một thiết bị mỏng nhẹ nhưng lại có thể đáp ứng tốt cho các tác vụ nặng như thiết kế hình ảnh, dựng 3D, render video và nhiều hơn thế nữa.

Thiết kế thừa hưởng từ dòng XPS 

Dell Precision 5560 được thừa hưởng một thiết kế sang trọng, mỏng nhẹ và tinh tế đến từ dòng XPS. Với bộ khung máy bằng nhôm màu đen được sơn phủ mờ, bề mặt phần chiếu nghỉ được làm bằng sợi carbon độc đáo, giúp hạn chế tối đa mồ hôi và dấu vân tay, giúp cho máy luôn luôn được giữ được vẻ ngoài bóng bẩy và sạch sẽ.', 1, 7)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [quantity]) VALUES (1027, N'DELL ALLIENWARE GAMING M15 R6', N'https://hanoicomputercdn.com/media/product/68934_allienware_gaming_m15_r5_01_19.jpeg', 39.9990, N'LAPTOP DELL ALLIENWARE GAMING M15 R6 (P109F001CBL) (I7 11800H/32GB RAM/1TB SSD/RTX3060 6G/15.6 INCH QHD 240HZ/WIN11/OFFICEHS21/XÁM ĐEN)', N'Về thiết kế, Laptop Dell Alienware Gaming m15 R6 sẽ có dáng dấp “chiến hạm” tương đồng với phiên bản m15 Ryzen Edition R5 ra mắt cùng dịp. Các yếu tố nổi bật như số 15 ở nắp, khe thoát nhiệt tổ ong hay dải LED RGB chạy bao quanh gờ sau,.. Tất cả vẫn ở đó để tạo nên phong cách tương lai cho sản phẩm. Về màu sắc, Laptop Dell Alienware Gaming m15 R6 sẽ có duy nhất tuỳ chọn Xám Đen (Dark Side of the Moon), tương tự với m15 Ryzen Edition R5. ', 1, 4)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [quantity]) VALUES (1028, N'LAPTOP DELL GAMING G15 5525', N'https://hanoicomputercdn.com/media/product/69036_laptop_dell_gaming_g15_5525_11.png', 24.2990, N'LAPTOP DELL GAMING G15 5525 (G15-5525-R5H085W11GR3050) (R5 6600H/8GB RAM/512GB SSD/RTX3050 4G/15.6 INCH FHD 120HZ/WIN11/OFFICEHS21/XÁM ĐEN)', N'Laptop gaming Dell G15 5520 là sản phẩm nằm trong pươhân khúc laptop gaming trên 30 triệu và là thế hệ chơi game tiếp theo của Dell. Vốn nổi tiếng với những chiếc laptop văn phòng thì nay Dell mang đến cho game thủ một lựa chọn mới đầy tính năng, cấu hình mạnh mẽ và đng đầu với vô số tựa game dễ dàng. Vậy Dell G15 5520 sẽ được trang bị những gì? 

Thiết kế mới lạ, độc đáo
Thiết kế độc lạ so với những dòng laptop gaming khác, đơn giản và không quá cầu kì, nhưng Dell G15 5520 vẫn được chau chuốt khi sở hữu vẻ ngoài mạnh mẽ với màu Dark Shadow Grey cùng thiết kế bản lề nối với màn hình độc đáo. Thiết kế của Dell G15 khiến ta liên tưởng đến ngay dòng sản phẩm cao cấp Alienware trước đây của Dell.', 3, 8)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [quantity]) VALUES (1029, N'LAPTOP DELL VOSTRO 3430', N'https://hanoicomputercdn.com/media/product/72524_laptop_dell_vostro_3430_6.png', 25.3490, N'LAPTOP DELL VOSTRO 3430 (V3430-I7U165W11GRD2) (I7 1355U 16GB/512GB SSD/MX550 2G/14.0FHD/WIN11/OFFICEHS21/XÁM)', N'Với Dell Vostro 5320, không điều gì có thể làm bạn chậm lại. Mang trong mình con chip hàng đầu cho laptop văn phòng thuộc thế hệ thứ 12 Alder Lake mới nhất, chiếc mạnh nhất có tới 12 lõi 16 luồng, trong đó 4 lõi P cực mạnh tốc độ lên tới 4.70GHz và 8 lõi E tiết kiệm năng lượng. So với những con chip Tiger Lake thế hệ trước, Alder Lake cho sức mạnh vượt trội. Bạn có thể xử lý những công việc nặng, các ứng dụng đòi hỏi cấu hình cao một cách dễ dàng. Không có gì ngạc nhiên khi Dell Vostro 5320 đạt chuẩn Intel Evo khi chiếc laptop hàng đầu này trang bị loạt tính năng vô cùng đẳng cấp, hỗ trợ bạn hoàn thành công việc một cách nhanh chóng.', 3, 6)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [quantity]) VALUES (1030, N'LENOVO IDEAPAD SLIM 5 PRO 14IAP7', N'https://hanoicomputercdn.com/media/product/70053_hacom_lenovo_ideapad_slim_5_pro_10.png', 19.2990, N'LAPTOP LENOVO IDEAPAD SLIM 5 PRO 14IAP7 (82SH002TVN) (I5 1240P/16GB RAM/512GB SSD/14 2.8K/WIN11/XÁM)(HÀNG THANH LÝ)', N'Laptop Lenovo Ideapad sở hữu trọng lượng nhẹ 1.41 kg và độ dày 17.99 mm đảm bảo tính di động, linh hoạt đồng hành cùng bạn đi học tập, làm việc cũng như giải trí mọi lúc mọi nơi.

Cấu hình mạnh mẽ đến bộ CPU Intel Gen 11 hiện đại
Bộ vi xử lý intel 12th, nâng cao nâng xuất giúp vận hành mượt mà các công cụ văn phòng Word, Excel, PowerPoint,... hay phần mềm đồ họa như Photoshop, AI, Figma,...', 1, 8)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [quantity]) VALUES (1031, N'LENOVO LEGION 5 PRO 16IAH7H ', N'https://hanoicomputercdn.com/media/product/73261_laptop_lenovo_legion_5_pro_16iah7h_82rf0043vn__2_.jpg', 37.3490, N'LAPTOP LENOVO LEGION 5 PRO 16IAH7H (82RF0043VN) (I7 12700H/16GB RAM/512GB SSD/16 WQXGA 165HZ/RTX 3060 6G/WIN11/XÁM)', N'Với phong cách thiết kế độc đáo cùng card đồ họa NVIDIA GeForce mạnh mẽ, laptop Lenovo Gaming Legion 5 đáp ứng tốt mọi tác vụ từ học tập, văn phòng nhẹ nhàng đến đồ họa, kỹ thuật chuyên sâu.

Thiết kế 
Có kích thước 36.32 x 25.91 x 2.54cm và 2,5kg được làm từ hợp kim nhôm nhựa. Nhìn chung với thiết kế của một chiếc Laptop Gaming như thế này được coi là khá nhẹ. Máy được thiết kế mạnh mẽ khá vuông vắn tạo cảm giác cho người sử dụng hài lòng ưng ý.', 1, 9)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [quantity]) VALUES (1032, N'LAPTOP LENOVO THINKPAD T14S GEN 2 ', N'https://hanoicomputercdn.com/media/product/70162_laptop_lenovo_thinkpad_t14s_gen_2_8.png', 23.7990, N'LAPTOP LENOVO THINKPAD T14S GEN 2 (20WM01SXVA) (I5 1135G7/16GB RAM/512GB SSD/14 FHD/DOS/ĐEN)', N'Màn hình sắc nét với 2 lựa chọn
Cho là với màn hình cảm ứng bạn thích hay màn hình truyền thống, máy tính xách tay ThinkPad T14s Gen 2 đều cho cho bạn một số lựa chọn màn hình 14" tùy theo nhu cầu - và tất cả các lựa chọn đều có viền bezel mỏng giúp màn hình tuyệt vời hơn. Bạn có thể chọn tấm nền FHD tiết kiệm điện để có thời lượng pin tối ưu hoặc sử dụng tấm nền cảm ứng góc rộng FHD. Để thể hiện các chi tiết tinh tế, độ sáng cao hơn và màu sắc chính xác đến kinh ngạc, màn hình 4K sử dụng công nghệ dải động cao (HDR) trên tấm nền IPS Dolby Vision™ đẹp đến mê người.

Sức mạnh
Với nền tảng intel thế hệ 11, máy tính xách tay ThinkPad T14s Gen 2 mang đến sự kết hợp mạnh mẽ giữa hiệu suất, khả năng phản hồi, thời lượng pin và hình ảnh tuyệt đẹp. Với bộ vi xử lý lên đến i7 1165G7, bạn có thể tin tưởng vào sự trải nghiệm đặc biệt, ở bất cứ đâu.', 4, 6)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [quantity]) VALUES (1033, N'MSI GAMING CYBORG 15', N'https://hanoicomputercdn.com/media/product/71035_laptop_msi_gaming_cyborg_15_12.png', 28.9490, N'LAPTOP MSI GAMING CYBORG 15 (A12VF-267VN) (I7 12650H/8GB RAM/512GB SSD/RTX4060 8GB/15.6 INCH FHD 144HZ/WIN11/ĐEN)', N'Cấu hình mạnh mẽ
Laptop MSI được trang bị bộ vi xử lý Intel Core i7 12650H cho hiệu suất mạnh mẽ có thể xử lý đa tác vụ mượt mà, vận hành trơn tru các tựa game phổ biến ở mức cấu hình cao. Với card đồ họa NVIDIA GeForce RTX 4060 8 GB, bạn sẽ có trải nghiệm chơi game và làm việc với độ phân giải cao cùng tốc độ xử lý ấn tượng.', 1, 8)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [quantity]) VALUES (1034, N'LAPTOP MSI GAMING KATANA GF66 ', N'https://hanoicomputercdn.com/media/product/67646_laptop_msi_gaming_katana_gf66_7.png', 25.3490, N'LAPTOP MSI GAMING KATANA GF66 (11UE-824VN) (I7 11800H 16GB RAM/512GB SSD/RTX3060 6G/15.6 INCH FHD 144HZ/WIN11/ĐEN)', N'Khơi nguồn mọi cảm hứng game thủ với cấu hình mạnh mẽ đến từ con chip Intel thế hệ 11 tân tiến cùng lối thiết kế cơ động, chuẩn gaming, MSI Katana GF66 hứa hẹn sẽ là một chiến binh dũng mãnh cùng bạn xông pha trên mọi thế trận.

Ngoại hình hiện đại, đậm cá tính riêng
Laptop MSI Gaming được thiết kế tinh xảo, tỉ mỉ cùng lớp vỏ nhựa cứng cáp và tông màu đen sang trọng, nổi bật lên cá tính riêng cho chủ nhân sở hữu nó. Trọng lượng 2.25 kg với bề dày 24.9 mm mang cảm giác chắc chắn, bền bỉ. Tuy khá nặng nhưng vẫn chấp nhận được trong phân khúc laptop gaming, cho phép bạn thỏa sức chiến game tại gia hay tụ tập bạn bè ở những nơi đông đúc.', 5, 6)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [quantity]) VALUES (1035, N'HP GAMING VICTUS 16-FA0110TX', N'https://hanoicomputercdn.com/media/product/69390_laptop_hp_gaming_victus_16_12.jpeg', 24.8490, N'LAPTOP HP GAMING VICTUS 16-FA0110TX (7C0R3PA) (I7 12700H/8GB RAM/512GB SSD/15.6 FHD 144HZ/RTX 3050 4GB/WIN11/ĐEN)', N'Với thiết kế tinh tế, phần cứng hoàn thiện tuyệt vời, cấu hình hấp dẫn cùng mức giá chỉ ở ngưỡng tầm trung; HP Victus 16 sẽ phù hợp với game thủ, người làm multimedia,… với hầu bao vừa phải nhưng vẫn muốn có được trải nghiệm sát nhất có thể so với các sản phẩm cao cấp. 

THIẾT KẾ MANG ADN CỦA OMEN CAO CẤP
Với vẻ ngoài vuông vắn cùng lớp sơn nhám Đen quen thuộc; HP Victus 16 dễ khiến người ta liên tưởng tới các sản phẩm Omen ở phân khúc cao cấp. Nhưng nếu nhìn kỹ, không khó để thấy rằng sản phẩm của chúng ta còn thú vị hơn vậy nhiều. Chẳng hạn như ở nắp máy, HP đã có một logo chữ V bóng bẩy, tinh tế dành riêng cho dòng Victus. Hay phần khe thoát gió phía sau cũng được thiết kế lại, tràn hẳn ra hai bên để tăng cường lưu thông khí. ', 1, 8)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [quantity]) VALUES (1036, N'LAPTOP HP PAVILION 15-EG2087TU ', N'https://hanoicomputercdn.com/media/product/71743_laptop_hp_pavilion_15_9.jpeg', 13.1990, N'LAPTOP HP PAVILION 15-EG2087TU (7C0Q9PA) (I3 1215U/8GB RAM/256GB SSD/15.6 FHD/WIN11/BẠC)', N'Laptop HP Pavilion 15 thừa hưởng nguyên vẹn dung mạo đặc trưng của dòng Pavilion. Vỏ trong máy trong sử dụng chất liệu nhựa giả nhôm xước, cùng tông màu tối với cả màn hình và bàn phím. Chỉ nặng 1.75kg nên máy có thiết kế gọn gàng và dễ di chuyển mọi lúc mọi nơi để làm việc.

 Hệ thống bản lề bo vát trùng xuống, được cải tiến chắc chắn hơn so với phiên bản cũ nên màn hình ít bị rung hơn khi sử dụng. Kết cấu khung máy bằng hợp kim chắc chắn, vỏ máy phủ lớp nhựa mềm bên ngoài. Màn hình gói gọn trong phần viền còn hơi dày và cục mịch nhưng có thêm lớp đệm chạy theo các viền bảo vệ, chống va chạm tốt hơn.', 6, 9)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [quantity]) VALUES (1037, N'LAPTOP HP ELITEBOOK 630 G9', N'https://hanoicomputercdn.com/media/product/70655_laptop_hp_eiltebook_630_g9_10.png', 25.2990, N'LAPTOP HP ELITEBOOK 630 G9 (6M146PA) (I7 1255U/16GB RAM/512GB SSD/13.3 FHD/WIN11/BẠC)', N'Laptop HP EliteBook 630 là một trong những siêu phẩm đáng cân nhắc khi bạn chọn mua laptop học tập - văn phòng. Máy sở hữu cấu hình mạnh mẽ đến từ con chip Intel Gen 12 cùng vẻ ngoài đẳng cấp, mỏng nhẹ có thể đáp ứng đầy đủ các nhu cầu khác nhau. 

Cấu hình chạy mượt mà đa tác vụ khác nhau
Laptop HP EliteBook được trang bị bộ vi xử lý Intel Core i7 thế hệ 12 sở hữu kiến trúc Hybrid với các lõi hiệu năng P-core và lõi tiết kiệm điện E-core có khả năng vận hành hoàn hảo mọi tác vụ văn phòng như Word, Excel, PowerPoint,... card đồ họa Intel UHD đáp ứng nhu cầu thiết kế cơ bản trên Photoshop hay chơi một số tựa game nhẹ như Liên Minh Huyền Thoại, CS:GO một cách mượt mà. ', 6, 4)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [quantity]) VALUES (2038, N'MACBOOK', N'https://hanoicomputercdn.com/media/product/63268_aspire_3_a315_57g_wp_black__5.jpg', 999.0000, N'qweqweqweqw', N'asdsadasdasd', 1, 33)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [quantity]) VALUES (2039, N'MACBOOK99999', N'https://hanoicomputercdn.com/media/product/63268_aspire_3_a315_57g_wp_black__5.jpg', 25.3490, N'fdadasda', N'adsadasdasd', 5, 67)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [quantity]) VALUES (2040, N'Giày chạy bộ 2023', N'https://hanoicomputercdn.com/media/product/63268_aspire_3_a315_57g_wp_black__5.jpg', 999.0000, N'sad', N'asdasd', 1, 45)
SET IDENTITY_INSERT [dbo].[product] OFF
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([aid])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([oid])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Cart_Order]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Cart_product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Cart_product]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_Category] FOREIGN KEY([cateID])
REFERENCES [dbo].[Category] ([cid])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_Category]
GO
USE [master]
GO
ALTER DATABASE [shop] SET  READ_WRITE 
GO
