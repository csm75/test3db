CREATE TABLE [TransUnion].[RedFlagText] (
  [id] [int] IDENTITY,
  [code] [char](4) NOT NULL,
  [description] [varchar](max) NULL,
  CONSTRAINT [PK_RedFlagText] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO