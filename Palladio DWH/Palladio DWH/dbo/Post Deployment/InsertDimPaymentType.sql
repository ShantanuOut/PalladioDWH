IF NOT EXISTS(SELECT TOP 1 1 FROM dbo.dimPaymentType)
BEGIN
	INSERT INTO dbo.dimPaymentType(PaymentType)
	VALUES ('Agreement Cost'),
			('GST'),
			('Maintainance Cost'),
			('Stamp Duty'),
			('Registration'),
			('Agreement Registration'),
			('TDS')
END