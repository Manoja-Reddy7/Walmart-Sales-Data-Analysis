use walmart_db;


SELECT count(*) from walmart;
SELECT 
	payment_method,count(*)
from walmart
GROUP BY payment_method

SELECT  count(distinct branch) from walmart;

select distinct branch from walmart
SELECT MAX(quantity) from walmart;

-- Business Problems 

-- 1. FIND Different payment method and number of transactions ,number of quantity sold

Select 
	payment_method,
	count(invoice_id) As No_of_Transactions,
	sum(quantity) as Total_Quantity
FROM walmart
Group by payment_method

-- 2. Identify the highest-rated category in each branch, display the branch,category
SELECT * FROM (
SELECT 
	branch,
    category,
	avg(rating) as avg_rating,
    rank() over(partition by branch order by branch , avg(rating) DESC) as rnk
from walmart
group by branch,category
) as ranked
WHERE rnk = 1

-- 3. Identify the busiest day for each branch based on the number of transactions

SELECT * FROM (
SELECT 
  branch ,
  DAYNAME(STR_TO_DATE(`date`, '%d/%m/%y')) AS day_name,
  count(*) as Total_transactions,
  RANK() over(partition by branch order by count(*) DESC ) as rnk
FROM walmart
Group by  branch,DAYNAME(STR_TO_DATE(`date`, '%d/%m/%y'))
) as ranked
WHERE rnk =1

-- 4. Calculate the total quantity of items sold per payment method, list payment method and quantity.

select payment_method,sum(quantity) As Total_quantity
from walmart
group by payment_method;

-- 5. Determine the average ,minimum,and maximum rating of category for each city 
SELECT * from walmart;  
SELECT 
	city,
	category,
	min(rating) as min_rating,
	MAX(rating) as max_rating,
    AVG(rating) as avg_rating
from walmart
GROUP BY city,category 

-- 6. Calculate the total profit for each category by considering total profit as (unit_price*quantity*profit_margin). 
-- List category and total_profit,ordered from highest to lowest profit.
SELECT 
  category,
  round(SUM(total_price *  profit_margin),2) AS total_profit
FROM walmart
GROUP BY category
ORDER BY total_profit DESC;

-- 7. Determine the most common payment_method for each branch.Display the branch and the preffered payment method
SELECT * from (
SELECT branch,
	payment_method,
	count(*) total_transaction,
    RANK() OVER(partition by branch order by count(*) DESC ) as rnk
from walmart
group by branch,payment_method
) as ranked
WHERE rnk =1

SELECT * from walmart
    
-- 8. Categorize sales into 3 groups MORNING,AFTERNOON,EVENING
-- Find out each of the shift and number of invoices
SELECT 
	branch,
  CASE 
    WHEN HOUR(`time`) < 12 THEN 'Morning'
    WHEN HOUR(`time`)  BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
  END AS Day_time,
  COUNT(*) AS invoice_count
FROM walmart
GROUP BY 
  branch,
 Day_time
 order by branch,count(*) DESC

-- 9. Identify 5 Branch with highest decrese ratio in revenue compare to last year (current year: 2023,last year:2022)

SELECT *,
EXTRACT(Year FROM STR_TO_DATE(date, '%d/%m/%y')) As formated_date
FROM Walmart;


-- 2022 sales
WITH revenue_2022 AS(
SELECT 
	Branch,
    sum(total_price) as Revenue
FROM Walmart
where EXTRACT(Year FROM STR_TO_DATE(date, '%d/%m/%y')) = 2022
group by Branch
),
revenue_2023
AS(
SELECT 
	Branch,
    sum(total_price) as Revenue
FROM Walmart
where EXTRACT(Year FROM STR_TO_DATE(date, '%d/%m/%y')) = 2023
group by Branch
)
SELECT 
ls.branch,
ls.revenue as last_year_revenue,
cs.revenue as current_year_revenue,
round((ls.revenue - cs.revenue)/ls.revenue * 100 ,2)As Decrease_ratio
FROM
revenue_2022 as ls
JOIN revenue_2023 as cs
on ls.branch = cs.branch
WHERE ls.revenue > cs.revenue
order by Decrease_ratio DESC
LIMIT 5