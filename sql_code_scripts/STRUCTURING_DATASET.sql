/*** STRUCTURING THE DATA ***/

-- 1. FORMAT TYPE 1

SELECT (SELECT COUNT(*) FROM [202210-divvy-tripdata])+(SELECT COUNT(*) FROM [202211-divvy-tripdata]); -- 896420

SELECT  ride_id, rideable_type, CAST(started_at AS smalldatetime) AS started_at, CAST(ended_at AS smalldatetime) ended_at, start_station_name, start_station_id, end_station_name, end_station_id
	   , CAST(NULLIF(start_lat,'') AS NUMERIC(17,15)) AS start_lat , CAST(NULLIF(start_lng,'') AS NUMERIC(17,15)) AS start_lng, CAST(NULLIF(end_lat,'') AS NUMERIC(17,15)) AS end_lat, CAST(NULLIF(end_lng,'') AS NUMERIC (17,15)) AS end_lng
	   , member_casual, CAST('2022-10-01' AS smalldatetime) AS REPORT_DATE 
INTO COMPLETE_DIVVY_TRIPDATA -- NOV22 / OCT22
FROM [dbo].[202210-divvy-tripdata]
UNION ALL
SELECT ["ride_id"], ["rideable_type"], CAST(["started_at"] AS smalldatetime) AS started_at, CAST(["ended_at"] as smalldatetime) AS ended_at, ["start_station_name"], ["start_station_id"], ["end_station_name"], ["end_station_id"]
	  , CAST(NULLIF(["start_lat"],'') AS NUMERIC(17,15)) AS start_lat , CAST(NULLIF(["start_lng"],'') AS NUMERIC(17,15)) AS start_lng, CAST(NULLIF(["end_lat"],'') AS NUMERIC(17,15)) AS end_lat, CAST(NULLIF(["end_lng"],'') AS NUMERIC(17,15)) AS end_lng
	   , ["member_casual"], CAST('2022-11-01' AS smalldatetime) AS REPORT_DATE 
FROM [dbo].[202211-divvy-tripdata]
;

INSERT INTO [dbo].[COMPLETE_DIVVY_TRIPDATA] -- 701339 -- SEP22
SELECT  ride_id, rideable_type, CAST(started_at AS smalldatetime) AS started_at, CAST(ended_at AS smalldatetime) ended_at, start_station_name, start_station_id, end_station_name, end_station_id
	   , CAST(NULLIF(start_lat,'') AS NUMERIC(17,15)) AS start_lat , CAST(NULLIF(start_lng,'') AS NUMERIC(17,15)) AS start_lng, CAST(NULLIF(end_lat,'') AS NUMERIC(17,15)) AS end_lat, CAST(NULLIF(end_lng,'') AS NUMERIC (17,15)) AS end_lng
	   , member_casual, CAST('2022-09-01' AS smalldatetime) AS REPORT_DATE 
FROM [dbo].[202209-divvy-publictripdata]

INSERT INTO [dbo].[COMPLETE_DIVVY_TRIPDATA] -- 785932 -- AGO22
SELECT  ride_id, rideable_type, CAST(started_at AS smalldatetime) AS started_at, CAST(ended_at AS smalldatetime) ended_at, start_station_name, start_station_id, end_station_name, end_station_id
	   , CAST(NULLIF(start_lat,'') AS NUMERIC(17,15)) AS start_lat , CAST(NULLIF(start_lng,'') AS NUMERIC(17,15)) AS start_lng, CAST(NULLIF(end_lat,'') AS NUMERIC(17,15)) AS end_lat, CAST(NULLIF(end_lng,'') AS NUMERIC (17,15)) AS end_lng
	   , member_casual, CAST('2022-08-01' AS smalldatetime) AS REPORT_DATE 
FROM [dbo].[202208-divvy-tripdata]

INSERT INTO [dbo].[COMPLETE_DIVVY_TRIPDATA] -- 823448 -- JUL22
SELECT  ride_id, rideable_type, CAST(started_at AS smalldatetime) AS started_at, CAST(ended_at AS smalldatetime) ended_at, start_station_name, start_station_id, end_station_name, end_station_id
	   , CAST(NULLIF(start_lat,'') AS NUMERIC(17,15)) AS start_lat , CAST(NULLIF(start_lng,'') AS NUMERIC(17,15)) AS start_lng, CAST(NULLIF(end_lat,'') AS NUMERIC(17,15)) AS end_lat, CAST(NULLIF(end_lng,'') AS NUMERIC (17,15)) AS end_lng
	   , member_casual, CAST('2022-07-01' AS smalldatetime) AS REPORT_DATE 
FROM [dbo].[202207-divvy-tripdata]

INSERT INTO [dbo].[COMPLETE_DIVVY_TRIPDATA] -- 769204 -- JUN22
SELECT  ride_id, rideable_type, CAST(started_at AS smalldatetime) AS started_at, CAST(ended_at AS smalldatetime) ended_at, start_station_name, start_station_id, end_station_name, end_station_id
	   , CAST(NULLIF(start_lat,'') AS NUMERIC(17,15)) AS start_lat , CAST(NULLIF(start_lng,'') AS NUMERIC(17,15)) AS start_lng, CAST(NULLIF(end_lat,'') AS NUMERIC(17,15)) AS end_lat, CAST(NULLIF(end_lng,'') AS NUMERIC (17,15)) AS end_lng
	   , member_casual, CAST('2022-06-01' AS smalldatetime) AS REPORT_DATE 
FROM [dbo].[202206-divvy-tripdata]

INSERT INTO [dbo].[COMPLETE_DIVVY_TRIPDATA] -- 634858 -- MAY22
SELECT  ride_id, rideable_type, CAST(started_at AS smalldatetime) AS started_at, CAST(ended_at AS smalldatetime) ended_at, start_station_name, start_station_id, end_station_name, end_station_id
	   , CAST(NULLIF(start_lat,'') AS NUMERIC(17,15)) AS start_lat , CAST(NULLIF(start_lng,'') AS NUMERIC(17,15)) AS start_lng, CAST(NULLIF(end_lat,'') AS NUMERIC(17,15)) AS end_lat, CAST(NULLIF(end_lng,'') AS NUMERIC (17,15)) AS end_lng
	   , member_casual, CAST('2022-05-01' AS smalldatetime) AS REPORT_DATE 
FROM [dbo].[202205-divvy-tripdata]

INSERT INTO [dbo].[COMPLETE_DIVVY_TRIPDATA] -- 371249 -- ABR22
SELECT  ride_id, rideable_type, CAST(started_at AS smalldatetime) AS started_at, CAST(ended_at AS smalldatetime) ended_at, start_station_name, start_station_id, end_station_name, end_station_id
	   , CAST(NULLIF(start_lat,'') AS NUMERIC(17,15)) AS start_lat , CAST(NULLIF(start_lng,'') AS NUMERIC(17,15)) AS start_lng, CAST(NULLIF(end_lat,'') AS NUMERIC(17,15)) AS end_lat, CAST(NULLIF(end_lng,'') AS NUMERIC (17,15)) AS end_lng
	   , member_casual, CAST('2022-04-01' AS smalldatetime) AS REPORT_DATE 
FROM [dbo].[202204-divvy-tripdata]

INSERT INTO [dbo].[COMPLETE_DIVVY_TRIPDATA] -- 284042 -- MAR22
SELECT  ride_id, rideable_type, CAST(started_at AS smalldatetime) AS started_at, CAST(ended_at AS smalldatetime) ended_at, start_station_name, start_station_id, end_station_name, end_station_id
	   , CAST(NULLIF(start_lat,'') AS NUMERIC(17,15)) AS start_lat , CAST(NULLIF(start_lng,'') AS NUMERIC(17,15)) AS start_lng, CAST(NULLIF(end_lat,'') AS NUMERIC(17,15)) AS end_lat, CAST(NULLIF(end_lng,'') AS NUMERIC (17,15)) AS end_lng
	   , member_casual, CAST('2022-03-01' AS smalldatetime) AS REPORT_DATE 
FROM [dbo].[202203-divvy-tripdata]

INSERT INTO [dbo].[COMPLETE_DIVVY_TRIPDATA] -- 115609 -- FEB22
SELECT  ride_id, rideable_type, CAST(started_at AS smalldatetime) AS started_at, CAST(ended_at AS smalldatetime) ended_at, start_station_name, start_station_id, end_station_name, end_station_id
	   , CAST(NULLIF(start_lat,'') AS NUMERIC(17,15)) AS start_lat , CAST(NULLIF(start_lng,'') AS NUMERIC(17,15)) AS start_lng, CAST(NULLIF(end_lat,'') AS NUMERIC(17,15)) AS end_lat, CAST(NULLIF(end_lng,'') AS NUMERIC (17,15)) AS end_lng
	   , member_casual, CAST('2022-02-01' AS smalldatetime) AS REPORT_DATE 
FROM [dbo].[202202-divvy-tripdata]

INSERT INTO [dbo].[COMPLETE_DIVVY_TRIPDATA] -- 103770 -- ENE22
SELECT  ride_id, rideable_type, CAST(started_at AS smalldatetime) AS started_at, CAST(ended_at AS smalldatetime) ended_at, start_station_name, start_station_id, end_station_name, end_station_id
	   , CAST(NULLIF(start_lat,'') AS NUMERIC(17,15)) AS start_lat , CAST(NULLIF(start_lng,'') AS NUMERIC(17,15)) AS start_lng, CAST(NULLIF(end_lat,'') AS NUMERIC(17,15)) AS end_lat, CAST(NULLIF(end_lng,'') AS NUMERIC (17,15)) AS end_lng
	   , member_casual, CAST('2022-01-01' AS smalldatetime) AS REPORT_DATE 
FROM [dbo].[202201-divvy-tripdata];

-- SELECT REPORT_DATE, COUNT(*) FROM [COMPLETE_DIVVY_TRIPDATA] GROUP BY REPORT_DATE ORDER BY REPORT_DATE

-- DROPING 2022 TABLES
DROP TABLE [dbo].[202211-divvy-tripdata], [dbo].[202210-divvy-tripdata], [dbo].[202209-divvy-publictripdata], [dbo].[202208-divvy-tripdata], [dbo].[202207-divvy-tripdata]
	       , [dbo].[202206-divvy-tripdata], [dbo].[202205-divvy-tripdata], [dbo].[202204-divvy-tripdata], [dbo].[202203-divvy-tripdata], [dbo].[202202-divvy-tripdata], [dbo].[202201-divvy-tripdata]
;

-- CONTINUE WITH 2021 TABLES

INSERT INTO [dbo].[COMPLETE_DIVVY_TRIPDATA] -- 247540 -- DIC21
SELECT  ride_id, rideable_type, CAST(started_at AS smalldatetime) AS started_at, CAST(ended_at AS smalldatetime) ended_at, start_station_name, start_station_id, end_station_name, end_station_id
	   , CAST(NULLIF(start_lat,'') AS NUMERIC(17,15)) AS start_lat , CAST(NULLIF(start_lng,'') AS NUMERIC(17,15)) AS start_lng, CAST(NULLIF(end_lat,'') AS NUMERIC(17,15)) AS end_lat, CAST(NULLIF(end_lng,'') AS NUMERIC (17,15)) AS end_lng
	   , member_casual, CAST('2021-12-01' AS smalldatetime) AS REPORT_DATE 
FROM [dbo].[202112-divvy-tripdata];

INSERT INTO [dbo].[COMPLETE_DIVVY_TRIPDATA] -- 359978 -- NOV21
SELECT  ride_id, rideable_type, CAST(started_at AS smalldatetime) AS started_at, CAST(ended_at AS smalldatetime) ended_at, start_station_name, start_station_id, end_station_name, end_station_id
	   , CAST(NULLIF(start_lat,'') AS NUMERIC(17,15)) AS start_lat , CAST(NULLIF(start_lng,'') AS NUMERIC(17,15)) AS start_lng, CAST(NULLIF(end_lat,'') AS NUMERIC(17,15)) AS end_lat, CAST(NULLIF(end_lng,'') AS NUMERIC (17,15)) AS end_lng
	   , member_casual, CAST('2021-11-01' AS smalldatetime) AS REPORT_DATE 
FROM [dbo].[202111-divvy-tripdata];

INSERT INTO [dbo].[COMPLETE_DIVVY_TRIPDATA] -- 631226 -- OCT21
SELECT  ride_id, rideable_type, CAST(started_at AS smalldatetime) AS started_at, CAST(ended_at AS smalldatetime) ended_at, start_station_name, start_station_id, end_station_name, end_station_id
	   , CAST(NULLIF(start_lat,'') AS NUMERIC(17,15)) AS start_lat , CAST(NULLIF(start_lng,'') AS NUMERIC(17,15)) AS start_lng, CAST(NULLIF(end_lat,'') AS NUMERIC(17,15)) AS end_lat, CAST(NULLIF(end_lng,'') AS NUMERIC (17,15)) AS end_lng
	   , member_casual, CAST('2021-10-01' AS smalldatetime) AS REPORT_DATE 
FROM [dbo].[202110-divvy-tripdata];

INSERT INTO [dbo].[COMPLETE_DIVVY_TRIPDATA] -- 756147 -- SEP21
SELECT  ride_id, rideable_type, CAST(started_at AS smalldatetime) AS started_at, CAST(ended_at AS smalldatetime) ended_at, start_station_name, start_station_id, end_station_name, end_station_id
	   , CAST(NULLIF(start_lat,'') AS NUMERIC(17,15)) AS start_lat , CAST(NULLIF(start_lng,'') AS NUMERIC(17,15)) AS start_lng, CAST(NULLIF(end_lat,'') AS NUMERIC(17,15)) AS end_lat, CAST(NULLIF(end_lng,'') AS NUMERIC (17,15)) AS end_lng
	   , member_casual, CAST('2021-09-01' AS smalldatetime) AS REPORT_DATE 
FROM [dbo].[202109-divvy-tripdata];

INSERT INTO [dbo].[COMPLETE_DIVVY_TRIPDATA] -- 804352 -- AGO21
SELECT  ride_id, rideable_type, CAST(started_at AS smalldatetime) AS started_at, CAST(ended_at AS smalldatetime) ended_at, start_station_name, start_station_id, end_station_name, end_station_id
	   , CAST(NULLIF(start_lat,'') AS NUMERIC(17,15)) AS start_lat , CAST(NULLIF(start_lng,'') AS NUMERIC(17,15)) AS start_lng, CAST(NULLIF(end_lat,'') AS NUMERIC(17,15)) AS end_lat, CAST(NULLIF(end_lng,'') AS NUMERIC (17,15)) AS end_lng
	   , member_casual, CAST('2021-08-01' AS smalldatetime) AS REPORT_DATE 
FROM [dbo].[202108-divvy-tripdata];

INSERT INTO [dbo].[COMPLETE_DIVVY_TRIPDATA] -- 822410 -- JUL21
SELECT  ride_id, rideable_type, CAST(started_at AS smalldatetime) AS started_at, CAST(ended_at AS smalldatetime) ended_at, start_station_name, start_station_id, end_station_name, end_station_id
	   , CAST(NULLIF(start_lat,'') AS NUMERIC(17,15)) AS start_lat , CAST(NULLIF(start_lng,'') AS NUMERIC(17,15)) AS start_lng, CAST(NULLIF(end_lat,'') AS NUMERIC(17,15)) AS end_lat, CAST(NULLIF(end_lng,'') AS NUMERIC (17,15)) AS end_lng
	   , member_casual, CAST('2021-07-01' AS smalldatetime) AS REPORT_DATE 
FROM [dbo].[202107-divvy-tripdata];

INSERT INTO [dbo].[COMPLETE_DIVVY_TRIPDATA] -- 729595 -- JUN21
SELECT  ride_id, rideable_type, CAST(started_at AS smalldatetime) AS started_at, CAST(ended_at AS smalldatetime) ended_at, start_station_name, start_station_id, end_station_name, end_station_id
	   , CAST(NULLIF(start_lat,'') AS NUMERIC(17,15)) AS start_lat , CAST(NULLIF(start_lng,'') AS NUMERIC(17,15)) AS start_lng, CAST(NULLIF(end_lat,'') AS NUMERIC(17,15)) AS end_lat, CAST(NULLIF(end_lng,'') AS NUMERIC (17,15)) AS end_lng
	   , member_casual, CAST('2021-06-01' AS smalldatetime) AS REPORT_DATE 
FROM [dbo].[202106-divvy-tripdata];

INSERT INTO [dbo].[COMPLETE_DIVVY_TRIPDATA] -- 531633 -- MAY21
SELECT  ride_id, rideable_type, CAST(started_at AS smalldatetime) AS started_at, CAST(ended_at AS smalldatetime) ended_at, start_station_name, start_station_id, end_station_name, end_station_id
	   , CAST(NULLIF(start_lat,'') AS NUMERIC(17,15)) AS start_lat , CAST(NULLIF(start_lng,'') AS NUMERIC(17,15)) AS start_lng, CAST(NULLIF(end_lat,'') AS NUMERIC(17,15)) AS end_lat, CAST(NULLIF(end_lng,'') AS NUMERIC (17,15)) AS end_lng
	   , member_casual, CAST('2021-05-01' AS smalldatetime) AS REPORT_DATE 
FROM [dbo].[202105-divvy-tripdata];

INSERT INTO [dbo].[COMPLETE_DIVVY_TRIPDATA] -- 337230 -- ABR21
SELECT  ride_id, rideable_type, CAST(started_at AS smalldatetime) AS started_at, CAST(ended_at AS smalldatetime) ended_at, start_station_name, start_station_id, end_station_name, end_station_id
	   , CAST(NULLIF(start_lat,'') AS NUMERIC(17,15)) AS start_lat , CAST(NULLIF(start_lng,'') AS NUMERIC(17,15)) AS start_lng, CAST(NULLIF(end_lat,'') AS NUMERIC(17,15)) AS end_lat, CAST(NULLIF(end_lng,'') AS NUMERIC (17,15)) AS end_lng
	   , member_casual, CAST('2021-04-01' AS smalldatetime) AS REPORT_DATE 
FROM [dbo].[202104-divvy-tripdata];

INSERT INTO [dbo].[COMPLETE_DIVVY_TRIPDATA] -- 228496 -- MAR21
SELECT  ride_id, rideable_type, CAST(started_at AS smalldatetime) AS started_at, CAST(ended_at AS smalldatetime) ended_at, start_station_name, start_station_id, end_station_name, end_station_id
	   , CAST(NULLIF(start_lat,'') AS NUMERIC(17,15)) AS start_lat , CAST(NULLIF(start_lng,'') AS NUMERIC(17,15)) AS start_lng, CAST(NULLIF(end_lat,'') AS NUMERIC(17,15)) AS end_lat, CAST(NULLIF(end_lng,'') AS NUMERIC (17,15)) AS end_lng
	   , member_casual, CAST('2021-03-01' AS smalldatetime) AS REPORT_DATE 
FROM [dbo].[202103-divvy-tripdata];

INSERT INTO [dbo].[COMPLETE_DIVVY_TRIPDATA] -- 49622 -- FEB21
SELECT  ride_id, rideable_type, CAST(started_at AS smalldatetime) AS started_at, CAST(ended_at AS smalldatetime) ended_at, start_station_name, start_station_id, end_station_name, end_station_id
	   , CAST(NULLIF(start_lat,'') AS NUMERIC(17,15)) AS start_lat , CAST(NULLIF(start_lng,'') AS NUMERIC(17,15)) AS start_lng, CAST(NULLIF(end_lat,'') AS NUMERIC(17,15)) AS end_lat, CAST(NULLIF(end_lng,'') AS NUMERIC (17,15)) AS end_lng
	   , member_casual, CAST('2021-02-01' AS smalldatetime) AS REPORT_DATE 
FROM [dbo].[202102-divvy-tripdata];

INSERT INTO [dbo].[COMPLETE_DIVVY_TRIPDATA] -- 96834 -- ENE21
SELECT  ride_id, rideable_type, CAST(started_at AS smalldatetime) AS started_at, CAST(ended_at AS smalldatetime) ended_at, start_station_name, start_station_id, end_station_name, end_station_id
	   , CAST(NULLIF(start_lat,'') AS NUMERIC(17,15)) AS start_lat , CAST(NULLIF(start_lng,'') AS NUMERIC(17,15)) AS start_lng, CAST(NULLIF(end_lat,'') AS NUMERIC(17,15)) AS end_lat, CAST(NULLIF(end_lng,'') AS NUMERIC (17,15)) AS end_lng
	   , member_casual, CAST('2021-01-01' AS smalldatetime) AS REPORT_DATE 
FROM [dbo].[202101-divvy-tripdata];

-- SELECT REPORT_DATE, COUNT(*) RECORDS FROM [COMPLETE_DIVVY_TRIPDATA] GROUP BY REPORT_DATE ORDER BY REPORT_DATE

-- DROPING 2021 TABLES
DROP TABLE [dbo].[202112-divvy-tripdata], [dbo].[202111-divvy-tripdata], [dbo].[202110-divvy-tripdata], [dbo].[202109-divvy-tripdata], [dbo].[202108-divvy-tripdata], [dbo].[202107-divvy-tripdata]
	       , [dbo].[202106-divvy-tripdata], [dbo].[202105-divvy-tripdata], [dbo].[202104-divvy-tripdata], [dbo].[202103-divvy-tripdata], [dbo].[202102-divvy-tripdata], [dbo].[202101-divvy-tripdata]
;

-- CONTINUE WITH 2020 TABLES

INSERT INTO [dbo].[COMPLETE_DIVVY_TRIPDATA] -- 131573 -- DIC20
SELECT  ride_id, rideable_type, CAST(started_at AS smalldatetime) AS started_at, CAST(ended_at AS smalldatetime) ended_at, start_station_name, start_station_id, end_station_name, end_station_id
	   , CAST(NULLIF(start_lat,'') AS NUMERIC(17,15)) AS start_lat , CAST(NULLIF(start_lng,'') AS NUMERIC(17,15)) AS start_lng, CAST(NULLIF(end_lat,'') AS NUMERIC(17,15)) AS end_lat, CAST(NULLIF(end_lng,'') AS NUMERIC (17,15)) AS end_lng
	   , member_casual, CAST('2020-12-01' AS smalldatetime) AS REPORT_DATE 
FROM [dbo].[202012-divvy-tripdata];

INSERT INTO [dbo].[COMPLETE_DIVVY_TRIPDATA] -- 259716 -- NOV20
SELECT  ride_id, rideable_type, CAST(started_at AS smalldatetime) AS started_at, CAST(ended_at AS smalldatetime) ended_at, start_station_name, start_station_id, end_station_name, end_station_id
	   , CAST(NULLIF(start_lat,'') AS NUMERIC(17,15)) AS start_lat , CAST(NULLIF(start_lng,'') AS NUMERIC(17,15)) AS start_lng, CAST(NULLIF(end_lat,'') AS NUMERIC(17,15)) AS end_lat, CAST(NULLIF(end_lng,'') AS NUMERIC (17,15)) AS end_lng
	   , member_casual, CAST('2020-11-01' AS smalldatetime) AS REPORT_DATE 
FROM [dbo].[202011-divvy-tripdata];

INSERT INTO [dbo].[COMPLETE_DIVVY_TRIPDATA] -- 388653 -- OCT20
SELECT  ride_id, rideable_type, CAST(started_at AS smalldatetime) AS started_at, CAST(ended_at AS smalldatetime) ended_at, start_station_name, start_station_id, end_station_name, end_station_id
	   , CAST(NULLIF(start_lat,'') AS NUMERIC(17,15)) AS start_lat , CAST(NULLIF(start_lng,'') AS NUMERIC(17,15)) AS start_lng, CAST(NULLIF(end_lat,'') AS NUMERIC(17,15)) AS end_lat, CAST(NULLIF(end_lng,'') AS NUMERIC (17,15)) AS end_lng
	   , member_casual, CAST('2020-10-01' AS smalldatetime) AS REPORT_DATE 
FROM [dbo].[202010-divvy-tripdata];

INSERT INTO [dbo].[COMPLETE_DIVVY_TRIPDATA] -- 532958 -- SEP20
SELECT  ride_id, rideable_type, CAST(started_at AS smalldatetime) AS started_at, CAST(ended_at AS smalldatetime) ended_at, start_station_name, start_station_id, end_station_name, end_station_id
	   , CAST(NULLIF(start_lat,'') AS NUMERIC(17,15)) AS start_lat , CAST(NULLIF(start_lng,'') AS NUMERIC(17,15)) AS start_lng, CAST(NULLIF(end_lat,'') AS NUMERIC(17,15)) AS end_lat, CAST(NULLIF(end_lng,'') AS NUMERIC (17,15)) AS end_lng
	   , member_casual, CAST('2020-09-01' AS smalldatetime) AS REPORT_DATE 
FROM [dbo].[202009-divvy-tripdata];

INSERT INTO [dbo].[COMPLETE_DIVVY_TRIPDATA] -- 622361 -- AGO20
SELECT  ride_id, rideable_type, CAST(started_at AS smalldatetime) AS started_at, CAST(ended_at AS smalldatetime) ended_at, start_station_name, start_station_id, end_station_name, end_station_id
	   , CAST(NULLIF(start_lat,'') AS NUMERIC(17,15)) AS start_lat , CAST(NULLIF(start_lng,'') AS NUMERIC(17,15)) AS start_lng, CAST(NULLIF(end_lat,'') AS NUMERIC(17,15)) AS end_lat, CAST(NULLIF(end_lng,'') AS NUMERIC (17,15)) AS end_lng
	   , member_casual, CAST('2020-08-01' AS smalldatetime) AS REPORT_DATE 
FROM [dbo].[202008-divvy-tripdata];

INSERT INTO [dbo].[COMPLETE_DIVVY_TRIPDATA] -- 551480 -- JUL20
SELECT  ride_id, rideable_type, CAST(started_at AS smalldatetime) AS started_at, CAST(ended_at AS smalldatetime) ended_at, start_station_name, start_station_id, end_station_name, end_station_id
	   , CAST(NULLIF(start_lat,'') AS NUMERIC(17,15)) AS start_lat , CAST(NULLIF(start_lng,'') AS NUMERIC(17,15)) AS start_lng, CAST(NULLIF(end_lat,'') AS NUMERIC(17,15)) AS end_lat, CAST(NULLIF(end_lng,'') AS NUMERIC (17,15)) AS end_lng
	   , member_casual, CAST('2020-07-01' AS smalldatetime) AS REPORT_DATE 
FROM [dbo].[202007-divvy-tripdata];

INSERT INTO [dbo].[COMPLETE_DIVVY_TRIPDATA] -- 343005 -- JUN20
SELECT  ride_id, rideable_type, CAST(started_at AS smalldatetime) AS started_at, CAST(ended_at AS smalldatetime) ended_at, start_station_name, start_station_id, end_station_name, end_station_id
	   , CAST(NULLIF(start_lat,'') AS NUMERIC(17,15)) AS start_lat , CAST(NULLIF(start_lng,'') AS NUMERIC(17,15)) AS start_lng, CAST(NULLIF(end_lat,'') AS NUMERIC(17,15)) AS end_lat, CAST(NULLIF(end_lng,'') AS NUMERIC (17,15)) AS end_lng
	   , member_casual, CAST('2020-06-01' AS smalldatetime) AS REPORT_DATE 
FROM [dbo].[202006-divvy-tripdata];

INSERT INTO [dbo].[COMPLETE_DIVVY_TRIPDATA] -- 200274 -- MAY20
SELECT  ride_id, rideable_type, CAST(started_at AS smalldatetime) AS started_at, CAST(ended_at AS smalldatetime) ended_at, start_station_name, start_station_id, end_station_name, end_station_id
	   , CAST(NULLIF(start_lat,'') AS NUMERIC(17,15)) AS start_lat , CAST(NULLIF(start_lng,'') AS NUMERIC(17,15)) AS start_lng, CAST(NULLIF(end_lat,'') AS NUMERIC(17,15)) AS end_lat, CAST(NULLIF(end_lng,'') AS NUMERIC (17,15)) AS end_lng
	   , member_casual, CAST('2020-05-01' AS smalldatetime) AS REPORT_DATE 
FROM [dbo].[202005-divvy-tripdata];

INSERT INTO [dbo].[COMPLETE_DIVVY_TRIPDATA] -- 200274 -- ABR20
SELECT  ride_id, rideable_type, CAST(started_at AS smalldatetime) AS started_at, CAST(ended_at AS smalldatetime) ended_at, start_station_name, start_station_id, end_station_name, end_station_id
	   , CAST(NULLIF(start_lat,'') AS NUMERIC(17,15)) AS start_lat , CAST(NULLIF(start_lng,'') AS NUMERIC(17,15)) AS start_lng, CAST(NULLIF(end_lat,'') AS NUMERIC(17,15)) AS end_lat, CAST(NULLIF(end_lng,'') AS NUMERIC (17,15)) AS end_lng
	   , member_casual, CAST('2020-04-01' AS smalldatetime) AS REPORT_DATE 
FROM [dbo].[202004-divvy-tripdata];

INSERT INTO [dbo].[COMPLETE_DIVVY_TRIPDATA] -- 426887 -- ENE20 A MAR
SELECT  ride_id, rideable_type, CAST(started_at AS smalldatetime) AS started_at, CAST(ended_at AS smalldatetime) ended_at, start_station_name, start_station_id, end_station_name, end_station_id
	   , CAST(NULLIF(start_lat,'') AS NUMERIC(17,15)) AS start_lat , CAST(NULLIF(start_lng,'') AS NUMERIC(17,15)) AS start_lng, CAST(NULLIF(end_lat,'') AS NUMERIC(17,15)) AS end_lat, CAST(NULLIF(end_lng,'') AS NUMERIC (17,15)) AS end_lng
	   , member_casual, CAST(CONCAT(LEFT(started_at,4),'-',SUBSTRING(started_at,6,2),'-01') AS smalldatetime) AS REPORT_DATE 
FROM [dbo].[Divvy_Trips_2020_Q1];

-- SELECT REPORT_DATE, COUNT(*) RECORDS FROM [COMPLETE_DIVVY_TRIPDATA] GROUP BY REPORT_DATE ORDER BY REPORT_DATE

-- DROPING 2020 TABLES
DROP TABLE [dbo].[202012-divvy-tripdata], [dbo].[202011-divvy-tripdata], [dbo].[202010-divvy-tripdata], [dbo].[202009-divvy-tripdata], [dbo].[202008-divvy-tripdata], [dbo].[202007-divvy-tripdata]
	       , [dbo].[202006-divvy-tripdata], [dbo].[202005-divvy-tripdata], [dbo].[202004-divvy-tripdata], [Divvy_Trips_2020_Q1]
;

-- CONTINUE WITH 2019 TABLES
SELECT trip_id AS ride_id, NULL AS rideable_type, CAST(start_time AS smalldatetime) AS started_at, CAST(end_time AS smalldatetime) ended_at -- 704054 -- OCT19 A DIC19
	   , from_station_name AS start_station_name, from_station_id AS start_station_id, to_station_name AS end_station_name, to_station_id AS end_station_id
	   , NULL AS start_lat, NULL start_lng, NULL AS end_lat, NULL AS end_lng
	   , IIF(usertype = 'Customer', 'casual', IIF(usertype ='Subscriber', 'member',NULL)) AS member_casual
	   , CAST(CONCAT(LEFT(start_time,4),'-',SUBSTRING(start_time,6,2),'-01') AS smalldatetime) AS REPORT_DATE 
	   , tripduration AS tripduration, bikeid, gender, IIF(CAST(birthyear*1 AS NUMERIC)=0,NULL,CAST(birthyear*1 AS NUMERIC)) AS birthyear
INTO DIVVY_TRIPDATA_UNTIL_2019
FROM [dbo].[Divvy_Trips_2019_Q4]

INSERT INTO DIVVY_TRIPDATA_UNTIL_2019
SELECT trip_id AS ride_id, NULL AS rideable_type, CAST(start_time AS smalldatetime) AS started_at, CAST(end_time AS smalldatetime) ended_at -- 704054 -- OCT19 A DIC19
	   , from_station_name AS start_station_name, from_station_id AS start_station_id, to_station_name AS end_station_name, to_station_id AS end_station_id
	   , NULL AS start_lat, NULL start_lng, NULL AS end_lat, NULL AS end_lng
	   , IIF(usertype = 'Customer', 'casual', IIF(usertype ='Subscriber', 'member',NULL)) AS member_casual
	   , CAST(CONCAT(LEFT(start_time,4),'-',SUBSTRING(start_time,6,2),'-01') AS smalldatetime) AS REPORT_DATE 
	   , tripduration AS tripduration, bikeid, gender, IIF(CAST(birthyear*1 AS NUMERIC)=0,NULL,CAST(birthyear*1 AS NUMERIC)) AS birthyear
FROM [dbo].[Divvy_Trips_2019_Q3]

INSERT INTO DIVVY_TRIPDATA_UNTIL_2019 -- 1108163 -- ABR19 TO JUN19
SELECT [01 - Rental Details Rental ID] AS ride_id, NULL AS rideable_type, CAST([01 - Rental Details Local Start Time] AS smalldatetime) AS started_at, CAST([01 - Rental Details Local End Time] AS smalldatetime) ended_at -- 1640718 -- ABR19 A JUN19
	   , [03 - Rental Start Station Name] AS start_station_name, [03 - Rental Start Station ID] AS start_station_id, [02 - Rental End Station Name] AS end_station_name, [02 - Rental End Station ID] AS end_station_id
	   , NULL AS start_lat, NULL start_lng, NULL AS end_lat, NULL AS end_lng
	   , IIF([User Type] = 'Customer', 'casual', IIF([User Type] ='Subscriber', 'member',NULL)) AS member_casual
	   , CAST(CONCAT(LEFT([01 - Rental Details Local Start Time],4),'-',SUBSTRING([01 - Rental Details Local Start Time],6,2),'-01') AS smalldatetime) AS REPORT_DATE 
	   , [01 - Rental Details Duration In Seconds Uncapped] AS tripduration, [01 - Rental Details Bike ID] AS bikeid
	   , [Member Gender] as gender, IIF(CAST([05 - Member Details Member Birthday Year]*1 AS NUMERIC)=0,NULL,CAST([05 - Member Details Member Birthday Year]*1 AS NUMERIC)) AS birthyear
FROM [dbo].[Divvy_Trips_2019_Q2];

INSERT INTO DIVVY_TRIPDATA_UNTIL_2019
SELECT trip_id AS ride_id, NULL AS rideable_type, CAST(start_time AS smalldatetime) AS started_at, CAST(end_time AS smalldatetime) ended_at -- 364069 -- ENE19 A MAR19
	   , from_station_name AS start_station_name, from_station_id AS start_station_id, to_station_name AS end_station_name, to_station_id AS end_station_id
	   , NULL AS start_lat, NULL start_lng, NULL AS end_lat, NULL AS end_lng
	   , IIF(usertype = 'Customer', 'casual', IIF(usertype ='Subscriber', 'member',NULL)) AS member_casual
	   , CAST(CONCAT(LEFT(start_time,4),'-',SUBSTRING(start_time,6,2),'-01') AS smalldatetime) AS REPORT_DATE 
	   , tripduration AS tripduration, bikeid, gender, IIF(CAST(birthyear*1 AS NUMERIC)=0,NULL,CAST(birthyear*1 AS NUMERIC)) AS birthyear
FROM [dbo].[Divvy_Trips_2019_Q1]

INSERT INTO DIVVY_TRIPDATA_UNTIL_2019
SELECT trip_id AS ride_id, NULL AS rideable_type, CAST(start_time AS smalldatetime) AS started_at, CAST(end_time AS smalldatetime) ended_at -- 642686 -- OCT18 A DIC18
	   , from_station_name AS start_station_name, from_station_id AS start_station_id, to_station_name AS end_station_name, to_station_id AS end_station_id
	   , NULL AS start_lat, NULL start_lng, NULL AS end_lat, NULL AS end_lng
	   , IIF(usertype = 'Customer', 'casual', IIF(usertype ='Subscriber', 'member',NULL)) AS member_casual
	   , CAST(CONCAT(LEFT(start_time,4),'-',SUBSTRING(start_time,6,2),'-01') AS smalldatetime) AS REPORT_DATE 
	   , tripduration AS tripduration, bikeid, gender, IIF(CAST(birthyear*1 AS NUMERIC)=0,NULL,CAST(birthyear*1 AS NUMERIC)) AS birthyear
FROM [dbo].[Divvy_Trips_2018_Q4]

INSERT INTO DIVVY_TRIPDATA_UNTIL_2019
SELECT trip_id AS ride_id, NULL AS rideable_type, CAST(start_time AS smalldatetime) AS started_at, CAST(end_time AS smalldatetime) ended_at -- 1513570 -- JUL18 A SEP18
	   , from_station_name AS start_station_name, from_station_id AS start_station_id, to_station_name AS end_station_name, to_station_id AS end_station_id
	   , NULL AS start_lat, NULL start_lng, NULL AS end_lat, NULL AS end_lng
	   , IIF(usertype = 'Customer', 'casual', IIF(usertype ='Subscriber', 'member',NULL)) AS member_casual
	   , CAST(CONCAT(LEFT(start_time,4),'-',SUBSTRING(start_time,6,2),'-01') AS smalldatetime) AS REPORT_DATE 
	   , tripduration AS tripduration, bikeid, gender, IIF(CAST(birthyear*1 AS NUMERIC)=0,NULL,CAST(birthyear*1 AS NUMERIC)) AS birthyear
FROM [dbo].[Divvy_Trips_2018_Q3]

INSERT INTO DIVVY_TRIPDATA_UNTIL_2019
SELECT trip_id AS ride_id, NULL AS rideable_type, CAST(start_time AS smalldatetime) AS started_at, CAST(end_time AS smalldatetime) ended_at -- 1059681 -- ABR18 A JUN18
	   , from_station_name AS start_station_name, from_station_id AS start_station_id, to_station_name AS end_station_name, to_station_id AS end_station_id
	   , NULL AS start_lat, NULL start_lng, NULL AS end_lat, NULL AS end_lng
	   , IIF(usertype = 'Customer', 'casual', IIF(usertype ='Subscriber', 'member',NULL)) AS member_casual
	   , CAST(CONCAT(LEFT(start_time,4),'-',SUBSTRING(start_time,6,2),'-01') AS smalldatetime) AS REPORT_DATE 
	   , tripduration AS tripduration, bikeid, gender, IIF(CAST(birthyear*1 AS NUMERIC)=0,NULL,CAST(birthyear*1 AS NUMERIC)) AS birthyear
FROM [dbo].[Divvy_Trips_2018_Q2]

INSERT INTO DIVVY_TRIPDATA_UNTIL_2019 -- 387145 -- ENE18 A MAR18
SELECT [01 - Rental Details Rental ID] AS ride_id, NULL AS rideable_type, CAST([01 - Rental Details Local Start Time] AS smalldatetime) AS started_at, CAST([01 - Rental Details Local End Time] AS smalldatetime) ended_at -- 1640718 -- ABR19 A JUN19
	   , [03 - Rental Start Station Name] AS start_station_name, [03 - Rental Start Station ID] AS start_station_id, [02 - Rental End Station Name] AS end_station_name, [02 - Rental End Station ID] AS end_station_id
	   , NULL AS start_lat, NULL start_lng, NULL AS end_lat, NULL AS end_lng
	   , IIF([User Type] = 'Customer', 'casual', IIF([User Type] ='Subscriber', 'member',NULL)) AS member_casual
	   , CAST(CONCAT(LEFT([01 - Rental Details Local Start Time],4),'-',SUBSTRING([01 - Rental Details Local Start Time],6,2),'-01') AS smalldatetime) AS REPORT_DATE 
	   , [01 - Rental Details Duration In Seconds Uncapped] AS tripduration, [01 - Rental Details Bike ID] AS bikeid
	   , [Member Gender] as gender, IIF(CAST([05 - Member Details Member Birthday Year]*1 AS NUMERIC)=0,NULL,CAST([05 - Member Details Member Birthday Year]*1 AS NUMERIC)) AS birthyear
FROM [dbo].[Divvy_Trips_2018_Q1];

-- UPDATING [COMPLETE_DIVVY_TRIPDATA] WITH INFO FROM 2018 AND 2019

insert into [COMPLETE_DIVVY_TRIPDATA] -- [COMPLETE_DIVVY_TRIPDATA] contains data from 2018 to 2022
SELECT ride_id, rideable_type, started_at,ended_at, start_station_name, start_station_id, end_station_name, end_station_id
	   , start_lat, start_lng, end_lat, end_lng, member_casual, REPORT_DATE
FROM DIVVY_TRIPDATA_UNTIL_2019



-- INSERT INTO DIVVY_TRIPDATA_UNTIL_2019 -- 387145 -- ENE18 A MAR18 --> PROBLEM WITH DATES
/*SELECT trip_id AS ride_id, NULL AS rideable_type, CAST(start_time AS smalldatetime) AS started_at, CAST(end_time AS smalldatetime) ended_at 
	   , from_station_name AS start_station_name, from_station_id AS start_station_id, to_station_name AS end_station_name, to_station_id AS end_station_id
	   , NULL AS start_lat, NULL start_lng, NULL AS end_lat, NULL AS end_lng
	   , IIF(usertype = 'Customer', 'casual', IIF(usertype ='Subscriber', 'member',NULL)) AS member_casual
	   , CAST(CONCAT(LEFT(start_time,4),'-',SUBSTRING(start_time,6,2),'-01') AS smalldatetime) AS REPORT_DATE 
	   , tripduration AS tripduration, bikeid, gender, IIF(CAST(birthyear*1 AS NUMERIC)=0,NULL,CAST(birthyear*1 AS NUMERIC)) AS birthyear
FROM [dbo].[Divvy_Trips_2017_Q4]*/











;
-- CONTINUE WITH STATIONS DATA

SELECT id AS ID, [name] AS STATION_NAME, city AS STATION_CITY, CAST(latitude AS NUMERIC(17,15)) AS LAT, CAST(longitude AS NUMERIC(17,15)) AS LNG, dpcapacity AS CAPACITY, CAST(online_date AS smalldatetime) AS ONLINE_DATE
INTO DIVVY_STATIONS_2017
FROM [dbo].[Divvy_Stations_2017_Q3Q4]
;

-- END