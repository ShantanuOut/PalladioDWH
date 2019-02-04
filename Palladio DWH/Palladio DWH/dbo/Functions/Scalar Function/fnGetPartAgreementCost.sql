CREATE FUNCTION [dbo].[fnGetPartAgreementCost]
(
	@percent	INT
)
RETURNS INT
AS
BEGIN
	DECLARE @AgrCost MONEY
	SELECT @AgrCost = Amount
	FROM dbo.factQotedCost fqc
	INNER JOIN dbo.dimPaymentType dpt
		ON fqc.PaymentTypeId = dpt.PaymentTypeId
		AND dpt.PaymentType = 'Agreement Cost'

	RETURN CAST(CEILING((@AgrCost*@percent)/100.0) AS INT)
END
