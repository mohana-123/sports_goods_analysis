select
	*
from dbo.products

-- ********************************************************************************************
-- ********************************************************************************************

-- check how many categories are there
select
	distinct(Category)
from dbo.products	-- there is only one category i.e sports

-- Analyse the max and min prices

select
	Min(Price) as minimum_price, -- 26.21
	MAX(Price) as maximum_price -- 485.32
from dbo.products 


-- categorized products based on price

select
	ProductID,
	ProductName,
	Price,
	category,
	CASE
		WHEN Price < 50 THEN 'Low'
		WHEN Price BETWEEN 50 AND 200 THEN 'Medium'
		ELSE 'High'
	END as price_category
from dbo.products