ALTER PROC [dbo].[USP_TinhToan_LuuDuLieu_BaoCao]
AS 
BEGIN

	UPDATE TransactionDetail_Temp 
	SET CreditCardID = CONVERT(NVARCHAR(32),HashBytes('MD5', CreditCardID),2)
	
	-- Prevent duplicate data
	DECLARE @Date DATE,@CreditCardID VARCHAR(255), @MerchantID VARCHAR(10)
	SELECT TOP 1 @Date = Date , @MerchantID = MerchantID FROM TransactionDetail_Temp
	DELETE FROM TransactionDetail WHERE Date = @Date AND MerchantID = @MerchantID

	INSERT INTO TransactionDetail (Customer,ProductName,Price,ProductNumber,Amount
	,TransactionType,CreditCardID,CreditCardType,MerchantID,MerchantRegionID,
	MerchantTypeID,Date) 
	SELECT Customer,ProductName,Price,ProductNumber,Amount
	,TransactionType,CreditCardID,CreditCardType,MerchantID,MerchantRegionID,
	MerchantTypeID,Date
	FROM TransactionDetail_Temp	
	
	DECLARE @AgentID VARCHAR(10)
	SELECT @AgentID = AgentID
	FROM Merchant
	WHERE MerchantID = @MerchantID



	EXEC USP_Tao_DailyReport @DATE,@MerchantID,@AgentID
	
	EXEC USP_Tao_MonthReport @MerchantID,@DATE
	
	EXEC USP_Tao_YearReport @MerchantID, @Date

END

GO


-- tao daily report
ALTER PROC [dbo].[USP_Tao_DailyReport]
			@Date DATE,
			@MerchantID VARCHAR(10),
			@AgentID VARCHAR(10)
AS 
BEGIN
	
	DELETE FROM DailyReport WHERE Date = @Date AND MerchantID = @MerchantID
	
	DECLARE @DebitCardSaleAmount decimal(18, 0) = 0   , @DebitCardSaleCount int = 0, 
	        @MasterCardSaleAmount decimal(18, 0) = 0  , @MasterCardSaleCount int = 0,
	        @VisaCardSaleAmount decimal(18, 0) = 0    , @VisaCardSaleCount int = 0
	        
	SELECT @DebitCardSaleAmount = ISNULL(SUM(tr.Amount),0), @DebitCardSaleCount = ISNULL(COUNT(tr.MerchantID),0)
	FROM TransactionDetail tr
	WHERE tr.Complete = 0 
	AND tr.TransactionType = 'Ban Hang'
	AND tr.CreditCardType = 'DEBIT'
	GROUP BY tr.MerchantID,tr.Date
	
	SELECT @MasterCardSaleAmount = ISNULL(SUM(tr.Amount),0), @MasterCardSaleCount = ISNULL(COUNT(tr.MerchantID),0)
	FROM TransactionDetail tr
	WHERE tr.Complete = 0 
	AND tr.TransactionType = 'Ban Hang'
	AND tr.CreditCardType = 'MASTER'
	GROUP BY tr.MerchantID,tr.Date
	
	SELECT @VisaCardSaleAmount = ISNULL(SUM(tr.Amount),0), @VisaCardSaleCount = ISNULL(COUNT(tr.MerchantID),0)
	FROM TransactionDetail tr
	WHERE tr.Complete = 0 
	AND tr.TransactionType = 'Ban Hang'
	AND tr.CreditCardType = 'VISA'
	GROUP BY tr.MerchantID,tr.Date

	DECLARE @DebitCardReturnAmount decimal(18, 0)  = 0  , @DebitCardReturnCount int = 0, 
	        @MasterCardReturnAmount decimal(18, 0) = 0  , @MasterCardReturnCount int = 0,
	        @VisaCardReturnAmount decimal(18, 0)  = 0   , @VisaCardReturnCount int = 0
	        
	SELECT @DebitCardReturnAmount = ISNULL(SUM(tr.Amount),0), @DebitCardReturnCount = ISNULL(COUNT(tr.MerchantID),0)
	FROM TransactionDetail tr
	WHERE tr.Complete = 0 
	AND tr.TransactionType = 'Tra Hang'
	AND tr.CreditCardType = 'DEBIT'
	GROUP BY tr.MerchantID,tr.Date
	
	SELECT @MasterCardReturnAmount = ISNULL(SUM(tr.Amount),0), @MasterCardReturnCount = ISNULL(COUNT(tr.MerchantID),0)
	FROM TransactionDetail tr
	WHERE tr.Complete = 0 
	AND tr.TransactionType = 'Tra Hang'
	AND tr.CreditCardType = 'MASTER'
	GROUP BY tr.MerchantID,tr.Date
	
	SELECT @VisaCardReturnAmount = ISNULL(SUM(tr.Amount),0), @VisaCardReturnCount = ISNULL(COUNT(tr.MerchantID),0)
	FROM TransactionDetail tr
	WHERE tr.Complete = 0 
	AND tr.TransactionType = 'Tra Hang'
	AND tr.CreditCardType = 'VISA'
	GROUP BY tr.MerchantID,tr.Date
	
	DECLARE @SaleAmount decimal(18, 0), @ReturnAmount decimal(18, 0), @SaleCount int, @ReturnCount int
	, @NetAmount decimal(18, 0), @NetCount decimal(18, 0)
	set @SaleAmount = @DebitCardSaleAmount + @MasterCardSaleAmount + @VisaCardSaleAmount
	set @ReturnAmount = @DebitCardReturnAmount + @MasterCardReturnAmount + @VisaCardReturnAmount
	set @SaleCount = @DebitCardSaleCount + @MasterCardSaleCount + @VisaCardSaleCount
	set @ReturnCount = @DebitCardReturnCount + @MasterCardReturnCount + @VisaCardReturnCount
	set @NetAmount =  @SaleAmount - @ReturnAmount
	set @NetCount = @SaleCount - @ReturnCount
	DECLARE @MerchantID_1 varchar(10), @MerchantTypeID varchar(10), @MerchantRegionID varchar(10)
	SELECT  @MerchantID_1 = tr.MerchantID,@MerchantTypeID = tr.MerchantTypeID,@MerchantRegionID = tr.MerchantRegionID
	FROM TransactionDetail tr
	WHERE tr.Complete =0 OR tr.Complete IS NULL -- v.1.1
	GROUP BY tr.MerchantID,tr.Date, tr.MerchantRegionID, tr.MerchantTypeID
	
	
	
	---- Processing DailyReport 
	INSERT INTO DailyReport(MerchantID,MerchantTypeID,MerchantRegionID,
	SaleAmount              ,ReturnAmount            ,SaleCount  ,ReturnCount,
	DebitCardSaleAmount     ,MasterCardSaleAmount    ,VisaCardSaleAmount,
	DebitCardReturnAmount   ,MasterCardReturnAmount  ,VisaCardReturnAmount,
	DebitCardSaleCount      ,MasterCardSaleCount     ,VisaCardSaleCount       ,
	DebitCardReturnCount    ,MasterCardReturnCount   ,VisaCardReturnCount     ,
	NetAmount               ,NetCount, Date,AgentID )
	VALUES (@MerchantID_1, @MerchantTypeID, @MerchantRegionID,
	@SaleAmount              ,@ReturnAmount            ,@SaleCount  ,@ReturnCount,
	@DebitCardSaleAmount     ,@MasterCardSaleAmount    ,@VisaCardSaleAmount,
	@DebitCardReturnAmount   ,@MasterCardReturnAmount  ,@VisaCardReturnAmount,
	@DebitCardSaleCount      ,@MasterCardSaleCount     ,@VisaCardSaleCount       ,
	@DebitCardReturnCount    ,@MasterCardReturnCount   ,@VisaCardReturnCount     ,
	@NetAmount               ,@NetCount, @Date,@AgentID)
	
	
	UPDATE TransactionDetail 
	SET Complete = 1
	WHERE Date= @Date AND MerchantID = @MerchantID

END

GO


-- tao month report

ALTER PROC [dbo].[USP_Tao_MonthReport]
			@MerchantID VARCHAR(10),
			@Date DATE
AS 
BEGIN
	
	DELETE FROM MonthlyReport WHERE MONTH(DATE) = MONTH(@Date) AND yEAR(DATE) = YEAR(@Date) AND MerchantID = @MerchantID
	
	INSERT INTO MonthlyReport(MerchantID,MerchantTypeID,MerchantRegionID,
	SaleAmount              ,ReturnAmount            ,SaleCount  ,ReturnCount,
	DebitCardSaleAmount     ,MasterCardSaleAmount    ,VisaCardSaleAmount,
	DebitCardReturnAmount   ,MasterCardReturnAmount  ,VisaCardReturnAmount,
	DebitCardSaleCount      ,MasterCardSaleCount     ,VisaCardSaleCount       ,
	DebitCardReturnCount    ,MasterCardReturnCount   ,VisaCardReturnCount     ,
	NetAmount               ,NetCount, Date, AgentID)
	SELECT MerchantID, MerchantTypeID, MerchantRegionID,
	SUM(SaleAmount)              ,SUM(ReturnAmount)            ,SUM(SaleCount )             ,SUM(ReturnCount),
	SUM(DebitCardSaleAmount )    ,SUM(MasterCardSaleAmount)    ,SUM(VisaCardSaleAmount)     ,
	SUM(DebitCardReturnAmount )  ,SUM(MasterCardReturnAmount)  ,SUM(VisaCardReturnAmount)   ,
	SUM(DebitCardSaleCount   )   ,SUM(MasterCardSaleCount)     ,SUM(VisaCardSaleCount   )   ,
	SUM(DebitCardReturnCount  )  ,SUM(MasterCardReturnCount)   ,SUM(VisaCardReturnCount )   ,
	SUM(NetAmount          )     ,SUM(NetCount),   DATEADD(month, DATEDIFF(month, 0, @Date), 0), AgentID
	FROM DailyReport
	WHERE MONTH(DATE) = MONTH(@Date) 
	AND YEAR(DATE) = YEAR(@Date)
	AND MerchantID = @MerchantID
	GROUP BY MerchantID, MerchantTypeID, MerchantRegionID, AgentID

END



GO

-- tao year report

ALTER PROC [dbo].[USP_Tao_YearReport]
			@MerchantID VARCHAR(10),
			@Date DATE
AS 
BEGIN
	
	DELETE FROM YearlyReport WHERE YEAR(DATE) = YEAR(@Date) AND MerchantID = @MerchantID
	
	INSERT INTO YearlyReport(MerchantID,MerchantTypeID,MerchantRegionID,
	SaleAmount              ,ReturnAmount            ,SaleCount  ,ReturnCount,
	DebitCardSaleAmount     ,MasterCardSaleAmount    ,VisaCardSaleAmount,
	DebitCardReturnAmount   ,MasterCardReturnAmount  ,VisaCardReturnAmount,
	DebitCardSaleCount      ,MasterCardSaleCount     ,VisaCardSaleCount       ,
	DebitCardReturnCount    ,MasterCardReturnCount   ,VisaCardReturnCount     ,
	NetAmount               ,NetCount, Date, AgentID)
	SELECT MerchantID, MerchantTypeID, MerchantRegionID,
	SUM(SaleAmount)              ,SUM(ReturnAmount)            ,SUM(SaleCount )             ,SUM(ReturnCount),
	SUM(DebitCardSaleAmount )    ,SUM(MasterCardSaleAmount)    ,SUM(VisaCardSaleAmount)     ,
	SUM(DebitCardReturnAmount )  ,SUM(MasterCardReturnAmount)  ,SUM(VisaCardReturnAmount)   ,
	SUM(DebitCardSaleCount   )   ,SUM(MasterCardSaleCount)     ,SUM(VisaCardSaleCount   )   ,
	SUM(DebitCardReturnCount  )  ,SUM(MasterCardReturnCount)   ,SUM(VisaCardReturnCount )   ,
	SUM(NetAmount          )     ,SUM(NetCount),  DATEADD(yy, DATEDIFF(yy, 0, @Date), 0), AgentID
	FROM MonthlyReport
	WHERE YEAR(DATE) = YEAR(@Date)
	AND MerchantID = @MerchantID
	GROUP BY MerchantID, MerchantTypeID, MerchantRegionID, AgentID

	
END



GO

TRUNCATE TABLE MonthlyReport
TRUNCATE TABLE DailyReport
TRUNCATE TABLE YearlyReport
TRUNCATE TABLE TransactionDetail_Temp
TRUNCATE TABLE TransactionDetail
