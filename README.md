# Data Analytics Power BI Report
How does a medium-sized international retailer elevate their business intelligence practices? What actionable insights can be obtained from a large dataset that spans across different regions? 

In this project, we will answer these questions and more through the many applications Power BI has to offer.

## Contents
1. Project Overview
2. Project Journey
3. Installation Instructions
4. Usage Instructions
5. File Structure of the Project
6. License Information

## 1. Project Overview
### Aim
To transform the data into actionable inights for better decision-making.In particular, Power Bi will be used to design a comprehensive Quarterly report for a medium-sized international retailer who is keen on elevating their business inteligence practices.

### How is this Aim Achieved?
Through extracting and transforming data from various origins and designing a robust data model rooted in a a star-based schema, a multi-page report has been created. Within this report, a high-level business summary tailored for C-suite executives has been presented. 

In addition, insights have been provided for their highest value customers, which have been segmented by sales region. These provide a detailed analysis of top-performing products categorised by type against their sales targets, and a visually appealing map visual that spotlights the performabce metrics of their retail outlets across different territories.

### What I've Learned

## 2. Project Journey
## Importing the Data
An essential step for every data analysis project is carefully loading and cleaning data to ensure the most relevant an dinformative analysis. Hence, the beginning of this project involved loading in various tables namely; 'Orders', 'Products', 'Stores' and 'Customers'. The tables were loaded and transformed using various Get Data options including Azure SQL Database, CSV file, Azure Blob Storage and a folder.

To ensure that all the data was relevant and of value, the following key transformations were made:
- Any data that compromised privacy was removed eg [Card Number] was removed from 'Orders' table.
- Distinct columns were created via the Split Column feature to separate date and time data types eg [Order Date] and [Shipping Date] columns were each split into the above 2 data types.
- Duplicates, missing and null values were removed from the necessary columns eg duplicates were removed from [Product Code] in the 'Products' table due to each code being unique.
- Calculated columns were created to convert necessary values so that the units are all the same eg conversion of grams to kg in the 'Products' table.
- Columns were combined to provide more informative information eg [First Name] and [Last Name] columns from 'Customers' table were combined to make [Full Name] column.
- All unused columns in tables were removed along with some being renamed in order to align with Power BI naming conventions.

## 3. Installation Instructions

## 4. Usage Instructions

## 5. File Structure of the Project

## 6. License Information
