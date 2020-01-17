--DO NOT MODIFY THIS FILE. IT IS ALWAYS OVERWRITTEN ON GENERATION.
--Data Schema

--CREATE TABLE [Customer]
if not exists(select * from sys.tables t inner join sys.schemas s on t.schema_id = s.schema_id where t.name = 'Customer' and s.name = 'dbo')
CREATE TABLE [dbo].[Customer] (
	[CustomerId] [Int] IDENTITY (1, 1) NOT NULL ,
	[FirstName] [VarChar] (50) NOT NULL ,
	[LastName] [VarChar] (50) NOT NULL ,
	[ModifiedBy] [NVarchar] (50) NULL,
	[ModifiedDate] [DateTime2] CONSTRAINT [DF__CUSTOMER_MODIFIEDDATE] DEFAULT sysdatetime() NULL,
	[CreatedBy] [NVarchar] (50) NULL,
	[CreatedDate] [DateTime2] CONSTRAINT [DF__CUSTOMER_CREATEDDATE] DEFAULT sysdatetime() NULL,
	[Timestamp] [ROWVERSION] NOT NULL,
	CONSTRAINT [PK_CUSTOMER] PRIMARY KEY CLUSTERED
	(
		[CustomerId]
	)
)

GO

--CREATE TABLE [Order]
if not exists(select * from sys.tables t inner join sys.schemas s on t.schema_id = s.schema_id where t.name = 'Order' and s.name = 'dbo')
CREATE TABLE [dbo].[Order] (
	[OrderId] [Int] IDENTITY (1, 1) NOT NULL ,
	[CustomerId] [Int] NOT NULL ,
	[Price] [Int] NOT NULL ,
	[ModifiedBy] [NVarchar] (50) NULL,
	[ModifiedDate] [DateTime2] CONSTRAINT [DF__ORDER_MODIFIEDDATE] DEFAULT sysdatetime() NULL,
	[CreatedBy] [NVarchar] (50) NULL,
	[CreatedDate] [DateTime2] CONSTRAINT [DF__ORDER_CREATEDDATE] DEFAULT sysdatetime() NULL,
	[Timestamp] [ROWVERSION] NOT NULL,
	CONSTRAINT [PK_ORDER] PRIMARY KEY CLUSTERED
	(
		[OrderId]
	)
)

GO

--##SECTION BEGIN [FIELD CREATE]
--TABLE [Customer] ADD FIELDS
if exists(select * from sys.objects where name = 'Customer' and type = 'U') AND not exists (select * from sys.columns c inner join sys.objects o on c.object_id = o.object_id where c.name = 'CustomerId' and o.name = 'Customer')
ALTER TABLE [dbo].[Customer] ADD [CustomerId] [Int] IDENTITY (1, 1) NOT NULL 
if exists(select * from sys.objects where name = 'Customer' and type = 'U') AND not exists (select * from sys.columns c inner join sys.objects o on c.object_id = o.object_id where c.name = 'FirstName' and o.name = 'Customer')
ALTER TABLE [dbo].[Customer] ADD [FirstName] [VarChar] (50) NOT NULL 
if exists(select * from sys.objects where name = 'Customer' and type = 'U') AND not exists (select * from sys.columns c inner join sys.objects o on c.object_id = o.object_id where c.name = 'LastName' and o.name = 'Customer')
ALTER TABLE [dbo].[Customer] ADD [LastName] [VarChar] (50) NOT NULL 
GO
--TABLE [Order] ADD FIELDS
if exists(select * from sys.objects where name = 'Order' and type = 'U') AND not exists (select * from sys.columns c inner join sys.objects o on c.object_id = o.object_id where c.name = 'OrderId' and o.name = 'Order')
ALTER TABLE [dbo].[Order] ADD [OrderId] [Int] IDENTITY (1, 1) NOT NULL 
if exists(select * from sys.objects where name = 'Order' and type = 'U') AND not exists (select * from sys.columns c inner join sys.objects o on c.object_id = o.object_id where c.name = 'CustomerId' and o.name = 'Order')
ALTER TABLE [dbo].[Order] ADD [CustomerId] [Int] NOT NULL 
if exists(select * from sys.objects where name = 'Order' and type = 'U') AND not exists (select * from sys.columns c inner join sys.objects o on c.object_id = o.object_id where c.name = 'Price' and o.name = 'Order')
ALTER TABLE [dbo].[Order] ADD [Price] [Int] NOT NULL 
GO
--##SECTION END [FIELD CREATE]

--##SECTION BEGIN [AUDIT TRAIL CREATE]

--APPEND AUDIT TRAIL CREATE FOR TABLE [Customer]
if exists(select * from sys.tables where name = 'Customer') and not exists (select * from sys.columns c inner join sys.tables t on c.object_id = t.object_id where c.name = 'CreatedBy' and t.name = 'Customer')
ALTER TABLE [dbo].[Customer] ADD [CreatedBy] [NVarchar] (50) NULL
if exists(select * from sys.tables where name = 'Customer') and not exists (select * from sys.columns c inner join sys.tables t on c.object_id = t.object_id where c.name = 'CreatedDate' and t.name = 'Customer')
ALTER TABLE [dbo].[Customer] ADD [CreatedDate] [DateTime2] CONSTRAINT [DF__CUSTOMER_CREATEDDATE] DEFAULT sysdatetime() NULL
GO

--APPEND AUDIT TRAIL MODIFY FOR TABLE [Customer]
if exists(select * from sys.tables where name = 'Customer') and not exists (select * from sys.columns c inner join sys.tables t on c.object_id = t.object_id where c.name = 'ModifiedBy' and t.name = 'Customer')
ALTER TABLE [dbo].[Customer] ADD [ModifiedBy] [NVarchar] (50) NULL
if exists(select * from sys.tables where name = 'Customer') and not exists (select * from sys.columns c inner join sys.tables t on c.object_id = t.object_id where c.name = 'ModifiedDate' and t.name = 'Customer')
ALTER TABLE [dbo].[Customer] ADD [ModifiedDate] [DateTime2] CONSTRAINT [DF__CUSTOMER_MODIFIEDDATE] DEFAULT sysdatetime() NULL
GO

--APPEND AUDIT TRAIL TIMESTAMP FOR TABLE [Customer]
if exists(select * from sys.tables where name = 'Customer') and not exists (select * from sys.columns c inner join sys.objects o on c.object_id = o.object_id where c.name = 'Timestamp' and o.name = 'Customer')
ALTER TABLE [dbo].[Customer] ADD [Timestamp] [ROWVERSION] NOT NULL
GO

GO

--APPEND AUDIT TRAIL CREATE FOR TABLE [Order]
if exists(select * from sys.tables where name = 'Order') and not exists (select * from sys.columns c inner join sys.tables t on c.object_id = t.object_id where c.name = 'CreatedBy' and t.name = 'Order')
ALTER TABLE [dbo].[Order] ADD [CreatedBy] [NVarchar] (50) NULL
if exists(select * from sys.tables where name = 'Order') and not exists (select * from sys.columns c inner join sys.tables t on c.object_id = t.object_id where c.name = 'CreatedDate' and t.name = 'Order')
ALTER TABLE [dbo].[Order] ADD [CreatedDate] [DateTime2] CONSTRAINT [DF__ORDER_CREATEDDATE] DEFAULT sysdatetime() NULL
GO

--APPEND AUDIT TRAIL MODIFY FOR TABLE [Order]
if exists(select * from sys.tables where name = 'Order') and not exists (select * from sys.columns c inner join sys.tables t on c.object_id = t.object_id where c.name = 'ModifiedBy' and t.name = 'Order')
ALTER TABLE [dbo].[Order] ADD [ModifiedBy] [NVarchar] (50) NULL
if exists(select * from sys.tables where name = 'Order') and not exists (select * from sys.columns c inner join sys.tables t on c.object_id = t.object_id where c.name = 'ModifiedDate' and t.name = 'Order')
ALTER TABLE [dbo].[Order] ADD [ModifiedDate] [DateTime2] CONSTRAINT [DF__ORDER_MODIFIEDDATE] DEFAULT sysdatetime() NULL
GO

--APPEND AUDIT TRAIL TIMESTAMP FOR TABLE [Order]
if exists(select * from sys.tables where name = 'Order') and not exists (select * from sys.columns c inner join sys.objects o on c.object_id = o.object_id where c.name = 'Timestamp' and o.name = 'Order')
ALTER TABLE [dbo].[Order] ADD [Timestamp] [ROWVERSION] NOT NULL
GO

GO

--##SECTION END [AUDIT TRAIL CREATE]

--##SECTION BEGIN [AUDIT TRAIL REMOVE]

--##SECTION END [AUDIT TRAIL REMOVE]

--##SECTION BEGIN [RENAME PK]

