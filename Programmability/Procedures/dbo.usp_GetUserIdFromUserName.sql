SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_GetUserIdFromUserName]
@UserName VARCHAR(50),
@UserID INT OUT

AS
BEGIN
	SET @UserID = 
	(
		SELECT TOP 1 id 
		FROM AdminApp.[User] (NOLOCK)
		WHERE [user_name] LIKE @UserName
	)
END
GO