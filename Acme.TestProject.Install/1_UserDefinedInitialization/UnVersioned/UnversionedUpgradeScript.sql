--Generated Unversioned Upgrade
--Generated on 2020-01-17 07:50:42

--UNCOMMENT TO DROP ALL DEFAULTS IF NEEDED. IF THIS MODEL WAS IMPORTED FROM AN EXISTSING DATABASE THE MODEL WILL RECREATE ALL DEFAULTS WITH A GENERATED NAME.
--DROP ALL DEFAULTS
--DECLARE @SqlCmd varchar(4000); SET @SqlCmd = ''
--DECLARE @Cnt int; SET @Cnt = 0
--select @Cnt = count(*) from sys.objects d
--join  sys.objects o on d.parent_object_id = o.object_id
--where d.type = 'D'
 
--WHILE @Cnt > 0
--BEGIN
--      select TOP 1 @SqlCmd = 'ALTER TABLE ' + o.name + ' DROP CONSTRAINT ' + d.name
--      from sys.objects d
--      join sys.objects o on d.parent_object_id = o.object_id
--      where d.type = 'D'
--      EXEC(@SqlCmd) --SELECT @SqlCmd --view the command only
--      select @Cnt = count(*) from sys.objects d
--      join  sys.objects o on d.parent_object_id = o.object_id
--      where d.type = 'D'
--END
--GO

--RENAME OLD INDEXES FROM THE IMPORT DATABASE IF NEEDED

