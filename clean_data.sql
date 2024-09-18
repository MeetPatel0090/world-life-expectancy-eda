# World Life Expectancy Data Cleaning



SELECT * FROM world_life_expectancy;



# Identifying duplicate pairs for Country & Year

 SELECT Country, Year, CONCAT(Country, Year) AS Pair, COUNT(CONCAT(Country, Year)) AS Pair_Count
 FROM world_life_expectancy
 GROUP  BY Country, Year, Pair
 HAVING Pair_Count > 1
 ;
 
 
 # Identifying the Row Numbers of the Duplicate Pairs Found
 
 SELECT *
 FROM (
    SELECT Row_ID, 
    CONCAT(Country, Year) AS Pair,
    ROW_NUMBER() OVER(PARTITION BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year)) AS ROW_NUM
    FROM world_life_expectancy
    ) AS Row_Table
WHERE Row_Num > 1
 ;
 
 
 # Deleting the Duplicate Pairs
 
 DELETE FROM world_life_expectancy 
 WHERE 
 Row_ID IN (
  SELECT Row_ID
  FROM (
     SELECT Row_ID, 
     CONCAT(Country, Year) AS Pair,
     ROW_NUMBER() OVER(PARTITION BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year)) AS ROW_NUM
     FROM world_life_expectancy
     ) AS Row_Table
 WHERE Row_Num > 1
 )
 ;
 

 # Finding the blank records in Status Column
 
 SELECT * 
 FROM world_life_expectancy
 WHERE Status = ''
 ;



SELECT DISTINCT(Status) 
 FROM world_life_expectancy
 WHERE Status <> ''
 ;
 
SELECT DISTINCT(Country)
FROM world_life_expectancy
WHERE Status = 'Developing'
;

 # Filling the blank records in the status column

#Wrong QUERY
UPDATE world_life_expectancy
SET Status = 'Developing'
WHERE Country IN ( SELECT DISTINCT(Country)
                   FROM world_life_expectancy
                   WHERE Status = 'Developing')
;


#Right QUERY for Developing Countries

UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
    ON t1.Country = t2.Country
SET t1.Status = 'Developing'
WHERE t1.Status = ''
AND t2.Status <>  ''
AND t2.Status = 'Developing'
;

#Right QUERY for Developed Countries

UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
    ON t1.Country = t2.Country
SET t1.Status = 'Developed'
WHERE t1.Status = ''
AND t2.Status <>  ''
AND t2.Status = 'Developed'
;

 
 
  # Finding the blank records in Life Expectancy Column
 
 SELECT * 
 FROM world_life_expectancy
 WHERE `Life expectancy` = ''
 ;
 
 
  # Filling the blank record for Afghanistan in Life Expectancy Column
 
 SELECT Country, Year, `Life expectancy`
 FROM world_life_expectancy
 WHERE `Life expectancy` = ''
 ;
 
 
 
SELECT t1.Country, t1.Year, t1.`Life expectancy`, 
       t2.Country, t2.Year, t2.`Life expectancy`,
       t3.Country, t3.Year, t3.`Life expectancy`,
       ROUND((t2.`Life expectancy` + t3.`Life expectancy`)/2,1)
 FROM world_life_expectancy t1
 JOIN world_life_expectancy t2
    ON t1.Country = t2.Country
    AND t1.Year = t2.Year - 1
JOIN world_life_expectancy t3
    ON t1.Country = t3.Country
    AND t1.Year = t3.Year + 1
WHERE t1.`Life expectancy` = ''
;


UPDATE world_life_expectancy t1
 JOIN world_life_expectancy t2
    ON t1.Country = t2.Country
    AND t1.Year = t2.Year - 1
JOIN world_life_expectancy t3
    ON t1.Country = t3.Country
    AND t1.Year = t3.Year + 1
SET t1.`Life expectancy` = ROUND((t2.`Life expectancy` + t3.`Life expectancy`)/2,1)
WHERE t1.`Life expectancy` = ''
;



