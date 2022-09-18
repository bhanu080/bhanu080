/*Exercise 1*/

select * from Purchasing.PurchaseOrderHeader

with m_e as
(select PurchaseOrderID,VendorID,OrderDate,TaxAmt,Freight,TotalDue,
most_expensive_rank=row_number()over(partition by VendorID order by TotalDue desc)
from Purchasing.PurchaseOrderHeader)

select PurchaseOrderID,VendorID,OrderDate,TaxAmt,Freight,TotalDue,most_expensive_rank
from m_e
where most_expensive_rank <=3

/*Exercise 2*/
select top(3) TotalDue,PurchaseOrderID,OrderDate,TaxAmt,Freight,
rank=row_number()over(order by TotalDue desc)
from Purchasing.PurchaseOrderHeader
where 3<=
(select max(TotalDue)
from Purchasing.PurchaseOrderHeader)

 /*Scalar Subqueries*/
 /*Exercise 1*/
select
BusinessEntityID,JobTitle,VacationHours ,(
select max(vacationHours) from [AdventureWorks2019].[HumanResources].[Employee])as MaxVacationHours

from [AdventureWorks2019].[HumanResources].[Employee] 

/*using cte*/

with a as(select
BusinessEntityID,JobTitle,VacationHours ,
MaxVacationHours=max(Vacationhours)over(order by Vacationhours desc)
from HumanResources.Employee)
select *from a



/*Exercise 2*/
/*Add a new derived field to your query from Exercise 1,
which returns the percent an individual employees
' vacation hours are, of the maximum vacation hours for any employee'. 
For example, the record for the employee with the most vacation hours should have a value of 1.00, or 100%, in this column.*/

select
BusinessEntityID,JobTitle,VacationHours,
VacationHours*100.00/(select max(VacationHours) from HumanResources.Employee)as 'Percentage'
from HumanResources.Employee 

/*Exercise 3*/
/*Refine your output with a criterion in the WHERE clause that filters
out any employees whose vacation hours are less then 80% of the maximum
amount of vacation hours for any one employee. In other words, return only 
employees who have at least 80% as much vacation time as the employee with the most vacation time. 
Hint: The query should return 60 rows. */

select * from (
Select 
BusinessEntityID,JobTitle,VacationHours ,(
select max(vacationHours) from [AdventureWorks2019].[HumanResources].[Employee])as MaxVacationHours ,
(cast(VacationHours as float)/ cast((select max(vacationHours) from [AdventureWorks2019].[HumanResources].[Employee])as float )) *100
as VacationPercentage
from [AdventureWorks2019].[HumanResources].[Employee] 
) Y
where VacationPercentage > 80

select
BusinessEntityID,JobTitle,VacationHours,
VacationHours*100/(select max(VacationHours) from HumanResources.Employee)as 'Percentage'
from HumanResources.Employee 
where VacationHours > 80


