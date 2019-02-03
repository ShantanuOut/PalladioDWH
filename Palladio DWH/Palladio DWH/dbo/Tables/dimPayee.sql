CREATE TABLE [dbo].[dimPayee]
(
	PayeeId		INT	IDENTITY NOT NULL,
	PayeeName	VARCHAR(50) NOT NULL,
	PayeeType	VARCHAR(10) NOT NULL,
	CONSTRAINT PK_dimPayee_PayeId PRIMARY KEY CLUSTERED (PayeeId ASC),
	CONSTRAINT UQ_dimPayee_PayeeName UNIQUE (PayeeName ASC),
	CONSTRAINT CK_dimPayee_PayeeType CHECK(PayeeType IN ('Self', 'HFL'))
)
