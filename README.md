# Urban-Essential-Stores-Sales-Analysis


## Introduction
This data analysis project focuses on analyzing sales data from the Urban Essential Stores located in different shopping malls in Turkey. The project aims to uncover insights, trends, and key performance indicators to inform business decisions. The dataset includes information on revenue, quantities sold, categories, age, gender, and payment methods. 

## Project Structure
The project is structured as follows:

1. Data Preparation: 
   - Cleaning and preprocessing the dataset to ensure data quality and consistency.
   - formatting issues, and data type conversions.
   - Creating additional columns from exisitng data required for the analysis; spliting the date column into Weekday, Month, Quarter and Year
   - Segmenting the customers into different Age Groups; Youth (18 - 35), Adult (36 - 45), Middle Age (46 - 59), Old (60+)

2. Exploratory Data Analysis:
   - Analyzing time series data for the years 2021 and 2022 to identify patterns and trends.
   - Calculating the percentage change in revenue between 2021 and 2022 to understand the growth or decline in sales.

3. Performance Analysis:
   - Identifying the categories that performed poorly in terms of quantities sold in the first quarter of 2022, specifically those that sold less than   1800 units.
   - Determining the age groups that contributed the highest revenue in the last quarter of 2021, specifically those generating 2.5 million and above.

4. Gender Analysis:
   - Calculating the average revenue per quantity ordered by each gender in January 2023 to understand the purchasing behavior of different genders.

5. Payment Method Analysis:
   - Determining the most preferred payment method by customers for each shopping mall in the third quarter of 2022 to gain insights into customer 
   preferences and optimize payment options.

6. Revenue Dashboard:
   - Creating a visual dashboard to provide an overview of revenue performance over time. Utilizing charts, graphs, and interactive elements to display         revenue trends, year-over-year comparisons, and quarterly revenue distribution. Allowing the management team to explore revenue data based on specific criteria such as categories, age groups, and gender.

## Analysis 
All Analysis was done using SQL. Click here to view the full SQL [Analysis](https://github.com/Ernest-30/Urban-Essential-Stores-Sales-Analysis/blob/main/Urban%20Essential%20Stores%20Analysis.sql)

### Business Task

#### 1. What is the revenue trend in 2021 and 2022?
The total revenue generated between 2021 and 2022 is 62,689,130.81. The highest revenue of 31,372,826.18 was recorded in the year 2022. In terms of quarters, the highest revenue of 15,936,579.55 was recorded in the third quarter. The month of July had the highest revenue of 5,552,023.57. Lastly, Mondays generated the highest revenue of 9,154,566.54. 
   
#### 2. What is the Percentage change in revenue between 2021 and 2022?
The revenue grew by 0.18% in 2022 compared to 2021. This indicates a slight increase in revenue during that period.

#### 3. Which Categories were the least performing in terms of quantities sold in the first Quarter of 2022 (sold less than 1800 units)?
In the first quarter of 2022, the Books category sold a total of 1706 units, while the Technology category sold 1676 units. These were the least performing categories in terms of quantities sold during that period.

#### 4. Which Age Groups contributed the highest revenue in the last Quarter of 2021 (2.5 million and above)? 
In the last quarter of 2021, the youth age group (18-35 years) contributed the highest revenue, surpassing 2.6 million. They were the key contributors to the overall revenue during that period.

#### 5. What is the average revenue per quantity ordered by each Gender in January 2023?
In January 2023, the average revenue per quantity ordered by males was 222.83, while for females it was 225.18. This indicates a slight difference in the average revenue generated per quantity ordered between the two genders during that period.

#### 6. What is the most preferred payment method by customers for each shopping mall in the 3rd quarter of 2022? 
In the third quarter of 2022, the cash payment method was the most preferred payment method for each shopping mall. This suggests that customers in all shopping malls preferred to make their payments in cash during that period.

## Visualization
The Revenue Dashboard was created using Tableau. Click here to view the complete Tableau [Dashboard](https://public.tableau.com/app/profile/ernest.obi/viz/UrbanEssentialStoresRevenueDashboard/Dashboard1)

![image](https://github.com/Ernest-30/Urban-Essential-Stores-Sales-Analysis/assets/123366282/9bd7e01a-f206-46e0-a7d5-698ccb3d5c26)


## Files Included
- `Urban Essentials Stores Sales raw data.csv`: The raw dataset containing sales information.
- `Urban Essential Sales Cleaned Data.xlsx`: The cleaned and preprocessed dataset used for analysis.
- `Urban Essential Stores Analysis.sql`:  The SQL Server script that includes the codes for the data cleaning, exploratory data analysis, and visualizations.
- `README.md`: This file provides an overview of the project, its objectives, and the analysis performed.

## Conclusion

Based on the analysis conducted on the provided data, the following conclusions can be drawn:

1. The revenue in 2022 showed a slight increase of 0.18% compared to 2021, indicating a positive growth trend.

2. Books and Technology were the least performing categories in terms of quantities sold in the first quarter of 2022, suggesting a potential area for improvement or adjustment in the marketing strategy for these categories.

3. The youth age group (18-35) contributed the highest revenue in the last quarter of 2021, indicating their significant purchasing power and potential as a target market.

4. In January 2023, the average revenue per quantity ordered by males was $222.83, while for females it was $225.18, suggesting a relatively similar spending pattern between the genders during that period.

5. Cash payment was the most preferred payment method for each shopping mall in the third quarter of 2022, highlighting the importance of providing cash payment options to cater to customer preferences.

## Recommendation:

Based on the findings, the following recommendations can be made:

1. Focus on strategies to boost sales in the Books and Technology categories, such as targeted marketing campaigns or promotions to attract more customers and increase sales volume.

2. Further explore and cater to the needs and preferences of the youth age group (18-35), as they have shown a higher propensity to contribute to revenue. This could involve tailoring products, services, and marketing efforts to resonate with this specific demographic.

3. Monitor and analyze gender-based purchasing patterns on an ongoing basis to identify potential areas for customization or targeted marketing approaches for different genders.

4. While cash payment remains popular among customers, consider offering additional payment options, such as digital payment methods, to accommodate the changing preferences of customers and provide a seamless payment experience.

By implementing these recommendations, the business can enhance its revenue generation, optimize marketing strategies, and meet customer preferences more effectively.
