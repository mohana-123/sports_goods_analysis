select *
from dbo.products;

-- ****************************************************************************************
-- ****************************************************************************************

-- Query to Categorize the products based on their price

SELECT
    ProductID,
    ProductName,
    Category,
    Price,
    CASE
        WHEN Price < 50 THEN 'Low'
        WHEN Price BETWEEN 50 AND 200 THEN 'Medium'
        ELSE 'High'
    END AS PriceCategory
FROM dbo.products;