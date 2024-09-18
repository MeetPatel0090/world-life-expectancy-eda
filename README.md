# World Life Expectancy Exploratory Data Analysis

## Project Overview
This project involves an exploratory data analysis (EDA) on world life expectancy using MySQL. The objective is to uncover insights and trends in life expectancy across different countries and regions.

## Table of Contents
- [Introduction](#introduction)
- [Dataset](#dataset)
- [Data Cleaning](#data-cleaning)
- [Installation](#installation)
- [Usage](#usage)
- [Analysis](#analysis)
- [Results](#results)
- [Conclusion](#conclusion)
- [Contributing](#contributing)
- [License](#license)

## Introduction
This project aims to understand global life expectancy trends through exploratory data analysis. By analyzing health indicators such as mortality rates, healthcare expenditure, and disease prevalence, we aim to provide insights into the factors affecting life expectancy in various countries.

## Dataset
The dataset used for this analysis is `WorldLifeExpectancy.csv`. It contains data on life expectancy across various countries and regions from multiple years. Key columns include:
- `Country`: Name of the country.
- `Year`: Year of the recorded data.
- `Life Expectancy`: Average life expectancy in that year.
- `Adult Mortality`: Adult mortality rates per 1000 people.
- `Infant Deaths`: Number of infant deaths.
- `Percentage Expenditure`: Healthcare expenditure as a percentage of GDP.
- `Measles`: Number of reported measles cases.
- `GDP`: Gross Domestic Product.
- `Schooling`: Average years of schooling.

## Data Cleaning
The dataset required some cleaning to ensure accuracy and consistency. The following steps were taken to clean the data, based on the `clean_data.sql` file:

### 1. **Identifying Duplicate Pairs for Country & Year**
   - **Query Used**:<br><br>
   ```SELECT Country, Year, CONCAT(Country, Year) AS Pair, COUNT(CONCAT(Country, Year)) AS Pair_Count```<br>
   ```FROM world_life_expectancy```<br>
   ```GROUP BY Country, Year, Pair```<br>
   ```HAVING Pair_Count > 1;```<br>

### Key Explanation:
1. **Purpose**: The reason for running the query. In this case, it identifies duplicates, ensuring the data is unique.
2. **Effect**: How this action benefits the dataset. In this example, removing duplicates leads to more accurate analysis results because each country-year pair is only represented once.
