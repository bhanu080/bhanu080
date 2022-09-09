/* Exercise 1*/

/* Exercise 1*/
select p.FirstName,p.LastName,e.JobTitle,h.Rate,AverageRate=avg(h.rate)over()
from Person.Person as p
join HumanResources.Employee as e
on p.BusinessEntityID=e.BusinessEntityID
join HumanResources.EmployeePayHistory as h
on e.BusinessEntityID=h.BusinessEntityID

/* Exercise 2*/
select p.FirstName,p.LastName,e.JobTitle,h.Rate,
AverageRate=avg(h.rate)over(),MaximumRate=max(h.rate)over()
from Person.Person as p
join HumanResources.Employee as e
on p.BusinessEntityID=e.BusinessEntityID
join HumanResources.EmployeePayHistory as h
on e.BusinessEntityID=h.BusinessEntityID

/* Exercise 3*/
select p.FirstName,p.LastName,e.JobTitle,h.Rate,
AverageRate=avg(h.rate)over(),MaximumRate=max(h.rate)over(),
DiffFrromAvg=h.rate-avg(h.rate)over()
from Person.Person as p
join HumanResources.Employee as e
on p.BusinessEntityID=e.BusinessEntityID
join HumanResources.EmployeePayHistory as h
on e.BusinessEntityID=h.BusinessEntityID


/* Exercise 4*/
select p.FirstName,p.LastName,e.JobTitle,h.Rate,
AverageRate=avg(h.rate)over(),MaximumRate=max(h.rate)over(),
DiffFrromAvg=h.rate-avg(h.rate)over(),
PercentofMaxRate=h.rate/max(h.rate)over()*100
from Person.Person as p
join HumanResources.Employee as e
on p.BusinessEntityID=e.BusinessEntityID
join HumanResources.EmployeePayHistory as h
on e.BusinessEntityID=h.BusinessEntityID

/*Exercise 2*/

/* Exercise 1*/

select p.Name as productname,p.ListPrice,s.Name as ProductSubCategory,c.Name as ProductCategory
from Production.Product p
inner join Production.ProductSubcategory s
on p.ProductSubcategoryID=s.ProductSubcategoryID
inner join  Production.ProductCategory c
on s.ProductCategoryID=c.ProductCategoryID


/* Exercise 2*/

select p.Name as productname,
p.ListPrice,s.Name as ProductSubCategory,
c.Name as ProductCategory,
AvgPriceByCategory=Avg(p.ListPrice) over(),
AvgPriceByCategoryAndSubcategory=Avg(p.ListPrice) over(partition by c.Name)
from Production.Product p
inner join Production.ProductSubcategory s
on p.ProductSubcategoryID=s.ProductSubcategoryID
inner join  Production.ProductCategory c
on s.ProductCategoryID=c.ProductCategoryID


/* Exercise 3*/
select p.Name as productname,
p.ListPrice,s.Name as ProductSubCategory,
c.Name as ProductCategory,
AvgPriceByCategory=Avg(p.ListPrice) over(partition by c.Name),
AvgPriceByCategoryAndSubcategory=Avg(p.ListPrice) over(partition by c.Name)
from Production.Product p
inner join Production.ProductSubcategory s
on p.ProductSubcategoryID=s.ProductSubcategoryID
inner join  Production.ProductCategory c
on s.ProductCategoryID=c.ProductCategoryID


/* Exercise 4*/
select p.Name as productname,
p.ListPrice,s.Name as ProductSubCategory,
c.Name as ProductCategory,
AvgPriceByCategory=Avg(p.ListPrice) over(partition by c.Name),
AvgPriceByCategoryAndSubcategory=Avg(p.ListPrice) over(partition by c.Name),
ProductVsCategoryDelta=p.ListPrice-avg(p.ListPrice) over(partition by c.Name)
from Production.Product p
inner join Production.ProductSubcategory s
on p.ProductSubcategoryID=s.ProductSubcategoryID
inner join  Production.ProductCategory c
on s.ProductCategoryID=c.ProductCategoryID
