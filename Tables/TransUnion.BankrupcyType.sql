CREATE TABLE [TransUnion].[BankrupcyType] (
  [id] [int] IDENTITY,
  [description] [varchar](max) NULL,
  CONSTRAINT [PK_BankrupcyType] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO