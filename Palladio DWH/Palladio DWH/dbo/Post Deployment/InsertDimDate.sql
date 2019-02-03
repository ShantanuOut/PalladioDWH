IF NOT EXISTS(SELECT TOP 1 1 FROM dbo.dimDate)
BEGIN
	DECLARE @date DATE = '2015-01-01'
	WHILE (@date <= '2023-12-31')
	BEGIN
		INSERT INTO dbo.dimDate([DateKeyId], [Date])
		VALUES (TRY_PARSE(CONVERT(varchar, @date, 112) AS INT), @date)

		SET @date = DATEADD(dd, 1, @date)
	END
END