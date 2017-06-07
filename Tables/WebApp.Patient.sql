CREATE TABLE [WebApp].[Patient] (
  [id] [int] IDENTITY,
  [code] [varchar](50) NOT NULL,
  [first_name] [varchar](50) NULL,
  [last_name] [varchar](50) NULL,
  [middle_name] [varchar](50) NULL,
  [age] [tinyint] NULL,
  [dob] [date] NULL,
  [ssn] [char](9) NULL,
  [temp] [varchar](50) NULL,
  [phone] [varchar](50) NULL,
  [email] [varchar](50) NULL,
  [city_id] [int] NULL,
  [gender] [char](1) NULL,
  [practice_id] [int] NULL,
  [insurance_policy] [varchar](50) NULL,
  [trading_partner_id] [varchar](50) NULL,
  [zoho_patient_id] [bigint] NULL,
  [created_at] [datetime] NULL,
  [updated_at] [datetime] NULL,
  [deleted_at] [datetime] NULL,
  [created_by] [int] NOT NULL,
  [updated_by] [int] NOT NULL,
  CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

ALTER TABLE [WebApp].[Patient]
  ADD CONSTRAINT [FK_Patient_City] FOREIGN KEY ([city_id]) REFERENCES [WebApp].[City] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE [WebApp].[Patient]
  ADD CONSTRAINT [FK_Patient_Practice] FOREIGN KEY ([practice_id]) REFERENCES [AdminApp].[Practice] ([id])
GO