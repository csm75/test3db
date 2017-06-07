CREATE TABLE [WebApp].[City] (
  [id] [int] IDENTITY,
  [zip_code] [char](6) NOT NULL,
  [city] [varchar](50) NOT NULL,
  [state] [char](2) NOT NULL,
  [county] [varchar](50) NOT NULL,
  CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO