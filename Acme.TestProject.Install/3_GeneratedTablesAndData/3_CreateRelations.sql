--DO NOT MODIFY THIS FILE. IT IS ALWAYS OVERWRITTEN ON GENERATION.
--Relations

--##SECTION BEGIN [RELATIONS]

--FOREIGN KEY RELATIONSHIP [Customer] -> [Order] ([Customer].[CustomerId] -> [Order].[CustomerId])
if not exists(select * from sys.objects where name = 'FK__ORDER_CUSTOMER' and type = 'F')
ALTER TABLE [dbo].[Order] ADD 
CONSTRAINT [FK__ORDER_CUSTOMER] FOREIGN KEY 
(
	[CustomerId]
) REFERENCES [dbo].[Customer] (
	[CustomerId]
)
GO

--##SECTION END [RELATIONS]

