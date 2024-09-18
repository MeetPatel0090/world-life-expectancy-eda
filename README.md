# World Life Expectancy Exploratory Data Analysis

## Project Overview
This project involves an exploratory data analysis (EDA) on world life expectancy using MySQL. The objective is to uncover insights and trends in life expectancy across different countries and regions. By analyzing key factors such as GDP, status, BMI, and adult mortality, we can draw correlations and conclusions on how these factors influence life expectancy.

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
This project aims to understand global life expectancy trends through exploratory data analysis. By analyzing health indicators such as mortality rates, GDP, BMI, and the status of countries (Developed vs. Developing), we aim to provide insights into the factors affecting life expectancy in various countries.

## Dataset
The dataset used for this analysis is `WorldLifeExpectancy.csv`. It contains data on life expectancy across various countries and regions from multiple years. Key columns include:
- `Country`: Name of the country.
- `Year`: Year of the recorded data.
- `Life Expectancy`: Average life expectancy in that year.
- `Adult Mortality`: Adult mortality rates per 1000 people.
- `GDP`: Gross Domestic Product.
- `BMI`: Average Body Mass Index (BMI).
- `Status`: Status of the country, whether it is "Developed" or "Developing."

## Data Cleaning
The dataset required some cleaning to ensure accuracy and consistency. The following steps were taken to clean the data, based on the `clean_data.sql` file:

### 1. **Identifying Duplicate Pairs for Country & Year**
   - **Purpose**: The query was used to identify duplicate records for each `Country` and `Year` combination.
   - **Effect**: By identifying duplicates, we ensured that each `Country` and `Year` pair only appeared once in the dataset, preventing duplicate records from skewing the results in future analysis.

---

### 2. **Identifying Row Numbers for Duplicate Records**
   - **Purpose**: This step assigned row numbers to each duplicate record, allowing us to identify which of the duplicates would be kept and which would be deleted.
   - **Effect**: This step made it easier to isolate the duplicates for removal, helping streamline the data-cleaning process by removing only the unnecessary records.

---

### 3. **Deleting Duplicate Records**
   - **Purpose**: This step removed the duplicate records identified earlier, ensuring only the first occurrence of each duplicate pair was kept and the remaining duplicates were deleted.
   - **Effect**: Removing duplicates ensured that the dataset contained unique records for each `Country` and `Year`, improving data consistency and accuracy for analysis.

---

### 4. **Identifying Blank Records in the Status Column**
   - **Purpose**: This step identified records where the `Status` field (whether a country is "Developed" or "Developing") was blank.
   - **Effect**: By identifying these blank records, we pinpointed missing information that needed to be filled, ensuring completeness in the `Status` field.

---

### 5. **Filling Blank Records in the Status Column**
   - **Purpose**: This step filled the blank `Status` fields by using the existing data for the same country. For countries where the status was known, this information was propagated to records with missing `Status` values.
   - **Effect**: This ensured that all records had consistent `Status` values, improving data quality and allowing for more accurate analysis when comparing countries based on their development status.

---

### 6. **Identifying Blank Records in Life Expectancy**
   - **Purpose**: This step identified records with missing `Life Expectancy` values.
   - **Effect**: It allowed us to identify incomplete records, ensuring the dataset’s integrity when analyzing life expectancy data.

---

### 7. **Filling Blank Life Expectancy Values (Interpolation)**
   - **Purpose**: This step filled missing `Life Expectancy` values by calculating the average life expectancy from the previous and next years for the same country.
   - **Effect**: By interpolating the missing values, we ensured that the dataset was complete, allowing for more accurate trend analysis over time.


### Conclusion
Through these cleaning steps, we ensured that the dataset was accurate, complete, and consistent, providing a solid foundation for meaningful exploratory data analysis.

## Installation
To set up the project locally, follow these steps:
1. Clone the repository:
    ```bash
    git clone https://github.com/your-repository/world-life-expectancy-eda.git
    ```
2. Ensure you have MySQL and MySQL Workbench installed.

## Usage
To use the SQL scripts provided:
1. Open MySQL Workbench and connect to your MySQL server.
2. Import the `WorldLifeExpectancy.csv` data into a MySQL table.
3. Run the provided SQL scripts to perform exploratory data analysis.

Example of importing the data into MySQL:
```sql
LOAD DATA INFILE '/path/to/WorldLifeExpectancy.csv'
INTO TABLE LifeExpectancy
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
