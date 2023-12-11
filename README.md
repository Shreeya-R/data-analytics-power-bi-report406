# Data Analytics Power BI Report
How does a medium-sized international retailer elevate their business intelligence practices? What actionable insights can be obtained from a large dataset that spans across different regions? 

In this project, we will answer these questions and more through the many applications Power BI has to offer.

## Contents
1. [Project Overview](https://github.com/shhrreeyyaa/data-analytics-power-bi-report406#1-project-overview)
2. [Project Journey](https://github.com/shhrreeyyaa/data-analytics-power-bi-report406#2-project-journey)
3. [Installation Instructions](https://github.com/shhrreeyyaa/data-analytics-power-bi-report406#3-installation-instructions)
4. [Usage Instructions](https://github.com/shhrreeyyaa/data-analytics-power-bi-report406#4-usage-instructions)
5. [File Structure of the Project](https://github.com/shhrreeyyaa/data-analytics-power-bi-report406#5-file-structure-of-the-project)
6. [License Information](https://github.com/shhrreeyyaa/data-analytics-power-bi-report406#6-license-information)

## 1. Project Overview
### Aim
To transform the data into actionable inights for better decision-making.In particular, Power Bi will be used to design a comprehensive Quarterly report for a medium-sized international retailer who is keen on elevating their business inteligence practices.

### How is this Aim Achieved?
Through extracting and transforming data from various origins and designing a robust data model rooted in a a star-based schema, a multi-page report has been created. Within this report, a high-level business summary tailored for C-suite executives has been presented. 

In addition, insights have been provided for their highest value customers, which have been segmented by sales region. These provide a detailed analysis of top-performing products categorised by type against their sales targets, and a visually appealing map visual that spotlights the performabce metrics of their retail outlets across different territories.

### What I've Learned

## 2. Project Journey
### Importing the Data
An essential step for every data analysis project is carefully loading and cleaning data to ensure the most relevant an dinformative analysis. Hence, the beginning of this project involved loading in various tables namely; 'Orders', 'Products', 'Stores' and 'Customers'. The tables were loaded and transformed using various Get Data options including Azure SQL Database, CSV file, Azure Blob Storage and a folder.

To ensure that all the data was relevant and of value, the following key transformations were made:
- Any data that compromised privacy was removed eg [Card Number] was removed from 'Orders' table.
- Distinct columns were created via the Split Column feature to separate date and time data types eg [Order Date] and [Shipping Date] columns were each split into the above 2 data types.
- Duplicates, missing and null values were removed from the necessary columns eg duplicates were removed from [Product Code] in the 'Products' table due to each code being unique.
- Calculated columns were created to convert necessary values so that the units are all the same eg conversion of grams to kg in the 'Products' table.
- Columns were combined to provide more informative information eg [First Name] and [Last Name] columns from 'Customers' table were combined to make [Full Name] column.
- All unused columns in tables were removed along with some being renamed in order to align with Power BI naming conventions.

### Creating a Continuous Date Table 
As the data only records the dates specific to certain events taking place, for example when an order is placed or when the shipping date is, there are many dates that remain missing. These missing dates can result in insufficient and misleading insights, especially when there are periods of this missing data. Creating a continuous data table can help eradicate these issues by filling in the gaps.

I used the CALENDAR function to create the date table. Before I could input the start and end dates, I first used the MIN and MAX functions on the [Order Date] and [Shipping Date] from the 'Orders' table respectively. This gave me the year the first order took place and the year the latest shipping took place, which I then used to input the dates for the start and end of the respective years. 

Next, I added the following columns to the date table; [Day of Week], [Month Number], [Month Name], [Quarter], [Year], [Start of Year], [Start of Quarter], [Start of Month], [Start of Week]. Applying the functions of WEEKDAY, MONTH, QUARTER, YEAR, START OF YEAR, START OF QUARTER, START OF MONTH were all used to achieve this along with nesting some of these functions in others such as FORMAT, which allowed the conversion of the month number into the month name.

The DAX formulas for each column has been shown below:

----------------------------------------------------- Table/list of all DAX formulas ----------------------------------------------------

Finally, in Data view I made sure that the newly constructed date table was marked as a date table, as this informs Power BI of my intention to use this table for time intelligence. This is a particularly important step to ensure optimal performance during calculations and guarantees compatibility with all time intelligence functions.

Thus, the continuous date table was created and completed.

### Building a Star Schema Data Model
Relationships between tables are vital in order to understand insights and create visualisations with the data in the future. A star schema model is one such model that highlights and utilises these relationships and this is the type that I will be utilising for this project.

Firstly, the 'fact' table and 'dimension' tables need to be identified. Typically, the 'fact' table contains quantitative and transactional data, whilst the 'dimension' tables store descriptive attributes. Moreover, each 'dimension' table directly connects to the 'fact' table, which creates a star like diagram as the schema suggests. In this case, our 'Orders' table will be out 'fact' table and all other tables will be 'dimension' tables.

All relationships in the below star schema are one-to-many and of single-filter direction, which the many side connected to the 'Orders' table. 
![Star_Schema_Diagram](Star_Schema.png)

Please note that there are 2 relationships between the 'Orders' table and 'Date' table. The actve relationship between these tables is from the [Order Date] to [Date]. 

### Creating Key Measures
Measures provide mathematical and quantitative insights to the data and can be effective to use in the final report.

The descriptions for each of these measures and their correspondind DAX formula are listed below. In some cases, the construction of a calculated column was required before the final measure could be calculated.

- __Total Orders__: Counts the number of orders from the 'Orders' table.
- __Total Revenue__: Sums the revenue of all the products ordered. Required the calculated column [Revenue] from 'Orders' table.
- __Total Profit__: Sums the profit of all the products ordered. Requires the calculated column [Profit] from 'Orders' table.
- __Total Customers__: Counts the number of unique customers in 'Orders' table.
- __Total Quantity__: Sums the quantity of all ordered items from the 'Orders' table.
- __Profit YTD__: Calculates the total profit for each year using the Total Profit measure.
- __Revenue YTD__: Calculates the total revenue for each year using the Total Revenue measure.

### Creating Hierachies
At first glance, the value of creating hierachies can be easily overlooked. However, to perform granular analysis and drill-through the data, hierachies are an absolute must. Insights from visualisations such as line graphs and bar charts can elevated by simply using hierachies. For this project, there are 2 hierachies namely; Date and Geography.

The Date Hierachy was pretty simple as all the necessary levels had already been created in the continuous date tabel section, so all that was required in this step was to choose the levels and order them. The levels for this hierachy are as follows:
- Start of Year
- Start of Quarter
- Start of Month
- Start of Week
- Date

The Geography Hierachy was slightly more complicated to make as it required new calculated columns in the 'Store' table to be created. In particular, the following columns were created:
- __Country__: Utilises the SWITCH function to convert [Country Code] column to teh full country names.
- __Geography__: Combines both the [Country Region] and [Country] columns into a single column using the logical operator '&'.

Before the final step of creating the hierachy could be done, I first ensured that all the necessary columns were correctly assigned a data category; World region as Continent, Country as Country and Country Region as State or Province. Now all that was left was to create the hierachy:
- World Region
- Country
- Country Region

### Report Page - Customer Detail
Now that the relevant data has been organised and sorted, it was time to start concising the data into visualisations in the Report View. The first report page I focussed on was the 'Customer Detail' one, which provides information and visualisations on a customer-level analysis.

The following features and visualisations have been used in this report page:
- Cards
- Summary charts through a donut chart and bar chart.
- Line chart
- Table
- Slicer

#### Cards
Cards provide key numerical information ad insight from the measures we created prior to creating the report age.
![Cards](Cards.mp4)

#### Summary Charts
These charts provide an overview of all the data and display information according to a specific categorical value. Donut charts and bar charts can both be used for corss-filtering and cross-highlighting, which allows the users to interact with the report page and gain furter insights.
![Donut Chart](Donut_chart.mp4)
![Bar Chart](Bar_chart.mp4)

#### Line Chart with Trend Line and Forecast
Line graphs allow us to notice trends and pattenrs within the data. Two particularly uselful features of this visualisation is the trend line and forecasting. Forecasting creates a visual representation of how the line should look in the next x period, here I have selected a period of 10.
![Line Graph](line_graph.mp4)
![Trendlines and Forecast](trendlines_forecast.mp4)

#### Table
It is good to understand the attributes of your top customers, hence I also created a table to display the top 20 customers in the company based on their total revenues.
![Top 20 Table](table.mp4)

#### Final Result
The final 'Customer Detail' report page:
![Customer_Details](Customer_Detail_Report_Page.png)

## 3. Installation Instructions

## 4. Usage Instructions
### Executive Summary

### Customer Detail 
- date slicer
- top customer

### Product Detail

### Stores Map

## 5. File Structure of the Project

## 6. License Information

-------------------------------------- Indicates missing space, make sure to fill in --------------------------------------