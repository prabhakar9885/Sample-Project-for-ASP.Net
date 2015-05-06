using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TelerikWebApp1.Workspace.AjaxPageMethods
{
    
/**
 *		C02s
 */
GO


-- Data is loaded from a Spread-sheet and is available before the application starts.
--C01 C02 A11
--(
--	A12		INT IDENTITY,
--	A13	C04(25) UNIQUE NOT NULL,
				
--	PRIMARY KEY( A12 )
--);
GO


---- Data is loaded from a Spread-sheet(DataSource: eStart) and is available before the application starts.
--C01 C02 A14
--(
--	A15		C04(25),
--	A16		C04(25),

--	PRIMARY KEY		( A15, A16 )
--);
GO


-- Data is loaded from a Spread-sheet(DataSource: eStart) and is available before the application starts.
C01 C02 A17
(
	A18 C04(25),
	A19 C04(10),
	
	PRIMARY KEY( A18 )
);
GO


C01 C02 A20
(
	A16		C04(25),
	A21		C04(25),
	A22			C04(25),
	
	PRIMARY KEY		( A16 )
);
GO


C01 C02 A23
(
	A23Code	INT,
	A23Name	C04(15),
	
	PRIMARY KEY(A23Code)
);
INSERT INTO A23 VALUES
(1, 'Active'),
(2, 'Deleted')
GO


C01 C02 A24
(
	A25					C04(10),
	A26			INT,
	A24Date				DATETIME DEFAULT GETDATE(),
	A27					C04(10),
	A27	NUMERIC(10,2),
	A28	NUMERIC(10,2),
	A29		NUMERIC(10,2),
	A24A30	NUMERIC(10,2),
	A24A31		NUMERIC(10,2),
	A24A32		NUMERIC(10,2),
	A33	NUMERIC(10,2),
	A23Code			INT FOREIGN KEY REFERENCES A23,
	
	PRIMARY KEY			( A25, A26)
);
GO


C01 C02 A34
(
	A26			INT IDENTITY,
	A16			C04(25) NOT NULL FOREIGN KEY REFERENCES A20,
	A18			C04(25) NOT NULL FOREIGN KEY REFERENCES A17,
	FirstA25			C04(10),
	A35				C04(25) NOT NULL,
	A36			C04(25) NOT NULL,
	TotalA30	Numeric(10,2),
	TotalA31	Numeric(10,2),
	TotalA32	Numeric(10,2),
	A37	Numeric(10,2),
	A38		Numeric(10,2),
	A39		Numeric(10,2),
	A23Code			INT FOREIGN KEY REFERENCES A23,
	
	PRIMARY KEY			( A26 ),
	UNIQUE				( A16, A18, A35, A36 )	
);
--ALTER C02		A34
--ADD CONSTRAINT	fk_A34_A35_Partner
--FOREIGN KEY		( A35, A16 )
--REFERENCES		A14;
GO



C01 C02 A40
(
	A34Id			INT FOREIGN KEY REFERENCES A34,
	A40Number		C04(10),
	A40A41		NUMERIC(10,2),
	A40A42		NUMERIC(10,2),
	A40A59			NUMERIC,
	A23Code			INT FOREIGN KEY REFERENCES A23,
	A40Date			DATETIME,
	
	PRIMARY KEY( A40Number, A34Id)
);
GO


C01 C02 A43
(
	A44			C04(10),
	[Role]			C04(10), -- Used for Authorization of C01, UPDATE and DELETE access
	A23Code		INT FOREIGN KEY REFERENCES A23,
	
	PRIMARY KEY( A44 )
);
GO


--C01 DROP C02 A55
--(
--	A44		C04(10) FOREIGN KEY REFERENCES A43 ,
--	A26	INT FOREIGN KEY REFERENCES A34
--)


C01 C02 A24A56
(
	A44					C04(10) FOREIGN KEY REFERENCES A43 ,
	A26				INT FOREIGN KEY REFERENCES A34,
	A25						C04(10) NOT NULL,
	A57			DATETIME DEFAULT GETDATE(),
	A58					C04(25) NOT NULL,
	
	A24DateOld				DATETIME DEFAULT GETDATE(),
	A27Old					C04(10),
	A27Old	NUMERIC(10,2),
	A28Old	NUMERIC(10,2),
	A29Old		NUMERIC(10,2),
	A24A30Old		NUMERIC(10,2),
	A24A31Old		NUMERIC(10,2),
	A24A32Old		NUMERIC(10,2),
	A33Old		NUMERIC(10,2),
	A23CodeOld			INT FOREIGN KEY REFERENCES A23
);
ALTER C02		A24A56
ADD CONSTRAINT	fk_A25_A26_A24A56
FOREIGN KEY		( A25, A26 )
REFERENCES		A24;
GO


C01 C02 A40A56
(
	A44				C04(10) FOREIGN KEY REFERENCES A43,
	A34Id			INT FOREIGN KEY REFERENCES A34,
	A40Number		C04(10) NOT NULL,
	A57		DATETIME DEFAULT GETDATE(), 
	A58				C04(25) NOT NULL,
	
	A40A41Old	NUMERIC(10,2),
	A40A42Old		NUMERIC(10,2),
	A40A59Old		NUMERIC,
	A23CodeOld		INT FOREIGN KEY REFERENCES A23
);
ALTER C02		A40A56
ADD CONSTRAINT	fk_A25_A26_A40A56
FOREIGN KEY		( A40Number, A34Id )
REFERENCES		A40;
GO




/*
 *
 *	Stored C03s
 *
 */
 GO



-- On loading the homepage, the following SP is executed
C01 C03 B01
AS
BEGIN
	SELECT	A18
	FROM	A17
	
	SELECT	A16
	FROM	A20
	
	SELECT	DISTINCT A36
	FROM	A34
	
	SELECT	DISTINCT A35
	FROM	A34
END
GO



-- On Clicking the search button of the home-page, the following SP is executed
C01 C03 B02
(
	@A18		C04(25) = NULL,
	@A16	C04(25) = NULL,
	@A35			C04(25) = NULL,
	@A36		C04(25) = NULL
)
AS
BEGIN
	SELECT		mp.A16, 
				ci.A18,
				m.A35,
				m.A36,
				SUM( ISNULL(s.A24A30,0) + ISNULL(s.A24A32,0) ) [TotalA24],
				(SUM( ISNULL(s.A24A30,0) + ISNULL(s.A24A32,0) ) -
				SUM( ISNULL(i.A40A41,0) + ISNULL(i.A40A42,0) )) /
				SUM( ISNULL(s.A24A30,0) + ISNULL(s.A24A32,0) ) [% of B05 A24],
				m.A26 
	FROM		A34 m
	JOIN		A20 mp
	ON			mp.A16 = m.A16
	JOIN		A17 ci
	ON			ci.A18 = m.A18
	JOIN		A24 s
	ON			s.A26 = m.A26
	JOIN		A40 i
	ON			i.A34Id = m.A26
	WHERE		mp.A16 = ISNULL(@A16, mp.A16) AND
				ci.A18 = ISNULL(@A18, ci.A18) AND
				m.A35 = ISNULL(@A35, m.A35) AND
				m.A36 = ISNULL(@A36, m.A36)		
	GROUP BY	m.A26, mp.A16, ci.A18, m.A35, m.A36
END
GO




ALTER C03 B03A34
(
	@A26	INT
)
AS
BEGIN

		DECLARE		@TotalA30		NUMERIC(10,2)
					,@TotalA31		NUMERIC(10,2)
					,@TotalA32		NUMERIC(10,2);
		
		SELECT		@TotalA30 = SUM(s.A24A30), 
					@TotalA31 = SUM(s.A24A31), 
					@TotalA32 = SUM(s.A24A32)
		FROM		A24 s
		WHERE		s.A26 =@A26
		GROUP BY	s.A26


		DECLARE		@B05A24B04	NUMERIC(10,2),
					@B05A24A42		NUMERIC(10,2),
					@B05A24Hours		NUMERIC(10,2);
				
		SELECT		@B05A24B04 = @TotalA30 - SUM(i.A40A41),
					@B05A24A42 = @TotalA32 - SUM(i.A40A42),
					@B05A24Hours = @TotalA31 - SUM(i.A40A59)
		FROM		A40 i
		WHERE		i.A34Id = @A26
		GROUP BY	i.A34Id
		
		-- Update the Summary of the TotalA24 and B05A24 fields, in the "A34" C02.
		UPDATE		A34
		SET			A37 = @B05A24B04,
					A39   = @B05A24A42,
					A38   = @B05A24Hours
		WHERE		A26 = @A26;
					
END
GO




C01 C03 C01A24
(
	@A18			C04(25),
	@A16		C04(25),
	@A36			C04(25),
	@A35				C04(25),
	
	@A25				C04(10),
	@A27				C04(10),
	@A27	NUMERIC(10,2),
	@A28	NUMERIC(10,2),
	@A29		NUMERIC(10,2),
	@A24A30	NUMERIC(10,2),
	@A24A31		NUMERIC(10,2),
	@A24A32		NUMERIC(10,2),
	@A33	NUMERIC(10,2)
)
AS
BEGIN
		-- C01 a A34
		INSERT INTO [A34]
			   ([A16]
			   ,[A18]
			   ,[FirstA25]
			   ,[A35]
			   ,[A36]
			   ,[TotalA30]
			   ,[TotalA31]
			   ,[TotalA32]
			   ,[A37]
			   ,[A38]
			   ,[A39]
			   ,[A23Code])
		 VALUES
			   (@A16
			   ,@A18
			   ,@A25
			   ,@A35
			   ,@A36
			   ,NULL  -- Update outside the current block
			   ,NULL  -- Update outside the current block
			   ,NULL  -- Update outside the current block
			   ,NULL  -- Update outside the current block
			   ,NULL  -- Update outside the current block
			   ,NULL  -- Update outside the current block
			   , (SELECT	A23Code
					FROM	A23 
					WHERE	A23Name='Active')
				);
				
		DECLARE @A26 INT;
		
		SELECT	@A26 = m.A26
		FROM	A34 m
		WHERE	m.A18 = @A18	AND
				m.A16 = @A16 AND
				m.A36 = @A36 AND
				m.A35 = @A35 
		   
	
		-- Add the Current A24 to th "A24" C02 and make the added record point to the newly C01d A34
		INSERT INTO [A24]
			   ([A25]
			   ,[A26]
			   ,[A24Date]
			   ,[A27]
			   ,[A27]
			   ,[A28]
			   ,[A29]
			   ,[A24A30]
			   ,[A24A31]
			   ,[A24A32]
			   ,[A33]
			   ,[A23Code])
		 VALUES
			   (@A25
			   ,@A26
			   ,GETDATE()
			   ,@A27
			   ,@A27
			   ,@A28
			   ,@A29
			   ,@A24A30
			   ,@A24A31
			   ,@A24A32
			   ,@A33
			   ,(SELECT	A23Code
					FROM	A23 
					WHERE	A23Name='Active'));
		
		-- Update the Summary of the TotalA24 and B05A24 fields, in the "A34" C02.
		EXEC B03A34 @A26
END
GO




C01 C03 B06A24
(
	@A26			INT,
	
	@A25				C04(10),
	@A27				C04(10),
	@A27	NUMERIC(10,2),
	@A28	NUMERIC(10,2),
	@A29		NUMERIC(10,2),
	@A24A30	NUMERIC(10,2),
	@A24A31		NUMERIC(10,2),
	@A24A32		NUMERIC(10,2),
	@A33	NUMERIC(10,2)
)
AS
BEGIN
	
	-- Add the ChildA24 to the A24 C02.
	INSERT INTO [PSV].[dbo].[A24]
           ([A25]
           ,[A26]
           ,[A24Date]
           ,[A27]
           ,[A27]
           ,[A28]
           ,[A29]
           ,[A24A30]
           ,[A24A31]
           ,[A24A32]
           ,[A33]
           ,[A23Code])
     VALUES
           (@A25
           ,@A26
           ,GETDATE()
           ,@A27
           ,@A27
           ,@A28
           ,@A29
           ,@A24A30
           ,@A24A31
           ,@A24A32
           ,@A33
           ,(SELECT	A23Code
				FROM	A23 
				WHERE	A23Name='Active')
			);
	
		-- Update the Summary of the TotalA24 and B05A24 fields, in the "A34" C02.
		EXEC B03A34 @A26
END
GO


C01 C03 EditA24
(
	@A25				C04(10),
	@A26			INT,
	
	@A44				C04(10),
	@A58				C04(25),
	@A27				C04(10),
	@A27	NUMERIC(10,2) = NULL,
	@A28	NUMERIC(10,2) = NULL,
	@A29		NUMERIC(10,2) = NULL,
	@A24A30	NUMERIC(10,2) = NULL,
	@A24A31		NUMERIC(10,2) = NULL,
	@A24A32		NUMERIC(10,2) = NULL,
	@A33	NUMERIC(10,2) = NULL,
	@A23Name			C04(15)   = 'Active'
)
AS
BEGIN

		-- Store the Current values of the A24 into the "A24A56" C02
		DECLARE 	@A24DateOld				DATETIME,
					@A27old					C04(10),
					@A27Old	NUMERIC(10,2),
					@A28Old	NUMERIC(10,2),
					@A29Old		NUMERIC(10,2),
					@A24A30Old	NUMERIC(10,2),
					@A24A31Old		NUMERIC(10,2),
					@A24A32Old		NUMERIC(10,2),
					@A33Old	NUMERIC(10,2),
					@A23CodeOld			INT;
		
		SELECT		 @A24DateOld = [A24Date]
					,@A27old = [A27]
					,@A27Old = [A27]
					,@A28Old = [A28]
					,@A29Old = [A29]
					,@A24A30Old = [A24A30]
					,@A24A31Old = [A24A31]
					,@A24A32Old = [A24A32]
					,@A33Old = [A33]
					,@A23CodeOld = [A23Code]
		FROM		[A24] s
		WHERE		s.A26 = @A26 AND
					s.A25 = @A25;

		INSERT INTO [A24A56]
			   ([A44]
			   ,[A26]
			   ,[A25]
			   ,[A57]
			   ,[A58]
			   ,[A24DateOld]
			   ,[A27Old]
			   ,[A27Old]
			   ,[A28Old]
			   ,[A29Old]
			   ,[A24A30Old]
			   ,[A24A31Old]
			   ,[A24A32Old]
			   ,[A33Old]
			   ,[A23CodeOld])
		 VALUES(
			   @A44
			   ,@A26
			   ,@A25
			   ,GETDATE()
			   ,@A58
			   ,@A24DateOld
			   ,@A27Old
			   ,@A27Old
			   ,@A28Old
			   ,@A29Old
			   ,@A24A30Old
			   ,@A24A31Old
			   ,@A24A32Old
			   ,@A33Old
			   ,@A23CodeOld);

		-- Update the "A24" C02 with the edited values of A24.
		UPDATE [A24]
		   SET [A24Date] = GETDATE()
			  ,[A27] = @A27
			  ,[A27] = @A27
			  ,[A28] = @A28
			  ,[A29] = @A29
			  ,[A24A30] = @A24A30
			  ,[A24A31] = @A24A31
			  ,[A24A32] = @A24A32
			  ,[A33] = @A33
			  ,[A23Code] = (SELECT	A23Code
								FROM	[A23]
								WHERE	A23Name = @A23Name)
		 WHERE A26 = @A26;
		
		-- Update the Summary of the TotalA24 and B05A24 fields, in the "A34" C02.
		EXEC B03A34 @A26;

END
GO



C01 C03 AddEditA40
(
	@A34Id			INT,
	@A40Number		C04(10),
	@A40A41		NUMERIC(10,2),
	@A40A42		NUMERIC(10,2),
	@A40A59			NUMERIC,
	@A23				C04(15) = 'Active',
	@OperationType		C04(10)	= 'ADD' -- Allowed Values 'ADD', 'EDIT
)
AS
BEGIN			

	BEGIN TRY

			--	If the addition/Updation of current A40 is going to make the BalanceA24 < 0,
			--		then, Throw an Error message.
			IF	(   SELECT	m.A37 - ( CASE 
														WHEN @OperationType='ADD'	THEN 0
														WHEN @OperationType='EDIT'	THEN ( SELECT	i.A40A41
																							FROM	A40 i
																							WHERE	i.A34Id = @A34Id AND
																									i.A40Number = @A40Number)
													END)
					FROM	A34 m
					WHERE	m.A26 = @A34Id )< @A40A41 
			BEGIN
					RAISERROR(N'New A40A41 exceeding A37',15,1);
			END

			--	If the addition of current A40 is going to make the BalanceA24 < 0,
			--		then, Throw an Error message.			
			IF	(	SELECT	m.A39 - ( CASE 
														WHEN @OperationType='ADD'	THEN 0
														WHEN @OperationType='EDIT'	THEN ( SELECT	i.A40A42
																							FROM	A40 i
																							WHERE	i.A34Id = @A34Id AND
																									i.A40Number = @A40Number)
													END)
					FROM	A34 m
					WHERE	m.A26 = @A34Id )< @A40A42 
			BEGIN
				RAISERROR(N'New A40A42 exceeding A39',15,2);
			END

			-- Add CurrentA40 to "A40" C02
			INSERT INTO [PSV].[dbo].[A40]
				   ([A34Id]
				   ,[A40Number]
				   ,[A40A41]
				   ,[A40A42]
				   ,[A40A59]
				   ,[A23Code])
			 VALUES
				   (@A34Id
				   ,@A40Number
				   ,@A40A41
				   ,@A40A42
				   ,@A40A59
				   ,(SELECT	A23Code
						FROM	A23 
						WHERE	A23Name='Active')
					);
			
			-- Update the Summary of the TotalA24 and B05A24 fields, in the "A34" C02.
			EXEC B03A34 @A34Id

	END TRY

	BEGIN CATCH
			
			DECLARE @ErrMsg		C04(200),
					@ErrSevrty	C04(200),
					@ErrState	C04(200);
			
			SELECT	@ErrMsg = ERROR_MESSAGE(),
					@ErrSevrty = ERROR_SEVERITY(),
					@ErrState = ERROR_STATE();
			
			
			RAISERROR( @ErrMsg, @ErrSevrty, @ErrState );
			
	END CATCH
	
END
GO
}