CREATE TABLE [WebApp].[PatientPaymentHistory] (
  [ID] [int] IDENTITY,
  [PatientID] [int] NOT NULL,
  [PaymentDate] [datetime] NOT NULL,
  [PaymentAmount] [money] NOT NULL,
  [FundingSource] [varchar](max) NULL,
  CONSTRAINT [PK_PatientPaymentHistory] PRIMARY KEY CLUSTERED ([ID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [WebApp].[PatientPaymentHistory]
  ADD CONSTRAINT [FK_PatientPaymentHistory_Patient] FOREIGN KEY ([PatientID]) REFERENCES [WebApp].[Patient] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
GO