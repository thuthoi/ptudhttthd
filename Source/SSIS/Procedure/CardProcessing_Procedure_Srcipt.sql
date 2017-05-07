CREATE PROC [dbo].[USP_TinhToan_LuuDuLieu_BaoCao]
AS 
BEGIN
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

	EXEC USP_Tao_DailyReport @DATE,@MerchantID
	
	EXEC USP_Tao_MonthReport @MerchantID
	
	EXEC USP_Tao_YearReport @MerchantID

END

GO
-- tao daily report
CREATE PROC [dbo].[USP_Tao_DailyReport]
			@Date DATE,
			@MerchantID VARCHAR(10)
AS 
BEGIN
	
	DELETE FROM DailyReport WHERE Date = @Date AND MerchantID = @MerchantID
	
	DECLARE @DebitCardSaleAmount decimal(18, 0)    , @DebitCardSaleCount int, 
	        @MasterCardSaleAmount decimal(18, 0)   , @MasterCardSaleCount int,
	        @VisaCardSaleAmount decimal(18, 0)     , @VisaCardSaleCount int
	        
	SELECT @DebitCardSaleAmount = SUM(tr.Amount), @DebitCardSaleCount = COUNT(tr.MerchantID)
	FROM TransactionDetail tr
	WHERE tr.Complete = 0 
	AND tr.TransactionType = 'Ban Hang'
	AND tr.CreditCardType = 'DEBIT'
	GROUP BY tr.MerchantID,tr.Date
	
	SELECT @MasterCardSaleAmount = SUM(tr.Amount), @MasterCardSaleCount = COUNT(tr.MerchantID)
	FROM TransactionDetail tr
	WHERE tr.Complete = 0 
	AND tr.TransactionType = 'Ban Hang'
	AND tr.CreditCardType = 'MASTER'
	GROUP BY tr.MerchantID,tr.Date
	
	SELECT @VisaCardSaleAmount = SUM(tr.Amount), @VisaCardSaleCount = COUNT(tr.MerchantID)
	FROM TransactionDetail tr
	WHERE tr.Complete = 0 
	AND tr.TransactionType = 'Ban Hang'
	AND tr.CreditCardType = 'VISA'
	GROUP BY tr.MerchantID,tr.Date

	DECLARE @DebitCardReturnAmount decimal(18, 0)    , @DebitCardReturnCount int, 
	        @MasterCardReturnAmount decimal(18, 0)   , @MasterCardReturnCount int,
	        @VisaCardReturnAmount decimal(18, 0)     , @VisaCardReturnCount int
	        
	SELECT @DebitCardReturnAmount = SUM(tr.Amount), @DebitCardReturnCount = COUNT(tr.MerchantID)
	FROM TransactionDetail tr
	WHERE tr.Complete = 0 
	AND tr.TransactionType = 'Tra Hang'
	AND tr.CreditCardType = 'DEBIT'
	GROUP BY tr.MerchantID,tr.Date
	
	SELECT @MasterCardReturnAmount = SUM(tr.Amount), @MasterCardReturnCount = COUNT(tr.MerchantID)
	FROM TransactionDetail tr
	WHERE tr.Complete = 0 
	AND tr.TransactionType = 'Tra Hang'
	AND tr.CreditCardType = 'MASTER'
	GROUP BY tr.MerchantID,tr.Date
	
	SELECT @VisaCardReturnAmount = SUM(tr.Amount), @VisaCardReturnCount = COUNT(tr.MerchantID)
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
	set @NetAmount =  @SaleAmount + @ReturnAmount
	set @NetCount = @SaleCount + @ReturnCount
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
	NetAmount               ,NetCount, Date)
	VALUES (@MerchantID_1, @MerchantTypeID, @MerchantRegionID,
	@SaleAmount              ,@ReturnAmount            ,@SaleCount  ,@ReturnCount,
	@DebitCardSaleAmount     ,@MasterCardSaleAmount    ,@VisaCardSaleAmount,
	@DebitCardReturnAmount   ,@MasterCardReturnAmount  ,@VisaCardReturnAmount,
	@DebitCardSaleCount      ,@MasterCardSaleCount     ,@VisaCardSaleCount       ,
	@DebitCardReturnCount    ,@MasterCardReturnCount   ,@VisaCardReturnCount     ,
	@NetAmount               ,@NetCount, @Date)
	
	
	UPDATE TransactionDetail 
	SET Complete = 1
	WHERE Date= @Date AND MerchantID = @MerchantID

END

GO


-- tao month report

CREATE PROC [dbo].[USP_Tao_MonthReport]
			@MerchantID VARCHAR(10)
AS 
BEGIN
	
	DELETE FROM MonthlyReport WHERE MONTH(DATE) = MONTH(GETDATE()) AND yEAR(DATE) = YEAR(GETDATE()) AND MerchantID = @MerchantID
	
	INSERT INTO MonthlyReport(MerchantID,MerchantTypeID,MerchantRegionID,
	SaleAmount              ,ReturnAmount            ,SaleCount  ,ReturnCount,
	DebitCardSaleAmount     ,MasterCardSaleAmount    ,VisaCardSaleAmount,
	DebitCardReturnAmount   ,MasterCardReturnAmount  ,VisaCardReturnAmount,
	DebitCardSaleCount      ,MasterCardSaleCount     ,VisaCardSaleCount       ,
	DebitCardReturnCount    ,MasterCardReturnCount   ,VisaCardReturnCount     ,
	NetAmount               ,NetCount, Date)
	SELECT MerchantID, MerchantTypeID, MerchantRegionID,
	SUM(SaleAmount)              ,SUM(ReturnAmount)            ,SUM(SaleCount )             ,SUM(ReturnCount),
	SUM(DebitCardSaleAmount )    ,SUM(MasterCardSaleAmount)    ,SUM(VisaCardSaleAmount)     ,
	SUM(DebitCardReturnAmount )  ,SUM(MasterCardReturnAmount)  ,SUM(VisaCardReturnAmount)   ,
	SUM(DebitCardSaleCount   )   ,SUM(MasterCardSaleCount)     ,SUM(VisaCardSaleCount   )   ,
	SUM(DebitCardReturnCount  )  ,SUM(MasterCardReturnCount)   ,SUM(VisaCardReturnCount )   ,
	SUM(NetAmount          )     ,SUM(NetCount), GETDATE()
	FROM DailyReport
	WHERE MONTH(DATE) = MONTH(GETDATE()) 
	AND YEAR(DATE) = YEAR(GETDATE())
	AND MerchantID = @MerchantID
	GROUP BY MerchantID, MerchantTypeID, MerchantRegionID

END

GO

-- tao year report

CREATE PROC [dbo].[USP_Tao_YearReport]
			@MerchantID VARCHAR(10)
AS 
BEGIN
	
	DELETE FROM YearlyReport WHERE yEAR(DATE) = YEAR(GETDATE()) AND MerchantID = @MerchantID
	
	INSERT INTO YearlyReport(MerchantID,MerchantTypeID,MerchantRegionID,
	SaleAmount              ,ReturnAmount            ,SaleCount  ,ReturnCount,
	DebitCardSaleAmount     ,MasterCardSaleAmount    ,VisaCardSaleAmount,
	DebitCardReturnAmount   ,MasterCardReturnAmount  ,VisaCardReturnAmount,
	DebitCardSaleCount      ,MasterCardSaleCount     ,VisaCardSaleCount       ,
	DebitCardReturnCount    ,MasterCardReturnCount   ,VisaCardReturnCount     ,
	NetAmount               ,NetCount, Date)
	SELECT MerchantID, MerchantTypeID, MerchantRegionID,
	SUM(SaleAmount)              ,SUM(ReturnAmount)            ,SUM(SaleCount )             ,SUM(ReturnCount),
	SUM(DebitCardSaleAmount )    ,SUM(MasterCardSaleAmount)    ,SUM(VisaCardSaleAmount)     ,
	SUM(DebitCardReturnAmount )  ,SUM(MasterCardReturnAmount)  ,SUM(VisaCardReturnAmount)   ,
	SUM(DebitCardSaleCount   )   ,SUM(MasterCardSaleCount)     ,SUM(VisaCardSaleCount   )   ,
	SUM(DebitCardReturnCount  )  ,SUM(MasterCardReturnCount)   ,SUM(VisaCardReturnCount )   ,
	SUM(NetAmount          )     ,SUM(NetCount), GETDATE()
	FROM MonthlyReport
	WHERE YEAR(DATE) = YEAR(GETDATE())
	AND MerchantID = @MerchantID
	GROUP BY MerchantID, MerchantTypeID, MerchantRegionID

END

GO