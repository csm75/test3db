CREATE TABLE [WebApp].[PaymentFrequency] (
  [ID] [int] IDENTITY,
  [Description] [varchar](max) NOT NULL,
  CONSTRAINT [PK_PaymentFrequency] PRIMARY KEY CLUSTERED ([ID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO