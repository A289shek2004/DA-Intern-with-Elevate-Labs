use salesdb;
select * from superstore;
-- Remove NULLs
SELECT * FROM superstore
WHERE Profit IS NOT NULL AND Sales IS NOT NULL AND Category IS NOT NULL;
-- Profit Margin = (Profit / Sales) * 100
SELECT Category, `Sub-Category`, 
  SUM(Sales) AS Total_Sales,
  SUM(Profit) AS Total_Profit, 
  ROUND(SUM(Profit)/SUM(Sales)*100, 2) AS Profit_Margin
FROM superstore GROUP BY Category, `Sub-Category`
ORDER BY Profit_Margin;

