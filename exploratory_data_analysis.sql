# World Life Expectancy Exploratory Data Analysis



SELECT * FROM world_life_expectancy;


# Selecting the MIN and MAX Life Expectancies for all the countries

SELECT Country, MIN(`Life expectancy`), MAX(`Life expectancy`)
 FROM world_life_expectancy
 GROUP BY Country
 HAVING MIN(`Life expectancy`) <> 0
 AND MAX(`Life expectancy`) <> 0
 ORDER BY Country DESC
 ;
 
 # Finding the Increase in Life Expectancy over 15 Years

SELECT Country, 
MIN(`Life expectancy`), 
MAX(`Life expectancy`),
ROUND(MAX(`Life expectancy`) - MIN(`Life expectancy`),1) AS Life_Increase_over_15_Years
 FROM world_life_expectancy
 GROUP BY Country
 HAVING MIN(`Life expectancy`) <> 0
 AND MAX(`Life expectancy`) <> 0
 ORDER BY Life_Increase_over_15_Years DESC
 ;
 
 
  # Finding the AVG in Life Expectancy for each year 

SELECT Year, 
ROUND(AVG(`Life expectancy`),2)
FROM world_life_expectancy
 WHERE `Life expectancy` <> 0
 GROUP BY Year
 ORDER BY Year
 ;
 
 
#  Checking Corelation between the GDP and Life Expectancy of a Country
 
SELECT Country,
ROUND(AVG( `Life expectancy`),2) AS Life_Exp,
ROUND(AVG(GDP),2) AS GDP 
FROM world_life_expectancy
GROUP BY Country
HAVING Life_Exp > 0 
AND GDP > 0
ORDER BY GDP DESC
;


# Categorizing the countries based on their GDP

SELECT 
SUM(CASE WHEN GDP >= 1500 THEN 1 ELSE 0 END) High_GDP_Count,
AVG(CASE WHEN GDP >= 1500 THEN `Life expectancy` ELSE NULL END) High_GDP_Life_Expectancy,
SUM(CASE WHEN GDP <= 1500 THEN 1 ELSE 0 END) Low_GDP_Count,
AVG(CASE WHEN GDP <= 1500 THEN `Life expectancy` ELSE NULL END) Low_GDP_Life_Expectancy
FROM world_life_expectancy
;



SELECT 
Status,
ROUND(AVG( `Life expectancy`),1) AS Life_Exp
FROM world_life_expectancy
GROUP BY Status
;

#  Checking Corelation between the Status and Life Expectancy of a Country

SELECT 
Status,
COUNT(DISTINCT Country),
ROUND(AVG( `Life expectancy`),1) AS Life_Exp
FROM world_life_expectancy
GROUP BY Status
;


#  Checking Corelation between the BMI and Life Expectancy of a Country

SELECT Country,
ROUND(AVG( `Life expectancy`),2) AS Life_Exp,
ROUND(AVG(BMI),2) AS BMI
FROM world_life_expectancy
GROUP BY Country
HAVING Life_Exp > 0 
AND BMI > 0
ORDER BY BMI ASC
;



#  Checking Corelation between the Adult Mortality and Life Expectancy of a Country

SELECT Country,
Year,
`Life expectancy`,
`Adult Mortality`,
SUM(`Adult Mortality`) OVER(PARTITION BY Country ORDER BY Year) AS Rolling_Total
FROM world_life_expectancy
;
