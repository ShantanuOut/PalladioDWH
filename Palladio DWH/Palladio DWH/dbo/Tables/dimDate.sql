CREATE TABLE [dbo].[dimDate]
(
	DateKeyId		INT NOT NULL,
	[Date]			DATE  NOT NULL,
	[Month]			AS MONTH([Date]) PERSISTED,
	[Day]			AS DAY([Date]) PERSISTED,
	[Year]			AS YEAR([Date]) PERSISTED,
	[DayName]		AS DATENAME(WEEKDAY, [Date]),
	[MonthName]		AS DATENAME(MONTH, [Date]),
	[Week]			AS DATENAME(WEEK, [Date]),
	CONSTRAINT PK_Date_DateId PRIMARY KEY CLUSTERED (DateKeyId ASC),
	CONSTRAINT UQ_Date_Date	  UNIQUE ([Date] ASC)
)
