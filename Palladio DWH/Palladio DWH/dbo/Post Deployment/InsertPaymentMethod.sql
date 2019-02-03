IF NOT EXISTS (SELECT TOP 1 1 FROM dbo.dimPaymentMethodType)
BEGIN
	INSERT INTO dbo.dimPaymentMethodType(PaymentMethod)
	VALUES ('Cash'),
			('Cheque'),
			('NEFT')
END 