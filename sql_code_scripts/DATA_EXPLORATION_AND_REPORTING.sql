/*** EXPLORING DATA FOR REPORTING ***/

USE DIVVY_DB
GO
;


-- 0. FILL MISING DATA WITH THE SAME DATA

-- 0.1 updating start_lat, start_lng
SELECT  start_station_id, start_station_name, avg(start_lat) as start_lat, avg(start_lng) as start_lng
into #start_station_id_data
FROM [COMPLETE_DIVVY_TRIPDATA]
where start_station_id <> ''
group by  start_station_id, start_station_name
order by start_station_id

select start_station_id, start_station_name, count(*) records from #start_station_id_data
group by start_station_id, start_station_name having count(*)>1

select count(*) from [COMPLETE_DIVVY_TRIPDATA] --> 22.043.743 / 22.043.743

update [COMPLETE_DIVVY_TRIPDATA] -- updated 7.200.019
set start_lat = b.start_lat, start_lng = b.start_lng
from [COMPLETE_DIVVY_TRIPDATA] as a inner join (select distinct start_station_id, start_station_name, start_lat, start_lng from #start_station_id_data 
												where (start_lat is not null) and (start_lng is not null) and (start_station_id is not null) and (start_station_name is not null)) as b 
on a.start_station_id = b.start_station_id and a.start_station_name = b.start_station_name
where (a.start_lat is null) or (a.start_lng is null);

-- 0.2 updating end_lat, end_lng
drop table #start_station_id_data; 

SELECT  end_station_id, end_station_name, avg(end_lat) as end_lat2, avg(end_lng) as end_lng2
into #end_station_id_data
FROM [COMPLETE_DIVVY_TRIPDATA]
where end_station_id <> ''
group by  end_station_id, end_station_name
order by end_station_id

select end_station_id, end_station_name, count(*) records from #end_station_id_data
group by end_station_id, end_station_name having count(*)>1

select count(*) from [COMPLETE_DIVVY_TRIPDATA] --> 22.043.743 / 22.043.743 / 22.043.743

update [COMPLETE_DIVVY_TRIPDATA] -- updated 7.203.943
set end_lat = b.end_lat2, end_lng = b.end_lng2
from [COMPLETE_DIVVY_TRIPDATA] as a inner join (select distinct end_station_id, end_station_name, end_lat2, end_lng2 from #end_station_id_data
												where (end_lat2 is not null) and (end_lng2 is not null) and (end_station_id is not null) and (end_station_name is not null)) as b 
on a.end_station_id = b.end_station_id and a.end_station_name = b.end_station_name
where (end_lat is null) or (end_lng is null);

-- 0.3 start_station_id, start_station_name (with max)

SELECT  start_station_id, start_station_name, max(start_lat) as start_lat, max(start_lng) as start_lng
into #start_station_id_data
FROM [COMPLETE_DIVVY_TRIPDATA]
where (start_station_id <> '') and (start_station_name <> '')
group by  start_station_id, start_station_name
order by start_station_id

select start_station_id, MAX(start_station_name) start_station_name, max(start_lat) start_lat, max(start_lng) start_lng 
into #final_table
from #start_station_id_data
where (start_lat is not null) and (start_lng is not null)
group by start_station_id

select count(*) from [COMPLETE_DIVVY_TRIPDATA] --> 22.043.743 / 22.043.743 / 22.043.743 / 22.043.743

update [COMPLETE_DIVVY_TRIPDATA] -- updated 498.454
set start_station_id = b.station_id2, start_station_name= b.station_name2
from [COMPLETE_DIVVY_TRIPDATA] as a inner join (select distinct start_station_id as station_id2, start_station_name as station_name2
												, start_lat as lat2, start_lng as lng2 from #final_table) as b 
on a.start_lat = b.lat2 and a.start_lng= b.lng2
where (start_station_id ='') or (start_station_name ='');

update [COMPLETE_DIVVY_TRIPDATA] -- updated 526.680
set end_station_id = b.station_id2, end_station_name= b.station_name2
from [COMPLETE_DIVVY_TRIPDATA] as a inner join (select distinct start_station_id as station_id2, start_station_name as station_name2
												, start_lat as lat2, start_lng as lng2 from #final_table) as b 
on a.end_lat = b.lat2 and a.end_lng= b.lng2
where (end_station_id ='') or (end_station_name ='');


-- 0.4 start_station_id, start_station_name (with min)

SELECT  start_station_id, start_station_name, min(start_lat) as start_lat, min(start_lng) as start_lng
into #start_station_id_data
FROM [COMPLETE_DIVVY_TRIPDATA]
where (start_station_id <> '') and (start_station_name <> '')
group by  start_station_id, start_station_name
order by start_station_id

select start_station_id, MAX(start_station_name) start_station_name, min(start_lat) start_lat, min(start_lng) start_lng 
into #final_table
from #start_station_id_data
where (start_lat is not null) and (start_lng is not null)
group by start_station_id

select count(*) from [COMPLETE_DIVVY_TRIPDATA] --> 22.043.743 / 22.043.743 / 22.043.743 / 22.043.743

update [COMPLETE_DIVVY_TRIPDATA] -- updated 93.750
set start_station_id = b.station_id2, start_station_name= b.station_name2
from [COMPLETE_DIVVY_TRIPDATA] as a inner join (select distinct start_station_id as station_id2, start_station_name as station_name2
												, start_lat as lat2, start_lng as lng2 from #final_table) as b 
on a.start_lat = b.lat2 and a.start_lng= b.lng2
where (start_station_id ='') or (start_station_name ='');

update [COMPLETE_DIVVY_TRIPDATA] -- updated 96.940
set end_station_id = b.station_id2, end_station_name= b.station_name2
from [COMPLETE_DIVVY_TRIPDATA] as a inner join (select distinct start_station_id as station_id2, start_station_name as station_name2
												, start_lat as lat2, start_lng as lng2 from #final_table) as b 
on a.end_lat = b.lat2 and a.end_lng= b.lng2
where (end_station_id ='') or (end_station_name ='');


-- 1. TRIPS_VIEW (ELECTRIC BIKE, CLASSIC BIKE, DOCKED BIKE / ): COUNT OF TRIPS / TYPE OF USERS

-- CREATE VIEW TRIPS_VIEW
-- AS
SELECT CAST(CONCAT(YEAR(started_at),'-',MONTH(started_at),'-',DAY(started_at)) AS smalldatetime) AS REPORT_DATE, YEAR(started_at) AS YEAR_REPORT
	   , MONTH(started_at) AS MONTH_REPORT, DAY(started_at) AS DAY_REPORT  
	   , member_casual AS MEMBER_CASUAL, rideable_type AS RIDEABLE_TYPE, CAST(COUNT(DISTINCT ride_id) AS NUMERIC) AS TRIPS
INTO TRIPS_TABLE
FROM [COMPLETE_DIVVY_TRIPDATA]
GROUP BY CAST(CONCAT(YEAR(started_at),'-',MONTH(started_at),'-',DAY(started_at)) AS smalldatetime),  YEAR(started_at) , MONTH(started_at) , DAY(started_at)	
	   , member_casual , rideable_type 
--GO;

-- 2. TRIPS_AVERAGES_VIEW (DURATION IN MIN, HOUR AND KM, PER DAY)
-- CREATE VIEW TRIPS_AVERAGES_VIEW
--AS
SELECT CAST(CONCAT(YEAR(started_at),'-',MONTH(started_at),'-',DAY(started_at)) AS smalldatetime) AS REPORT_DATE, YEAR(started_at) AS YEAR_REPORT
	   , MONTH(started_at) AS MONTH_REPORT, DAY(started_at) AS DAY_REPORT  
	   , CAST(COUNT(DISTINCT ride_id) AS NUMERIC) AS TRIPS
	   , AVG(DATEDIFF(minute, started_at, ended_at)) AS TRIP_DURATION_MIN, AVG((DATEDIFF(minute, started_at, ended_at)*1.0)/60) AS TRIP_DURATION_HOUR
	   , AVG(iif(start_lat is null or start_lng is null or end_lat is null or end_lng is null, null,  GEOGRAPHY::Point(start_lat, start_lng, 4326).STDistance(GEOGRAPHY::Point(end_lat, end_lng, 4326))/1000)) as TRIP_IN_KMS
INTO TRIPS_AVERAGES_TABLE
FROM [COMPLETE_DIVVY_TRIPDATA]
GROUP BY CAST(CONCAT(YEAR(started_at),'-',MONTH(started_at),'-',DAY(started_at)) AS smalldatetime),  YEAR(started_at) , MONTH(started_at) , DAY(started_at)	
	   
--GO

;
--CREATE VIEW TRIPS_AVERAGES_VIEW_2
--AS
SELECT CAST(CONCAT(YEAR(started_at),'-',MONTH(started_at),'-',DAY(started_at)) AS smalldatetime) AS REPORT_DATE, YEAR(started_at) AS YEAR_REPORT
	   , MONTH(started_at) AS MONTH_REPORT, DAY(started_at) AS DAY_REPORT  
	   , member_casual AS MEMBER_CASUAL, rideable_type AS RIDEABLE_TYPE, CAST(COUNT(DISTINCT ride_id) AS NUMERIC) AS TRIPS
	   , AVG(DATEDIFF(minute, started_at, ended_at)) AS TRIP_DURATION_MIN, AVG((DATEDIFF(minute, started_at, ended_at)*1.0)/60) AS TRIP_DURATION_HOUR
	   , AVG(iif(start_lat is null or start_lng is null or end_lat is null or end_lng is null, null,  GEOGRAPHY::Point(start_lat, start_lng, 4326).STDistance(GEOGRAPHY::Point(end_lat, end_lng, 4326))/1000)) as TRIP_IN_KMS
INTO TRIPS_AVERAGES_TABLE_2
FROM [COMPLETE_DIVVY_TRIPDATA]
GROUP BY CAST(CONCAT(YEAR(started_at),'-',MONTH(started_at),'-',DAY(started_at)) AS smalldatetime),  YEAR(started_at) , MONTH(started_at) , DAY(started_at)	
	   , member_casual , rideable_type 
--GO
;

-- 3. TOP_10_STATIONS_VIEW (ONLY STATIONS WITH THE CAPACITY): PER MONTH AND PER DAY

; 
--CREATE VIEW TOP_10_STATIONS_VIEW_1
--AS

WITH TRIPS AS (
SELECT YEAR(started_at) AS YEAR_REPORT , MONTH(started_at) AS MONTH_REPORT, REPORT_DATE
	   , start_station_id STATION_ID, start_station_name STATION_NAME, start_lat STATION_LAT, start_lng STATION_LNG, COUNT(DISTINCT ride_id) AS TRIPS
FROM [COMPLETE_DIVVY_TRIPDATA]
GROUP BY YEAR(started_at), MONTH(started_at), REPORT_DATE
	   , start_station_id, start_station_name, start_lat, start_lng)

SELECT REPORT_DATE, A.YEAR_REPORT, A.MONTH_REPORT, iif(STATION_ID = '', 'Unknown '+ cast(FILTER_TOP_10 as varchar(5)), STATION_ID) STATION_ID
	   , iif(STATION_NAME = '', 'Unknown '+ cast(FILTER_TOP_10 as varchar(5)), STATION_NAME) STATION_NAME
	   , A.STATION_LAT, A.STATION_LNG, TRIPS, CAPACITY, FILTER_TOP_10
INTO TOP_10_STATIONS_TABLE_1
FROM (
SELECT  REPORT_DATE, A.YEAR_REPORT, A.MONTH_REPORT, IIF(A.STATION_ID IS NULL, B.ID, A.STATION_ID) AS STATION_ID, IIF(A.STATION_NAME IS NULL, B.STATION_NAME, A.STATION_NAME) AS STATION_NAME
	   , A.STATION_LAT, A.STATION_LNG, TRIPS, B.CAPACITY 
	   , ROW_NUMBER() OVER (PARTITION BY REPORT_DATE ORDER BY TRIPS DESC) FILTER_TOP_10
FROM TRIPS AS A LEFT JOIN [dbo].DIVVY_STATIONS_2017 AS B ON A.STATION_ID = B.ID
) AS A 
WHERE FILTER_TOP_10 <11


-- 4. LAST_10_STATIONS_VIEW (ONLY STATIONS WITH THE CAPACITY): PER MONTH AND PER DAY

WITH TRIPS AS (
SELECT YEAR(started_at) AS YEAR_REPORT , MONTH(started_at) AS MONTH_REPORT, REPORT_DATE
	   , start_station_id STATION_ID, start_station_name STATION_NAME, start_lat STATION_LAT, start_lng STATION_LNG, COUNT(DISTINCT ride_id) AS TRIPS
FROM [COMPLETE_DIVVY_TRIPDATA]
GROUP BY YEAR(started_at), MONTH(started_at), REPORT_DATE
	   , start_station_id, start_station_name, start_lat, start_lng)

SELECT REPORT_DATE, A.YEAR_REPORT, A.MONTH_REPORT, iif(STATION_ID = '', 'Unknown '+ cast(FILTER_LAST_10 as varchar(5)), STATION_ID) STATION_ID
	   , iif(STATION_NAME = '', 'Unknown '+ cast(FILTER_LAST_10 as varchar(5)), STATION_NAME) STATION_NAME
	   , A.STATION_LAT, A.STATION_LNG, TRIPS, CAPACITY, FILTER_LAST_10
INTO LAST_10_STATIONS_TABLE_1
FROM (
SELECT REPORT_DATE, A.YEAR_REPORT, A.MONTH_REPORT, IIF(A.STATION_ID IS NULL, B.ID, A.STATION_ID) AS STATION_ID, IIF(A.STATION_NAME IS NULL, B.STATION_NAME, A.STATION_NAME) AS STATION_NAME
	   , A.STATION_LAT, A.STATION_LNG, TRIPS, B.CAPACITY 
	   , ROW_NUMBER() OVER (PARTITION BY REPORT_DATE ORDER BY TRIPS ASC) FILTER_LAST_10
FROM TRIPS AS A LEFT JOIN [dbo].DIVVY_STATIONS_2017 AS B ON A.STATION_ID = B.ID
) AS A 
WHERE FILTER_LAST_10 <11

--GO

SELECT DISTINCT * FROM TOP_10_STATIONS_TABLE_1 WHERE STATION_NAME LIKE '%Unknown%'


-- 5. DETAIL PER STATION PER DAY --> USE_PER_STATION

--Declare table
DECLARE @t TABLE
(StartTime TIME, EndTime TIME)
INSERT INTO @t
SELECT '00:00', '23:59'
-- Make CTE
;WITH CTE (n) AS (
    SELECT TOP (SELECT DATEDIFF(MINUTE,StartTime,EndTime)/30
    FROM @t) 30*(ROW_NUMBER() OVER (ORDER BY (SELECT NULL))-1)
    FROM sys.all_columns
    )
-- QUERY
SELECT 
     TSStart=DATEADD(minute, n, StartTime)
    ,TSEnd=DATEADD(minute, n + 29, StartTime)
    ,Timeslot=CONVERT(VARCHAR(100), DATEADD(minute, n, StartTime), 0) + ' - ' +
        CONVERT(VARCHAR(100), DATEADD(minute, n + 30, StartTime), 0)
INTO SELECT * FROM #TIMESLOT
FROM @t
CROSS APPLY (
    SELECT n 
    FROM CTE 
    WHERE n BETWEEN 0 AND DATEDIFF(minute, StartTime, DATEADD(minute, -30, EndTime))) a
ORDER BY TSStart

SELECT START_STATION_ID, Timeslot, TSStart, AVG(START_TRIPS) AS AVG_START_TRIPS
INTO #AVG_START_TRIPS
FROM (
SELECT START_STATION_ID, CAST(CONCAT(YEAR(started_at),'-',MONTH(started_at),'-',DAY(started_at)) AS smalldatetime) AS REPORT_DATE
	  , B.Timeslot, COUNT(ride_id) AS START_TRIPS, B.TSStart
FROM [COMPLETE_DIVVY_TRIPDATA] AS  A, #TIMESLOT AS B
WHERE (YEAR(STARTED_AT)= '2022') AND (CONVERT(VARCHAR(12),STARTED_AT,114) BETWEEN TSStart AND TSEnd)
GROUP BY START_STATION_ID, CAST(CONCAT(YEAR(started_at),'-',MONTH(started_at),'-',DAY(started_at)) AS smalldatetime)
	   , B.timeslot, B.TSStart
) AS A 
GROUP BY START_STATION_ID, Timeslot, TSStart

SELECT END_STATION_ID, Timeslot, TSStart, AVG(END_TRIPS) AS AVG_END_TRIPS
INTO #AVG_END_TRIPS
FROM (
SELECT END_STATION_ID, CAST(CONCAT(YEAR(ENDED_AT),'-',MONTH(ENDED_AT),'-',DAY(ENDED_AT)) AS smalldatetime) AS REPORT_DATE
	  , B.Timeslot, B.TSStart, COUNT(ride_id) AS END_TRIPS
FROM [COMPLETE_DIVVY_TRIPDATA] AS  A, #TIMESLOT AS B
WHERE (YEAR(ENDED_AT)= '2022') AND (CONVERT(VARCHAR(12),ENDED_AT,114) BETWEEN TSStart AND TSEnd)
GROUP BY END_STATION_ID, CAST(CONCAT(YEAR(ENDED_AT),'-',MONTH(ENDED_AT),'-',DAY(ENDED_AT)) AS smalldatetime)
	   , B.timeslot, B.TSStart
) AS A 
GROUP BY END_STATION_ID, Timeslot, TSStart

SELECT A.ID, A.STATION_NAME, A.CAPACITY, B.Timeslot, B.TSStart, B.AVG_START_TRIPS, C.AVG_END_TRIPS
	   , (CAPACITY-AVG_START_TRIPS+AVG_END_TRIPS) CURRENT_BIKES_STATION, IIF(CAPACITY=0, NULL, (AVG_START_TRIPS-AVG_END_TRIPS)*1.0/CAPACITY) AS USE_PRCNT
INTO USE_PER_STATION
FROM DIVVY_STATIONS_2017 AS A INNER JOIN #AVG_START_TRIPS AS B ON A.ID = B.START_STATION_ID
	 INNER JOIN #AVG_END_TRIPS AS C ON A.ID = C.END_STATION_ID AND B.Timeslot = C.Timeslot
ORDER BY ID, TSStart

DROP TABLE #AVG_START_TRIPS, #AVG_END_TRIPS, #TIMESLOT  

-- 5. KPIS FOR FINANCIAL INDICATORS OF THE YEAR: AV DISTANCE PER DAY, AVERAGE HOURS PER DAY BY TYPE OF BIKE (COSTS) 
--                                                  // CASUAL TRIPS OF LESS 30 MIN PER DAY, CASUAL TRIPS OR MORE 30MIN PER DAY, TOTAL CASUAL TRIPS PER DAY, TOTAL MEMBER TRIPS PER DAY, AVERAGE MIN PER TRIP PER DAY ALL BY TYPE OF BYKE (INCOME)

-- 5.1 COSTS

SELECT REPORT_DATE, YEAR_REPORT, MONTH_REPORT, DAY_REPORT, RIDEABLE_TYPE, MEMBER_CASUAL, TRIPS
	   ,  (SUM_TRIP_DURATION_HOUR*1.0/50)*75 AS MAINTENANCE_COST
	   , IIF([rideable_type] = 'electric_bike', (SUM_TRIP_IN_KMS*1.0/6154)*600 -- because 160.000KM / 26KM PER HOUR OF SPEED IN CITY OF AN AVERAGE BIKE
			, (SUM_TRIP_DURATION_HOUR*1.0/350)*750)  -- THIS IS REPLACEMENT COSTS FOR NORMAL DEPRECIATION 
			--+ ((TRIPS / 2304 /*576 TRIPS PER USER PER YEAR BY 4 USERS PER DAY USING A BIKE*/ ) * 
			--(0.15 /* 0.1 VANDALISED BIKES AND 0.05 STOLEN BIKES PER YEAR*/) * 
			--(1500 /* REPLACE COST OF A BIKE*/))
			AS REPLACE_COST
	   , IIF([rideable_type] = 'electric_bike',(SUM_TRIP_IN_KMS*1.0/80)*48, NULL) BATERY_CHARGE_COST
INTO COSTS_TABLE_PER_DAY_VIEW
FROM (
SELECT CAST(CONCAT(YEAR(started_at),'-',MONTH(started_at),'-',DAY(started_at)) AS smalldatetime) AS REPORT_DATE, YEAR(started_at) AS YEAR_REPORT
	   , MONTH(started_at) AS MONTH_REPORT, DAY(started_at) AS DAY_REPORT, [rideable_type] as RIDEABLE_TYPE, member_casual AS MEMBER_CASUAL
	   , CAST(COUNT(DISTINCT ride_id) AS NUMERIC) AS TRIPS
	   , SUM((DATEDIFF(minute, started_at, ended_at)*1.0)/60) AS SUM_TRIP_DURATION_HOUR
	   , SUM(iif(start_lat is null or start_lng is null or end_lat is null or end_lng is null, null,  GEOGRAPHY::Point(start_lat, start_lng, 4326).STDistance(GEOGRAPHY::Point(end_lat, end_lng, 4326))/1000)) as SUM_TRIP_IN_KMS
FROM [COMPLETE_DIVVY_TRIPDATA]
GROUP BY CAST(CONCAT(YEAR(started_at),'-',MONTH(started_at),'-',DAY(started_at)) AS smalldatetime),  YEAR(started_at) , MONTH(started_at) , DAY(started_at)	
	    , [rideable_type], member_casual
) AS A 



-- SELECT * FROM COSTS_TABLE_PER_DAY_VIEW WHERE RIDEABLE_TYPE IS NOT NULL

-- 5.2 INCOMES (REVISAR MAÑANA)
 
SELECT CAST(CONCAT(YEAR(started_at),'-',MONTH(started_at),'-',DAY(started_at)) AS smalldatetime) AS REPORT_DATE, YEAR(started_at) AS YEAR_REPORT
	   , MONTH(started_at) AS MONTH_REPORT, DAY(started_at) AS DAY_REPORT, [rideable_type] as RIDEABLE_TYPE, member_casual AS MEMBER_CASUAL
	   , IIF((DATEDIFF(minute, started_at, ended_at)*1.0)>=45,1,0) AS RIDE_MORE_45_MINUTES
	   , CAST(COUNT(DISTINCT ride_id) AS NUMERIC) AS TRIPS
	   , SUM((DATEDIFF(minute, started_at, ended_at)*1.0)/60) AS SUM_TRIP_DURATION_HOUR
	   , SUM((DATEDIFF(minute, started_at, ended_at)*1.0)) AS SUM_TRIP_DURATION_MINUTE
	   , SUM(iif(start_lat is null or start_lng is null or end_lat is null or end_lng is null, null,  GEOGRAPHY::Point(start_lat, start_lng, 4326).STDistance(GEOGRAPHY::Point(end_lat, end_lng, 4326))/1000)) as SUM_TRIP_IN_KMS
INTO #TEMP_INCOME_TABLE --> RECALCULATE
FROM [COMPLETE_DIVVY_TRIPDATA]
GROUP BY CAST(CONCAT(YEAR(started_at),'-',MONTH(started_at),'-',DAY(started_at)) AS smalldatetime),  YEAR(started_at) , MONTH(started_at) , DAY(started_at)	
	    , [rideable_type], member_casual, IIF((DATEDIFF(minute, started_at, ended_at)*1.0)>=45,1,0)


SELECT REPORT_DATE, YEAR_REPORT, MONTH_REPORT, DAY_REPORT, RIDEABLE_TYPE, MEMBER_CASUAL
	   , RIDE_MORE_45_MINUTES, TRIPS
	   , iif(member_casual = 'casual'
			, iif(RIDEABLE_TYPE ='electric_bike', (1*TRIPS_PER_USE_CASUAL)+(0.39*(PER_USE_SUM_DURATION_CASUAL)), (1*TRIPS_PER_USE_CASUAL)+(0.16*(PER_USE_SUM_DURATION_CASUAL)+(15*(DAY_PASS_TRIPS_CASUAL/9))))
			, iif( RIDE_MORE_45_MINUTES = 1,(0.16*(SUM_TRIP_DURATION_MINUTE)),0)) AS INCOME_PER_USE	   
	   , IIF(member_casual = 'member', TRIPS,NULL)/(24*12) AS MEMBERS_YEARLY --> MEMBERS DOES 2 TRIPS PER DAY, 12 TRIPS PER WEEK AND 48 TRIPS PER MONTH
	   , IIF(member_casual = 'member', TRIPS,NULL)/(24) AS MEMBERS_MONTHLY --> MEMBERS DOES 2 TRIPS PER DAY, 12 TRIPS PER WEEK AND 48 TRIPS PER MONTH
	   , IIF(member_casual = 'member', TRIPS,NULL)/(6) AS MEMBERS_WEEKLY --> MEMBERS DOES 2 TRIPS PER DAY, 12 TRIPS PER WEEK AND 48 TRIPS PER MONTH
	   , IIF(member_casual = 'member', TRIPS,NULL)/(1) AS MEMBERS_DAILY --> MEMBERS DOES 2 TRIPS PER DAY, 12 TRIPS PER WEEK AND 48 TRIPS PER MONTH
	   , (IIF(member_casual = 'member', TRIPS,NULL))/(24*12)*10 AS INCOME_PER_MEMBERSHIPS_YEARLY
	   , (IIF(member_casual = 'member', TRIPS,NULL)/(24))*10 AS INCOME_PER_MEMBERSHIPS_MONTHLY
	   , (IIF(member_casual = 'member', TRIPS,NULL)/(6))*10 AS INCOME_PER_MEMBERSHIPS_WEEKLY
	   , (IIF(member_casual = 'member', TRIPS,NULL)/(1))*10 AS INCOME_PER_MEMBERSHIPS_DAILY
INTO INCOME_TABLE_PER_DAY_VIEW --> RECALCULATE AND REVIEW
FROM 
	(SELECT *
	, IIF(MEMBER_CASUAL = 'casual', IIF(RIDE_MORE_45_MINUTES = 1, TRIPS, TRIPS*(0.66)),0) AS DAY_PASS_TRIPS_CASUAL
	, IIF(MEMBER_CASUAL = 'casual', IIF(RIDE_MORE_45_MINUTES = 1, 0, TRIPS*(0.34)),0) AS TRIPS_PER_USE_CASUAL
	, IIF(MEMBER_CASUAL = 'casual', IIF(RIDE_MORE_45_MINUTES = 1, SUM_TRIP_DURATION_MINUTE, SUM_TRIP_DURATION_MINUTE*(0.66)),0) AS DAY_PASS_SUM_DURATION_CASUAL
	, IIF(MEMBER_CASUAL = 'casual', IIF(RIDE_MORE_45_MINUTES = 1, 0, SUM_TRIP_DURATION_MINUTE*(0.34)),0) AS PER_USE_SUM_DURATION_CASUAL
	 FROM #TEMP_INCOME_TABLE) AS A
;

SELECT YEAR_REPORT, MEMBER_CASUAL, RIDE_MORE_45_MINUTES, RIDEABLE_TYPE,SUM(TRIPS) TRIPS, SUM(DAY_PASS_TRIPS_CASUAL) DAY_PASS_TRIPS_CASUAL, SUM(TRIPS_PER_USE_CASUAL) TRIPS_PER_USE_CASUAL, SUM(SUM_TRIP_DURATION_MINUTE) SUM_TRIP_DURATION_MINUTE
FROM (
SELECT *, IIF(MEMBER_CASUAL = 'casual', IIF(RIDE_MORE_45_MINUTES = 1, TRIPS, TRIPS*(0.66)),0) AS DAY_PASS_TRIPS_CASUAL, IIF(MEMBER_CASUAL = 'casual', IIF(RIDE_MORE_45_MINUTES = 1, 0, TRIPS*(0.34)),0) AS TRIPS_PER_USE_CASUAL
	 FROM #TEMP_INCOME_TABLE
) AS A 
GROUP BY YEAR_REPORT, MEMBER_CASUAL, RIDE_MORE_45_MINUTES, RIDEABLE_TYPE
ORDER BY YEAR_REPORT, MEMBER_CASUAL, RIDE_MORE_45_MINUTES, RIDEABLE_TYPE


SELECT YEAR_REPORT,  RIDE_MORE_45_MINUTES, SUM(TRIPS) TRIPS
FROM #TEMP_INCOME_TABLE
WHERE MEMBER_CASUAL = 'casual'
GROUP BY YEAR_REPORT,  RIDE_MORE_45_MINUTES
ORDER BY YEAR_REPORT,  RIDE_MORE_45_MINUTES

-- 6. CREATE TOP_10_STATIONS_DETAIL
WITH TOTAL AS (
SELECT CAST(CONCAT(YEAR(REPORT_DATE),'-',MONTH(REPORT_DATE),'-01') AS smalldatetime) AS REPORT_DATE, YEAR_REPORT, MONTH_REPORT
	   , SUM(TRIPS) AS TRIPS
FROM [dbo].[TRIPS_AVERAGES_TABLE_2]
GROUP BY CAST(CONCAT(YEAR(REPORT_DATE),'-',MONTH(REPORT_DATE),'-01') AS smalldatetime), YEAR_REPORT, MONTH_REPORT)

SELECT A.*, B.TRIPS AS TOTAL_TRIPS_IN_MONTH, IIF(B.TRIPS =0, NULL, A.TRIPS*1.0 / B.TRIPS ) AS STATION_TRIPS_PARTICIPATION
INTO TOP_10_STATIONS_DETAIL
FROM [dbo].[TOP_10_STATIONS_TABLE_1] AS A LEFT JOIN TOTAL AS B ON A.REPORT_DATE = B.REPORT_DATE AND A.YEAR_REPORT = B.YEAR_REPORT AND A.MONTH_REPORT = B.MONTH_REPORT

-- 7. PROFIT_VIEW

WITH INCOMES AS (
SELECT REPORT_DATE, YEAR_REPORT, MONTH_REPORT, DAY_REPORT, SUM(TRIPS) AS TRIPS
	   ,  SUM(INCOME_PER_USE) INCOME_PER_USE
	   , SUM(MEMBERS_YEARLY) MEMBERS_YEARLY
	   , SUM(MEMBERS_MONTHLY) MEMBERS_MONTHLY
	   , SUM(MEMBERS_WEEKLY) MEMBERS_WEEKLY
	   , SUM(MEMBERS_DAILY) MEMBERS_DAILY
	   , SUM(INCOME_PER_MEMBERSHIPS_YEARLY) INCOME_PER_MEMBERSHIPS_YEARLY
	   , SUM(INCOME_PER_MEMBERSHIPS_MONTHLY) INCOME_PER_MEMBERSHIPS_MONTHLY
	   , SUM(INCOME_PER_MEMBERSHIPS_WEEKLY) INCOME_PER_MEMBERSHIPS_WEEKLY
	   , SUM(INCOME_PER_MEMBERSHIPS_DAILY) INCOME_PER_MEMBERSHIPS_DAILY
	   ,  (SUM(INCOME_PER_USE) + SUM(INCOME_PER_MEMBERSHIPS_YEARLY)) AS TOTAL_INCOME_YEARLY
	   ,  (SUM(INCOME_PER_USE) + SUM(INCOME_PER_MEMBERSHIPS_MONTHLY)) AS TOTAL_INCOME_MONTHLY
	   ,  (SUM(INCOME_PER_USE) + SUM(INCOME_PER_MEMBERSHIPS_WEEKLY)) AS TOTAL_INCOME_WEEKLY
	   ,  (SUM(INCOME_PER_USE) + SUM(INCOME_PER_MEMBERSHIPS_DAILY)) AS TOTAL_INCOME_DAILY
FROM [INCOME_TABLE_PER_DAY_VIEW]
GROUP BY REPORT_DATE, YEAR_REPORT, MONTH_REPORT, DAY_REPORT
) 

, COSTS AS (
SELECT REPORT_DATE, YEAR_REPORT, MONTH_REPORT, DAY_REPORT, SUM(TRIPS) TRIPS
	   , SUM(MAINTENANCE_COST) MAINTENANCE_COST, SUM(REPLACE_COST) REPLACE_COST, SUM(BATERY_CHARGE_COST) BATERY_CHARGE_COST
	   , IIF((SUM(IIF(MAINTENANCE_COST IS NULL, 0, MAINTENANCE_COST )) + SUM(IIF(REPLACE_COST IS NULL, 0, REPLACE_COST)) + SUM(IIF(BATERY_CHARGE_COST IS NULL, 0, BATERY_CHARGE_COST))) = 0, NULL, (SUM(IIF(MAINTENANCE_COST IS NULL, 0, MAINTENANCE_COST )) + SUM(IIF(REPLACE_COST IS NULL, 0, REPLACE_COST)) + SUM(IIF(BATERY_CHARGE_COST IS NULL, 0, BATERY_CHARGE_COST)))) AS TOTAL_COSTS 
FROM [COSTS_TABLE_PER_DAY_VIEW]
GROUP BY REPORT_DATE, YEAR_REPORT, MONTH_REPORT, DAY_REPORT
)

SELECT REPORT_DATE, YEAR_REPORT, MONTH_REPORT,  DAY_REPORT, TRIPS, MEMBERS_DAILY, MEMBERS_WEEKLY, MEMBERS_MONTHLY, MEMBERS_YEARLY
	   , INCOME_PER_USE, INCOME_PER_MEMBERSHIPS_DAILY, INCOME_PER_MEMBERSHIPS_WEEKLY, INCOME_PER_MEMBERSHIPS_MONTHLY, INCOME_PER_MEMBERSHIPS_YEARLY
	   , TOTAL_INCOME_DAILY, TOTAL_INCOME_WEEKLY, TOTAL_INCOME_MONTHLY, TOTAL_INCOME_YEARLY
	   , MAINTENANCE_COST, REPLACE_COST, BATERY_CHARGE_COST, TOTAL_COSTS
	   , IIF(REPORT_DATE <= '2019-12-31',NULL, TOTAL_INCOME_DAILY - TOTAL_COSTS) AS DAILY_PROFIT
	   , IIF(REPORT_DATE <= '2019-12-31',NULL, TOTAL_INCOME_WEEKLY - TOTAL_COSTS) AS WEEKLY_PROFIT
	   , IIF(REPORT_DATE <= '2019-12-31',NULL, TOTAL_INCOME_MONTHLY - TOTAL_COSTS) AS MONTHLY_PROFIT
	   , IIF(REPORT_DATE <= '2019-12-31',NULL, TOTAL_INCOME_YEARLY - TOTAL_COSTS) AS ANNUAL_PROFIT
INTO PROFIT_VIEW
FROM (
SELECT A.*, B.MAINTENANCE_COST, B.REPLACE_COST, B.BATERY_CHARGE_COST, B.TOTAL_COSTS
FROM INCOMES AS A INNER JOIN COSTS AS B ON A.REPORT_DATE = B.REPORT_DATE AND A.YEAR_REPORT = B.YEAR_REPORT AND A.MONTH_REPORT = B.MONTH_REPORT AND A.DAY_REPORT = B.DAY_REPORT
) AS A 
WHERE REPORT_DATE > '2019-12-31'

-- 8. PROFIT_VIEW_MEMBERS

WITH INCOMES AS (
SELECT REPORT_DATE, YEAR_REPORT, MONTH_REPORT, DAY_REPORT, MEMBER_CASUAL, SUM(TRIPS) AS TRIPS
	   ,  SUM(INCOME_PER_USE) INCOME_PER_USE
	   , SUM(MEMBERS_YEARLY) MEMBERS_YEARLY
	   , SUM(MEMBERS_MONTHLY) MEMBERS_MONTHLY
	   , SUM(MEMBERS_WEEKLY) MEMBERS_WEEKLY
	   , SUM(MEMBERS_DAILY) MEMBERS_DAILY
	   , SUM(INCOME_PER_MEMBERSHIPS_YEARLY) INCOME_PER_MEMBERSHIPS_YEARLY
	   , SUM(INCOME_PER_MEMBERSHIPS_MONTHLY) INCOME_PER_MEMBERSHIPS_MONTHLY
	   , SUM(INCOME_PER_MEMBERSHIPS_WEEKLY) INCOME_PER_MEMBERSHIPS_WEEKLY
	   , SUM(INCOME_PER_MEMBERSHIPS_DAILY) INCOME_PER_MEMBERSHIPS_DAILY
	   ,  (SUM(INCOME_PER_USE) + SUM(ISNULL(INCOME_PER_MEMBERSHIPS_YEARLY,0))) AS TOTAL_INCOME_YEARLY
	   ,  (SUM(INCOME_PER_USE) + SUM(ISNULL(INCOME_PER_MEMBERSHIPS_MONTHLY,0))) AS TOTAL_INCOME_MONTHLY
	   ,  (SUM(INCOME_PER_USE) + SUM(ISNULL(INCOME_PER_MEMBERSHIPS_WEEKLY,0))) AS TOTAL_INCOME_WEEKLY
	   ,  (SUM(INCOME_PER_USE) + SUM(ISNULL(INCOME_PER_MEMBERSHIPS_DAILY,0))) AS TOTAL_INCOME_DAILY
FROM [INCOME_TABLE_PER_DAY_VIEW]
GROUP BY REPORT_DATE, YEAR_REPORT, MONTH_REPORT, DAY_REPORT, MEMBER_CASUAL
) 

, COSTS AS (
SELECT REPORT_DATE, YEAR_REPORT, MONTH_REPORT, DAY_REPORT, MEMBER_CASUAL, SUM(TRIPS) TRIPS
	   , SUM(MAINTENANCE_COST) MAINTENANCE_COST, SUM(REPLACE_COST) REPLACE_COST, SUM(BATERY_CHARGE_COST) BATERY_CHARGE_COST
	   , IIF((SUM(IIF(MAINTENANCE_COST IS NULL, 0, MAINTENANCE_COST)) + SUM(IIF(REPLACE_COST IS NULL, 0, REPLACE_COST)) + SUM(IIF(BATERY_CHARGE_COST IS NULL, 0, BATERY_CHARGE_COST))) = 0, NULL, (SUM(IIF(MAINTENANCE_COST IS NULL, 0, MAINTENANCE_COST )) + SUM(IIF(REPLACE_COST IS NULL, 0, REPLACE_COST )) + SUM(IIF(BATERY_CHARGE_COST IS NULL, 0, BATERY_CHARGE_COST )))) AS TOTAL_COSTS 
FROM [COSTS_TABLE_PER_DAY_VIEW]
GROUP BY REPORT_DATE, YEAR_REPORT, MONTH_REPORT, DAY_REPORT, MEMBER_CASUAL
)

SELECT REPORT_DATE, YEAR_REPORT, MONTH_REPORT,  DAY_REPORT, MEMBER_CASUAL, TRIPS, MEMBERS_DAILY, MEMBERS_WEEKLY, MEMBERS_MONTHLY, MEMBERS_YEARLY
	   , INCOME_PER_USE, INCOME_PER_MEMBERSHIPS_DAILY, INCOME_PER_MEMBERSHIPS_WEEKLY, INCOME_PER_MEMBERSHIPS_MONTHLY, INCOME_PER_MEMBERSHIPS_YEARLY
	   , TOTAL_INCOME_DAILY, TOTAL_INCOME_WEEKLY, TOTAL_INCOME_MONTHLY, TOTAL_INCOME_YEARLY
	   , MAINTENANCE_COST, REPLACE_COST, BATERY_CHARGE_COST, TOTAL_COSTS
	   , IIF(REPORT_DATE <= '2019-12-31',NULL, TOTAL_INCOME_DAILY - TOTAL_COSTS) AS DAILY_PROFIT
	   , IIF(REPORT_DATE <= '2019-12-31',NULL, TOTAL_INCOME_WEEKLY - TOTAL_COSTS) AS WEEKLY_PROFIT
	   , IIF(REPORT_DATE <= '2019-12-31',NULL, TOTAL_INCOME_MONTHLY - TOTAL_COSTS) AS MONTHLY_PROFIT
	   , IIF(REPORT_DATE <= '2019-12-31',NULL, TOTAL_INCOME_YEARLY - TOTAL_COSTS) AS ANNUAL_PROFIT
INTO PROFIT_VIEW_MEMBERS
FROM (
SELECT A.*, B.MAINTENANCE_COST, B.REPLACE_COST, B.BATERY_CHARGE_COST, B.TOTAL_COSTS
FROM INCOMES AS A INNER JOIN COSTS AS B ON A.REPORT_DATE = B.REPORT_DATE AND A.YEAR_REPORT = B.YEAR_REPORT AND A.MONTH_REPORT = B.MONTH_REPORT AND A.DAY_REPORT = B.DAY_REPORT and A.MEMBER_CASUAL = B.MEMBER_CASUAL
) AS A 
WHERE REPORT_DATE > '2019-12-31'


-- FINAL VIEWS CREATED
SELECT COUNT (*) FROM [dbo].[TRIPS_TABLE]
SELECT COUNT (*) FROM [dbo].[TRIPS_AVERAGES_TABLE]
SELECT COUNT (*) FROM [dbo].[TRIPS_AVERAGES_TABLE_2]
SELECT top 10 * FROM [dbo].[TOP_10_STATIONS_TABLE_1]
SELECT * FROM [dbo].[LAST_10_STATIONS_TABLE_1] where YEAR_REPORT = '2022' and month_report = '09'
SELECT COUNT (*) FROM [dbo].[USE_PER_STATION]
SELECT TOP 10 * FROM [dbo].[COSTS_TABLE_PER_DAY_VIEW]
SELECT COUNT (*) FROM [dbo].[INCOME_TABLE_PER_DAY_VIEW]
SELECT TOP 10 * FROM TOP_10_STATIONS_DETAIL
SELECT TOP 10 * FROM PROFIT_VIEW

SELECT YEAR_REPORT, MEMBER_CASUAL, SUM(MEMBERS_DAILY) MEMBERS_DAILY,SUM(MEMBERS_YEARLY) AS MEMBERS_YEARLY,  SUM(TOTAL_INCOME_YEARLY) AS INCOME 
	   , SUM(TOTAL_COSTS) AS COSTS, SUM(ANNUAL_PROFIT) PROFIT, SUM(INCOME_PER_USE) INCOME_PER_USE
FROM PROFIT_VIEW_MEMBERS
GROUP BY YEAR_REPORT, MEMBER_CASUAL


select YEAR_REPORT, MEMBER_CASUAL, SUM(MEMBERS_YEARLY) MEMBERS_YEARLY, SUM(TRIPS) TRIPS, SUM(TOTAL_COSTS) COSTS
	   ,  SUM(INCOME_PER_USE) INCOME_PER_USE, SUM(INCOME_PER_MEMBERSHIPS_YEARLY) INCOME_PER_MEMBERSHIPS_YEARLY
	   , SUM(TOTAL_INCOME_YEARLY) TOTAL_INCOME_YEARLY, SUM(TOTAL_INCOME_YEARLY) - SUM(TOTAL_COSTS) as PROFITS
from PROFIT_VIEW_MEMBERS
GROUP BY YEAR_REPORT, MEMBER_CASUAL ORDER BY YEAR_REPORT

-- delinquency costs



select top 10 * from INCOME_TABLE_PER_DAY_VIEW

;

-- -- --ADDITIONAL IMPORTANT QUERIES
/*
SELECT REPORT_DATE, YEAR(REPORT_DATE) AS YEAR_REPORT, MONTH(REPORT_DATE) AS MONTH_REPORT, DAY(started_at) AS DAY_REPORT
	   , AVG(DATEDIFF(minute, started_at, ended_at)) AS TRIP_DURATION_MIN, AVG((DATEDIFF(minute, started_at, ended_at)*1.0)/60) AS TRIP_DURATION_HOUR
	   , member_casual AS MEMBER_CASUAL, rideable_type AS RIDEABLE_TYPE, CAST(COUNT(ride_id) AS NUMERIC) AS TRIPS
FROM [COMPLETE_DIVVY_TRIPDATA]
GROUP BY REPORT_DATE, YEAR(REPORT_DATE), MONTH(REPORT_DATE), DAY(started_at)
	   , member_casual , rideable_type
ORDER BY REPORT_DATE DESC

SELECT  top 10 *, iif(start_lat is null or start_lng is null or end_lat is null or end_lng is null, null,  GEOGRAPHY::Point(start_lat, start_lng, 4326).STDistance(GEOGRAPHY::Point(end_lat, end_lng, 4326))/1000) as TRIP_IN_KMS
FROM [COMPLETE_DIVVY_TRIPDATA]

select count(distinct start_station_id) as stations1, count(distinct end_station_id) stations2
from [COMPLETE_DIVVY_TRIPDATA]
*/

/*select * from TRIPS_AVERAGES_TABLE_2 where TRIP_DURATION_HOUR < 0

select * from [COMPLETE_DIVVY_TRIPDATA] where year(started_at) = 2020 and month(started_at) = 12 and day(started_at) = 15*/

