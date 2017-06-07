SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[usp_InsertIntoPractice]
    @npi VARCHAR(max),
	@contact_name VARCHAR(max),
	@address VARCHAR(max),
	@city_id INT,
	@phone VARCHAR(20),
	@url VARCHAR(max),
	@operating_hours VARCHAR(max),
	@practice_focus VARCHAR(max),
	@email VARCHAR(max),
	@business_mgr_fname VARCHAR(120),
	@business_mgr_lname VARCHAR(120),
	@practice_name VARCHAR(max),
	@created_by INT,
	@updated_by INT,
	@created_at DATETIME,
	@updated_at DATETIME,
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
BEGIN TRY
INSERT INTO [dbo].[_tmpPractice]
           ([npi]
           ,[contact_name]
           ,[address]
           ,[city_id]
           ,[phone]
           ,[url]
           ,[operating_hours]
           ,[practice_focus]
           ,[email]
           ,[business_mgr_fname]
           ,[business_mgr_lname]
           ,[practice_name]
           ,[created_by]
           ,[updated_by]
           ,[created_at]
           ,[updated_at])
     VALUES
           (@npi,
			@contact_name,
			@address,
			@city_id,
			@phone,
			@url,
			@operating_hours,
			@practice_focus,
			@email,
			@business_mgr_fname,
			@business_mgr_lname,
			@practice_name,
			@created_by,
			@updated_by,
			@created_at,
			@updated_at)
SET @responseMessage='Success!!'
END TRY
BEGIN CATCH
	SET @responseMessage=ERROR_MESSAGE() 
END CATCH
END --proc
GO