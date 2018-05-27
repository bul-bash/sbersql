use sber
go
create procedure GetRecordForMonth
@MonthNumber int = 0
as

SELECT  mm, SUM(part) summ
FROM (
  SELECT 
  *, 
  dateadd(day, -d, date) dd, Test.Summa * 0.2 part, 
  DATEPART (month  , dateadd(day, -d, date)) mm
  FROM dbo.Test
  CROSS JOIN (
    SELECT 0 d UNION SELECT 1  UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 
    UNION SELECT 5 UNION SELECT 6
  ) days
  WHERE  DATEPART ( weekday  ,  dateadd(day, -d, date) ) NOT IN (1, 7)
) daily where mm=@MonthNumber or @MonthNumber=0
GROUP BY  mm 


 