CREATE TABLE [TransUnion].[FinancialClearance] (
  [id] [int] IDENTITY,
  [social_security_number] [int] NULL,
  [dob] [date] NULL,
  [dti] [smallint] NULL,
  [residual_income] [money] NULL,
  [fpl] [smallint] NULL,
  [fpl_model] [varchar](255) NULL,
  [available_credit] [int] NULL,
  [est_household_income] [money] NULL,
  [est_household_income_model] [varchar](255) NULL,
  [est_household_size] [int] NULL,
  [est_household_size_model] [varchar](255) NULL,
  [bankruptcy_indicator] [varchar](50) NULL,
  [bankruptcy_type_id] [int] NULL,
  [bankruptcy_filed_date] [date] NULL,
  [bankruptcy_docket_number] [int] NULL,
  [bankruptcy_type_of_court] [varchar](255) NULL,
  [bankruptcy_court_address] [varchar](255) NULL,
  [determination_accuracy] [varchar](255) NULL,
  [determination_financial_aid] [varchar](255) NULL,
  [determination_collection] [varchar](255) NULL,
  [determination_risk_indicator] [varchar](255) NULL,
  [determination_warnings] [varchar](255) NULL,
  [determination_warnings_alert_code] [varchar](255) NULL,
  [determination_red_flag] [varchar](255) NULL,
  [determination_red_flag_alert_code] [varchar](255) NULL,
  [determination_ssa_deceased] [varchar](255) NULL,
  [determination_ssa_deceased_date] [date] NULL,
  [determination_reported_deceased] [varchar](255) NULL,
  [pull_date] [datetime] NULL,
  [print_image] [varchar](max) NULL,
  [patient_id] [int] NULL,
  [created_at] [datetime] NULL,
  [updated_at] [datetime] NULL,
  CONSTRAINT [PK_FinancialClearance] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [TransUnion].[FinancialClearance]
  ADD CONSTRAINT [FK_FinancialClearance_BankrupcyType] FOREIGN KEY ([bankruptcy_type_id]) REFERENCES [TransUnion].[BankrupcyType] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE [TransUnion].[FinancialClearance]
  ADD CONSTRAINT [FK_FinancialClearance_patient] FOREIGN KEY ([patient_id]) REFERENCES [WebApp].[Patient] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
GO