-- List all customer names containing "art" (case insensitive)
SELECT customer_name FROM customers
WHERE LOWER(customer_name ) LIKE '%art%';

-- List customers who have placed more than 3 orders
SELECT C.customer_name FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 3;

-- List the top 3 customers who generated the highest total order amount (sum of all their orders).

-- SELECT
-- c.customer_name,
-- SUM(o.amount) AS total_amount
-- FROM customers c
-- JOIN orders o ON c.customer_id = o.customer_id
-- GROUP BY c.customer_id, c.customer_name
-- ORDER BY total_amount DESC
-- LIMIT 3;

-- Using window functions, calculate the month-wise revenue and the cumulative revenue till that month. 
-- (“Cumulative revenue” means the total revenue of the current month plus revenue of all previous months)

WITH MonthlyRevenue AS (
    SELECT
        -- Extract Year and Month for grouping and ordering (syntax may vary by database system)
        EXTRACT(YEAR FROM OrderDate) AS SaleYear,
        EXTRACT(MONTH FROM OrderDate) AS SaleMonth,
        -- Calculate total revenue for each month
        SUM(TotalAmount) AS MonthlyRevenue
    FROM
        Orders
    GROUP BY
        SaleYear,
        SaleMonth
    -- Order the data chronologically within the CTE
    ORDER BY
        SaleYear,
        SaleMonth
)
SELECT
    SaleYear,
    SaleMonth,
    MonthlyRevenue,
    -- Calculate the cumulative revenue using a window function
    SUM(MonthlyRevenue) OVER (ORDER BY SaleYear, SaleMonth) AS CumulativeRevenue
FROM
    MonthlyRevenue
ORDER BY
    SaleYear,
    SaleMonth;



-- List the customers who placed orders during February but had zero orders in March

SELECT c.customer_id, c.customer_name
FROM Customers c
WHERE EXISTS (
    SELECT 1
    FROM Orders o_feb
    WHERE o_feb.customer_id = c.customer_id
    AND MONTH(o_feb.order_date) = 2
    AND YEAR(o_feb.order_date) = 2024 -- Specify the year
)
AND NOT EXISTS (
    SELECT 1
    FROM Orders o_mar
    WHERE o_mar.customer_id = c.customer_id
    AND MONTH(o_mar.order_date) = 3
    AND YEAR(o_mar.order_date) = 2024 -- Specify the year
);


-- List key insights that can be derived from this dataset

-- The provided dataset schema allows for several key business insights to be derived through SQL queries:
-- Customer Demographics and Sales: Analyze which cities generate the most sales revenue or have the most customers. 
-- Top-Selling Products: Identify the most popular products based on quantity sold or total revenue generated.
-- Customer Order Behavior: Track individual customer purchasing history, including order frequency, average order value, and total spending over time.
-- Order Details and Value: Determine the total amount for each order by aggregating the prices and quantities of individual items within the order_items table.
-- Sales Trends: Analyze sales performance over time using the order_date column to identify peak seasons, monthly trends, or year-over-year growth.
-- Customer Segmentation: Segment customers based on their purchasing habits (e.g., high-value customers, frequent buyers) for targeted marketing initiatives. 