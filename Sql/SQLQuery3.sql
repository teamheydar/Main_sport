
/****** Object:  Table [dbo].[tbl_User]    Script Date: 08/17/2022 17:00:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](350) NULL,
	[Password] [nvarchar](50) NULL,
	[Code] [nvarchar](max) NULL,
	[R_Code] [int] NULL,
	[R_Date] [nvarchar](50) NULL,
	[N_Phone] [nvarchar](15) NOT NULL,
	[N_Home] [nvarchar](15) NULL,
	[Email] [nvarchar](300) NULL,
	[Address] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Codey] [nvarchar](50) NOT NULL,
	[D_Birth] [nvarchar](50) NULL,
	[G_Blood] [nvarchar](50) NULL,
	[N_Insurance] [nvarchar](150) NULL,
	[Gender] [int] NULL,
	[Marital] [int] NULL,
	[D_E_Insurance] [nvarchar](50) NULL,
	[img] [nvarchar](max) NULL,
	[GymID] [int] NULL,
	[Deleted] [int] NOT NULL,
	[OkAdmin] [int] NOT NULL,
	[FullItem] [int] NOT NULL,
 CONSTRAINT [PK_tbl_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_User] ON
INSERT [dbo].[tbl_User] ([ID], [FullName], [UserName], [Password], [Code], [R_Code], [R_Date], [N_Phone], [N_Home], [Email], [Address], [Description], [Codey], [D_Birth], [G_Blood], [N_Insurance], [Gender], [Marital], [D_E_Insurance], [img], [GymID], [Deleted], [OkAdmin], [FullItem]) VALUES (21, N'gt', NULL, NULL, N'dthtgj35j', NULL, N'1401/5/13', N'4546', NULL, NULL, NULL, NULL, N'5859', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 1, 0)
INSERT [dbo].[tbl_User] ([ID], [FullName], [UserName], [Password], [Code], [R_Code], [R_Date], [N_Phone], [N_Home], [Email], [Address], [Description], [Codey], [D_Birth], [G_Blood], [N_Insurance], [Gender], [Marital], [D_E_Insurance], [img], [GymID], [Deleted], [OkAdmin], [FullItem]) VALUES (22, N'علیرضا حایری', N'12', N'00', N'tj4st68j4srt', NULL, N'1401/5/13', N'00', N'5757575', NULL, N'', N'', N'12', N'1401/05/21', NULL, N'', 0, 0, N'', N'DefaultUser.png', 8, 0, 1, 1)
INSERT [dbo].[tbl_User] ([ID], [FullName], [UserName], [Password], [Code], [R_Code], [R_Date], [N_Phone], [N_Home], [Email], [Address], [Description], [Codey], [D_Birth], [G_Blood], [N_Insurance], [Gender], [Marital], [D_E_Insurance], [img], [GymID], [Deleted], [OkAdmin], [FullItem]) VALUES (23, N'علیرضا حایری', N'00', N'00', N't4j6ry4j', NULL, N'1401/5/13', N'00', N'00', NULL, N'', N'', N'00', N'2022-08-09', NULL, N'', 0, 0, N'', N'DefaultUser.png', 8, 0, 1, 1)
INSERT [dbo].[tbl_User] ([ID], [FullName], [UserName], [Password], [Code], [R_Code], [R_Date], [N_Phone], [N_Home], [Email], [Address], [Description], [Codey], [D_Birth], [G_Blood], [N_Insurance], [Gender], [Marital], [D_E_Insurance], [img], [GymID], [Deleted], [OkAdmin], [FullItem]) VALUES (24, N'ssssss', N'0', N'0', N'fg4ryj6tyj68tyj4y', NULL, N'1401/5/17', N'0', NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL, NULL, NULL, N'DefaultUser.png', 8, 0, 1, 0)
INSERT [dbo].[tbl_User] ([ID], [FullName], [UserName], [Password], [Code], [R_Code], [R_Date], [N_Phone], [N_Home], [Email], [Address], [Description], [Codey], [D_Birth], [G_Blood], [N_Insurance], [Gender], [Marital], [D_E_Insurance], [img], [GymID], [Deleted], [OkAdmin], [FullItem]) VALUES (25, N'ماااااااااااااا', N'678678676', N'57867678678', N'', NULL, N'1401/5/19', N'57867678678', NULL, NULL, NULL, NULL, N'678678676', NULL, NULL, NULL, NULL, NULL, NULL, N'DefaultUser.png', 8, 0, 0, 0)
INSERT [dbo].[tbl_User] ([ID], [FullName], [UserName], [Password], [Code], [R_Code], [R_Date], [N_Phone], [N_Home], [Email], [Address], [Description], [Codey], [D_Birth], [G_Blood], [N_Insurance], [Gender], [Marital], [D_E_Insurance], [img], [GymID], [Deleted], [OkAdmin], [FullItem]) VALUES (26, N'زلانزلغن', N'675675756', N'83783783', N'a', NULL, N'1401/5/19', N'83783783', NULL, NULL, NULL, NULL, N'675675756', NULL, NULL, NULL, NULL, NULL, NULL, N'DefaultUser.png', 8, 0, 1, 0)
INSERT [dbo].[tbl_User] ([ID], [FullName], [UserName], [Password], [Code], [R_Code], [R_Date], [N_Phone], [N_Home], [Email], [Address], [Description], [Codey], [D_Birth], [G_Blood], [N_Insurance], [Gender], [Marital], [D_E_Insurance], [img], [GymID], [Deleted], [OkAdmin], [FullItem]) VALUES (27, N'بفتقغتفغتغفتفیغتفغیفتیفت', N'7686786887678', N'67867867867', N'aaaaaa', NULL, N'1401/5/19', N'67867867867', NULL, NULL, NULL, NULL, N'7686786887678', NULL, NULL, NULL, NULL, NULL, NULL, N'DefaultUser.png', 8, 0, 1, 0)
INSERT [dbo].[tbl_User] ([ID], [FullName], [UserName], [Password], [Code], [R_Code], [R_Date], [N_Phone], [N_Home], [Email], [Address], [Description], [Codey], [D_Birth], [G_Blood], [N_Insurance], [Gender], [Marital], [D_E_Insurance], [img], [GymID], [Deleted], [OkAdmin], [FullItem]) VALUES (28, N'تقفیقفتثقتثقغتثقغتثفتفغتفغتفغت', N'756783788', N'78378378', N'thrthrth', NULL, N'1401/5/19', N'78378378', NULL, NULL, NULL, NULL, N'756783788', NULL, NULL, NULL, NULL, NULL, NULL, N'DefaultUser.png', 8, 0, 1, 0)
SET IDENTITY_INSERT [dbo].[tbl_User] OFF
/****** Object:  Table [dbo].[tbl_TimeUser]    Script Date: 08/17/2022 17:00:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TimeUser](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserCodey] [nvarchar](50) NOT NULL,
	[GymID] [int] NOT NULL,
	[Date] [nvarchar](50) NOT NULL,
	[TimeLogin] [nvarchar](50) NOT NULL,
	[TimeOut] [nvarchar](50) NOT NULL,
	[DateWek] [nvarchar](50) NOT NULL,
	[Deleted] [int] NOT NULL,
 CONSTRAINT [PK_tbl_TimeUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_TimeUser] ON
INSERT [dbo].[tbl_TimeUser] ([ID], [UserCodey], [GymID], [Date], [TimeLogin], [TimeOut], [DateWek], [Deleted]) VALUES (5, N'548', 8, N'g', N'2', N'2', N'fg', 1)
INSERT [dbo].[tbl_TimeUser] ([ID], [UserCodey], [GymID], [Date], [TimeLogin], [TimeOut], [DateWek], [Deleted]) VALUES (6, N'', 8, N'9633-05-06T08:07', N'', N'', N'جمعه', 1)
INSERT [dbo].[tbl_TimeUser] ([ID], [UserCodey], [GymID], [Date], [TimeLogin], [TimeOut], [DateWek], [Deleted]) VALUES (7, N'', 8, N'2022-08-16T03:49', N'', N'', N'سه شنبه', 1)
INSERT [dbo].[tbl_TimeUser] ([ID], [UserCodey], [GymID], [Date], [TimeLogin], [TimeOut], [DateWek], [Deleted]) VALUES (8, N'000', 8, N'2022-08-30T03:52', N'0', N'0', N'سه شنبه', 1)
INSERT [dbo].[tbl_TimeUser] ([ID], [UserCodey], [GymID], [Date], [TimeLogin], [TimeOut], [DateWek], [Deleted]) VALUES (9, N'o', 8, N'1401-05-26', N'i', N'i', N'چهار شنبه', 1)
INSERT [dbo].[tbl_TimeUser] ([ID], [UserCodey], [GymID], [Date], [TimeLogin], [TimeOut], [DateWek], [Deleted]) VALUES (10, N'd', 8, N'1401/05/18', N'd', N'd', N'سه شنبه', 0)
INSERT [dbo].[tbl_TimeUser] ([ID], [UserCodey], [GymID], [Date], [TimeLogin], [TimeOut], [DateWek], [Deleted]) VALUES (11, N'12', 8, N'1401/05/18', N'03:00', N'19:00', N'سه شنبه', 0)
INSERT [dbo].[tbl_TimeUser] ([ID], [UserCodey], [GymID], [Date], [TimeLogin], [TimeOut], [DateWek], [Deleted]) VALUES (12, N'd', 8, N'1401/05/02', N'12:00', N'04:00', N'یک شنبه', 0)
INSERT [dbo].[tbl_TimeUser] ([ID], [UserCodey], [GymID], [Date], [TimeLogin], [TimeOut], [DateWek], [Deleted]) VALUES (13, N'd', 8, N'1401/05/03', N'12:00', N'12:00', N'دو شنبه', 0)
SET IDENTITY_INSERT [dbo].[tbl_TimeUser] OFF
/****** Object:  Table [dbo].[tbl_Teacher]    Script Date: 08/17/2022 17:00:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Teacher](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](350) NULL,
	[Password] [nvarchar](50) NULL,
	[Code] [nvarchar](max) NULL,
	[R_Code] [int] NULL,
	[R_Date] [nvarchar](50) NULL,
	[N_Phone] [nvarchar](15) NOT NULL,
	[N_Home] [nvarchar](15) NULL,
	[Email] [nvarchar](300) NULL,
	[Address] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Codey] [nvarchar](50) NOT NULL,
	[D_Birth] [nvarchar](50) NULL,
	[G_Blood] [nvarchar](50) NULL,
	[N_Insurance] [nvarchar](150) NULL,
	[Gender] [int] NOT NULL,
	[Marital] [int] NOT NULL,
	[D_E_Insurance] [nvarchar](50) NULL,
	[img] [nvarchar](max) NULL,
	[Gym_ID] [int] NOT NULL,
	[Deleted] [int] NOT NULL,
	[FullItem] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Teacher] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Teacher] ON
INSERT [dbo].[tbl_Teacher] ([ID], [FullName], [UserName], [Password], [Code], [R_Code], [R_Date], [N_Phone], [N_Home], [Email], [Address], [Description], [Codey], [D_Birth], [G_Blood], [N_Insurance], [Gender], [Marital], [D_E_Insurance], [img], [Gym_ID], [Deleted], [FullItem]) VALUES (3, N'tyut', N'hoiuj', N'huyg', N'h341t35jh', NULL, N'1401/5/21', N'huyg', N'ikuhpo', NULL, N'87', N'78', N'hoiuj', N'1401/05/09', NULL, N'788', 0, 0, N'1401/05/30', N'DefaultTeacher.png', 8, 0, 0)
INSERT [dbo].[tbl_Teacher] ([ID], [FullName], [UserName], [Password], [Code], [R_Code], [R_Date], [N_Phone], [N_Home], [Email], [Address], [Description], [Codey], [D_Birth], [G_Blood], [N_Insurance], [Gender], [Marital], [D_E_Insurance], [img], [Gym_ID], [Deleted], [FullItem]) VALUES (4, N'امیر محمد', N'44644535', N'3863865786578', N'maaaaaaaaaaaa', NULL, N'1401/5/19', N'3863865786578', N'448384348', NULL, N'سر کوچه', N'خیلی خوبام', N'44644535', N'2022-08-10', NULL, N'rthrthrt', 1, 1, N'1402/10/16', N'Default.png', 8, 0, 0)
SET IDENTITY_INSERT [dbo].[tbl_Teacher] OFF
/****** Object:  Table [dbo].[tbl_SportFild]    Script Date: 08/17/2022 17:00:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_SportFild](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[GymID] [int] NOT NULL,
	[Code] [nvarchar](max) NOT NULL,
	[Deleted] [int] NOT NULL,
 CONSTRAINT [PK_tbl_SportFild] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_SportFild] ON
INSERT [dbo].[tbl_SportFild] ([ID], [Name], [GymID], [Code], [Deleted]) VALUES (3, N'u', 0, N'45354ghfth', 0)
INSERT [dbo].[tbl_SportFild] ([ID], [Name], [GymID], [Code], [Deleted]) VALUES (4, N'علیرضا حایری', 0, N'g31r65hrt5r', 0)
INSERT [dbo].[tbl_SportFild] ([ID], [Name], [GymID], [Code], [Deleted]) VALUES (5, N'امیر محمد', 0, N'maaaaaaaaaaaa', 0)
SET IDENTITY_INSERT [dbo].[tbl_SportFild] OFF
/****** Object:  Table [dbo].[tbl_SansBuy]    Script Date: 08/17/2022 17:00:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_SansBuy](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SansID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Deleted] [int] NOT NULL,
 CONSTRAINT [PK_tbl_SansBuy] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_SansBuy] ON
INSERT [dbo].[tbl_SansBuy] ([ID], [SansID], [UserID], [Deleted]) VALUES (19, 11, 22, 1)
INSERT [dbo].[tbl_SansBuy] ([ID], [SansID], [UserID], [Deleted]) VALUES (20, 8, 22, 1)
INSERT [dbo].[tbl_SansBuy] ([ID], [SansID], [UserID], [Deleted]) VALUES (21, 13, 22, 1)
INSERT [dbo].[tbl_SansBuy] ([ID], [SansID], [UserID], [Deleted]) VALUES (22, 12, 22, 1)
INSERT [dbo].[tbl_SansBuy] ([ID], [SansID], [UserID], [Deleted]) VALUES (23, 13, 23, 0)
INSERT [dbo].[tbl_SansBuy] ([ID], [SansID], [UserID], [Deleted]) VALUES (24, 9, 23, 0)
INSERT [dbo].[tbl_SansBuy] ([ID], [SansID], [UserID], [Deleted]) VALUES (25, 12, 23, 0)
SET IDENTITY_INSERT [dbo].[tbl_SansBuy] OFF
/****** Object:  Table [dbo].[tbl_Sans]    Script Date: 08/17/2022 17:00:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Sans](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](350) NOT NULL,
	[Code] [nvarchar](max) NOT NULL,
	[SportFildID] [int] NOT NULL,
	[SportFild] [nvarchar](max) NOT NULL,
	[GymID] [int] NOT NULL,
	[Gym] [nvarchar](max) NOT NULL,
	[Techare] [nvarchar](250) NULL,
	[TechareID] [int] NULL,
	[Gender] [int] NOT NULL,
	[D_Start] [nvarchar](50) NOT NULL,
	[D_End] [nvarchar](50) NOT NULL,
	[Days] [nvarchar](max) NOT NULL,
	[Mony] [int] NOT NULL,
	[CostTypeID] [int] NOT NULL,
	[Deleted] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Sans] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Sans] ON
INSERT [dbo].[tbl_Sans] ([ID], [FullName], [Code], [SportFildID], [SportFild], [GymID], [Gym], [Techare], [TechareID], [Gender], [D_Start], [D_End], [Days], [Mony], [CostTypeID], [Deleted]) VALUES (8, N'dgf', N'gfhtjsr', 4, N'علیرضا حایری', 8, N'باشگاه تهران', N'امیر محمد', 4, 1, N'1399/05/03', N'1399/05/03', N'فرد', 10000, 0, 1)
INSERT [dbo].[tbl_Sans] ([ID], [FullName], [Code], [SportFildID], [SportFild], [GymID], [Gym], [Techare], [TechareID], [Gender], [D_Start], [D_End], [Days], [Mony], [CostTypeID], [Deleted]) VALUES (9, N'1', N'rtyjrjjrt', 4, N'علیرضا حایری', 8, N'باشگاه تهران', N'tyut', 3, 1, N'1401/05/09', N'1401/05/10', N'زوج', 10000, 0, 0)
INSERT [dbo].[tbl_Sans] ([ID], [FullName], [Code], [SportFildID], [SportFild], [GymID], [Gym], [Techare], [TechareID], [Gender], [D_Start], [D_End], [Days], [Mony], [CostTypeID], [Deleted]) VALUES (12, N'erg', N'jy', 5, N'امیر محمد', 8, N'باشگاه تهران', N'امیر محمد', 4, 1, N'1', N'1', N'زوج', 10000, 0, 0)
INSERT [dbo].[tbl_Sans] ([ID], [FullName], [Code], [SportFildID], [SportFild], [GymID], [Gym], [Techare], [TechareID], [Gender], [D_Start], [D_End], [Days], [Mony], [CostTypeID], [Deleted]) VALUES (13, N'jrytyjtyj', N'1jy', 4, N'علیرضا حایری', 8, N'باشگاه تهران', NULL, NULL, 1, N'1400-02-3', N'1401-05-3', N'فرد', 10000, 0, 0)
SET IDENTITY_INSERT [dbo].[tbl_Sans] OFF
/****** Object:  Table [dbo].[tbl_Orders]    Script Date: 08/17/2022 17:00:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SansID] [int] NULL,
	[MemberID] [int] NULL,
	[Date_Insert] [nvarchar](50) NULL,
	[IsFinal] [bit] NULL,
 CONSTRAINT [PK_tbl_Orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Orders] ON
INSERT [dbo].[tbl_Orders] ([ID], [SansID], [MemberID], [Date_Insert], [IsFinal]) VALUES (18, 9, 23, N'1401/5/26', 1)
INSERT [dbo].[tbl_Orders] ([ID], [SansID], [MemberID], [Date_Insert], [IsFinal]) VALUES (22, 12, 23, N'1401/5/26', 1)
SET IDENTITY_INSERT [dbo].[tbl_Orders] OFF
/****** Object:  Table [dbo].[tbl_OnlinePayment]    Script Date: 08/17/2022 17:00:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_OnlinePayment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[PaymentAmount] [decimal](18, 0) NULL,
	[PaymentDate] [nvarchar](50) NULL,
	[PaymentIsSuccessful] [bit] NULL,
	[PaymentResponseCode] [nvarchar](50) NULL,
	[PaymentResponseMessage] [nvarchar](max) NULL,
	[PaymentTransactionID] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_OnlinePayment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_OnlinePayment] ON
INSERT [dbo].[tbl_OnlinePayment] ([ID], [OrderID], [PaymentAmount], [PaymentDate], [PaymentIsSuccessful], [PaymentResponseCode], [PaymentResponseMessage], [PaymentTransactionID]) VALUES (1, 1, CAST(1 AS Decimal(18, 0)), N'1401/5/25', 0, NULL, NULL, NULL)
INSERT [dbo].[tbl_OnlinePayment] ([ID], [OrderID], [PaymentAmount], [PaymentDate], [PaymentIsSuccessful], [PaymentResponseCode], [PaymentResponseMessage], [PaymentTransactionID]) VALUES (2, 2, CAST(1 AS Decimal(18, 0)), N'1401/5/25', 0, NULL, NULL, NULL)
INSERT [dbo].[tbl_OnlinePayment] ([ID], [OrderID], [PaymentAmount], [PaymentDate], [PaymentIsSuccessful], [PaymentResponseCode], [PaymentResponseMessage], [PaymentTransactionID]) VALUES (3, 3, CAST(1 AS Decimal(18, 0)), N'1401/5/25', 0, NULL, NULL, NULL)
INSERT [dbo].[tbl_OnlinePayment] ([ID], [OrderID], [PaymentAmount], [PaymentDate], [PaymentIsSuccessful], [PaymentResponseCode], [PaymentResponseMessage], [PaymentTransactionID]) VALUES (4, 4, CAST(1 AS Decimal(18, 0)), N'1401/5/25', 0, NULL, NULL, NULL)
INSERT [dbo].[tbl_OnlinePayment] ([ID], [OrderID], [PaymentAmount], [PaymentDate], [PaymentIsSuccessful], [PaymentResponseCode], [PaymentResponseMessage], [PaymentTransactionID]) VALUES (5, 5, CAST(1 AS Decimal(18, 0)), N'1401/5/25', 0, NULL, NULL, NULL)
INSERT [dbo].[tbl_OnlinePayment] ([ID], [OrderID], [PaymentAmount], [PaymentDate], [PaymentIsSuccessful], [PaymentResponseCode], [PaymentResponseMessage], [PaymentTransactionID]) VALUES (6, 6, CAST(1 AS Decimal(18, 0)), N'1401/5/25', 0, NULL, NULL, NULL)
INSERT [dbo].[tbl_OnlinePayment] ([ID], [OrderID], [PaymentAmount], [PaymentDate], [PaymentIsSuccessful], [PaymentResponseCode], [PaymentResponseMessage], [PaymentTransactionID]) VALUES (7, 7, CAST(1 AS Decimal(18, 0)), N'1401/5/25', 0, NULL, NULL, NULL)
INSERT [dbo].[tbl_OnlinePayment] ([ID], [OrderID], [PaymentAmount], [PaymentDate], [PaymentIsSuccessful], [PaymentResponseCode], [PaymentResponseMessage], [PaymentTransactionID]) VALUES (8, 8, CAST(1 AS Decimal(18, 0)), N'1401/5/26', 0, NULL, NULL, NULL)
INSERT [dbo].[tbl_OnlinePayment] ([ID], [OrderID], [PaymentAmount], [PaymentDate], [PaymentIsSuccessful], [PaymentResponseCode], [PaymentResponseMessage], [PaymentTransactionID]) VALUES (9, 9, CAST(1 AS Decimal(18, 0)), N'1401/5/26', 0, NULL, NULL, NULL)
INSERT [dbo].[tbl_OnlinePayment] ([ID], [OrderID], [PaymentAmount], [PaymentDate], [PaymentIsSuccessful], [PaymentResponseCode], [PaymentResponseMessage], [PaymentTransactionID]) VALUES (10, 10, CAST(1 AS Decimal(18, 0)), N'1401/5/26', 0, NULL, NULL, NULL)
INSERT [dbo].[tbl_OnlinePayment] ([ID], [OrderID], [PaymentAmount], [PaymentDate], [PaymentIsSuccessful], [PaymentResponseCode], [PaymentResponseMessage], [PaymentTransactionID]) VALUES (11, 11, CAST(1 AS Decimal(18, 0)), N'1401/5/26', 0, NULL, NULL, NULL)
INSERT [dbo].[tbl_OnlinePayment] ([ID], [OrderID], [PaymentAmount], [PaymentDate], [PaymentIsSuccessful], [PaymentResponseCode], [PaymentResponseMessage], [PaymentTransactionID]) VALUES (12, 12, CAST(1 AS Decimal(18, 0)), N'1401/5/26', 0, NULL, NULL, NULL)
INSERT [dbo].[tbl_OnlinePayment] ([ID], [OrderID], [PaymentAmount], [PaymentDate], [PaymentIsSuccessful], [PaymentResponseCode], [PaymentResponseMessage], [PaymentTransactionID]) VALUES (13, 13, CAST(30000 AS Decimal(18, 0)), N'1401/5/26', 0, NULL, NULL, NULL)
INSERT [dbo].[tbl_OnlinePayment] ([ID], [OrderID], [PaymentAmount], [PaymentDate], [PaymentIsSuccessful], [PaymentResponseCode], [PaymentResponseMessage], [PaymentTransactionID]) VALUES (14, 14, CAST(30000 AS Decimal(18, 0)), N'1401/5/26', 0, NULL, NULL, NULL)
INSERT [dbo].[tbl_OnlinePayment] ([ID], [OrderID], [PaymentAmount], [PaymentDate], [PaymentIsSuccessful], [PaymentResponseCode], [PaymentResponseMessage], [PaymentTransactionID]) VALUES (15, 15, CAST(30000 AS Decimal(18, 0)), N'1401/5/26', 0, NULL, NULL, NULL)
INSERT [dbo].[tbl_OnlinePayment] ([ID], [OrderID], [PaymentAmount], [PaymentDate], [PaymentIsSuccessful], [PaymentResponseCode], [PaymentResponseMessage], [PaymentTransactionID]) VALUES (16, 16, CAST(10000 AS Decimal(18, 0)), N'1401/5/26', 0, NULL, NULL, NULL)
INSERT [dbo].[tbl_OnlinePayment] ([ID], [OrderID], [PaymentAmount], [PaymentDate], [PaymentIsSuccessful], [PaymentResponseCode], [PaymentResponseMessage], [PaymentTransactionID]) VALUES (17, 17, CAST(10000 AS Decimal(18, 0)), N'1401/5/26', 0, NULL, NULL, NULL)
INSERT [dbo].[tbl_OnlinePayment] ([ID], [OrderID], [PaymentAmount], [PaymentDate], [PaymentIsSuccessful], [PaymentResponseCode], [PaymentResponseMessage], [PaymentTransactionID]) VALUES (18, 18, CAST(10000 AS Decimal(18, 0)), N'1401/5/26 11:59 ق.ظ', 1, N'100', N' عملیات موفق', N'36886154801')
INSERT [dbo].[tbl_OnlinePayment] ([ID], [OrderID], [PaymentAmount], [PaymentDate], [PaymentIsSuccessful], [PaymentResponseCode], [PaymentResponseMessage], [PaymentTransactionID]) VALUES (19, 19, CAST(10000 AS Decimal(18, 0)), N'1401/5/26', 0, NULL, NULL, NULL)
INSERT [dbo].[tbl_OnlinePayment] ([ID], [OrderID], [PaymentAmount], [PaymentDate], [PaymentIsSuccessful], [PaymentResponseCode], [PaymentResponseMessage], [PaymentTransactionID]) VALUES (20, 20, CAST(10000 AS Decimal(18, 0)), N'1401/5/26', 0, NULL, NULL, NULL)
INSERT [dbo].[tbl_OnlinePayment] ([ID], [OrderID], [PaymentAmount], [PaymentDate], [PaymentIsSuccessful], [PaymentResponseCode], [PaymentResponseMessage], [PaymentTransactionID]) VALUES (21, 21, CAST(10000 AS Decimal(18, 0)), N'1401/5/26 12:04 ب.ظ', 0, N'-51', N'پرداخت ناموفق', N'-51')
INSERT [dbo].[tbl_OnlinePayment] ([ID], [OrderID], [PaymentAmount], [PaymentDate], [PaymentIsSuccessful], [PaymentResponseCode], [PaymentResponseMessage], [PaymentTransactionID]) VALUES (22, 22, CAST(10000 AS Decimal(18, 0)), N'1401/5/26 12:05 ب.ظ', 1, N'100', N' عملیات موفق', N'36886323301')
SET IDENTITY_INSERT [dbo].[tbl_OnlinePayment] OFF
/****** Object:  Table [dbo].[tbl_CostType]    Script Date: 08/17/2022 17:00:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CostType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](250) NOT NULL,
	[Code] [nvarchar](max) NOT NULL,
	[Gym] [int] NOT NULL,
	[Deleted] [int] NOT NULL,
 CONSTRAINT [PK_tbl_CostType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_CostType] ON
INSERT [dbo].[tbl_CostType] ([ID], [Type], [Code], [Gym], [Deleted]) VALUES (33, N'aaaa', N'gthdth1541dfdfsfgthdth1541 ', 8, 0)
INSERT [dbo].[tbl_CostType] ([ID], [Type], [Code], [Gym], [Deleted]) VALUES (34, N'sdgg', N'gthdth1541 ', 8, 0)
INSERT [dbo].[tbl_CostType] ([ID], [Type], [Code], [Gym], [Deleted]) VALUES (36, N'asgsrg', N'dfdfsfgthdth1541 ', 8, 0)
SET IDENTITY_INSERT [dbo].[tbl_CostType] OFF
/****** Object:  Table [dbo].[tbl_CMS]    Script Date: 08/17/2022 17:00:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CMS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PanelTitel] [nvarchar](max) NULL,
	[TextFoter] [nvarchar](max) NULL,
	[imgTitel] [nvarchar](max) NULL,
	[Slidimg1] [nvarchar](max) NULL,
	[Slidimg2] [nvarchar](max) NULL,
	[Slidimg3] [nvarchar](max) NULL,
	[TitelMinAbut] [nvarchar](max) NULL,
	[TextMinAbut] [nvarchar](max) NULL,
	[imgMinAbut] [nvarchar](max) NULL,
	[TitelCart] [nvarchar](max) NULL,
	[TextCart] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[NumberPhone] [nvarchar](max) NULL,
	[FoterMain] [nvarchar](max) NULL,
	[ATitel] [nvarchar](max) NULL,
	[AText] [nvarchar](max) NULL,
	[ATitel1] [nvarchar](max) NULL,
	[AText1] [nvarchar](max) NULL,
	[ATitel2] [nvarchar](max) NULL,
	[AText2] [nvarchar](max) NULL,
	[ATitel3] [nvarchar](max) NULL,
	[AText3] [nvarchar](max) NULL,
	[ATitelCart] [nvarchar](max) NULL,
	[ATextCart] [nvarchar](max) NULL,
	[MapX] [nvarchar](max) NULL,
	[MapY] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_CMS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_CMS] ON
INSERT [dbo].[tbl_CMS] ([ID], [PanelTitel], [TextFoter], [imgTitel], [Slidimg1], [Slidimg2], [Slidimg3], [TitelMinAbut], [TextMinAbut], [imgMinAbut], [TitelCart], [TextCart], [Description], [Address], [NumberPhone], [FoterMain], [ATitel], [AText], [ATitel1], [AText1], [ATitel2], [AText2], [ATitel3], [AText3], [ATitelCart], [ATextCart], [MapX], [MapY]) VALUES (1, N'Sport ', N'سایت ورزشی یزد', N'Logo.png', N'Slid1.png', N'Slid2.png', N'Slid3.png', N'Sport Yazd', N'باشگاه ورزشی آنلاین در یزد افتتاح شد', N'Aboutimg.png', N'Sport', N'اولین باشگاه آنلاین در یزد', N'علیرضا حایری و امیر محمد عبادی فر', N'Mehriz-Yazd', N'09907912890 , 09944824375', N'فوتر اصلی', N'درباره ما', N'توضیحات طولانی', N'عنوان یک', N'متن نسبتا طولانی', N'عنوان دو', N'متن نسبتا طولانی', N'عنوان سه', N'متن نسبتا طولانی', NULL, NULL, N'31.57389383150505', N'54.44495916366578')
SET IDENTITY_INSERT [dbo].[tbl_CMS] OFF
/****** Object:  Table [dbo].[tbl_Admins]    Script Date: 08/17/2022 17:00:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Admins](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](450) NOT NULL,
	[Password] [nvarchar](450) NOT NULL,
	[Codey] [nvarchar](50) NOT NULL,
	[GymID] [int] NOT NULL,
	[Code] [nvarchar](max) NOT NULL,
	[N_Phone] [nvarchar](15) NOT NULL,
	[N_Home] [nvarchar](15) NULL,
	[Address] [nvarchar](max) NULL,
	[img] [nvarchar](150) NULL,
	[AdminLevel] [int] NOT NULL,
	[D_Birth] [nvarchar](50) NULL,
	[Gender] [int] NULL,
	[Marital] [int] NULL,
	[FullNameGym] [nvarchar](450) NOT NULL,
	[N_PhoneGym] [nvarchar](15) NOT NULL,
	[AddressGym] [nvarchar](max) NOT NULL,
	[DescriptionGym] [nvarchar](max) NULL,
	[R_DateGym] [nvarchar](50) NOT NULL,
	[E_DateGym] [nvarchar](50) NULL,
	[DebtGym] [int] NOT NULL,
	[Active] [int] NOT NULL,
	[Deleted] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Admins] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Admins] ON
INSERT [dbo].[tbl_Admins] ([ID], [FullName], [UserName], [Password], [Codey], [GymID], [Code], [N_Phone], [N_Home], [Address], [img], [AdminLevel], [D_Birth], [Gender], [Marital], [FullNameGym], [N_PhoneGym], [AddressGym], [DescriptionGym], [R_DateGym], [E_DateGym], [DebtGym], [Active], [Deleted]) VALUES (3, N'امیر علی', N'admin', N'pass', N'143546', 0, N'aa', N'0944634534', N'14554', N'توضیحات', N'DefaultAdmin.png', 1, N'2022-07-12', 0, 0, N'ادمین', N'41656546', N'میدان شهر داری', N'باشگاه مدرن', N'454', N'1402/03/21', 1212, 0, 0)
INSERT [dbo].[tbl_Admins] ([ID], [FullName], [UserName], [Password], [Codey], [GymID], [Code], [N_Phone], [N_Home], [Address], [img], [AdminLevel], [D_Birth], [Gender], [Marital], [FullNameGym], [N_PhoneGym], [AddressGym], [DescriptionGym], [R_DateGym], [E_DateGym], [DebtGym], [Active], [Deleted]) VALUES (8, N'amir', N'Admin2', N'pass', N'00000000000', 0, N'cc', N'022555852', N'23366396', N'address', N'DefaultAdmin.png', 0, N'2022-08-17', 1, 0, N'باشگاه تهران', N'32521578', N'تهران', N'توضیحات باشگاه', N'1401/5/12', N'1401/06/02', 0, 0, 0)
SET IDENTITY_INSERT [dbo].[tbl_Admins] OFF
