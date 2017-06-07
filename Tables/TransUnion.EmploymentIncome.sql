CREATE TABLE [TransUnion].[EmploymentIncome] (
  [id] [int] IDENTITY,
  [employment_id] [int] NULL,
  [pay_schedule] [varchar](50) NULL,
  [amount] [money] NULL,
  [pay_period_start] [date] NULL,
  [pay_period_end] [date] NULL,
  [tax_year_end] [date] NULL,
  [created_at] [datetime] NULL,
  [updated_at] [datetime] NULL,
  CONSTRAINT [PK_EmploymentIncome] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

ALTER TABLE [TransUnion].[EmploymentIncome]
  ADD CONSTRAINT [FK_EmploymentIncome_Employment] FOREIGN KEY ([employment_id]) REFERENCES [TransUnion].[Employment] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
GO