IF NOT EXISTS (SELECT TOP 1 1 FROM dbo.factQotedCost)
BEGIN
	INSERT INTO dbo.factQotedCost
	SELECT
		PaymentTypeId,
		CASE PaymentType WHEN 'Agreement Cost'
			 THEN 5643350
			 WHEN 'GST'
			 THEN 338601
			 WHEN 'Maintainance Cost'
			 THEN 125000
			 WHEN 'Stamp Duty'
			 THEN 338700
			 WHEN 'Registration'
			 THEN 30000
			 WHEN 'Agreement Registration'
			 THEN 5000
			 ELSE 0
		END
	FROM dbo.dimPaymentType
END