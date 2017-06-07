CREATE TABLE [TransUnion].[PublicRecordSource] (
  [id] [int] IDENTITY,
  [code] [char](2) NULL,
  [description] [varchar](max) NULL,
  CONSTRAINT [PK_PublicRecordSource] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO