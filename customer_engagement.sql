select
	*
from dbo.engagement_data

-- ****************************************************************************************
-- ****************************************************************************************

-- cleaning and transforming of columns => ContentType, ViewsCicksCombined
-- 1. ContentType => 4 types
select
	DISTINCT(UPPER(REPLACE(ContentType, 'Socialmedia', 'Social Media')))
from dbo.engagement_data

-- 2. transform ViewsCicksCombined column into 2 columns
select
	ViewsClicksCombined,
	LEFT(ViewsClicksCombined, CHARINDEX('-', ViewsClicksCombined) - 1) as Views,
	RIGHT(ViewsClicksCombined, len(ViewsClicksCombined) - CHARINDEX('-', ViewsClicksCombined)) as Clicks
from dbo.engagement_data

-- 3. Transform EngagementDate column
select
	FORMAT(CONVERT(DATE, EngagementDate), 'dd.MM.yyyy') as EngagementDate
from dbo.engagement_data

-- Final query to clean and normalize the table
select
	EngagementID,
	ContentID,
	CampaignID,
	ProductID,
	UPPER(REPLACE(ContentType, 'Socialmedia', 'Social Media')) as ContentType,
	LEFT(ViewsClicksCombined, CHARINDEX('-', ViewsClicksCombined) - 1) as Views,
	RIGHT(ViewsClicksCombined, len(ViewsClicksCombined) - CHARINDEX('-', ViewsClicksCombined)) as Clicks,
	Likes,
	FORMAT(CONVERT(DATE, EngagementDate), 'dd.MM.yyyy') as EngagementDate
from dbo.engagement_data
where ContentType != 'NEWSLETTER'
