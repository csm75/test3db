CREATE TABLE [TransUnion].[AccountRatingCodes] (
  [id] [int] IDENTITY,
  [code] [char](3) NULL,
  [description] [varchar](max) NULL,
  CONSTRAINT [PK_AccountRatingCodes] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO