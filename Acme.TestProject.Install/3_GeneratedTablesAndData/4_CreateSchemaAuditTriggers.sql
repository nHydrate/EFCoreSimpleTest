--DO NOT MODIFY THIS FILE. IT IS ALWAYS OVERWRITTEN ON GENERATION.
--Audit Triggers

--##SECTION BEGIN [AUDIT TRIGGERS]

--DROP ANY AUDIT TRIGGERS FOR [dbo].[Customer]
if exists(select * from sys.objects where name = '__TR_Customer__INSERT' AND type = 'TR')
DROP TRIGGER [dbo].[__TR_Customer__INSERT]
GO
if exists(select * from sys.objects where name = '__TR_Customer__UPDATE' AND type = 'TR')
DROP TRIGGER [dbo].[__TR_Customer__UPDATE]
GO
if exists(select * from sys.objects where name = '__TR_Customer__DELETE' AND type = 'TR')
DROP TRIGGER [dbo].[__TR_Customer__DELETE]
GO

--DROP ANY AUDIT TRIGGERS FOR [dbo].[Order]
if exists(select * from sys.objects where name = '__TR_Order__INSERT' AND type = 'TR')
DROP TRIGGER [dbo].[__TR_Order__INSERT]
GO
if exists(select * from sys.objects where name = '__TR_Order__UPDATE' AND type = 'TR')
DROP TRIGGER [dbo].[__TR_Order__UPDATE]
GO
if exists(select * from sys.objects where name = '__TR_Order__DELETE' AND type = 'TR')
DROP TRIGGER [dbo].[__TR_Order__DELETE]
GO

--##SECTION END [AUDIT TRIGGERS]

