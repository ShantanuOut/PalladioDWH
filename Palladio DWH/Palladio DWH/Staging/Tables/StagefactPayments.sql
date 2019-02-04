CREATE TABLE [STG].[StagefactPayments]
(
	DateId				INT,
	Amount				MONEY,
	PaymentType			VARCHAR(100),
	Cheque				VARCHAR(50),
	DrawnOn				VARCHAR(100),
	FinancedBy			VARCHAR(50),
	Schedule			VARCHAR(200),
	PaymentTypeId		INT,
	PaymentMethodId		INT,
	PayeeId				INT,
	PaymentScheduleId	INT
)
