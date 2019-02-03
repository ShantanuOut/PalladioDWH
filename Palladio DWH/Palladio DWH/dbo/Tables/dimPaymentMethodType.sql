CREATE TABLE [dbo].[dimPaymentMethodType]
(
	PaymentMethodTypeId		INT IDENTITY NOT NULL,
	PaymentMethod			VARCHAR(25) NOT NULL,
	CONSTRAINT PK_dimPaymentMethodType_PaymentMethodTypeId PRIMARY KEY CLUSTERED (PaymentMethodTypeId ASC),
	CONSTRAINT CQ_dimPaymentMethodType_PaymentMethod CHECK (PaymentMethod IN ('Cash', 'Cheque', 'NEFT'))
)
