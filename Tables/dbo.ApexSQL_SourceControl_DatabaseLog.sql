CREATE TABLE [dbo].[ApexSQL_SourceControl_DatabaseLog] (
  [ID] [int] IDENTITY,
  [ObjectID] [int] NULL,
  [PostTime] [datetime] NULL,
  [DatabaseUser] [nvarchar](50) NULL,
  [Event] [nvarchar](max) NULL,
  [SchemaName] [nvarchar](max) NULL,
  [DatabaseName] [nvarchar](255) NULL,
  [ObjectName] [nvarchar](max) NULL,
  [ObjectType] [nvarchar](50) NULL,
  [NewObjectName] [nvarchar](255) NULL,
  [ParentObjectName] [nvarchar](255) NULL,
  [ParentObjectType] [nvarchar](255) NULL,
  [TSQL] [nvarchar](max) NULL,
  [XmlEvent] [xml] NULL,
  CONSTRAINT [PK_ApexSQL_SourceControl_DatabaseLog] PRIMARY KEY CLUSTERED ([ID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO