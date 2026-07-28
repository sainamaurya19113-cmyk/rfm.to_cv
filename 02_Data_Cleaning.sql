USE ProjectRFM;
GO

IF OBJECT_ID('CleanSalesData', 'U') IS NOT NULL 
DROP TABLE CleanSalesData;

SELECT 
    CAST(Invoice AS nvarchar(20)) as InvoiceNo,
    CAST(StockCode AS nvarchar(20)) as StockCode,
    CAST(Description AS nvarchar(100)) as Description,
    CAST(Customer_ID AS nvarchar(20)) as CustomerID,
    CAST(InvoiceDate AS datetime) as InvoiceDate,
    CAST(Quantity AS int) as Quantity,
    CAST(Price AS float) as UnitPrice,
    (CAST(Quantity AS int) * CAST(Price AS float)) as TotalLineValue
INTO CleanSalesData
FROM Online_Retail 
WHERE Customer_ID IS NOT NULL 
  AND Price > 0 
  AND Quantity > 0
  AND Invoice NOT LIKE 'C%'; 
GO

SELECT TOP 100 * FROM CleanSalesData;