CREATE TABLE [TransUnion].[InvestigateWarningText] (
  [id] [int] IDENTITY,
  [code] [char](6) NOT NULL,
  [description] [varchar](max) NULL,
  CONSTRAINT [PK_InvestigateWarningText] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO