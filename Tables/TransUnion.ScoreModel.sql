CREATE TABLE [TransUnion].[ScoreModel] (
  [id] [int] IDENTITY,
  [financial_clearance_id] [int] NULL,
  [code] [varchar](255) NULL,
  [results] [varchar](255) NULL,
  [derogatory_alert] [tinyint] NULL,
  [file_inquiries_impacted_score] [varchar](255) NULL,
  [created_at] [datetime] NULL,
  [updated_at] [datetime] NULL,
  CONSTRAINT [PK_ScoreModel] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

ALTER TABLE [TransUnion].[ScoreModel]
  ADD CONSTRAINT [FK_ScoreModel_FinancialClearance] FOREIGN KEY ([financial_clearance_id]) REFERENCES [TransUnion].[FinancialClearance] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
GO