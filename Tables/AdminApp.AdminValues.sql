CREATE TABLE [AdminApp].[AdminValues] (
  [id] [int] IDENTITY,
  [key] [varchar](50) NOT NULL,
  [value] [varchar](100) NOT NULL,
  [created_at] [datetime] NULL,
  [updated_at] [datetime] NULL,
  CONSTRAINT [PK_AdminValues] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO