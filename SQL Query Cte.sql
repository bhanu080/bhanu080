With Sales as ( 
	SELECT 
	OrderMonth, 
	TotalSales = SUM(TotalDue) 
	FROM ( 
		SELECT  
		   OrderDate 
		  ,OrderMonth = DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) 
		  ,TotalDue 
		  ,OrderRank = ROW_NUMBER() OVER(PARTITION BY DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) ORDER BY TotalDue DESC) 
		FROM AdventureWorks2019.Sales.SalesOrderHeader 
		) s
	WHERE OrderRank > 10 
	GROUP BY OrderMonth 
), Purchase as (
	SELECT 
	OrderMonth, 
	TotalPurchases = SUM(TotalDue) 
	FROM ( 
		SELECT  
		   OrderDate 
		  ,OrderMonth = DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) 
		  ,TotalDue 
		  ,OrderRank = ROW_NUMBER() OVER(PARTITION BY DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) ORDER BY TotalDue DESC) 
		FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader 
		) p
	WHERE OrderRank > 10 
	GROUP BY OrderMonth 
) 
Select Sales.ordermonth,Sales.Totalsales,Purchase.TotalPurchases
from Sales
join Purchase
on Sales.ordermonth = Purchase.ordermonth
order by 1