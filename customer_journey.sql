-- select
-- 	*
-- from dbo.customer_journey

-- check any duplicates in primary key JourneyID

-- select
-- 	distinct(JourneyID)
-- from dbo.customer_journey  -- had duplicates

-- query to identity duplicates and tag
with
	duplicate_records
	as
	(
		select
			JourneyID,
			CustomerID,
			ProductID,
			VisitDate,
			Stage,
			Action,
			Duration,
			ROW_NUMBER() over(
	partition by CustomerID, ProductID, VisitDate, Stage, Action order by Duration
	) as row_num
		from dbo.customer_journey
	)

select *
from duplicate_records
where row_num > 1
order by JourneyID


-- clean query

select
	JourneyID,
	CustomerID,
	ProductID,
	VisitDate,
	Stage,
	Action,
	coalesce(Duration, avg_duration) as Duration
from (
			select
		JourneyID,
		CustomerID,
		ProductID,
		VisitDate,
		upper(Stage) as Stage,
		Action,
		Duration,
		AVG(Duration) over(partition by VisitDate) as avg_duration,
		ROW_NUMBER() over(
				partition by CustomerID, ProductID, VisitDate, Stage, Action order by Duration
				) as row_num
	from dbo.customer_journey
) as subquery
where row_num = 1