--RENAME EXISTING PRIMARY KEYS IF NECESSARY
DECLARE @pkfixCustomer varchar(500)
SET @pkfixCustomer = (SELECT top 1 i.name AS IndexName FROM sys.indexes AS i WHERE i.is_primary_key = 1 AND OBJECT_NAME(i.OBJECT_ID) = 'Customer')
if @pkfixCustomer <> '' and (BINARY_CHECKSUM(@pkfixCustomer) <> BINARY_CHECKSUM('PK_CUSTOMER')) exec('sp_rename '''+@pkfixCustomer+''', ''PK_CUSTOMER''')
DECLARE @pkfixOrder varchar(500)
SET @pkfixOrder = (SELECT top 1 i.name AS IndexName FROM sys.indexes AS i WHERE i.is_primary_key = 1 AND OBJECT_NAME(i.OBJECT_ID) = 'Order')
if @pkfixOrder <> '' and (BINARY_CHECKSUM(@pkfixOrder) <> BINARY_CHECKSUM('PK_ORDER')) exec('sp_rename '''+@pkfixOrder+''', ''PK_ORDER''')
GO

--##SECTION END [RENAME PK]

--##SECTION BEGIN [DROP PK]

--##SECTION END [DROP PK]

--##SECTION BEGIN [CREATE PK]

--PRIMARY KEY FOR TABLE [Customer]
if not exists(select * from sys.objects where name = 'PK_CUSTOMER' and type = 'PK')
ALTER TABLE [dbo].[Customer] WITH NOCHECK ADD 
CONSTRAINT [PK_CUSTOMER] PRIMARY KEY CLUSTERED
(
	[CustomerId]
)
GO
--PRIMARY KEY FOR TABLE [Order]
if not exists(select * from sys.objects where name = 'PK_ORDER' and type = 'PK')
ALTER TABLE [dbo].[Order] WITH NOCHECK ADD 
CONSTRAINT [PK_ORDER] PRIMARY KEY CLUSTERED
(
	[OrderId]
)
GO
--##SECTION END [CREATE PK]

--##SECTION BEGIN [AUDIT TABLES PK]

--DROP PRIMARY KEY FOR TABLE [__AUDIT__CUSTOMER]
if exists(select * from sys.objects where name = 'PK___AUDIT__CUSTOMER' and type = 'PK' and type_desc = 'PRIMARY_KEY_CONSTRAINT')
ALTER TABLE [dbo].[__AUDIT__CUSTOMER] DROP CONSTRAINT [PK___AUDIT__CUSTOMER]
GO

--DROP PRIMARY KEY FOR TABLE [__AUDIT__ORDER]
if exists(select * from sys.objects where name = 'PK___AUDIT__ORDER' and type = 'PK' and type_desc = 'PRIMARY_KEY_CONSTRAINT')
ALTER TABLE [dbo].[__AUDIT__ORDER] DROP CONSTRAINT [PK___AUDIT__ORDER]
GO

--##SECTION END [AUDIT TABLES PK]

--##SECTION BEGIN [CREATE INDEXES]

--##SECTION END [CREATE INDEXES]

--##SECTION BEGIN [TENANT INDEXES]

--##SECTION END [TENANT INDEXES]

--##SECTION BEGIN [REMOVE DEFAULTS]

--BEGIN DEFAULTS FOR TABLE [Customer]
DECLARE @defaultName varchar(max)
--DROP CONSTRAINT FOR '[Customer].[CustomerId]'
SET @defaultName = (SELECT d.name FROM sys.columns c inner join sys.default_constraints d on c.column_id = d.parent_column_id and c.object_id = d.parent_object_id inner join sys.objects o on d.parent_object_id = o.object_id where o.name = 'Customer' and c.name = 'CustomerId')
if @defaultName IS NOT NULL
exec('ALTER TABLE [dbo].[Customer] DROP CONSTRAINT ' + @defaultName)
--DROP CONSTRAINT FOR '[Customer].[FirstName]'
SET @defaultName = (SELECT d.name FROM sys.columns c inner join sys.default_constraints d on c.column_id = d.parent_column_id and c.object_id = d.parent_object_id inner join sys.objects o on d.parent_object_id = o.object_id where o.name = 'Customer' and c.name = 'FirstName')
if @defaultName IS NOT NULL
exec('ALTER TABLE [dbo].[Customer] DROP CONSTRAINT ' + @defaultName)
--DROP CONSTRAINT FOR '[Customer].[LastName]'
SET @defaultName = (SELECT d.name FROM sys.columns c inner join sys.default_constraints d on c.column_id = d.parent_column_id and c.object_id = d.parent_object_id inner join sys.objects o on d.parent_object_id = o.object_id where o.name = 'Customer' and c.name = 'LastName')
if @defaultName IS NOT NULL
exec('ALTER TABLE [dbo].[Customer] DROP CONSTRAINT ' + @defaultName)
--END DEFAULTS FOR TABLE [Customer]
GO

