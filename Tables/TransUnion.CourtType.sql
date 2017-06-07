CREATE TABLE [TransUnion].[CourtType] (
  [id] [int] IDENTITY,
  [code] [char](2) NULL,
  [description] [varchar](max) NULL,
  CONSTRAINT [PK_CourtType] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO