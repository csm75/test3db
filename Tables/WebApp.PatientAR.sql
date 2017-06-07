CREATE TABLE [WebApp].[PatientAR] (
  [id] [int] IDENTITY,
  [patient_id] [int] NOT NULL,
  [original_invoice] [money] NOT NULL,
  [funding_source] [varchar](max) NULL,
  [amount_funded] [money] NOT NULL,
  [payment_date] [datetime] NOT NULL,
  [balance] [money] NOT NULL,
  [created_at] [datetime] NULL,
  [updated_at] [datetime] NULL,
  CONSTRAINT [PK_PatientAR] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [WebApp].[PatientAR]
  ADD CONSTRAINT [FK_PatientAR_Patient] FOREIGN KEY ([patient_id]) REFERENCES [WebApp].[Patient] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
GO