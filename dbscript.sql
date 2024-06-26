USE [Web_Demo]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 6/7/2024 11:02:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[categoryid] [int] NOT NULL,
	[categoryname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED 
(
	[categoryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[features]    Script Date: 6/7/2024 11:02:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[features](
	[featureid] [int] IDENTITY(1,1) NOT NULL,
	[feature_name] [varchar](1000) NOT NULL,
	[access_url] [varchar](1000) NOT NULL,
	[active] [bit] NOT NULL,
	[httpmethod] [varchar](10) NULL,
	[params] [varchar](1000) NULL,
 CONSTRAINT [PK_features] PRIMARY KEY CLUSTERED 
(
	[featureid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feedbacks]    Script Date: 6/7/2024 11:02:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feedbacks](
	[feedbackid] [int] IDENTITY(1,1) NOT NULL,
	[message] [ntext] NOT NULL,
	[subject] [varchar](150) NOT NULL,
	[time] [datetime] NOT NULL,
 CONSTRAINT [PK_feedbacks] PRIMARY KEY CLUSTERED 
(
	[feedbackid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[matrix_roles_features]    Script Date: 6/7/2024 11:02:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[matrix_roles_features](
	[roleid] [int] NOT NULL,
	[featureid] [int] NOT NULL,
 CONSTRAINT [PK_matrix_roles_features] PRIMARY KEY CLUSTERED 
(
	[roleid] ASC,
	[featureid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[matrix_users_resources]    Script Date: 6/7/2024 11:02:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[matrix_users_resources](
	[resourceid] [int] NOT NULL,
	[userid] [int] NOT NULL,
	[action] [varchar](2) NOT NULL,
 CONSTRAINT [PK_matrix_users_resources] PRIMARY KEY CLUSTERED 
(
	[resourceid] ASC,
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[matrix_users_roles]    Script Date: 6/7/2024 11:02:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[matrix_users_roles](
	[uid] [int] NOT NULL,
	[roleid] [int] NOT NULL,
 CONSTRAINT [PK_matrix_users_roles] PRIMARY KEY CLUSTERED 
(
	[uid] ASC,
	[roleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_lines]    Script Date: 6/7/2024 11:02:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_lines](
	[orderid] [int] NOT NULL,
	[productid] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK_order_line] PRIMARY KEY CLUSTERED 
(
	[orderid] ASC,
	[productid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 6/7/2024 11:02:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[orderid] [int] IDENTITY(1,1) NOT NULL,
	[orderdate] [datetime] NOT NULL,
	[customer] [int] NOT NULL,
	[status] [int] NOT NULL,
	[sale] [int] NULL,
	[processdate] [datetime] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[orderid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 6/7/2024 11:02:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[productid] [int] IDENTITY(1,1) NOT NULL,
	[productname] [varchar](150) NOT NULL,
	[productprice] [float] NOT NULL,
	[image_name] [varchar](max) NOT NULL,
	[creator] [int] NOT NULL,
	[create_time] [datetime] NOT NULL,
	[updater] [int] NULL,
	[update_time] [datetime] NULL,
	[active] [bit] NOT NULL,
	[categoryid] [int] NOT NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[productid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[resources]    Script Date: 6/7/2024 11:02:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[resources](
	[resourceid] [int] IDENTITY(1,1) NOT NULL,
	[resourcename] [varchar](150) NOT NULL,
	[creator] [int] NOT NULL,
	[create_time] [datetime] NOT NULL,
	[updater] [int] NULL,
	[update_time] [datetime] NULL,
	[file_url] [varchar](1000) NOT NULL,
 CONSTRAINT [PK_resources] PRIMARY KEY CLUSTERED 
(
	[resourceid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 6/7/2024 11:02:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[roleid] [int] IDENTITY(1,1) NOT NULL,
	[rolename] [varchar](150) NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[roleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 6/7/2024 11:02:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
	[displayname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[categories] ([categoryid], [categoryname]) VALUES (1, N'houseware')
INSERT [dbo].[categories] ([categoryid], [categoryname]) VALUES (2, N'fruit')
INSERT [dbo].[categories] ([categoryid], [categoryname]) VALUES (3, N'vehicle')
INSERT [dbo].[categories] ([categoryid], [categoryname]) VALUES (4, N'toy')
GO
SET IDENTITY_INSERT [dbo].[features] ON 

INSERT [dbo].[features] ([featureid], [feature_name], [access_url], [active], [httpmethod], [params]) VALUES (1, N'logout', N'/logout', 1, N'GET', NULL)
INSERT [dbo].[features] ([featureid], [feature_name], [access_url], [active], [httpmethod], [params]) VALUES (2, N'home page', N'/home/feature', 1, N'GET', NULL)
INSERT [dbo].[features] ([featureid], [feature_name], [access_url], [active], [httpmethod], [params]) VALUES (6, N'checkin cart', N'/order/create', 1, N'POST', NULL)
INSERT [dbo].[features] ([featureid], [feature_name], [access_url], [active], [httpmethod], [params]) VALUES (7, N'view placed orders', N'/order/history', 1, N'GET', NULL)
INSERT [dbo].[features] ([featureid], [feature_name], [access_url], [active], [httpmethod], [params]) VALUES (8, N'view an order', N'/order/detail', 1, N'GET', N'id')
INSERT [dbo].[features] ([featureid], [feature_name], [access_url], [active], [httpmethod], [params]) VALUES (9, N'list of orders', N'/order/list', 1, N'GET', NULL)
INSERT [dbo].[features] ([featureid], [feature_name], [access_url], [active], [httpmethod], [params]) VALUES (10, N'review an order', N'/order/review', 1, N'POST', N'id,status')
INSERT [dbo].[features] ([featureid], [feature_name], [access_url], [active], [httpmethod], [params]) VALUES (13, N'list of products', N'/product/list', 1, N'GET', NULL)
INSERT [dbo].[features] ([featureid], [feature_name], [access_url], [active], [httpmethod], [params]) VALUES (14, N'view shopping cart', N'/order/cart', 1, N'GET', NULL)
INSERT [dbo].[features] ([featureid], [feature_name], [access_url], [active], [httpmethod], [params]) VALUES (1009, N'create new resource', N'/resource/create', 1, N'GET', NULL)
INSERT [dbo].[features] ([featureid], [feature_name], [access_url], [active], [httpmethod], [params]) VALUES (1010, N'view shared resources', N'/resource/list', 1, N'GET', NULL)
INSERT [dbo].[features] ([featureid], [feature_name], [access_url], [active], [httpmethod], [params]) VALUES (1011, N'view a resource', N'/resource/detail', 1, N'GET', N'id')
INSERT [dbo].[features] ([featureid], [feature_name], [access_url], [active], [httpmethod], [params]) VALUES (1012, N'edit resource', N'/resource/edit', 1, N'GET', N'id')
INSERT [dbo].[features] ([featureid], [feature_name], [access_url], [active], [httpmethod], [params]) VALUES (1013, N'download resource file', N'/resource/file', 1, N'GET', N'filename')
INSERT [dbo].[features] ([featureid], [feature_name], [access_url], [active], [httpmethod], [params]) VALUES (2009, N'create new product', N'/product/create', 1, N'GET', NULL)
INSERT [dbo].[features] ([featureid], [feature_name], [access_url], [active], [httpmethod], [params]) VALUES (2010, N'update product', N'/product/update', 1, N'GET', N'id')
INSERT [dbo].[features] ([featureid], [feature_name], [access_url], [active], [httpmethod], [params]) VALUES (3009, N'manage all products', N'/product/manage', 1, N'GET', NULL)
INSERT [dbo].[features] ([featureid], [feature_name], [access_url], [active], [httpmethod], [params]) VALUES (3011, N'list of feedbacks', N'/feedback/list', 1, N'GET', NULL)
INSERT [dbo].[features] ([featureid], [feature_name], [access_url], [active], [httpmethod], [params]) VALUES (3012, N'view a feedback', N'/feedback/detail', 1, N'GET', N'id')
SET IDENTITY_INSERT [dbo].[features] OFF
GO
INSERT [dbo].[matrix_roles_features] ([roleid], [featureid]) VALUES (1, 6)
INSERT [dbo].[matrix_roles_features] ([roleid], [featureid]) VALUES (1, 7)
INSERT [dbo].[matrix_roles_features] ([roleid], [featureid]) VALUES (1, 8)
INSERT [dbo].[matrix_roles_features] ([roleid], [featureid]) VALUES (2, 9)
INSERT [dbo].[matrix_roles_features] ([roleid], [featureid]) VALUES (2, 10)
INSERT [dbo].[matrix_roles_features] ([roleid], [featureid]) VALUES (3, 9)
INSERT [dbo].[matrix_roles_features] ([roleid], [featureid]) VALUES (3, 2009)
INSERT [dbo].[matrix_roles_features] ([roleid], [featureid]) VALUES (3, 2010)
INSERT [dbo].[matrix_roles_features] ([roleid], [featureid]) VALUES (3, 3009)
INSERT [dbo].[matrix_roles_features] ([roleid], [featureid]) VALUES (3, 3011)
INSERT [dbo].[matrix_roles_features] ([roleid], [featureid]) VALUES (3, 3012)
INSERT [dbo].[matrix_roles_features] ([roleid], [featureid]) VALUES (4, 1)
INSERT [dbo].[matrix_roles_features] ([roleid], [featureid]) VALUES (4, 2)
INSERT [dbo].[matrix_roles_features] ([roleid], [featureid]) VALUES (4, 13)
INSERT [dbo].[matrix_roles_features] ([roleid], [featureid]) VALUES (4, 14)
INSERT [dbo].[matrix_roles_features] ([roleid], [featureid]) VALUES (4, 1009)
INSERT [dbo].[matrix_roles_features] ([roleid], [featureid]) VALUES (4, 1010)
INSERT [dbo].[matrix_roles_features] ([roleid], [featureid]) VALUES (4, 1011)
INSERT [dbo].[matrix_roles_features] ([roleid], [featureid]) VALUES (4, 1012)
INSERT [dbo].[matrix_roles_features] ([roleid], [featureid]) VALUES (4, 1013)
GO
INSERT [dbo].[matrix_users_roles] ([uid], [roleid]) VALUES (1, 1)
INSERT [dbo].[matrix_users_roles] ([uid], [roleid]) VALUES (1, 4)
INSERT [dbo].[matrix_users_roles] ([uid], [roleid]) VALUES (2, 1)
INSERT [dbo].[matrix_users_roles] ([uid], [roleid]) VALUES (2, 4)
INSERT [dbo].[matrix_users_roles] ([uid], [roleid]) VALUES (3, 2)
INSERT [dbo].[matrix_users_roles] ([uid], [roleid]) VALUES (3, 4)
INSERT [dbo].[matrix_users_roles] ([uid], [roleid]) VALUES (4, 2)
INSERT [dbo].[matrix_users_roles] ([uid], [roleid]) VALUES (4, 4)
INSERT [dbo].[matrix_users_roles] ([uid], [roleid]) VALUES (5, 3)
INSERT [dbo].[matrix_users_roles] ([uid], [roleid]) VALUES (5, 4)
INSERT [dbo].[matrix_users_roles] ([uid], [roleid]) VALUES (1002, 3)
INSERT [dbo].[matrix_users_roles] ([uid], [roleid]) VALUES (1002, 4)
INSERT [dbo].[matrix_users_roles] ([uid], [roleid]) VALUES (2002, 1)
INSERT [dbo].[matrix_users_roles] ([uid], [roleid]) VALUES (2002, 2)
INSERT [dbo].[matrix_users_roles] ([uid], [roleid]) VALUES (2002, 3)
INSERT [dbo].[matrix_users_roles] ([uid], [roleid]) VALUES (2002, 4)
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([productid], [productname], [productprice], [image_name], [creator], [create_time], [updater], [update_time], [active], [categoryid]) VALUES (1, N'apple', 5.2, N'apple.png', 5, CAST(N'2024-06-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 2)
INSERT [dbo].[products] ([productid], [productname], [productprice], [image_name], [creator], [create_time], [updater], [update_time], [active], [categoryid]) VALUES (2, N'ball', 8.7, N'ball.png', 5, CAST(N'2024-06-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 4)
INSERT [dbo].[products] ([productid], [productname], [productprice], [image_name], [creator], [create_time], [updater], [update_time], [active], [categoryid]) VALUES (3, N'bird', 8.4, N'bird.png', 5, CAST(N'2024-06-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 4)
INSERT [dbo].[products] ([productid], [productname], [productprice], [image_name], [creator], [create_time], [updater], [update_time], [active], [categoryid]) VALUES (4, N'boat', 1000.5, N'boat.png', 5, CAST(N'2024-01-01T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[products] ([productid], [productname], [productprice], [image_name], [creator], [create_time], [updater], [update_time], [active], [categoryid]) VALUES (5, N'car', 500.4, N'car.png', 5, CAST(N'2024-01-01T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[products] ([productid], [productname], [productprice], [image_name], [creator], [create_time], [updater], [update_time], [active], [categoryid]) VALUES (6, N'computer', 131, N'computer.png', 5, CAST(N'2024-01-01T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[products] ([productid], [productname], [productprice], [image_name], [creator], [create_time], [updater], [update_time], [active], [categoryid]) VALUES (7, N'doll', 14, N'doll.png', 5, CAST(N'2024-01-01T00:00:00.000' AS DateTime), NULL, NULL, 1, 4)
INSERT [dbo].[products] ([productid], [productname], [productprice], [image_name], [creator], [create_time], [updater], [update_time], [active], [categoryid]) VALUES (8, N'house', 834, N'house.png', 5, CAST(N'2024-01-01T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[products] ([productid], [productname], [productprice], [image_name], [creator], [create_time], [updater], [update_time], [active], [categoryid]) VALUES (9, N'injection', 3.5, N'injection.png', 5, CAST(N'2024-01-01T00:00:00.000' AS DateTime), NULL, NULL, 1, 4)
INSERT [dbo].[products] ([productid], [productname], [productprice], [image_name], [creator], [create_time], [updater], [update_time], [active], [categoryid]) VALUES (10, N'man', 100, N'man.png', 5, CAST(N'2024-01-01T00:00:00.000' AS DateTime), NULL, NULL, 1, 4)
INSERT [dbo].[products] ([productid], [productname], [productprice], [image_name], [creator], [create_time], [updater], [update_time], [active], [categoryid]) VALUES (11, N'motor', 150, N'motor.png', 5, CAST(N'2024-01-01T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[products] ([productid], [productname], [productprice], [image_name], [creator], [create_time], [updater], [update_time], [active], [categoryid]) VALUES (12, N'paper', 3.4, N'paper.png', 5, CAST(N'2024-01-01T00:00:00.000' AS DateTime), NULL, NULL, 0, 4)
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([roleid], [rolename], [active]) VALUES (1, N'Customer', 1)
INSERT [dbo].[roles] ([roleid], [rolename], [active]) VALUES (2, N'Sale', 1)
INSERT [dbo].[roles] ([roleid], [rolename], [active]) VALUES (3, N'Manager', 1)
INSERT [dbo].[roles] ([roleid], [rolename], [active]) VALUES (4, N'Mandatory-Basic-User', 1)
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([uid], [username], [password], [displayname]) VALUES (1, N'customer1', N'123', N'Mr A')
INSERT [dbo].[users] ([uid], [username], [password], [displayname]) VALUES (2, N'customer2', N'123', N'mr b')
INSERT [dbo].[users] ([uid], [username], [password], [displayname]) VALUES (3, N'sale1', N'123', N'mr c')
INSERT [dbo].[users] ([uid], [username], [password], [displayname]) VALUES (4, N'sale2', N'123', N'mr d')
INSERT [dbo].[users] ([uid], [username], [password], [displayname]) VALUES (5, N'manager1', N'123', N'MR E')
INSERT [dbo].[users] ([uid], [username], [password], [displayname]) VALUES (1002, N'manager2', N'123', N'MR X')
INSERT [dbo].[users] ([uid], [username], [password], [displayname]) VALUES (2002, N'sonnt', N'123', N'Ngo Tung Son')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [unique_username]    Script Date: 6/7/2024 11:02:21 PM ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [unique_username] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[matrix_roles_features]  WITH CHECK ADD  CONSTRAINT [FK_matrix_roles_features_features] FOREIGN KEY([featureid])
REFERENCES [dbo].[features] ([featureid])
GO
ALTER TABLE [dbo].[matrix_roles_features] CHECK CONSTRAINT [FK_matrix_roles_features_features]
GO
ALTER TABLE [dbo].[matrix_roles_features]  WITH CHECK ADD  CONSTRAINT [FK_matrix_roles_features_roles] FOREIGN KEY([roleid])
REFERENCES [dbo].[roles] ([roleid])
GO
ALTER TABLE [dbo].[matrix_roles_features] CHECK CONSTRAINT [FK_matrix_roles_features_roles]
GO
ALTER TABLE [dbo].[matrix_users_resources]  WITH CHECK ADD  CONSTRAINT [FK_matrix_users_resources_resources] FOREIGN KEY([resourceid])
REFERENCES [dbo].[resources] ([resourceid])
GO
ALTER TABLE [dbo].[matrix_users_resources] CHECK CONSTRAINT [FK_matrix_users_resources_resources]
GO
ALTER TABLE [dbo].[matrix_users_resources]  WITH CHECK ADD  CONSTRAINT [FK_matrix_users_resources_users] FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([uid])
GO
ALTER TABLE [dbo].[matrix_users_resources] CHECK CONSTRAINT [FK_matrix_users_resources_users]
GO
ALTER TABLE [dbo].[matrix_users_roles]  WITH CHECK ADD  CONSTRAINT [FK_matrix_users_roles_roles] FOREIGN KEY([roleid])
REFERENCES [dbo].[roles] ([roleid])
GO
ALTER TABLE [dbo].[matrix_users_roles] CHECK CONSTRAINT [FK_matrix_users_roles_roles]
GO
ALTER TABLE [dbo].[matrix_users_roles]  WITH CHECK ADD  CONSTRAINT [FK_matrix_users_roles_users] FOREIGN KEY([uid])
REFERENCES [dbo].[users] ([uid])
GO
ALTER TABLE [dbo].[matrix_users_roles] CHECK CONSTRAINT [FK_matrix_users_roles_users]
GO
ALTER TABLE [dbo].[order_lines]  WITH CHECK ADD  CONSTRAINT [FK_order_lines_orders] FOREIGN KEY([orderid])
REFERENCES [dbo].[orders] ([orderid])
GO
ALTER TABLE [dbo].[order_lines] CHECK CONSTRAINT [FK_order_lines_orders]
GO
ALTER TABLE [dbo].[order_lines]  WITH CHECK ADD  CONSTRAINT [FK_order_lines_products] FOREIGN KEY([productid])
REFERENCES [dbo].[products] ([productid])
GO
ALTER TABLE [dbo].[order_lines] CHECK CONSTRAINT [FK_order_lines_products]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_users] FOREIGN KEY([customer])
REFERENCES [dbo].[users] ([uid])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_users]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_users1] FOREIGN KEY([sale])
REFERENCES [dbo].[users] ([uid])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_users1]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_categories] FOREIGN KEY([categoryid])
REFERENCES [dbo].[categories] ([categoryid])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_categories]
GO
