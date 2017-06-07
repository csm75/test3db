CREATE TABLE [TransUnion].[AccountTypeCodes] (
  [id] [int] IDENTITY,
  [code] [char](2) NULL,
  [description] [varchar](max) NULL,
  CONSTRAINT [PK_AccountTypeCodes] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO