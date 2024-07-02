# World Life Expectancy Exploratory Data Analysis

## Project Overview
This project involves an exploratory data analysis (EDA) on world life expectancy using MySQL. The objective is to uncover insights and trends in life expectancy across different countries and regions.

## Table of Contents
- [Introduction](#introduction)
- [Dataset](#dataset)
- [Installation](#installation)
- [Usage](#usage)
- [Analysis](#analysis)
- [Results](#results)
- [Conclusion](#conclusion)
- [Contributing](#contributing)
- [License](#license)

## Introduction
Provide a brief introduction to your project, explaining the motivation behind it and the key questions you aim to answer through your analysis.

## Dataset
The dataset used for this analysis is `WorldLifeExpectancy.csv`. It contains data on life expectancy across various countries and regions. Key columns include:
- `Country`: Name of the country.
- `Year`: Year of the recorded data.
- `LifeExpectancy`: Average life expectancy in that year.
- `OtherColumns`: Any other relevant columns in the dataset.

## Installation
To set up the project locally, follow these steps:
1. Clone the repository:
    ```bash
    git clone https://github.com/meetpatel0090/world-life-expectancy-eda.git
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


