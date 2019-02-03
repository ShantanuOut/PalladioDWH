IF NOT EXISTS(SELECT TOP 1 1 FROM dbo.dimPayee)
BEGIN
	INSERT INTO dbo.dimPayee (PayeeName, PayeeType)
	VALUES ('Baba-Vibhuti-Shantanu', 'Self'),
			('LIC HFL', 'HFL')
END