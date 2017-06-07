CREATE TABLE [WebApp].[CreditCardInfo] (
  [id] [int] IDENTITY,
  [patient_id] [int] NOT NULL,
  [credit_card_id] [bigint] NOT NULL,
  [state] [varchar](50) NOT NULL,
  [last_four] [nvarchar](50) NOT NULL,
  [created_at] [datetime] NULL,
  [updated_at] [datetime] NULL,
  [created_by] [int] NOT NULL,
  [updated_by] [int] NOT NULL,
  CONSTRAINT [PK_CreditCardInfo] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

ALTER TABLE [WebApp].[CreditCardInfo]
  ADD CONSTRAINT [FK_CreditCardInfo_Patient] FOREIGN KEY ([patient_id]) REFERENCES [WebApp].[Patient] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
GO