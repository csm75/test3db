CREATE TABLE [AdminApp].[UserPasswordHistory] (
  [id] [int] IDENTITY,
  [user_id] [int] NOT NULL,
  [password] [varchar](100) NOT NULL,
  [created_at] [datetime] NULL,
  [updated_at] [datetime] NULL,
  CONSTRAINT [PK_UserPasswordHistory] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

ALTER TABLE [AdminApp].[UserPasswordHistory]
  ADD CONSTRAINT [FK_UserPasswordHistory_User] FOREIGN KEY ([user_id]) REFERENCES [AdminApp].[User] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
GO