CREATE TABLE [dbo].[dimPaymentSchedule]
(
	PaymentScheduleId			INT IDENTITY NOT NULL,	
	StageCompletion				VARCHAR(200) NOT NULL,
	PercentageAgrCost			INT NOT NULL,
	Amount						AS dbo.fnGetPartAgreementCost(PercentageAgrCost),
	GST							AS dbo.fnCalculateGST(PercentageAgrCost)
)
