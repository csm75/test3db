CREATE TABLE [WebApp].[Lender] (
  [id] [int] IDENTITY,
  [lender_name] [varchar](max) NOT NULL,
  [created_at] [datetime] NULL,
  [updated_at] [datetime] NULL,
  CONSTRAINT [PK_Lender] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO