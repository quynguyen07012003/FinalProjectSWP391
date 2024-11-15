USE [SWP]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 11/6/2024 8:58:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[AgentID] [int] IDENTITY(1,1) NOT NULL,
	[AgentName] [nvarchar](255) NOT NULL,
	[Address] [nvarchar](255) NULL,
	[PhoneNumber] [varchar](20) NULL,
	[Email] [varchar](100) NULL,
	[UserID] [int] NULL,
	[CompanyId] [int] NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[AgentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Album]    Script Date: 11/6/2024 8:58:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[AlbumID] [int] IDENTITY(1,1) NOT NULL,
	[AlbumName] [nvarchar](255) NOT NULL,
	[ReleaseDate] [date] NULL,
	[ArtistID] [int] NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK_Album] PRIMARY KEY CLUSTERED 
(
	[AlbumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Artist]    Script Date: 11/6/2024 8:58:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artist](
	[ArtistID] [int] IDENTITY(1,1) NOT NULL,
	[ArtistName] [nvarchar](255) NULL,
	[StageName] [nvarchar](255) NULL,
	[Bio] [nvarchar](max) NULL,
	[DateOfBirth] [date] NULL,
	[PhoneNumber] [varchar](20) NULL,
	[Email] [varchar](100) NULL,
	[image] [varchar](500) NULL,
	[AgencyID] [int] NULL,
	[UserID] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[facebook] [nvarchar](255) NULL,
	[tiktok] [nvarchar](255) NULL,
	[instagram] [nvarchar](255) NULL,
	[website] [nvarchar](255) NULL,
	[twitter] [nvarchar](255) NULL,
 CONSTRAINT [PK_Artist] PRIMARY KEY CLUSTERED 
(
	[ArtistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArtistGenres]    Script Date: 11/6/2024 8:58:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArtistGenres](
	[ArtistID] [int] NOT NULL,
	[genre_id] [int] NOT NULL,
 CONSTRAINT [PK_ArtistGenres] PRIMARY KEY CLUSTERED 
(
	[ArtistID] ASC,
	[genre_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 11/6/2024 8:58:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[ArtistID] [int] NULL,
	[UserID] [int] NULL,
	[BookingDate] [datetime] NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingArtists]    Script Date: 11/6/2024 8:58:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingArtists](
	[BookingID] [int] NOT NULL,
	[ArtistID] [int] NOT NULL,
 CONSTRAINT [PK_BookingArtists] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC,
	[ArtistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingForm]    Script Date: 11/6/2024 8:58:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingForm](
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NULL,
	[ClientID] [int] NULL,
	[Status] [varchar](50) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
 CONSTRAINT [PK_BookingForm] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 11/6/2024 8:58:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NOT NULL,
	[AddedAt] [datetime] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 11/6/2024 8:58:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[ClientName] [varchar](255) NOT NULL,
	[ContactPerson] [varchar](255) NULL,
	[PhoneNumber] [varchar](20) NULL,
	[Email] [varchar](100) NULL,
	[Address] [varchar](255) NULL,
	[UserID] [int] NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 11/6/2024 8:58:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](255) NOT NULL,
	[Address] [nvarchar](255) NULL,
	[PhoneNumber] [varchar](20) NULL,
	[Email] [varchar](100) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventDetails]    Script Date: 11/6/2024 8:58:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventDetails](
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[EventName] [nvarchar](255) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Location] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [PK_EventDetails] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 11/6/2024 8:58:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[genre_id] [int] IDENTITY(1,1) NOT NULL,
	[genre_name] [nvarchar](255) NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[genre_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 11/6/2024 8:58:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewsID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[AuthorID] [int] NULL,
	[Status] [varchar](50) NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/6/2024 8:58:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[TotalAmount] [decimal](10, 2) NOT NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 11/6/2024 8:58:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[OrderItemID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[OrderItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/6/2024 8:58:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[ProductImage] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Stock] [int] NOT NULL,
	[EventID] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/6/2024 8:58:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Song]    Script Date: 11/6/2024 8:58:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Song](
	[SongID] [int] IDENTITY(1,1) NOT NULL,
	[SongName] [nvarchar](255) NULL,
	[LinkToSong] [nvarchar](500) NULL,
	[ReleaseDate] [date] NULL,
	[ArtistID] [int] NULL,
	[AlbumID] [int] NULL,
	[genre_id] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK_Song] PRIMARY KEY CLUSTERED 
(
	[SongID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SongGenres]    Script Date: 11/6/2024 8:58:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SongGenres](
	[SongID] [int] NOT NULL,
	[genre_id] [int] NOT NULL,
 CONSTRAINT [PK_SongGenres] PRIMARY KEY CLUSTERED 
(
	[SongID] ASC,
	[genre_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/6/2024 8:58:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](100) NULL,
	[PasswordHash] [varchar](255) NULL,
	[Email] [varchar](100) NULL,
	[FullName] [nvarchar](255) NULL,
	[image] [varchar](500) NULL,
	[is_verified] [bit] NULL,
	[RoleID] [int] NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Agent] ON 

INSERT [dbo].[Agent] ([AgentID], [AgentName], [Address], [PhoneNumber], [Email], [UserID], [CompanyId], [CreatedAt]) VALUES (1, N'Agent A', N'123 Main St', N'0123456789', N'contact@agenta.com', 3, 1, CAST(N'2024-11-05T21:11:48.240' AS DateTime))
INSERT [dbo].[Agent] ([AgentID], [AgentName], [Address], [PhoneNumber], [Email], [UserID], [CompanyId], [CreatedAt]) VALUES (2, N'Agent B', N'456 Elm St', N'0987654321', N'contact@agentb.com', 4, 2, CAST(N'2024-11-05T21:11:48.240' AS DateTime))
SET IDENTITY_INSERT [dbo].[Agent] OFF
GO
SET IDENTITY_INSERT [dbo].[Album] ON 

INSERT [dbo].[Album] ([AlbumID], [AlbumName], [ReleaseDate], [ArtistID], [CreatedAt]) VALUES (1, N'First Album', CAST(N'2023-01-01' AS Date), 1, CAST(N'2024-11-05T21:11:48.260' AS DateTime))
INSERT [dbo].[Album] ([AlbumID], [AlbumName], [ReleaseDate], [ArtistID], [CreatedAt]) VALUES (2, N'Second Album', CAST(N'2024-10-26' AS Date), 2, CAST(N'2024-11-05T21:11:48.260' AS DateTime))
INSERT [dbo].[Album] ([AlbumID], [AlbumName], [ReleaseDate], [ArtistID], [CreatedAt]) VALUES (3, N'fnajkifnaf', CAST(N'2024-11-06' AS Date), 1, CAST(N'2024-11-06T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Album] OFF
GO
SET IDENTITY_INSERT [dbo].[Artist] ON 

INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [StageName], [Bio], [DateOfBirth], [PhoneNumber], [Email], [image], [AgencyID], [UserID], [CreatedAt], [facebook], [tiktok], [instagram], [website], [twitter]) VALUES (1, N'John Doe', N'JD', N'John is a renowned artist.', CAST(N'1985-10-05' AS Date), N'0123456789', N'jd@artists.com', N'./uploads/artist/110624114444_AoPhong.jpg', 1, 4, CAST(N'2024-11-05T21:11:48.253' AS DateTime), N'facebook.com/johndoe', N'tiktok.com/@johndoe', N'instagram.com/johndoe', N'johndoe.com', N'twitter.com/johndoe')
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [StageName], [Bio], [DateOfBirth], [PhoneNumber], [Email], [image], [AgencyID], [UserID], [CreatedAt], [facebook], [tiktok], [instagram], [website], [twitter]) VALUES (2, N'Jane Smith', N'JSmith', N'Jane is an upcoming star.', CAST(N'1995-08-22' AS Date), N'0987654321', N'jsmith@artists.com', N'jane.jpg', 2, 3, CAST(N'2024-11-05T21:11:48.253' AS DateTime), N'facebook.com/janesmith', N'tiktok.com/@janesmith', N'instagram.com/janesmith', N'janesmith.com', N'twitter.com/janesmith')
SET IDENTITY_INSERT [dbo].[Artist] OFF
GO
INSERT [dbo].[ArtistGenres] ([ArtistID], [genre_id]) VALUES (1, 1)
INSERT [dbo].[ArtistGenres] ([ArtistID], [genre_id]) VALUES (2, 2)
GO
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([BookingID], [ArtistID], [UserID], [BookingDate], [Status]) VALUES (1, 2, 2, CAST(N'2024-11-06T12:09:06.300' AS DateTime), N'Confirmed')
SET IDENTITY_INSERT [dbo].[Booking] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([CartID], [ClientID], [ProductID], [Quantity], [AddedAt]) VALUES (3, 1, 1, 2, CAST(N'2024-11-05T21:16:01.627' AS DateTime))
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ClientID], [ClientName], [ContactPerson], [PhoneNumber], [Email], [Address], [UserID], [CreatedAt]) VALUES (1, N'Client A', N'John Client', N'0123456789', N'clientA@example.com', N'789 Oak St', 1, CAST(N'2024-11-05T21:15:52.143' AS DateTime))
INSERT [dbo].[Client] ([ClientID], [ClientName], [ContactPerson], [PhoneNumber], [Email], [Address], [UserID], [CreatedAt]) VALUES (2, N'Client BCA', N'Jane Client', N'0987654321', N'clientB@example.com', N'987 Pine St', 2, CAST(N'2024-11-05T21:15:52.143' AS DateTime))
INSERT [dbo].[Client] ([ClientID], [ClientName], [ContactPerson], [PhoneNumber], [Email], [Address], [UserID], [CreatedAt]) VALUES (3, N'hung', N'', N'0375741241', N'dinhdau200@gmail.com', N'', 5, CAST(N'2024-11-06T11:25:16.290' AS DateTime))
INSERT [dbo].[Client] ([ClientID], [ClientName], [ContactPerson], [PhoneNumber], [Email], [Address], [UserID], [CreatedAt]) VALUES (4, N'', N'', N'', N'dinhdau200@gmail.com', N'', 5, CAST(N'2024-11-06T11:35:36.940' AS DateTime))
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([CompanyID], [CompanyName], [Address], [PhoneNumber], [Email]) VALUES (1, N'BachCute', N'123 Music Avenue', N'0961988450', N'info@musicstar.com')
INSERT [dbo].[Company] ([CompanyID], [CompanyName], [Address], [PhoneNumber], [Email]) VALUES (2, N'Artist Management Inc.', N'456 Talent Road', N'098-765-4321', N'contact@artistmgmt.com')
INSERT [dbo].[Company] ([CompanyID], [CompanyName], [Address], [PhoneNumber], [Email]) VALUES (3, N'BachCute111', N'Ân thi 1 Hồng Quang Ân Thi Hưng Yên', N'0961988444', N'quyndhe171242@fpt.edu.vn')
SET IDENTITY_INSERT [dbo].[Company] OFF
GO
SET IDENTITY_INSERT [dbo].[EventDetails] ON 

INSERT [dbo].[EventDetails] ([EventID], [EventName], [StartDate], [EndDate], [Location], [Description]) VALUES (1, N'Ahihi', CAST(N'2024-05-01T00:00:00.000' AS DateTime), CAST(N'2024-05-05T00:00:00.000' AS DateTime), N'Công Viên Trung Tâm', N'Lễ hội âm nhạc thường niên')
INSERT [dbo].[EventDetails] ([EventID], [EventName], [StartDate], [EndDate], [Location], [Description]) VALUES (2, N'Buổi Hòa Nhạc Rock', CAST(N'2024-06-15T00:00:00.000' AS DateTime), CAST(N'2024-06-15T00:00:00.000' AS DateTime), N'Sân Vận Động B', N'Sự kiện nhạc rock với các nghệ sĩ nổi tiếng')
INSERT [dbo].[EventDetails] ([EventID], [EventName], [StartDate], [EndDate], [Location], [Description]) VALUES (3, N'Concert Mùa Hè', CAST(N'2024-06-01T00:00:00.000' AS DateTime), CAST(N'2024-06-01T00:00:00.000' AS DateTime), N'Sân Vận Động Quốc Gia', N'Buổi hòa nhạc ngoài trời với các nghệ sĩ nổi tiếng.')
INSERT [dbo].[EventDetails] ([EventID], [EventName], [StartDate], [EndDate], [Location], [Description]) VALUES (4, N'Lễ Hội Âm Nhạc Mùa Xuân', CAST(N'2024-03-21T00:00:00.000' AS DateTime), CAST(N'2024-03-23T00:00:00.000' AS DateTime), N'Quảng Trường Trung Tâm', N'Lễ hội âm nhạc kéo dài ba ngày với nhiều thể loại nhạc khác nhau.')
INSERT [dbo].[EventDetails] ([EventID], [EventName], [StartDate], [EndDate], [Location], [Description]) VALUES (5, N'Buổi Biểu Diễn Trực Tiếp của Nghệ Sĩ A', CAST(N'2024-09-15T00:00:00.000' AS DateTime), CAST(N'2024-09-15T00:00:00.000' AS DateTime), N'Nhà Hát Lớn Thành Phố', N'Buổi biểu diễn đặc biệt của Nghệ Sĩ A với những bản hit mới nhất.')
INSERT [dbo].[EventDetails] ([EventID], [EventName], [StartDate], [EndDate], [Location], [Description]) VALUES (6, N'Lễ Hội EDM Quốc Tế', CAST(N'2024-10-10T00:00:00.000' AS DateTime), CAST(N'2024-10-12T00:00:00.000' AS DateTime), N'Sân Vận Động Quân Đội', N'Lễ hội EDM với sự tham gia của các DJ quốc tế hàng đầu.')
INSERT [dbo].[EventDetails] ([EventID], [EventName], [StartDate], [EndDate], [Location], [Description]) VALUES (8, N'Lễ Hội Âm Nhạc Biển', CAST(N'2024-07-04T00:00:00.000' AS DateTime), CAST(N'2024-07-06T00:00:00.000' AS DateTime), N'Bãi Biển Xanh', N'Lễ hội âm nhạc ngoài trời bên bờ biển, dành cho các tín đồ yêu thích nhạc pop và rock.')
INSERT [dbo].[EventDetails] ([EventID], [EventName], [StartDate], [EndDate], [Location], [Description]) VALUES (9, N'Chương Trình Ca Nhạc Gây Quỹ Từ Thiện', CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-08-10T00:00:00.000' AS DateTime), N'Trung Tâm Văn Hóa', N'Chương trình ca nhạc nhằm gây quỹ giúp đỡ các hoàn cảnh khó khăn.')
INSERT [dbo].[EventDetails] ([EventID], [EventName], [StartDate], [EndDate], [Location], [Description]) VALUES (10, N'Đêm Nhạc Cổ Điển Quốc Tế', CAST(N'2024-12-15T00:00:00.000' AS DateTime), CAST(N'2024-12-15T00:00:00.000' AS DateTime), N'Nhà Hát Nhạc Vũ Kịch', N'Buổi hòa nhạc cổ điển với các tác phẩm nổi tiếng thế giới.')
INSERT [dbo].[EventDetails] ([EventID], [EventName], [StartDate], [EndDate], [Location], [Description]) VALUES (11, N'Lễ Hội Rock và Metal', CAST(N'2024-05-30T00:00:00.000' AS DateTime), CAST(N'2024-06-01T00:00:00.000' AS DateTime), N'Công Viên Đồi Thông', N'Lễ hội âm nhạc Rock và Metal quy tụ các ban nhạc nổi tiếng.')
INSERT [dbo].[EventDetails] ([EventID], [EventName], [StartDate], [EndDate], [Location], [Description]) VALUES (12, N'Festival Nghệ Thuật Đương Đại', CAST(N'2024-04-20T00:00:00.000' AS DateTime), CAST(N'2024-04-22T00:00:00.000' AS DateTime), N'Thảo Cầm Viên', N'Lễ hội nghệ thuật với các tiết mục âm nhạc, múa và nghệ thuật đường phố.')
INSERT [dbo].[EventDetails] ([EventID], [EventName], [StartDate], [EndDate], [Location], [Description]) VALUES (13, N'Đêm Hòa Nhạc Từ Thiện', CAST(N'2024-08-15T00:00:00.000' AS DateTime), CAST(N'2024-08-15T00:00:00.000' AS DateTime), N'Sân Khấu Trống Đồng', N'Đêm hòa nhạc từ thiện với các nghệ sĩ tên tuổi.')
INSERT [dbo].[EventDetails] ([EventID], [EventName], [StartDate], [EndDate], [Location], [Description]) VALUES (14, N'Hòa Nhạc Đêm Noel', CAST(N'2024-12-24T00:00:00.000' AS DateTime), CAST(N'2024-12-24T00:00:00.000' AS DateTime), N'Nhà Thờ Lớn', N'Buổi hòa nhạc Giáng Sinh với các bản nhạc truyền thống.')
INSERT [dbo].[EventDetails] ([EventID], [EventName], [StartDate], [EndDate], [Location], [Description]) VALUES (15, N'Lễ Hội Âm Nhạc Giải Trí', CAST(N'2024-09-05T00:00:00.000' AS DateTime), CAST(N'2024-09-07T00:00:00.000' AS DateTime), N'Công Viên Nước', N'Lễ hội âm nhạc dành cho giải trí với nhiều thể loại nhạc và hoạt động ngoài trời.')
INSERT [dbo].[EventDetails] ([EventID], [EventName], [StartDate], [EndDate], [Location], [Description]) VALUES (16, N'Đại Nhạc Hội Xuân', CAST(N'2024-02-10T00:00:00.000' AS DateTime), CAST(N'2024-02-12T00:00:00.000' AS DateTime), N'Sân Vận Động Hòa Bình', N'Đại nhạc hội mừng xuân với sự tham gia của nhiều ca sĩ nổi tiếng.')
INSERT [dbo].[EventDetails] ([EventID], [EventName], [StartDate], [EndDate], [Location], [Description]) VALUES (17, N'Hòa Nhạc Mừng Năm Mới', CAST(N'2025-01-01T00:00:00.000' AS DateTime), CAST(N'2025-01-01T00:00:00.000' AS DateTime), N'Quảng Trường Thành Phố', N'Buổi hòa nhạc đón chào năm mới với nhiều tiết mục sôi động.')
INSERT [dbo].[EventDetails] ([EventID], [EventName], [StartDate], [EndDate], [Location], [Description]) VALUES (18, N'Ahihi Bách', CAST(N'2024-11-06T08:00:00.000' AS DateTime), CAST(N'2024-11-09T23:59:00.000' AS DateTime), N'Nhà Tôi', N'Bách Ngu')
INSERT [dbo].[EventDetails] ([EventID], [EventName], [StartDate], [EndDate], [Location], [Description]) VALUES (19, N'A', CAST(N'2024-11-19T08:00:00.000' AS DateTime), CAST(N'2024-11-22T23:59:00.000' AS DateTime), N'Ahii', N'AAAAA')
INSERT [dbo].[EventDetails] ([EventID], [EventName], [StartDate], [EndDate], [Location], [Description]) VALUES (20, N'AAAAAAA', CAST(N'2024-11-06T08:00:00.000' AS DateTime), CAST(N'2024-11-09T23:59:00.000' AS DateTime), N'Thính Phòng Thành Phố', N'A')
SET IDENTITY_INSERT [dbo].[EventDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Genres] ON 

INSERT [dbo].[Genres] ([genre_id], [genre_name]) VALUES (1, N'Pop')
INSERT [dbo].[Genres] ([genre_id], [genre_name]) VALUES (2, N'Rock')
INSERT [dbo].[Genres] ([genre_id], [genre_name]) VALUES (3, N'Jazz')
INSERT [dbo].[Genres] ([genre_id], [genre_name]) VALUES (4, N'Classical')
SET IDENTITY_INSERT [dbo].[Genres] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([NewsID], [Title], [Content], [AuthorID], [Status], [CreatedAt]) VALUES (1, N'Music Festival Highlights', N'Highlights from the music festival.', 1, N'Published', CAST(N'2024-11-05T21:11:48.297' AS DateTime))
INSERT [dbo].[News] ([NewsID], [Title], [Content], [AuthorID], [Status], [CreatedAt]) VALUES (2, N'Rock Concert Announcement', N'Upcoming rock concert details.', 2, N'Draft', CAST(N'2024-11-05T21:11:48.297' AS DateTime))
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [ClientID], [OrderDate], [TotalAmount], [Status]) VALUES (3, 1, CAST(N'2024-11-05T21:16:01.640' AS DateTime), CAST(40.00 AS Decimal(10, 2)), N'Processing')
INSERT [dbo].[Order] ([OrderID], [ClientID], [OrderDate], [TotalAmount], [Status]) VALUES (4, 2, CAST(N'2024-11-05T21:16:01.640' AS DateTime), CAST(150.00 AS Decimal(10, 2)), N'Completed')
INSERT [dbo].[Order] ([OrderID], [ClientID], [OrderDate], [TotalAmount], [Status]) VALUES (5, 1, CAST(N'2024-11-05T21:16:22.917' AS DateTime), CAST(40.00 AS Decimal(10, 2)), N'Processing')
INSERT [dbo].[Order] ([OrderID], [ClientID], [OrderDate], [TotalAmount], [Status]) VALUES (6, 2, CAST(N'2024-11-05T21:16:22.917' AS DateTime), CAST(150.00 AS Decimal(10, 2)), N'Completed')
INSERT [dbo].[Order] ([OrderID], [ClientID], [OrderDate], [TotalAmount], [Status]) VALUES (7, 2, CAST(N'2024-11-05T21:23:35.197' AS DateTime), CAST(490.00 AS Decimal(10, 2)), N'Đã Giao Hàng')
INSERT [dbo].[Order] ([OrderID], [ClientID], [OrderDate], [TotalAmount], [Status]) VALUES (8, 2, CAST(N'2024-11-05T23:41:00.770' AS DateTime), CAST(902250.00 AS Decimal(10, 2)), N'Đã Giao Hàng')
INSERT [dbo].[Order] ([OrderID], [ClientID], [OrderDate], [TotalAmount], [Status]) VALUES (9, 2, CAST(N'2024-11-05T23:41:33.830' AS DateTime), CAST(530000.00 AS Decimal(10, 2)), N'Đang Vận Chuyển')
INSERT [dbo].[Order] ([OrderID], [ClientID], [OrderDate], [TotalAmount], [Status]) VALUES (10, 2, CAST(N'2024-11-05T23:51:21.773' AS DateTime), CAST(2700000.00 AS Decimal(10, 2)), N'Đã Vận Chuyển')
INSERT [dbo].[Order] ([OrderID], [ClientID], [OrderDate], [TotalAmount], [Status]) VALUES (11, 2, CAST(N'2024-11-05T23:53:15.287' AS DateTime), CAST(1600000.00 AS Decimal(10, 2)), N'Đã Giao Hàng')
INSERT [dbo].[Order] ([OrderID], [ClientID], [OrderDate], [TotalAmount], [Status]) VALUES (12, 2, CAST(N'2024-11-05T23:53:57.193' AS DateTime), CAST(1350000.00 AS Decimal(10, 2)), N'Đang Vận Chuyển')
INSERT [dbo].[Order] ([OrderID], [ClientID], [OrderDate], [TotalAmount], [Status]) VALUES (13, 2, CAST(N'2024-11-05T23:59:24.367' AS DateTime), CAST(1210000.00 AS Decimal(10, 2)), N'Đã Hủy')
INSERT [dbo].[Order] ([OrderID], [ClientID], [OrderDate], [TotalAmount], [Status]) VALUES (14, 2, CAST(N'2024-11-06T00:02:39.617' AS DateTime), CAST(1660000.00 AS Decimal(10, 2)), N'Đã Giao Hàng')
INSERT [dbo].[Order] ([OrderID], [ClientID], [OrderDate], [TotalAmount], [Status]) VALUES (15, 2, CAST(N'2024-11-06T00:26:32.783' AS DateTime), CAST(180000.00 AS Decimal(10, 2)), N'Đang Vận Chuyển')
INSERT [dbo].[Order] ([OrderID], [ClientID], [OrderDate], [TotalAmount], [Status]) VALUES (16, 2, CAST(N'2024-11-06T00:51:40.497' AS DateTime), CAST(6500000.00 AS Decimal(10, 2)), N'Chờ Xử Lý')
INSERT [dbo].[Order] ([OrderID], [ClientID], [OrderDate], [TotalAmount], [Status]) VALUES (17, 2, CAST(N'2024-11-06T17:41:24.047' AS DateTime), CAST(730300.00 AS Decimal(10, 2)), N'Chờ Xử Lý')
INSERT [dbo].[Order] ([OrderID], [ClientID], [OrderDate], [TotalAmount], [Status]) VALUES (18, 2, CAST(N'2024-11-06T18:07:00.207' AS DateTime), CAST(525000.00 AS Decimal(10, 2)), N'Chờ Xử Lý')
INSERT [dbo].[Order] ([OrderID], [ClientID], [OrderDate], [TotalAmount], [Status]) VALUES (19, 2, CAST(N'2024-11-06T18:07:05.863' AS DateTime), CAST(525000.00 AS Decimal(10, 2)), N'Chờ Xử Lý')
INSERT [dbo].[Order] ([OrderID], [ClientID], [OrderDate], [TotalAmount], [Status]) VALUES (20, 2, CAST(N'2024-11-06T18:23:40.490' AS DateTime), CAST(2950000.00 AS Decimal(10, 2)), N'Chờ Xử Lý')
INSERT [dbo].[Order] ([OrderID], [ClientID], [OrderDate], [TotalAmount], [Status]) VALUES (21, 2, CAST(N'2024-11-06T18:28:35.330' AS DateTime), CAST(300.00 AS Decimal(10, 2)), N'Chờ Xử Lý')
INSERT [dbo].[Order] ([OrderID], [ClientID], [OrderDate], [TotalAmount], [Status]) VALUES (22, 2, CAST(N'2024-11-06T18:28:40.570' AS DateTime), CAST(300.00 AS Decimal(10, 2)), N'Chờ Xử Lý')
INSERT [dbo].[Order] ([OrderID], [ClientID], [OrderDate], [TotalAmount], [Status]) VALUES (23, 2, CAST(N'2024-11-06T18:28:53.017' AS DateTime), CAST(300.00 AS Decimal(10, 2)), N'Chờ Xử Lý')
INSERT [dbo].[Order] ([OrderID], [ClientID], [OrderDate], [TotalAmount], [Status]) VALUES (24, 2, CAST(N'2024-11-06T18:30:49.867' AS DateTime), CAST(300.00 AS Decimal(10, 2)), N'Chờ Xử Lý')
INSERT [dbo].[Order] ([OrderID], [ClientID], [OrderDate], [TotalAmount], [Status]) VALUES (25, 2, CAST(N'2024-11-06T18:30:54.597' AS DateTime), CAST(300.00 AS Decimal(10, 2)), N'Chờ Xử Lý')
INSERT [dbo].[Order] ([OrderID], [ClientID], [OrderDate], [TotalAmount], [Status]) VALUES (26, 2, CAST(N'2024-11-06T18:31:19.240' AS DateTime), CAST(150.00 AS Decimal(10, 2)), N'Chờ Xử Lý')
INSERT [dbo].[Order] ([OrderID], [ClientID], [OrderDate], [TotalAmount], [Status]) VALUES (27, 2, CAST(N'2024-11-06T18:52:54.097' AS DateTime), CAST(3450420.00 AS Decimal(10, 2)), N'Chờ Xử Lý')
INSERT [dbo].[Order] ([OrderID], [ClientID], [OrderDate], [TotalAmount], [Status]) VALUES (28, 2, CAST(N'2024-11-06T18:53:02.607' AS DateTime), CAST(3450420.00 AS Decimal(10, 2)), N'Chờ Xử Lý')
INSERT [dbo].[Order] ([OrderID], [ClientID], [OrderDate], [TotalAmount], [Status]) VALUES (29, 2, CAST(N'2024-11-06T18:53:06.927' AS DateTime), CAST(3450420.00 AS Decimal(10, 2)), N'Chờ Xử Lý')
INSERT [dbo].[Order] ([OrderID], [ClientID], [OrderDate], [TotalAmount], [Status]) VALUES (30, 2, CAST(N'2024-11-06T19:34:20.400' AS DateTime), CAST(1350170.00 AS Decimal(10, 2)), N'Chờ Xử Lý')
INSERT [dbo].[Order] ([OrderID], [ClientID], [OrderDate], [TotalAmount], [Status]) VALUES (31, 2, CAST(N'2024-11-06T19:36:50.430' AS DateTime), CAST(1350170.00 AS Decimal(10, 2)), N'Chờ Xử Lý')
INSERT [dbo].[Order] ([OrderID], [ClientID], [OrderDate], [TotalAmount], [Status]) VALUES (32, 2, CAST(N'2024-11-06T19:36:52.097' AS DateTime), CAST(1350170.00 AS Decimal(10, 2)), N'Chờ Xử Lý')
INSERT [dbo].[Order] ([OrderID], [ClientID], [OrderDate], [TotalAmount], [Status]) VALUES (33, 2, CAST(N'2024-11-06T19:37:58.793' AS DateTime), CAST(1700170.00 AS Decimal(10, 2)), N'Chờ Xử Lý')
INSERT [dbo].[Order] ([OrderID], [ClientID], [OrderDate], [TotalAmount], [Status]) VALUES (34, 2, CAST(N'2024-11-06T20:05:43.213' AS DateTime), CAST(2400170.00 AS Decimal(10, 2)), N'Chờ Xử Lý')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItem] ON 

INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (9, 7, 2, 3, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (10, 7, 1, 2, CAST(20.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (11, 8, 2, 16, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (12, 8, 11, 6, CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (13, 9, 11, 1, CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (14, 9, 14, 2, CAST(30000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (15, 9, 15, 2, CAST(350000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (16, 10, 11, 2, CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (17, 10, 12, 3, CAST(1200000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (18, 11, 12, 2, CAST(1200000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (19, 11, 13, 2, CAST(50000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (20, 11, 15, 2, CAST(350000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (21, 12, 11, 2, CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (22, 12, 12, 2, CAST(1200000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (23, 13, 11, 2, CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (24, 13, 15, 2, CAST(350000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (25, 13, 14, 2, CAST(30000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (26, 13, 13, 3, CAST(50000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (27, 14, 22, 4, CAST(70000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (28, 14, 23, 2, CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (29, 14, 26, 4, CAST(120000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (30, 14, 27, 2, CAST(300000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (31, 15, 11, 1, CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (32, 15, 14, 1, CAST(30000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (33, 16, 11, 2, CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (34, 16, 15, 4, CAST(350000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (35, 16, 12, 4, CAST(1200000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (36, 17, 11, 1, CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (37, 17, 12, 1, CAST(1200000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (38, 17, 15, 2, CAST(350000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (39, 17, 20, 1, CAST(30000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (40, 17, 2, 2, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (41, 18, 11, 1, CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (42, 18, 15, 1, CAST(350000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (43, 18, 19, 1, CAST(25000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (44, 20, 12, 1, CAST(1200000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (45, 20, 15, 5, CAST(350000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (46, 21, 11, 2, CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (47, 26, 11, 1, CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (48, 27, 2, 2, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (49, 27, 1, 6, CAST(20.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (50, 27, 11, 7, CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (51, 27, 12, 2, CAST(1200000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (52, 30, 1, 1, CAST(20.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (53, 30, 2, 1, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (54, 30, 11, 1, CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (55, 30, 12, 1, CAST(1200000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (56, 33, 1, 1, CAST(20.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (57, 33, 12, 1, CAST(1200000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (58, 33, 11, 1, CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (59, 33, 15, 1, CAST(350000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (60, 33, 2, 1, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (61, 34, 12, 2, CAST(1200000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (62, 34, 1, 1, CAST(20.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (63, 34, 2, 1, CAST(150.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[OrderItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductImage], [Description], [Price], [Stock], [EventID], [IsActive], [CreatedAt]) VALUES (1, N'Concert T-Shirt', N'./uploads/product/110624083002_images.jpg', N'Official T-Shirt for the concert', CAST(250000.00 AS Decimal(10, 2)), 60, 15, 1, CAST(N'2024-11-05T21:11:48.273' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductImage], [Description], [Price], [Stock], [EventID], [IsActive], [CreatedAt]) VALUES (2, N'VIP Pass', NULL, N'Exclusive VIP access pass', CAST(290000.00 AS Decimal(10, 2)), 40, 2, 1, CAST(N'2024-11-05T21:11:48.273' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductImage], [Description], [Price], [Stock], [EventID], [IsActive], [CreatedAt]) VALUES (11, N'Áo Thun Sự Kiện', N'./uploads/product/110624081431_Ao Thun Su Kien.png', N'Áo thun chính thức của sự kiện, chất liệu thoáng mát.', CAST(150000.00 AS Decimal(10, 2)), 170, 12, 1, CAST(N'2024-11-05T21:32:43.520' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductImage], [Description], [Price], [Stock], [EventID], [IsActive], [CreatedAt]) VALUES (12, N'Hỏi Làm gì', NULL, N'Vé VIP với quyền lợi đặc biệt.', CAST(1200000.00 AS Decimal(10, 2)), 31, 1, 1, CAST(N'2024-11-05T21:32:43.520' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductImage], [Description], [Price], [Stock], [EventID], [IsActive], [CreatedAt]) VALUES (13, N'Cốc Sứ', N'./uploads/product/110624081446_Coc Su.png', N'Cốc sứ in logo sự kiện.', CAST(50000.00 AS Decimal(10, 2)), 295, 14, 1, CAST(N'2024-11-05T21:32:43.520' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductImage], [Description], [Price], [Stock], [EventID], [IsActive], [CreatedAt]) VALUES (14, N'Poster', N'./uploads/product/110624081453_Poster.png', N'Poster chất lượng cao từ buổi hòa nhạc.', CAST(30000.00 AS Decimal(10, 2)), 495, 1, 1, CAST(N'2024-11-05T21:32:43.520' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductImage], [Description], [Price], [Stock], [EventID], [IsActive], [CreatedAt]) VALUES (15, N'Áo Khoác Hoodie', N'./uploads/product/110624081505_Ao Khoac Hoodie.png', N'Áo hoodie ấm áp với logo nghệ sĩ.', CAST(350000.00 AS Decimal(10, 2)), 81, 10, 1, CAST(N'2024-11-05T21:32:43.520' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductImage], [Description], [Price], [Stock], [EventID], [IsActive], [CreatedAt]) VALUES (16, N'Nón Lưỡi Trai', N'./uploads/product/110624081341_Non Luoi Trai.png', N'Nón lưỡi trai in logo sự kiện.', CAST(80000.00 AS Decimal(10, 2)), 150, 14, 1, CAST(N'2024-11-05T21:32:43.520' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductImage], [Description], [Price], [Stock], [EventID], [IsActive], [CreatedAt]) VALUES (17, N'Vòng Đeo Tay', N'./uploads/product/110624081603_Vong Deo Tay.png', N'Vòng tay màu sắc dành cho người hâm mộ.', CAST(15000.00 AS Decimal(10, 2)), 600, 17, 1, CAST(N'2024-11-05T21:32:43.520' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductImage], [Description], [Price], [Stock], [EventID], [IsActive], [CreatedAt]) VALUES (18, N'Móc Khóa', N'./uploads/product/110624081728_Moc Khoa.png', N'Móc khóa kỷ niệm của sự kiện.', CAST(20000.00 AS Decimal(10, 2)), 400, 1, 1, CAST(N'2024-11-05T21:32:43.520' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductImage], [Description], [Price], [Stock], [EventID], [IsActive], [CreatedAt]) VALUES (19, N'Bộ Hình Dán', N'hinh_dan.jpg', N'Bộ hình dán nghệ sĩ.', CAST(25000.00 AS Decimal(10, 2)), 249, NULL, 1, CAST(N'2024-11-05T21:32:43.520' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductImage], [Description], [Price], [Stock], [EventID], [IsActive], [CreatedAt]) VALUES (20, N'Khẩu Trang', N'khau_trang.jpg', N'Khẩu trang vải có logo sự kiện.', CAST(30000.00 AS Decimal(10, 2)), 199, NULL, 1, CAST(N'2024-11-05T21:32:43.520' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductImage], [Description], [Price], [Stock], [EventID], [IsActive], [CreatedAt]) VALUES (21, N'Nón Len', NULL, N'Nón len giữ ấm có logo nghệ sĩ.', CAST(100000.00 AS Decimal(10, 2)), 100, 12, 1, CAST(N'2024-11-05T21:32:43.520' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductImage], [Description], [Price], [Stock], [EventID], [IsActive], [CreatedAt]) VALUES (22, N'Ốp Điện Thoại', N'op_dien_thoai.jpg', N'Ốp điện thoại hình nghệ sĩ.', CAST(70000.00 AS Decimal(10, 2)), 96, NULL, 1, CAST(N'2024-11-05T21:32:43.520' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductImage], [Description], [Price], [Stock], [EventID], [IsActive], [CreatedAt]) VALUES (23, N'Bình Nước Inox', N'binh_nuoc.jpg', N'Bình nước inox in logo sự kiện.', CAST(150000.00 AS Decimal(10, 2)), 78, NULL, 1, CAST(N'2024-11-05T21:32:43.520' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductImage], [Description], [Price], [Stock], [EventID], [IsActive], [CreatedAt]) VALUES (24, N'Sổ Tay', N'so_tay.jpg', N'Sổ tay xoắn in logo sự kiện.', CAST(40000.00 AS Decimal(10, 2)), 200, NULL, 1, CAST(N'2024-11-05T21:32:43.520' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductImage], [Description], [Price], [Stock], [EventID], [IsActive], [CreatedAt]) VALUES (25, N'Kính Mát', NULL, N'Kính mát phong cách sự kiện.', CAST(120000.00 AS Decimal(10, 2)), 75, 8, 1, CAST(N'2024-11-05T21:32:43.520' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductImage], [Description], [Price], [Stock], [EventID], [IsActive], [CreatedAt]) VALUES (26, N'USB 16GB', N'usb.jpg', N'USB 16GB in logo nghệ sĩ.', CAST(120000.00 AS Decimal(10, 2)), 56, NULL, 1, CAST(N'2024-11-05T21:32:43.520' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductImage], [Description], [Price], [Stock], [EventID], [IsActive], [CreatedAt]) VALUES (27, N'Balo', N'balo.jpg', N'Balo thời trang có logo sự kiện.', CAST(300000.00 AS Decimal(10, 2)), 38, NULL, 1, CAST(N'2024-11-05T21:32:43.520' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductImage], [Description], [Price], [Stock], [EventID], [IsActive], [CreatedAt]) VALUES (28, N'Áo Sweater', N'sweater.jpg', N'Áo sweater thoải mái cho người hâm mộ.', CAST(250000.00 AS Decimal(10, 2)), 100, NULL, 1, CAST(N'2024-11-05T21:32:43.520' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductImage], [Description], [Price], [Stock], [EventID], [IsActive], [CreatedAt]) VALUES (29, N'Bộ Nam Châm Trang Trí', N'nam_cham.jpg', N'Bộ nam châm trang trí cho tủ lạnh.', CAST(20000.00 AS Decimal(10, 2)), 350, NULL, 1, CAST(N'2024-11-05T21:32:43.520' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductImage], [Description], [Price], [Stock], [EventID], [IsActive], [CreatedAt]) VALUES (30, N'Huy Hiệu', N'huy_hieu.jpg', N'Huy hiệu tròn có hình nghệ sĩ.', CAST(10000.00 AS Decimal(10, 2)), 450, NULL, 1, CAST(N'2024-11-05T21:32:43.520' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductImage], [Description], [Price], [Stock], [EventID], [IsActive], [CreatedAt]) VALUES (31, N'Giá Đỡ Điện Thoại', N'gia_do.jpg', N'Giá đỡ điện thoại có logo.', CAST(30000.00 AS Decimal(10, 2)), 200, NULL, 1, CAST(N'2024-11-05T21:32:43.520' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductImage], [Description], [Price], [Stock], [EventID], [IsActive], [CreatedAt]) VALUES (32, N'Túi Đeo Laptop', N'tui_laptop.jpg', N'Túi đựng laptop có logo sự kiện.', CAST(200000.00 AS Decimal(10, 2)), 40, NULL, 1, CAST(N'2024-11-05T21:32:43.520' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductImage], [Description], [Price], [Stock], [EventID], [IsActive], [CreatedAt]) VALUES (33, N'Túi Vải Tote', N'tui_tote.jpg', N'Túi vải tote có hình nghệ sĩ.', CAST(50000.00 AS Decimal(10, 2)), 100, NULL, 1, CAST(N'2024-11-05T21:32:43.520' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductImage], [Description], [Price], [Stock], [EventID], [IsActive], [CreatedAt]) VALUES (34, N'Dây Đeo Thẻ', NULL, N'Dây đeo thẻ sự kiện.', CAST(15000.00 AS Decimal(10, 2)), 500, 11, 1, CAST(N'2024-11-05T21:32:43.520' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductImage], [Description], [Price], [Stock], [EventID], [IsActive], [CreatedAt]) VALUES (35, N'Tai Nghe Bluetooth', N'tai_nghe.jpg', N'Tai nghe Bluetooth có in logo nghệ sĩ.', CAST(250000.00 AS Decimal(10, 2)), 50, NULL, 1, CAST(N'2024-11-05T21:32:43.520' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductImage], [Description], [Price], [Stock], [EventID], [IsActive], [CreatedAt]) VALUES (38, N'A', N'./uploads/product/110624121304_Screenshot 2024-09-18 190628.png', N'78', CAST(3.50 AS Decimal(10, 2)), 345, 1, 1, CAST(N'2024-11-06T12:13:04.280' AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'User')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Agent')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (4, N'Artist')
GO
SET IDENTITY_INSERT [dbo].[Song] ON 

INSERT [dbo].[Song] ([SongID], [SongName], [LinkToSong], [ReleaseDate], [ArtistID], [AlbumID], [genre_id], [CreatedAt]) VALUES (1, N'Song AB', N'https://youtube.com/songA', CAST(N'2023-02-01' AS Date), 1, 1, 1, CAST(N'2024-11-05T21:11:48.303' AS DateTime))
INSERT [dbo].[Song] ([SongID], [SongName], [LinkToSong], [ReleaseDate], [ArtistID], [AlbumID], [genre_id], [CreatedAt]) VALUES (2, N'Song B', N'https://youtube.com/songB', CAST(N'2024-03-01' AS Date), 2, 2, 2, CAST(N'2024-11-05T21:11:48.303' AS DateTime))
INSERT [dbo].[Song] ([SongID], [SongName], [LinkToSong], [ReleaseDate], [ArtistID], [AlbumID], [genre_id], [CreatedAt]) VALUES (3, N'Song B', N'https://chatgpt.com/c/672ae056-efa4-8005-bba4-e8496be4a3ee', CAST(N'2024-11-21' AS Date), 1, 1, 0, CAST(N'2024-11-06T11:21:55.893' AS DateTime))
SET IDENTITY_INSERT [dbo].[Song] OFF
GO
INSERT [dbo].[SongGenres] ([SongID], [genre_id]) VALUES (1, 1)
INSERT [dbo].[SongGenres] ([SongID], [genre_id]) VALUES (1, 2)
INSERT [dbo].[SongGenres] ([SongID], [genre_id]) VALUES (1, 3)
INSERT [dbo].[SongGenres] ([SongID], [genre_id]) VALUES (1, 4)
INSERT [dbo].[SongGenres] ([SongID], [genre_id]) VALUES (2, 2)
INSERT [dbo].[SongGenres] ([SongID], [genre_id]) VALUES (3, 1)
INSERT [dbo].[SongGenres] ([SongID], [genre_id]) VALUES (3, 2)
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [Username], [PasswordHash], [Email], [FullName], [image], [is_verified], [RoleID], [CreatedAt]) VALUES (1, N'admin123', N'c4ca4238a0b923820dcc509a6f75849b', N'admin@example.com', N'Admin User', N'admin.jpg', 1, 1, CAST(N'2024-11-05T21:11:48.230' AS DateTime))
INSERT [dbo].[User] ([UserID], [Username], [PasswordHash], [Email], [FullName], [image], [is_verified], [RoleID], [CreatedAt]) VALUES (2, N'user001', N'c4ca4238a0b923820dcc509a6f75849b', N'user001@example.com', N'User One', N'user1.jpg', 1, 2, CAST(N'2024-11-05T21:11:48.230' AS DateTime))
INSERT [dbo].[User] ([UserID], [Username], [PasswordHash], [Email], [FullName], [image], [is_verified], [RoleID], [CreatedAt]) VALUES (3, N'agent001', N'c4ca4238a0b923820dcc509a6f75849b', N'agent001@example.com', N'Agent One', N'agent1.jpg', 1, 3, CAST(N'2024-11-05T21:11:48.230' AS DateTime))
INSERT [dbo].[User] ([UserID], [Username], [PasswordHash], [Email], [FullName], [image], [is_verified], [RoleID], [CreatedAt]) VALUES (4, N'artist001', N'c4ca4238a0b923820dcc509a6f75849b', N'artist001@example.com', N'Artist One', N'artist1.jpg', 1, 4, CAST(N'2024-11-05T21:11:48.230' AS DateTime))
INSERT [dbo].[User] ([UserID], [Username], [PasswordHash], [Email], [FullName], [image], [is_verified], [RoleID], [CreatedAt]) VALUES (5, N'111', N'202cb962ac59075b964b07152d234b70', N'dinhdau200@gmail.com', N'111', NULL, 1, 2, CAST(N'2024-11-06T11:25:16.283' AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Agent] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Album] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Artist] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Booking] ADD  DEFAULT (getdate()) FOR [BookingDate]
GO
ALTER TABLE [dbo].[BookingForm] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[BookingForm] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Cart] ADD  DEFAULT (getdate()) FOR [AddedAt]
GO
ALTER TABLE [dbo].[Client] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[News] ADD  DEFAULT ('Draft') FOR [Status]
GO
ALTER TABLE [dbo].[News] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF__Order__OrderDate__46E78A0C]  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Song] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyID])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_Company]
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_User]
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD FOREIGN KEY([ArtistID])
REFERENCES [dbo].[Artist] ([ArtistID])
GO
ALTER TABLE [dbo].[Artist]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Artist]  WITH CHECK ADD  CONSTRAINT [FK_Artist_Agency] FOREIGN KEY([AgencyID])
REFERENCES [dbo].[Agent] ([AgentID])
GO
ALTER TABLE [dbo].[Artist] CHECK CONSTRAINT [FK_Artist_Agency]
GO
ALTER TABLE [dbo].[ArtistGenres]  WITH CHECK ADD FOREIGN KEY([ArtistID])
REFERENCES [dbo].[Artist] ([ArtistID])
GO
ALTER TABLE [dbo].[ArtistGenres]  WITH CHECK ADD FOREIGN KEY([genre_id])
REFERENCES [dbo].[Genres] ([genre_id])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([ArtistID])
REFERENCES [dbo].[Artist] ([ArtistID])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[BookingArtists]  WITH CHECK ADD FOREIGN KEY([ArtistID])
REFERENCES [dbo].[Artist] ([ArtistID])
GO
ALTER TABLE [dbo].[BookingArtists]  WITH CHECK ADD FOREIGN KEY([BookingID])
REFERENCES [dbo].[BookingForm] ([BookingID])
GO
ALTER TABLE [dbo].[BookingForm]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ClientID])
GO
ALTER TABLE [dbo].[BookingForm]  WITH CHECK ADD  CONSTRAINT [FK__BookingFo__Event__619B8048] FOREIGN KEY([EventID])
REFERENCES [dbo].[EventDetails] ([EventID])
GO
ALTER TABLE [dbo].[BookingForm] CHECK CONSTRAINT [FK__BookingFo__Event__619B8048]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ClientID])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD FOREIGN KEY([AuthorID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK__Order__ClientID__66603565] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ClientID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK__Order__ClientID__66603565]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK__OrderItem__Order__6754599E] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK__OrderItem__Order__6754599E]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__EventID__693CA210] FOREIGN KEY([EventID])
REFERENCES [dbo].[EventDetails] ([EventID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__EventID__693CA210]
GO
ALTER TABLE [dbo].[Song]  WITH CHECK ADD FOREIGN KEY([AlbumID])
REFERENCES [dbo].[Album] ([AlbumID])
GO
ALTER TABLE [dbo].[Song]  WITH CHECK ADD FOREIGN KEY([ArtistID])
REFERENCES [dbo].[Artist] ([ArtistID])
GO
ALTER TABLE [dbo].[SongGenres]  WITH CHECK ADD FOREIGN KEY([genre_id])
REFERENCES [dbo].[Genres] ([genre_id])
GO
ALTER TABLE [dbo].[SongGenres]  WITH CHECK ADD FOREIGN KEY([SongID])
REFERENCES [dbo].[Song] ([SongID])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
