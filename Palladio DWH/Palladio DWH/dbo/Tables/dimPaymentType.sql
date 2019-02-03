CREATE TABLE [dbo].[dimPaymentType]
(
	PaymentTypeId		INT IDENTITY NOT NULL,
	PaymentType			VARCHAR(100) NOT NULL
	CONSTRAINT PK_dimPaymentType_PaymentTypeId PRIMARY KEY CLUSTERED (PaymentTypeId ASC),
	CONSTRAINT CK_dimPaymentType_PaymentType CHECK (PaymentType IN ('Agreement Cost', 'GST', 'Maintainance Cost', 'Stamp Duty', 'Registration', 'TDS', 'Agreement Registration'))	
)
