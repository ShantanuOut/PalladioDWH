CREATE PROCEDURE [dbo].[rptGetSelfPaymentDetails]
	@AgrChrg	BIT,
	@MainChrg	BIT
AS
BEGIN

	SELECT
		d.[Date],
		dp.PayeeType,
		dmt.PaymentMethod,
		CASE WHEN dpt.PaymentType = 'TDS'
			 THEN 'TDS Adjusted to Agreement Cost'
			 ELSE dpt.PaymentType
		END AS PaymentType,
		dps.StageCompletion,
		fqc.Amount,
		fqc.ChequeNumber,
		fqc.DrawnOn,
		dps.Amount + dps.GST AS [Demand Amount]
	FROM dbo.factPayments fqc
	INNER JOIN dbo.dimPayee dp
		ON fqc.PayeeId = dp.PayeeId
	INNER JOIN dbo.dimPaymentMethodType dmt
		ON fqc.PaymentMethodTypeId = dmt.PaymentMethodTypeId
	INNER JOIN dbo.dimPaymentType dpt
		ON fqc.PaymentTypeId = dpt.PaymentTypeId
	INNER JOIN dbo.dimDate d
		ON d.DateKeyId = fqc.DateKeyId
	INNER JOIN dbo.dimPaymentSchedule dps
		ON dps.PaymentScheduleId = fqc.PaymentScheduleId
	WHERE dp.PayeeType = 'Self'
	AND dpt.PaymentType <> CASE @AgrChrg WHEN 0
										 THEN 'Agreement Registration'
										 ELSE ''
							END
	AND dpt.PaymentType <> CASE @MainChrg WHEN 0
										 THEN 'Maintainance Cost'
										 ELSE ''
							END
	ORDER BY dps.PaymentScheduleId ASC
END