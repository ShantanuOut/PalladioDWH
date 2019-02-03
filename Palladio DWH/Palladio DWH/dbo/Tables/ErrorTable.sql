CREATE TABLE [dbo].[ErrorTable]
(
	NaturalKey		VARCHAR(100),
	ErrorCode		INT,
	LoadDate		DATE DEFAULT(GETDATE())
)
