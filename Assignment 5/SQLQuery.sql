/*Excercise 1*/

select p.Name as productname,p.ListPrice,s.Name as ProductSubCategory,c.Name as ProductCategory
from Production.Product p
inner join Production.ProductSubcategory s
on p.ProductSubcategoryID=s.ProductSubcategoryID
inner join  Production.ProductCategory c
on s.ProductCategoryID=c.ProductCategoryID



/*Excercise 2*/

select p.Name as productname,p.ListPrice,s.Name as ProductSubCategory,c.Name as ProductCategory,
Pricerank=row_number() over(order by p.ListPrice desc)
from Production.Product p
inner join Production.ProductSubcategory s
on p.ProductSubcategoryID=s.ProductSubcategoryID
inner join  Production.ProductCategory c
on s.ProductCategoryID=c.ProductCategoryID


/*Excercise 3*/

select p.Name as productname,p.ListPrice,s.Name as ProductSubCategory,c.Name as ProductCategory,
Pricerank=row_number() over(order by p.ListPrice desc),
CategoryPriceRank=row_number() over(Partition by c.Name order by  p.ListPrice desc) 
from Production.Product p
inner join Production.ProductSubcategory s
on p.ProductSubcategoryID=s.ProductSubcategoryID
inner join  Production.ProductCategory c
on s.ProductCategoryID=c.ProductCategoryID


/*Excercise 4*/

select p.Name as productname,p.ListPrice,s.Name as ProductSubCategory,c.Name as ProductCategory,
PriceRank=row_number() over(Partition by p.ListPrice order by c.Name desc),
CategoryPriceRank=rank() over(Partition by c.Name order by p.ListPrice desc),
  CASE
  when rank()over(Partition by c.Name order by p.ListPrice desc)> 5 THEN 'NO'
  else 'YES'
  end as Top5PriceInCategory

from Production.Product p
inner join Production.ProductSubcategory s
on p.ProductSubcategoryID=s.ProductSubcategoryID
inner join  Production.ProductCategory c
on s.ProductCategoryID=c.ProductCategoryID



/*Rank Excercise 1 */

select p.Name as productname,p.ListPrice,s.Name as ProductSubCategory,c.Name as ProductCategory,
CategoryPriceRank= row_number()  over(order by ListPrice desc),
CategoryPriceRankWithRank=rank() over(Partition by c.Name order by p.ListPrice desc)
from Production.Product p
inner join Production.ProductSubcategory s
on p.ProductSubcategoryID=s.ProductSubcategoryID
inner join  Production.ProductCategory c
on s.ProductCategoryID=c.ProductCategoryID
order by p.ListPrice desc,ProductCategory

/*Rank Excercise 2 */


select p.Name as productname,p.ListPrice,s.Name as ProductSubCategory,c.Name as ProductCategory,
CategoryPriceRank=row_number() over(order by p.ListPrice desc),
CategoryPriceRankWithRank=rank() over(Partition by c.Name order by p.ListPrice desc),
CategoryPriceDenseRank=dense_rank() over(Partition by c.Name order by p.ListPrice desc)
from Production.Product p
inner join Production.ProductSubcategory s
on p.ProductSubcategoryID=s.ProductSubcategoryID
inner join  Production.ProductCategory c
on s.ProductCategoryID=c.ProductCategoryID
order by p.ListPrice desc,ProductCategory desc

/*Rank Excercise 3 */

select p.Name as productname,p.ListPrice,s.Name as ProductSubCategory,c.Name as ProductCategory,
CategoryPriceRankWithRank=rank() over(Partition by c.Name order by p.ListPrice desc),
CategoryPriceDenseRank=dense_rank() over(Partition by c.Name order by p.ListPrice desc),
 CASE
  when dense_rank()over(Partition by c.Name order by p.ListPrice desc)> 5 THEN 'NO'
  else 'YES'
  end as Top5PriceInCategory
from Production.Product p
inner join Production.ProductSubcategory s
on p.ProductSubcategoryID=s.ProductSubcategoryID
inner join  Production.ProductCategory c
on s.ProductCategoryID=c.ProductCategoryID

/*Lead-Lag Exercise 1*/

select o.PurchaseOrderID,o.OrderDate,
o.TotalDue,o.VendorID,a.BusinessEntityID,a.Name as VendorName
from Purchasing.PurchaseOrderHeader as o
join Purchasing.Vendor as a
on o.VendorID=a.BusinessEntityID
where OrderDate > '2013-05-23' and TotalDue > $ 500


/*Lead-Lag Exercise 2*/

select o.PurchaseOrderID,o.OrderDate,
o.TotalDue,o.VendorID,a.BusinessEntityID,a.Name as VendorName,
PrevOrderFromVendorAmt=lag(TotalDue,1)over(order by o.VendorID)
from Purchasing.PurchaseOrderHeader as o
join Purchasing.Vendor as a
on o.VendorID=a.BusinessEntityID
where OrderDate > '2013-05-23' and TotalDue > $ 500


/*Lead-Lag Exercise 3*/

select o.PurchaseOrderID,o.OrderDate,
o.TotalDue,o.VendorID,o.EmployeeID,a.BusinessEntityID,a.Name as VendorName,
NextOrderByEmployeeVendor=lead(a.Name,1)over(order by o.EmployeeID)
from Purchasing.PurchaseOrderHeader as o
join Purchasing.Vendor as a
on o.VendorID=a.BusinessEntityID
where OrderDate > '2013-05-23' and TotalDue > $ 500


/*Lead-Lag Exercise 4*/

select o.PurchaseOrderID,o.OrderDate,
o.TotalDue,o.VendorID,o.EmployeeID,a.BusinessEntityID,a.Name as VendorName,
Next2OrderByEmployeeVendor=lead(a.Name,2)over(order by o.EmployeeID)
from Purchasing.PurchaseOrderHeader as o
join Purchasing.Vendor as a
on o.VendorID=a.BusinessEntityID
where OrderDate > '2013-05-23' and TotalDue > $ 500


