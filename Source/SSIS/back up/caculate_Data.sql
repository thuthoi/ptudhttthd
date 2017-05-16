-- tao month report

CREATE PROC [dbo].[USP_Tao_MonthReport]
			@MerchantID VARCHAR(10)
AS 
BEGIN
	
	DELETE FROM MonthlyReport WHERE MONTH(DATE) = MONTH('2016-12-31') AND yEAR(DATE) = YEAR('2016-12-31') AND MerchantID = 'MERCH00001'
	
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
	SUM(NetAmount          )     ,SUM(NetCount), '2016-12-31'
	FROM DailyReport
	WHERE MONTH(DATE) = MONTH('2016-12-31') 
	AND YEAR(DATE) = YEAR('2016-12-31')
	AND MerchantID = 'MERCH00001'
	GROUP BY MerchantID, MerchantTypeID, MerchantRegionID

END

GO

-- tao year report

CREATE PROC [dbo].[USP_Tao_YearReport]
			@MerchantID VARCHAR(10)
AS 
BEGIN
	
	DELETE FROM YearlyReport WHERE yEAR(DATE) = YEAR('2016-12-31') AND MerchantID ='MERCH00001'
	
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
	SUM(NetAmount          )     ,SUM(NetCount),'2016-12-31'
	FROM MonthlyReport
	WHERE YEAR(DATE) = YEAR('2016-12-31')
	AND MerchantID = 'MERCH00001'
	GROUP BY MerchantID, MerchantTypeID, MerchantRegionID

END

GO