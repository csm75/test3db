CREATE TABLE [WebApp].[PatientAddress] (
  [id] [int] IDENTITY,
  [patient_id] [int] NOT NULL,
  [city_id] [int] NOT NULL,
  [address] [varchar](255) NOT NULL,
  [address_extra] [varchar](255) NULL,
  [is_current] [tinyint] NOT NULL DEFAULT (0),
  [created_at] [datetime] NULL,
  [updated_at] [datetime] NULL,
  CONSTRAINT [PK_PatientAddress] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

ALTER TABLE [WebApp].[PatientAddress]
  ADD CONSTRAINT [FK_PatientAddress_City] FOREIGN KEY ([city_id]) REFERENCES [WebApp].[City] ([id])
GO

ALTER TABLE [WebApp].[PatientAddress]
  ADD CONSTRAINT [FK_PatientAddress_Patient] FOREIGN KEY ([patient_id]) REFERENCES [WebApp].[Patient] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
GO