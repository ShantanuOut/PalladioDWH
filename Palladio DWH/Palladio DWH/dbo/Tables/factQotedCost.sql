CREATE TABLE [dbo].[factQotedCost]
(
	PaymentTypeId		INT NOT NULL,
	Amount				MONEY NOT NULL,
	CONSTRAINT PK_factQuotedCost_PaymentTypeId PRIMARY KEY CLUSTERED (PaymentTypeId ASC),
	CONSTRAINT FK_factQuotedCost_DimPaymentType FOREIGN KEY (PaymentTypeId) REFERENCES dimPaymentType (PaymentTypeId)
)
