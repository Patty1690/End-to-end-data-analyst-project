create database stock;


-- 1. What is the average daily return for each stock?
select stock_name, avg(daily_return) as AVG_DAILY_RETURN
from stock
group by stock_name;



-- 2. Which stock is the most volatile?
select stock_name, stdev(daily_return) as Most_Volatile
from stock
group by stock_name;



-- 3. What is the total return for each stock?
select stock_name, sum(daily_return) as Total_Return
from stock
group by stock_name
order by Total_Return desc;


-- 4. Which month has the highest average return?
SELECT TOP 1 month, AVG(daily_return) AS highest_avg_return
FROM stock
GROUP BY month
ORDER BY highest_avg_return DESC;


-- 5. What is the yearly average price trend?
select year, avg([close]) as avg_price_trend
from stock
group by year;


-- 6. Which stock has the highest trading volume?
SELECT stock_name, max(volume)
from stock
group by stock_name;

-- 7. What are the top 5 worst return days?
SELECT TOP 5 date, stock_name, daily_return
FROM stock
ORDER BY daily_return ASC;


-- 8. Compare performance between stocks.
SELECT stock_name, 
       AVG(daily_return) AS Avg_Return, 
       STDEV(daily_return) AS Risk_Volatility
FROM stock
GROUP BY stock_name;



-- 9. Identify any seasonal trends.
select month, sum(daily_return) as seasonal_returns
from stock
group by month;


-- 10. Which stock is best for long-term investment?
SELECT stock_name, 
       SUM(daily_return) AS Cumulative_Return,
       STDEV(daily_return) AS Risk
FROM stock
GROUP BY stock_name
ORDER BY Cumulative_Return DESC;




WITH StockBounds AS (
    -- Find the first and last dates for each stock
    SELECT stock_name, 
           MIN(date) as start_date, 
           MAX(date) as end_date
    FROM stock
    GROUP BY stock_name
)
SELECT sb.stock_name,
       s_start.[close] as Initial_Price,
       s_end.[close] as Current_Price,
       ((s_end.[close] - s_start.[close]) / s_start.[close]) * 100 AS Total_Return_Percent
FROM StockBounds sb
JOIN stock s_start ON sb.stock_name = s_start.stock_name AND sb.start_date = s_start.date
JOIN stock s_end ON sb.stock_name = s_end.stock_name AND sb.end_date = s_end.date;