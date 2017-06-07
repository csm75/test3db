CREATE TABLE [WebApp].[CreditInfo] (
  [id] [int] IDENTITY,
  [lender_id] [int] NOT NULL,
  [payment_frequency_id] [int] NOT NULL,
  [payment_amount] [money] NOT NULL,
  [date_funded] [datetime] NOT NULL,
  [created_at] [datetime] NULL,
  [updated_at] [datetime] NULL,
  CONSTRAINT [PK_CreditInfo] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

ALTER TABLE [WebApp].[CreditInfo]
  ADD CONSTRAINT [FK_CreditInfo_Lender] FOREIGN KEY ([lender_id]) REFERENCES [WebApp].[Lender] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE [WebApp].[CreditInfo]
  ADD CONSTRAINT [FK_CreditInfo_PaymentFrequency] FOREIGN KEY ([payment_frequency_id]) REFERENCES [WebApp].[PaymentFrequency] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO