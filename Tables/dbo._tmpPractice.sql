CREATE TABLE [dbo].[_tmpPractice] (
  [id] [int] IDENTITY,
  [npi] [varchar](max) NOT NULL,
  [contact_name] [varchar](max) NOT NULL,
  [address] [varchar](max) NOT NULL,
  [city_id] [int] NOT NULL,
  [phone] [varchar](20) NOT NULL,
  [url] [varchar](max) NOT NULL,
  [operating_hours] [varchar](max) NOT NULL,
  [practice_focus] [varchar](max) NOT NULL,
  [email] [varchar](max) NOT NULL,
  [business_mgr_fname] [varchar](120) NOT NULL,
  [business_mgr_lname] [varchar](120) NOT NULL,
  [practice_name] [varchar](max) NOT NULL,
  [created_by] [int] NULL,
  [updated_by] [int] NULL,
  [created_at] [datetime] NULL,
  [updated_at] [datetime] NULL,
  CONSTRAINT [PK__tmpPractice] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO