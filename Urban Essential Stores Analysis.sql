USE Urban_Essentials

SELECT* 
FROM Stores_Sales

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* Standardizing the date column */

ALTER TABLE Stores_Sales
ADD [Date] date;

UPDATE Stores_Sales
SET [Date] = CAST (invoice_date as date)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* Splitting the Date Column into Day, Month, Quarter and Year */

ALTER TABLE Stores_Sales
ADD [Weekday] nvarchar(255);

UPDATE Stores_Sales
SET [Weekday] = DATENAME(WEEKDAY,[Date])



ALTER TABLE Stores_Sales
ADD [Month] nvarchar(255);

UPDATE Stores_Sales
SET [Month] = DATENAME(MONTH, [Date])



ALTER TABLE Stores_Sales
ADD [Quarter] nvarchar (255);

UPDATE Stores_Sales
SET [Quarter] = CASE 
		WHEN DATEPART(QUARTER,[Date]) = 1 THEN 'Q1' 
		WHEN DATEPART(QUARTER,[Date]) = 2 THEN 'Q2' 
		WHEN DATEPART(QUARTER,[Date]) = 3 THEN 'Q3' 
		WHEN DATEPART(QUARTER,[Date]) = 4 THEN 'Q4' 
		END



ALTER TABLE Stores_Sales
ADD [Year] nvarchar (255);

UPDATE Stores_Sales
SET [Year] = DATEPART(YEAR,[Date])


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* Age Segmentation */

ALTER TABLE Stores_Sales
ADD Age_group nvarchar (255);

UPDATE Stores_Sales
SET Age_group = CASE 
		WHEN age >= 18 AND age <= 35 THEN 'Youth' 
		WHEN age >= 36 AND age <= 45 THEN 'Adult'
		WHEN age >= 46 AND age <= 59 THEN 'Middle_age'
		WHEN age >= 60 THEN 'Old'
		ELSE 'Other'
		END
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
/* Overall Summary */

SELECT	COUNT (invoice_no) AS Total_orders, 
		COUNT (DISTINCT category) AS Number_of_categories,
		COUNT (DISTINCT shopping_mall) AS Number_of_stores,
		SUM (quantity) AS Quantity_Ordered,
		ROUND (SUM (price),0) AS Total_revenue
FROM Stores_Sales

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* What is the combined revenue trend in 2021 and 2022 */

SELECT ROUND(SUM (price),2) AS Total_revenue
FROM Stores_Sales
WHERE [Year] in (2021,2022)

/* The total revenue generated between 2021 and 2022 is 62689130.81 */

SELECT [Year], ROUND(SUM (price),2) AS Total_revenue
FROM Stores_Sales
WHERE [Year] IN (2021,2022)
GROUP BY [Year]
ORDER BY 2 DESC 

/* The highest revenue was recorded in 2022 */

SELECT [Quarter], ROUND(SUM (price),2) AS Total_revenue
FROM Stores_Sales
WHERE [Year] IN (2021,2022)
GROUP BY [Quarter]
ORDER BY 2 DESC

/* The highest revenue was recorded in Q3 */

SELECT [Month], ROUND(SUM (price),2) AS Total_revenue
FROM Stores_Sales
WHERE [Year] IN (2021,2022)
GROUP BY [Month]
ORDER BY 2 DESC

/* July is the month with the highest revenue */

SELECT [Weekday], ROUND(SUM (price),2) AS Total_revenue
FROM Stores_Sales
WHERE [Year] IN (2021,2022)
GROUP BY [Weekday]
ORDER BY 2 DESC

/* Mondays generated the highest revenue */

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* What is the Percentage change in revenue between 2021 and 2022? */

SELECT 
    ROUND((SUM(CASE WHEN [Year] = 2022 THEN price END) - SUM(CASE WHEN [Year] = 2021 THEN price END))/ SUM(CASE WHEN [Year] = 2021 THEN price END) * 100,2) AS Percentage_Change
FROM Stores_Sales

/* Revenue grew by 0.18% in 2022 */

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* Which Categories were the least performing in terms of quantities sold in the first Quarter of 2022 (sold less than 1800 units)? */

SELECT category, SUM(quantity) AS Total_quantities
FROM Stores_Sales
WHERE [Year] = 2022 AND [Quarter] = 'Q1'
GROUP BY category
HAVING SUM(quantity) < 1800

/* Books and Technology were the least selling categories in the first Quarter (January - March) of 2022 */

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Which Age Groups contributed the highest revenue in the last Quarter of 2021 (2.5 million and above)? */

SELECT Age_group, ROUND(SUM(price),0) AS Total_revenue
FROM Stores_Sales
WHERE [Year] = 2021 AND [Quarter] = 'Q4'
GROUP BY Age_group
HAVING SUM(price) >= 2500000

/* The youths (18 - 35) contributed the highest revenue in the last quarter of 2021 with a revenue of over 2.6 million */

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* What is the average revenue per quantity ordered by each Gender in January 2023? */

SELECT gender, ROUND(AVG (price/quantity),2) AS Average_revenue 
FROM Stores_Sales
WHERE [Year] = 2023 AND [Month] = 'January'
GROUP  BY gender

/* The average revenue per quantity ordered by each Gender in January 2023 is 222.83 for Male and 225.18 for Female */

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* What is the most prefered payment method by customers for each shopping mall in the 3rd quarter of 2022? */

SELECT shopping_mall, payment_method, COUNT (customer_id) AS Total_customers
FROM Stores_Sales
WHERE [Year] = 2022 AND [Quarter] = 'Q3'
GROUP  BY shopping_mall, payment_method
HAVING COUNT (customer_id) = (
	SELECT MAX (CustomerCount)
	FROM(	SELECT shopping_mall, COUNT (customer_id) AS CustomerCount
			FROM Stores_Sales
			WHERE [Year] = 2022 AND [Quarter] = 'Q3'
			GROUP BY shopping_mall, payment_method
		) AS T
		WHERE T.shopping_mall = Stores_Sales.shopping_mall
)

/* Cash payment method was the most preferred payment method for each shooping mall in the 3rd Quarter of 2022 */

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Build an overall dashboard for the Management Team */

/* Selecting the data for the Dashboard */

SELECT	customer_id, gender, age, Age_group, category, quantity, price, 
		payment_method, shopping_mall, [Date], [Weekday], [Month], [Quarter], [Year]
FROM Stores_Sales

