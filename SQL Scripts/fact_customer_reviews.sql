-- select
-- 	*
-- from dbo.customer_reviews

-- ***************************************************************************************
-- ***************************************************************************************

-- Query to clear the white spaces in ReviewText
-- check them if present
select
	ReviewID,
	CustomerID,
	ProductID,
	ReviewDate,
	Rating,
	REPLACE(ReviewText,'   ', ' ') as ReviewText
from dbo.customer_reviews;