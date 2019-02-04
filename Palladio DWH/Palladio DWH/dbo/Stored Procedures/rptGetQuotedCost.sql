CREATE PROCEDURE [dbo].[rptGetQuotedCost]
	@paramMain		BIT,
	@paramAgrCst	BIT,
	@paramTDSchr	BIT
AS
BEGIN
	SELECT
		dpt.PaymentType,
		fqc.Amount
	FROM dbo.factQotedCost fqc
	INNER JOIN dbo.dimPaymentType dpt
		ON fqc.PaymentTypeId = dpt.PaymentTypeId	
	WHERE dpt.PaymentType <> CASE WHEN @paramMain = 0
								THEN 'Maintainance Cost'
								ELSE ''
							 END
	AND dpt.PaymentType <> CASE WHEN @paramAgrCst = 0
								THEN 'Agreement Registration'
								ELSE ''
							END
	AND dpt.PaymentType <> CASE WHEN  @paramTDSchr = 0
								THEN 'TDS'
								ELSE ''
							END
END