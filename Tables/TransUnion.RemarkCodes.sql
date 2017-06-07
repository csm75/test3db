CREATE TABLE [TransUnion].[RemarkCodes] (
  [id] [int] IDENTITY,
  [code] [char](3) NULL,
  [description] [varchar](max) NULL,
  CONSTRAINT [PK_RemarkCodes] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO