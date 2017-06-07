CREATE TABLE [WebApp].[PatientCreditTU] (
  [id] [int] IDENTITY,
  [patient_id] [int] NOT NULL,
  [created_at] [datetime] NULL,
  [updated_at] [datetime] NULL,
  CONSTRAINT [PK_PatientCreditTU] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

ALTER TABLE [WebApp].[PatientCreditTU]
  ADD CONSTRAINT [FK_PatientCreditTU_Patient] FOREIGN KEY ([patient_id]) REFERENCES [WebApp].[Patient] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
GO