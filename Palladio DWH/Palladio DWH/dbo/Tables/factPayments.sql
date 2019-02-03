CREATE TABLE [dbo].[factPayments]
(
	DateKeyId				INT NOT NULL,
	PaymentTypeId			INT NOT NULL,
	PaymentMethodTypeId		INT NOT NULL,
	PayeeId					INT NOT NULL,
	Amount					MONEY NOT NULL,
	ChequeNumber			VARCHAR(50) NULL
	CONSTRAINT PK_factPayments_Com PRIMARY KEY CLUSTERED(DateKeyId, PaymentTypeId, PaymentMethodTypeId, PayeeId), 
    CONSTRAINT [FK_factPayments_DimDate] FOREIGN KEY (DateKeyId) REFERENCES dimDate(DateKeyId), 
    CONSTRAINT [FK_factPayments_DimPaymentType] FOREIGN KEY (PaymentTypeId) REFERENCES dimPaymentType(PaymentTypeId), 
    CONSTRAINT [FK_factPayments_DimPaymentMethodType] FOREIGN KEY (PaymentMethodTypeId) REFERENCES dimPaymentMethodType(PaymentMethodTypeId), 
    CONSTRAINT [FK_factPayments_DimPayee] FOREIGN KEY (PayeeId) REFERENCES dimPayee(PayeeId)
)
