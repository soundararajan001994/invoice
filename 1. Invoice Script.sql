/****** Object:  StoredProcedure [dbo].[InvoiceProcedure]    Script Date: 02-04-2021 08:40:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InvoiceProcedure]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[InvoiceProcedure]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__InvoicePa__Statu__05D2B7D0]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvoiceParent]'))
ALTER TABLE [dbo].[InvoiceParent] DROP CONSTRAINT [FK__InvoicePa__Statu__05D2B7D0]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__InvoicePa__Custo__06C6DC09]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvoiceParent]'))
ALTER TABLE [dbo].[InvoiceParent] DROP CONSTRAINT [FK__InvoicePa__Custo__06C6DC09]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__InvoiceCh__Invoi__0A976CED]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvoiceChild]'))
ALTER TABLE [dbo].[InvoiceChild] DROP CONSTRAINT [FK__InvoiceCh__Invoi__0A976CED]
GO
/****** Object:  Table [dbo].[InvoiceStatus]    Script Date: 02-04-2021 08:40:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InvoiceStatus]') AND type in (N'U'))
DROP TABLE [dbo].[InvoiceStatus]
GO
/****** Object:  Table [dbo].[InvoiceParent]    Script Date: 02-04-2021 08:40:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InvoiceParent]') AND type in (N'U'))
DROP TABLE [dbo].[InvoiceParent]
GO
/****** Object:  Table [dbo].[InvoiceChild]    Script Date: 02-04-2021 08:40:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InvoiceChild]') AND type in (N'U'))
DROP TABLE [dbo].[InvoiceChild]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 02-04-2021 08:40:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
DROP TABLE [dbo].[Customer]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 02-04-2021 08:40:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvoiceChild]    Script Date: 02-04-2021 08:40:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InvoiceChild]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[InvoiceChild](
	[InvoiceChildID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceParentID] [int] NULL,
	[ProductID] [int] NULL,
	[ProductNote] [nvarchar](1000) NULL,
	[Price] [decimal](10, 2) NULL,
	[Qty] [decimal](10, 2) NULL,
	[Tax] [decimal](10, 2) NULL,
	[Total] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceChildID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[InvoiceParent]    Script Date: 02-04-2021 08:40:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InvoiceParent]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[InvoiceParent](
	[InvoiceParentID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[Invoiceno] [varchar](500) NULL,
	[Invoicedate] [datetime] NULL,
	[InvoiceDuedate] [datetime] NULL,
	[StatusID] [int] NULL,
	[Invoicenote] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceParentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvoiceStatus]    Script Date: 02-04-2021 08:40:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InvoiceStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[InvoiceStatus](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__InvoiceCh__Invoi__0A976CED]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvoiceChild]'))
ALTER TABLE [dbo].[InvoiceChild]  WITH CHECK ADD FOREIGN KEY([InvoiceParentID])
REFERENCES [dbo].[InvoiceParent] ([InvoiceParentID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__InvoicePa__Custo__06C6DC09]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvoiceParent]'))
ALTER TABLE [dbo].[InvoiceParent]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__InvoicePa__Statu__05D2B7D0]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvoiceParent]'))
ALTER TABLE [dbo].[InvoiceParent]  WITH CHECK ADD FOREIGN KEY([StatusID])
REFERENCES [dbo].[InvoiceStatus] ([StatusID])
GO
/****** Object:  StoredProcedure [dbo].[InvoiceProcedure]    Script Date: 02-04-2021 08:40:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InvoiceProcedure]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[InvoiceProcedure] AS' 
END
GO
ALTER procedure [dbo].[InvoiceProcedure]
as begin

select  ROW_NUMBER() OVER(ORDER BY p1.InvoiceParentID ASC) AS Rowno,p1.Invoiceno,c1.CustomerName,convert(date,p1.Invoicedate) as Invoicedate ,
convert(date,p1.InvoiceDuedate) as InvoiceDuedate ,s1.StatusName,(select sum(total) from InvoiceChild where InvoiceParentID=p1.InvoiceParentID) as Total
from InvoiceParent as p1
join customer as c1 on c1.customerid=p1.CustomerID
join invoicestatus as s1 on s1.StatusID=p1.StatusID
end

GO
