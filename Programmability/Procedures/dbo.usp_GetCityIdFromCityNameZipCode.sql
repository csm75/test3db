SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_GetCityIdFromCityNameZipCode]
@CityName VARCHAR(50),
@ZipCode CHAR(6), --> This param is NOT mandatory
@CityID INT OUT

AS
BEGIN
	SET @CityID = 
	(
		SELECT TOP 1 id 
		FROM WebApp.City (NOLOCK)
		WHERE city LIKE @CityName
		AND (zip_code = @ZipCode OR @ZipCode = '') --> This param is NOT mandatory
	)
END
GO