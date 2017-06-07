CREATE TABLE [WePay].[Account] (
  [id] [int] IDENTITY,
  [access_token] [varchar](255) NULL,
  [account_id] [bigint] NULL,
  [account_state] [varchar](64) NOT NULL,
  [user_id] [bigint] NULL,
  [user_state] [varchar](64) NULL,
  [practice_id] [int] NOT NULL,
  [created_at] [datetime] NULL,
  [updated_at] [datetime] NULL,
  [deleted_at] [datetime] NULL DEFAULT (NULL),
  [created_by] [int] NULL,
  [updated_by] [int] NULL,
  CONSTRAINT [PK_WePayAccount] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

ALTER TABLE [WePay].[Account]
  ADD CONSTRAINT [FK_WePayAccount_Practice] FOREIGN KEY ([practice_id]) REFERENCES [AdminApp].[Practice] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
GO