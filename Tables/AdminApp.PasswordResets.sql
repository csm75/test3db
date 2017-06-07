CREATE TABLE [AdminApp].[PasswordResets] (
  [id] [int] IDENTITY,
  [email] [varchar](max) NOT NULL,
  [token] [varchar](max) NOT NULL,
  [created_at] [datetime] NULL,
  CONSTRAINT [PK_PasswordResets] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO