CREATE PROCEDURE [dbo].[rptGetSelfPaymentDetails]
	@AgrChrg	BIT,
	@MainChrg	BIT,
	@TDSSep		BIT,
	@SelfPayee	BIT = 1
AS
BEGIN

	SELECT
		d.[Date],
		dp.PayeeType,
		dmt.PaymentMethod,
		CASE WHEN dpt.PaymentType = 'TDS' AND @TDSSep = 0
			 THEN 'TDS - Adjusted to Agreement Cost'
			 WHEN dpt.PaymentType = 'TDS' AND @TDSSep = 1
			 THEN 'Agreement Cost'
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
	WHERE dp.PayeeType = CASE WHEN @SelfPayee = 1
							 THEN 'Self'
							 ELSE 'HFL'
						 END
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