USE Aromaterapia
GO

SELECT	OilName,
	UPPER(OilName) AS [May�sculas],
	LOWER(OilName) AS [Min�sculas],
	SUBSTRING(OilName, 3, 3) AS [Subcadena]
FROM	Oils
GO