﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE TRIGGER [ApexSQL_SourceControl_DDLTrigger] ON DATABASE 
FOR 
DDL_ASSEMBLY_EVENTS, 
DDL_APPLICATION_ROLE_EVENTS, 
DDL_ASYMMETRIC_KEY_EVENTS, 
DDL_CERTIFICATE_EVENTS,
DDL_ROLE_EVENTS, 
DDL_SCHEMA_EVENTS, 
DDL_SYMMETRIC_KEY_EVENTS, 
DDL_USER_EVENTS, 
DDL_DEFAULT_EVENTS, 
DDL_EVENT_NOTIFICATION_EVENTS,
DDL_FULLTEXT_CATALOG_EVENTS, 
DDL_FULLTEXT_STOPLIST_EVENTS, 
DDL_FUNCTION_EVENTS, 
DDL_PARTITION_EVENTS, 
DDL_PROCEDURE_EVENTS,
DDL_RULE_EVENTS,
DDL_SEARCH_PROPERTY_LIST_EVENTS, 
DDL_SEQUENCE_EVENTS,  
DDL_CONTRACT_EVENTS, 
DDL_MESSAGE_TYPE_EVENTS, 
DDL_QUEUE_EVENTS, 
DDL_REMOTE_SERVICE_BINDING_EVENTS, 
DDL_ROUTE_EVENTS, 
DDL_SERVICE_EVENTS, 
DDL_SYNONYM_EVENTS, 
DDL_TABLE_EVENTS, 
DDL_VIEW_EVENTS, 
DDL_TRIGGER_EVENTS, 
DDL_TYPE_EVENTS,
DDL_XML_SCHEMA_COLLECTION_EVENTS,
DDL_EXTENDED_PROPERTY_EVENTS,
DDL_INDEX_EVENTS,
RENAME -- Applies to sp_rename and also renaming of columns
AS 
BEGIN
    SET NOCOUNT ON;

    DECLARE @data XML;
    DECLARE @schema sysname;
    DECLARE @object sysname;
    DECLARE @eventType sysname;
    DECLARE @parentObjectName nvarchar(255);
    DECLARE @parentObjectType nvarchar(255);
    DECLARE @newObjectName nvarchar(255);
    DECLARE @objectID nvarchar(max);
    DECLARE @objectType nvarchar(50);

    SET @data = EVENTDATA();
    SET @eventType = @data.value('(/EVENT_INSTANCE/EventType)[1]', 'sysname');
    SET @schema = @data.value('(/EVENT_INSTANCE/SchemaName)[1]', 'sysname');
    SET @object = @data.value('(/EVENT_INSTANCE/ObjectName)[1]', 'sysname') 
    SET @parentObjectName = @data.value('(/EVENT_INSTANCE/TargetObjectName)[1]', 'nvarchar(255)');
    SET @parentObjectType = @data.value('(/EVENT_INSTANCE/TargetObjectType)[1]', 'nvarchar(255)');
    SET @newObjectName = @data.value('(/EVENT_INSTANCE/NewObjectName)[1]', 'nvarchar(255)');
    SET @objectType = @data.value('(/EVENT_INSTANCE/ObjectType)[1]', 'nvarchar(50)');

    IF(@eventType = 'RENAME' AND @data.value('(/EVENT_INSTANCE/ObjectType)[1]', 'nvarchar(50)') = 'COLUMN') 
				SET @objectID = (@data.value('(/EVENT_INSTANCE/DatabaseName)[1]', 'varchar(256)') + '.' +
				CONVERT(sysname, @schema) + '.' + 
				CONVERT(sysname, @parentObjectName));
    ELSE IF(@eventType = 'RENAME') 
				SET @objectID = (@data.value('(/EVENT_INSTANCE/DatabaseName)[1]', 'varchar(256)') + '.' +
				CONVERT(sysname, @schema) + '.' + 
				CONVERT(sysname, @newObjectName));
    ELSE SET @objectID = (@data.value('(/EVENT_INSTANCE/DatabaseName)[1]', 'varchar(256)') + '.' +
				CONVERT(sysname, @schema) + '.' + 
				CONVERT(sysname, @object));

    IF @object IS NOT NULL
        PRINT '  ' + @eventType + ' - ' + @schema + '.' + @object;
    ELSE
        PRINT '  ' + @eventType + ' - ' + @schema;

    IF @eventType IS NULL
        PRINT CONVERT(nvarchar(max), @data);

    DECLARE @objectTempID int;
    SET @objectTempID = OBJECT_ID(@objectID);

    IF OBJECT_ID(@objectTempID) IS NULL
    BEGIN    
	   IF @objectType = N'TYPE'
		  SET @objectTempID = (SELECT system_type_id From sys.types WHERE sys.types.name = @object)
	   IF @objectType = N'TRIGGER'
		  SET @objectTempID = (SELECT OBJECT_ID FROM sys.triggers WHERE name = @object)
	   IF @objectType = N'ASSEMBLY'
		  SET @objectTempID = (SELECT sys.assemblies.assembly_id FROM sys.assemblies WHERE [name] = @object)
	   IF @objectType = N'CONTRACT'
		  SET @objectTempID = (SELECT sys.service_contracts.service_contract_id FROM sys.service_contracts WHERE [name] = @object)
	   IF @objectType = N'EVENT NOTIFICATION'
		  SET @objectTempID = (SELECT OBJECT_ID FROM sys.event_notifications WHERE [name] = @object)
	   IF @objectType = N'SERVICE'
		  SET @objectTempID = (SELECT OBJECT_ID from sys.services a inner join sys.service_queues b on a.service_queue_id = b.object_id WHERE b.name = @object)
	   IF @objectType = N'ROUTE'
		  SET @objectTempID = (SELECT sys.routes.route_id FROM sys.routes WHERE [name] = @object)
	   IF @objectType = N'FULLTEXT CATALOG'
		  SET @objectTempID = (SELECT sys.fulltext_catalogs.fulltext_catalog_id FROM sys.fulltext_catalogs WHERE [name] = @object)
	   IF @objectType = N'MESSAGE TYPE'
		  SET @objectTempID = (SELECT sys.service_message_types.message_type_id FROM sys.service_message_types WHERE [name] = @object)
	   IF @objectType = N'PARTITION FUNCTION'
		  SET @objectTempID = (SELECT sys.partition_functions.function_id FROM sys.partition_functions WHERE [name] = @object)
	   IF @objectType = N'PARTITION SCHEME'
		  SET @objectTempID = (SELECT sys.partition_schemes.function_id FROM sys.partition_schemes WHERE [name] = @object)
	   IF @objectType = N'ROLE'
		  SET @objectTempID = (SELECT sys.database_principals.principal_id FROM sys.database_principals WHERE [name] = @object)
	   IF @objectType = N'APPLICATION ROLE'
		  SET @objectTempID = (SELECT sys.database_principals.principal_id FROM sys.database_principals WHERE [name] = @object)
	   IF @objectType = N'SQL USER'
		  SET @objectTempID = (SELECT sys.sysusers.uid FROM sys.sysusers WHERE [name] = @object)
	   IF @objectType = N'REMOTE SERVICE BINDING'
		  SET @objectTempID = (SELECT sys.remote_service_bindings.remote_service_binding_id FROM sys.remote_service_bindings WHERE [name] = @object)
	   IF @objectType = N'SCHEMA'
		  SET @objectTempID = (SELECT a.schema_id FROM sys.schemas a inner join sys.database_principals sysdbp on a.principal_id = sysdbp.principal_id WHERE a.name = @object)
	   IF @objectType = N'SEARCH PROPERTY LIST'
		  SET @objectTempID = (SELECT sys.registered_search_property_lists.property_list_id FROM sys.registered_search_property_lists WHERE [name] = @object)
	   IF @objectType = N'XML SCHEMA COLLECTION'
		  SET @objectTempID = (SELECT sys.xml_schema_collections.xml_collection_id from sys.xml_schema_collections WHERE [name] = @object)
	   IF @objectType = N'FULLTEXT STOPLIST'
		  SET @objectTempID = (SELECT sys.fulltext_stoplists.stoplist_id from sys.fulltext_stoplists WHERE [name] = @object)
    END

    INSERT into [T1].dbo.ApexSQL_SourceControl_DatabaseLog
    VALUES 
        (
		  @objectTempID,
		  GETDATE(), 
		  CONVERT(sysname, SYSTEM_USER), 
		  @eventType, 
		  CONVERT(sysname, @schema), 
		  DB_NAME(),
		  CONVERT(sysname, @object),
		  @objectType,
		  @newObjectName,
		  @parentObjectName,
		  @parentObjectType,
		  @data.value('(/EVENT_INSTANCE/TSQLCommand)[1]', 'nvarchar(max)'), 
		  @data
        );

END;
GO