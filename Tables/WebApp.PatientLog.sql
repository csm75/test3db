CREATE TABLE [WebApp].[PatientLog] (
  [id] [int] IDENTITY,
  [patient_id] [int] NOT NULL,
  [prequalify] [tinyint] NOT NULL,
  [prequalify_amount] [money] NOT NULL,
  [funding_source] [varchar](max) NULL,
  [created_at] [datetime] NULL,
  [updated_at] [datetime] NULL,
  CONSTRAINT [PK_PatientLog] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [WebApp].[PatientLog]
  ADD CONSTRAINT [FK_PatientLog_Patient] FOREIGN KEY ([patient_id]) REFERENCES [WebApp].[Patient] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
GO