CREATE FUNCTION [dbo].[fnCalculateGST]
(
	@Percent	INT
)
RETURNS INT
AS
BEGIN
	DECLARE @GSTRate INT,
			@AgrCost INT

	SELECT @AgrCost = dbo.fnGetPartAgreementCost(@Percent)

	SELECT @GSTRate = PARSE(ControlValue AS INT)
	FROM [dbo].[ControlTotal]
	WHERE IsActive = 1
	AND ControlField = 'GST'

	RETURN ((@AgrCost*@GSTRate)/100.0)
END