--BEGIN DEFAULTS FOR TABLE [Order]
DECLARE @defaultName varchar(max)
--DROP CONSTRAINT FOR '[Order].[CustomerId]'
SET @defaultName = (SELECT d.name FROM sys.columns c inner join sys.default_constraints d on c.column_id = d.parent_column_id and c.object_id = d.parent_object_id inner join sys.objects o on d.parent_object_id = o.object_id where o.name = 'Order' and c.name = 'CustomerId')
if @defaultName IS NOT NULL
exec('ALTER TABLE [dbo].[Order] DROP CONSTRAINT ' + @defaultName)
--DROP CONSTRAINT FOR '[Order].[OrderId]'
SET @defaultName = (SELECT d.name FROM sys.columns c inner join sys.default_constraints d on c.column_id = d.parent_column_id and c.object_id = d.parent_object_id inner join sys.objects o on d.parent_object_id = o.object_id where o.name = 'Order' and c.name = 'OrderId')
if @defaultName IS NOT NULL
exec('ALTER TABLE [dbo].[Order] DROP CONSTRAINT ' + @defaultName)
--DROP CONSTRAINT FOR '[Order].[Price]'
SET @defaultName = (SELECT d.name FROM sys.columns c inner join sys.default_constraints d on c.column_id = d.parent_column_id and c.object_id = d.parent_object_id inner join sys.objects o on d.parent_object_id = o.object_id where o.name = 'Order' and c.name = 'Price')
if @defaultName IS NOT NULL
exec('ALTER TABLE [dbo].[Order] DROP CONSTRAINT ' + @defaultName)
--END DEFAULTS FOR TABLE [Order]
GO

--##SECTION END [REMOVE DEFAULTS]

--##SECTION BEGIN [CREATE DEFAULTS]

--##SECTION END [CREATE DEFAULTS]

if not exists(select * from sys.tables where [name] = '__nhydrateschema')
BEGIN
CREATE TABLE [__nhydrateschema] (
[dbVersion] [varchar] (50) NOT NULL,
[LastUpdate] [datetime] NOT NULL,
[ModelKey] [uniqueidentifier] NOT NULL,
[History] [nvarchar](max) NOT NULL
)
if not exists(select * from sys.objects where [name] = '__pk__nhydrateschema' and [type] = 'PK')
ALTER TABLE [__nhydrateschema] WITH NOCHECK ADD CONSTRAINT [__pk__nhydrateschema] PRIMARY KEY CLUSTERED ([ModelKey])
END
GO

if not exists(select * from sys.tables where name = '__nhydrateobjects')
CREATE TABLE [dbo].[__nhydrateobjects]
(
	[rowid] [bigint] IDENTITY(1,1) NOT NULL,
	[id] [uniqueidentifier] NULL,
	[name] [nvarchar](450) NOT NULL,
	[type] [varchar](10) NOT NULL,
	[schema] [nvarchar](450) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[Hash] [varchar](32) NULL,
	[ModelKey] [uniqueidentifier] NOT NULL,
)

if not exists(select * from sys.indexes where name = '__ix__nhydrateobjects_name')
CREATE NONCLUSTERED INDEX [__ix__nhydrateobjects_name] ON [dbo].[__nhydrateobjects]
(
	[name] ASC
)

if not exists(select * from sys.indexes where name = '__ix__nhydrateobjects_schema')
CREATE NONCLUSTERED INDEX [__ix__nhydrateobjects_schema] ON [dbo].[__nhydrateobjects] 
(
	[schema] ASC
)

if not exists(select * from sys.indexes where name = '__ix__nhydrateobjects_type')
CREATE NONCLUSTERED INDEX [__ix__nhydrateobjects_type] ON [dbo].[__nhydrateobjects] 
(
	[type] ASC
)

if not exists(select * from sys.indexes where name = '__ix__nhydrateobjects_modelkey')
CREATE NONCLUSTERED INDEX [__ix__nhydrateobjects_modelkey] ON [dbo].[__nhydrateobjects] 
(
	[ModelKey] ASC
)

if not exists(select * from sys.indexes where name = '__pk__nhydrateobjects')
ALTER TABLE [dbo].[__nhydrateobjects] ADD CONSTRAINT [__pk__nhydrateobjects] PRIMARY KEY CLUSTERED 
(
	[rowid] ASC
)
GO

