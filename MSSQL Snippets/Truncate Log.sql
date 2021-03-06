SELECT
  --DB_NAME(database_id) AS DatabaseName,
  --Physical_Name,
  Name AS Logical_Name, (size*8)/1024 SizeMB,*
FROM sys.master_files
WHERE DB_NAME(database_id) = 'Test'
Order By SizeMB DESC
GO

exec sp_spaceused
SELECT @@VERSION


USE Test;
GO


-- Truncate the log by changing the database recovery model to SIMPLE.
ALTER DATABASE Test
SET RECOVERY SIMPLE WITH NO_WAIT;
GO

-- Shrink the truncated log file to 1 MB.
DBCC SHRINKFILE(Test, 1);  --file_name is the logical name of the file to be shrink
GO
DBCC SHRINKFILE(Test_log, 1);  --file_name is the logical name of the file to be shrink
GO

-- Reset the database recovery model.
ALTER DATABASE Test
SET RECOVERY FULL WITH NO_WAIT;
GO

exec sp_spaceused