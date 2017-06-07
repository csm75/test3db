CREATE TABLE [WebApp].[Appointment] (
  [id] [int] IDENTITY,
  [patient_id] [int] NOT NULL,
  [appt_date] [date] NOT NULL,
  [app_time] [time] NULL,
  [created_at] [datetime] NULL,
  [updated_at] [datetime] NULL,
  CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

ALTER TABLE [WebApp].[Appointment]
  ADD CONSTRAINT [FK_Appointment_Patient] FOREIGN KEY ([patient_id]) REFERENCES [WebApp].[Patient] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
GO