USE [master]
GO

DECLARE @path nvarchar(512), @sql varchar(max)
SET @path = N'E:\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\'

set @sql = '
ALTER DATABASE [BD_INDICADORES] ADD FILEGROUP [fgUno]
GOs
ALTER DATABASE [BD_INDICADORES] ADD FILE ( NAME = N''frnUno'', FILENAME = ' + @path + 'fnUno.ndf'') TO FILEGROUP [fgUno]
GO
ALTER DATABASE [BD_INDICADORES] ADD FILEGROUP [fgDos]
GO
ALTER DATABASE [BD_INDICADORES] ADD FILE ( NAME = N''fnDos'', FILENAME = ' + @path + 'fnDos.ndf'') TO FILEGROUP [fgDos]
GO
ALTER DATABASE [BD_INDICADORES] ADD FILEGROUP [fgTres]
GO
ALTER DATABASE [BD_INDICADORES] ADD FILE ( NAME = N''fnTres'', FILENAME = ' + @path + 'fnTres.ndf'') TO FILEGROUP [fgTres]
GO
ALTER DATABASE [BD_INDICADORES] ADD FILEGROUP [fgCuatro]
GO
ALTER DATABASE [BD_INDICADORES] ADD FILE ( NAME = N''fnCuatro'', FILENAME = ' + @path + 'fnCuatro.ndf'') TO FILEGROUP [fgCuatro]
GO
ALTER DATABASE [BD_INDICADORES] ADD FILEGROUP [fgCinco]
GO
ALTER DATABASE [BD_INDICADORES] ADD FILE ( NAME = N''fnCinco'', FILENAME = ' + @path + 'fnCinco.ndf'') TO FILEGROUP [fgCinco]
GO
ALTER DATABASE [BD_INDICADORES] ADD FILEGROUP [fgSeis]
GO
ALTER DATABASE [BD_INDICADORES] ADD FILE ( NAME = N''fnSeis'', FILENAME = ' + @path + 'fnSeis.ndf'') TO FILEGROUP [fgSeis]
GO
ALTER DATABASE [BD_INDICADORES] ADD FILEGROUP [fgSiete]
GO
ALTER DATABASE [BD_INDICADORES] ADD FILE ( NAME = N''fnSiete'', FILENAME = ' + @path + 'fnSiete.ndf'') TO FILEGROUP [fgSiete]
GO
ALTER DATABASE [BD_INDICADORES] ADD FILEGROUP [fgOcho]
GO
ALTER DATABASE [BD_INDICADORES] ADD FILE ( NAME = N''fnOcho'', FILENAME = ' + @path + 'fnOcho.ndf'') TO FILEGROUP [fgOcho]
GO
ALTER DATABASE [BD_INDICADORES] ADD FILEGROUP [fgNueve]
GO
ALTER DATABASE [BD_INDICADORES] ADD FILE ( NAME = N''fnNueve'', FILENAME = ' + @path + 'fnNueve.ndf'') TO FILEGROUP [fgNueve]
GO'

exec @sql










-- Crea un campo calculado, auxiliar para segmentar la tabla clientes...
ALTER TABLE [dbo].[Cliente]
ADD [CampoParticionar]  AS (left(CONVERT([varchar],[ID_Cliente],0),(1))) PERSISTED;















--SCRIPT PARA PARTICIONAR...
USE [BD_INDICADORES]
GO
BEGIN TRANSACTION
CREATE PARTITION FUNCTION [funcionParticionarTablaCliente](varchar(1)) AS RANGE LEFT FOR VALUES (N'0', N'1', N'2', N'3', N'4', N'5', N'6', N'7', N'8')


CREATE PARTITION SCHEME [schemaParticionarTablaCliente] 
AS PARTITION [funcionParticionarTablaCliente] 
TO ([PRIMARY], [fgUno], [fgDos], [fgTres], [fgCuatro], [fgCinco], [fgSeis], [fgSiete], [fgOcho], [fgNueve])






ALTER TABLE [dbo].[tmp_Clientes] DROP CONSTRAINT [PK_Clientes]


ALTER TABLE [dbo].[tmp_Clientes] ADD  CONSTRAINT [PK_Clientes] PRIMARY KEY NONCLUSTERED 
(
	[ID_Cliente] ASC,
	[ID_Org_Ventas] ASC,
	[ID_Canal_Distribucion] ASC
	,[CampoParticionar]  AS (left(CONVERT([varchar],[ID_Cliente],0),(1))) PERSISTED
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [schemaParticionarTablaCliente]([CampoParticionar])


SET ANSI_PADDING ON

CREATE CLUSTERED INDEX [ClusteredIndex_on_schemaParticionarTablaCliente_635860395373035219] ON [dbo].[tmp_Clientes]
(
	[CampoParticionar]
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [schemaParticionarTablaCliente]([CampoParticionar])


DROP INDEX [ClusteredIndex_on_schemaParticionarTablaCliente_635860395373035219] ON [dbo].[tmp_Clientes]








COMMIT TRANSACTION















-- Prueba los registros particionados
SELECT 
p.partition_number AS PartitionNumber,
f.name AS PartitionFilegroup, 
p.rows AS NumberOfRows 
FROM sys.partitions p
JOIN sys.destination_data_spaces dds ON p.partition_number = dds.destination_id
JOIN sys.filegroups f ON dds.data_space_id = f.data_space_id
WHERE OBJECT_NAME(OBJECT_ID) = 'Clientes'