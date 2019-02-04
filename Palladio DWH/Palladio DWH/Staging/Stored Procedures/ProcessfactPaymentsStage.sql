CREATE PROCEDURE [STG].[ProcessfactPaymentsStage]
AS
BEGIN
	UPDATE sp
	SET PaymentTypeId = dpt.PaymentTypeId
	FROM STG.StagefactPayments sp
	INNER JOIN dbo.dimPaymentType dpt
		ON TRIM(sp.PaymentType) = TRIM(dpt.PaymentType)

	UPDATE sp
	SET PayeeId = dp.PayeeId
	FROM STG.StagefactPayments sp
	INNER JOIN dbo.dimPayee dp
		ON PATINDEX('%' + TRIM(sp.FinancedBy) + '%', dp.PayeeName) > 0

	UPDATE STG.StagefactPayments
	SET Cheque = NULL,
		DrawnOn = NULL
	WHERE TRIM(Cheque) = ''

	UPDATE sfp
	SET PaymentMethodId = (
							SELECT PaymentMethodTypeId 
							FROM dbo.dimPaymentMethodType dpm
							WHERE dpm.PaymentMethod = CASE WHEN sfp.Cheque IS NULL
														   THEN 'Cash'
														   WHEN LEFT(sfp.Cheque, 1) = 'N'
														   THEN 'NEFT'
														   ELSE 'Cheque'
														END
						 )
	FROM STG.StagefactPayments sfp

	UPDATE sfp
	SET PaymentScheduleId = dps.PaymentScheduleId
	FROM STG.StageFactPayments sfp
	INNER JOIN dbo.dimPaymentSchedule dps
		ON sfp.Schedule = dps.StageCompletion

END