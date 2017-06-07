CREATE TABLE [AdminApp].[HealthProviders] (
  [id] [int] IDENTITY,
  [npi] [int] NOT NULL,
  [full_name] [varchar](max) NULL,
  [we_pay_key] [varchar](max) NULL,
  [created_at] [datetime] NULL,
  [updated_at] [datetime] NULL,
  CONSTRAINT [PK_HealthProviders] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IDX_HealthProviders_NPI]
  ON [AdminApp].[HealthProviders] ([npi])
  ON [PRIMARY]
GO