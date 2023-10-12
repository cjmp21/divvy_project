/**** IMPORT DATASET ***/

USE DIVVY_DB
GO

-- 1. monthly-divvy-tripdata
SELECT TOP 10 * FROM [dbo].[202211-divvy-tripdata]
SELECT TOP 10 * FROM [dbo].[202210-divvy-tripdata]
SELECT TOP 10 * FROM [dbo].[202209-divvy-publictripdata] --> DON'T HAVE START/END STATION ID 
SELECT TOP 10 * FROM [dbo].[202208-divvy-tripdata] --> DON'T HAVE START/END STATION ID 
SELECT TOP 10 * FROM [dbo].[202207-divvy-tripdata] 
SELECT TOP 10 * FROM [dbo].[202206-divvy-tripdata] --> DON'T HAVE START/END STATION ID 
SELECT TOP 10 * FROM [dbo].[202205-divvy-tripdata] 
SELECT TOP 10 * FROM [dbo].[202204-divvy-tripdata] 
SELECT TOP 10 * FROM [dbo].[202203-divvy-tripdata] 
SELECT TOP 10 * FROM [dbo].[202202-divvy-tripdata] 
SELECT TOP 10 * FROM [dbo].[202201-divvy-tripdata] 
SELECT TOP 10 * FROM [dbo].[202112-divvy-tripdata] 
SELECT TOP 10 * FROM [dbo].[202111-divvy-tripdata]  --> DON'T HAVE START/END STATION ID
SELECT TOP 10 * FROM [dbo].[202110-divvy-tripdata]
SELECT TOP 10 * FROM [dbo].[202109-divvy-tripdata]
SELECT TOP 10 * FROM [dbo].[202108-divvy-tripdata] --> DON'T HAVE START/END STATION ID
SELECT TOP 10 * FROM [dbo].[202107-divvy-tripdata]
SELECT TOP 10 * FROM [dbo].[202106-divvy-tripdata]
SELECT TOP 10 * FROM [dbo].[202105-divvy-tripdata] --> DON'T HAVE START/END STATION ID
SELECT TOP 10 * FROM [dbo].[202104-divvy-tripdata]
SELECT TOP 10 * FROM [dbo].[202103-divvy-tripdata]
SELECT TOP 10 * FROM [dbo].[202102-divvy-tripdata]
SELECT TOP 10 * FROM [dbo].[202101-divvy-tripdata] --> DON'T HAVE START/END STATION ID
SELECT TOP 10 * FROM [dbo].[202012-divvy-tripdata] --> DON'T HAVE START/END STATION ID
SELECT TOP 10 * FROM [dbo].[202011-divvy-tripdata]
SELECT TOP 10 * FROM [dbo].[202010-divvy-tripdata]
SELECT TOP 10 * FROM [dbo].[202009-divvy-tripdata] --> DON'T HAVE START/END STATION ID
SELECT TOP 10 * FROM [dbo].[202008-divvy-tripdata] 
SELECT TOP 10 * FROM [dbo].[202007-divvy-tripdata] 
SELECT TOP 10 * FROM [dbo].[202006-divvy-tripdata] 
SELECT TOP 10 * FROM [dbo].[202005-divvy-tripdata] 



-- 2. quarterly-divvy-tripdata
SELECT TOP 10 * FROM  [dbo].[Divvy_Trips_2020_Q1] -- table type 1
SELECT TOP 10 * FROM  [dbo].[Divvy_Trips_2019_Q4] -- table type 2 -- FALTA DESDE AQUI
SELECT TOP 10 * FROM  [dbo].[Divvy_Trips_2019_Q3] -- table type 2
SELECT TOP 10 * FROM  [dbo].[Divvy_Trips_2019_Q2] -- table type 2 // all names of fields change
SELECT TOP 10 * FROM  [dbo].[Divvy_Trips_2019_Q1] -- table type 2 
SELECT TOP 10 * FROM  [dbo].[Divvy_Trips_2018_Q4] -- table type 2 
SELECT TOP 10 * FROM  [dbo].[Divvy_Trips_2018_Q3] -- table type 2 
SELECT TOP 10 * FROM  [dbo].[Divvy_Trips_2018_Q2] -- table type 2 
SELECT TOP 10 * FROM  [dbo].[Divvy_Trips_2018_Q1] -- table type 2 
SELECT TOP 10 * FROM  [dbo].[Divvy_Trips_2017_Q4] -- table type 2 
SELECT TOP 10 * FROM  [dbo].[Divvy_Trips_2017_Q3] -- table type 2
SELECT TOP 10 * FROM  [dbo].[Divvy_Trips_2017_Q2] -- table type 2
SELECT TOP 10 * FROM  [dbo].[Divvy_Trips_2017_Q1] -- table type 2
SELECT TOP 10 * FROM  [dbo].[Divvy_Trips_2016_Q4] -- table type 2
SELECT TOP 10 * FROM  [dbo].[Divvy_Trips_2016_Q3] -- table type 2

SELECT TOP 10 * FROM  [dbo].[Divvy_Trips_2016_06] -- table type 2
SELECT TOP 10 * FROM  [dbo].[Divvy_Trips_2016_05] -- table type 2
SELECT TOP 10 * FROM  [dbo].[Divvy_Trips_2016_04] -- table type 2

SELECT TOP 10 * FROM  [dbo].[Divvy_Trips_2016_Q1] -- table type 2
SELECT TOP 10 * FROM  [dbo].[Divvy_Trips_2015_Q4] -- table type 2

SELECT TOP 10 * FROM  [dbo].[Divvy_Trips_2015_09] -- table type 2
SELECT TOP 10 * FROM  [dbo].[Divvy_Trips_2015_08] -- table type 2
SELECT TOP 10 * FROM  [dbo].[Divvy_Trips_2015_07] -- table type 2

SELECT TOP 10 * FROM  [dbo].[Divvy_Trips_2015-Q2] -- table type 2
SELECT TOP 10 * FROM  [dbo].[Divvy_Trips_2015-Q1] -- table type 2

-- 3. last divvy station file (Divvy_Stations_2017_Q3Q4) 

select  * from [dbo].[Divvy_Stations_2017_Q3Q4]




