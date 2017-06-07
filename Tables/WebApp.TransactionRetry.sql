CREATE TABLE [WebApp].[TransactionRetry] (
  [id] [int] IDENTITY,
  [transaction_id] [int] NOT NULL,
  [retry_failed] [tinyint] NOT NULL,
  [message] [nvarchar](150) NOT NULL,
  [created_at] [datetime] NULL,
  CONSTRAINT [PK_TransactionRetry] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

ALTER TABLE [WebApp].[TransactionRetry]
  ADD CONSTRAINT [FK_TransactionRetry_Transaction] FOREIGN KEY ([transaction_id]) REFERENCES [WebApp].[Transaction] ([id])
GO