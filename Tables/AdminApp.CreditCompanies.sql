CREATE TABLE [AdminApp].[CreditCompanies] (
  [id] [int] IDENTITY,
  [full_name] [varchar](max) NULL,
  [created_at] [datetime] NULL,
  [updated_at] [datetime] NULL,
  CONSTRAINT [PK_CreditCompanies] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO