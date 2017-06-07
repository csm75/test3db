CREATE TABLE [AdminApp].[User] (
  [id] [int] IDENTITY,
  [user_name] [varchar](50) NOT NULL,
  [password] [varchar](100) NOT NULL,
  [first_name] [varchar](50) NOT NULL,
  [last_name] [varchar](50) NOT NULL,
  [email] [varchar](100) NOT NULL,
  [phone] [varchar](100) NOT NULL,
  [remember_token] [varchar](100) NOT NULL,
  [role_id] [smallint] NOT NULL,
  [practice_id] [int] NULL,
  [claim_md_allow] [tinyint] NULL DEFAULT (0),
  [created_at] [datetime] NULL,
  [updated_at] [datetime] NULL,
  [deleted_at] [datetime] NULL DEFAULT (NULL),
  CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([id]),
  CONSTRAINT [AdminApp_User_UQ_user_name] UNIQUE ([user_name])
)
ON [PRIMARY]
GO

ALTER TABLE [AdminApp].[User]
  ADD CONSTRAINT [FK_User_Practice] FOREIGN KEY ([practice_id]) REFERENCES [AdminApp].[Practice] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
GO