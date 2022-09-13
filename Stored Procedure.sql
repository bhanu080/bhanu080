CREATE TABLE Prodct
(ProdctID INT, ProdctName VARCHAR(100) )
GO
 
CREATE TABLE ProdctDescription
(ProdctID INT, ProdctDescription VARCHAR(800) )
GO
 
INSERT INTO Prodct VALUES (680,'HL Road Frame - Black, 58')
,(706,'HL Road Frame - Red, 58')
,(707,'Sport-100 Helmet, Red')
GO
 
INSERT INTO ProdctDescription VALUES (680,'Replacement mountain wheel for entry-level rider.')
,(706,'Sturdy alloy features a quick-release hub.')
,(707,'Aerodynamic rims for smooth riding.')

select *from Prodct

create Procedure GetProdDescrption as
begin
set nocount on

select p.ProdctID,p.ProdctName,PD.ProductDescrption
from Prodct as p
inner join ProductDescrption PD
on p.ProdctID=PD.ProdctID

end

 Exec sp_rename 'GetProdDescrption' ,'GetProdDe_t2'

 
Exec GetProdDe_t1



create Procedure GetProdDescrption_withparaments
(@PID int)
as
begin
set nocount on


select p.ProductID,p.ProductName,PD.ProductDescription
from Product as p
inner join ProductDescription PD
on p.ProductID=PD.ProductID
where p.ProductID=@PID

End

Exec GetProdDescription_withparaments 706

create Procedure GetProdDescription_withDefaultparam
(@PID int=706)
as
begin
set nocount on

select p.ProductID,p.ProductName,PD.ProductDescription
from Product as p
inner join ProductDescription PD
on p.ProductID=PD.ProductID
where p.ProductID=@PID

End

Exec GetProdDescription_withparaments 680


create table Employee(EmpID int Identity(1,1),EmpName varchar(500))

select * from Employee
 
 create Procedure ins_NewEmp_withoutputparameters
 (@Ename varchar(50),@EId int output)
 as 
 begin
 set nocount on

 insert into Employee(EmpName)values(@Ename)
 select @EId =SCOPE_IDENTITY()


 declare @EmpID int 
 Exec ins_NewEmp_withoutputparameters 'Andrew',@EmpID output

 select @EmpID


 select * from Employee

 create Procedure GetEmployee
 with encryption
 as
 begin
set nocount on

 select EmpID,EmpName
 from Employee

 end
 Exec GetEmployee

 sp_helptext GetEmployee


 /*Local temporary*/

 create Procedure #Temp
 as
 begin
 Print('Local temp Procedure')
 End

 Exec #Temp

  /*global temporary*/

 create Procedure ##Temp1
 as
 begin
 Print('Global temp Procedure')
 End
 Exec ##Temp1

 