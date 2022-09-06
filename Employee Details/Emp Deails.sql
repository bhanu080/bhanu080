Create database Employee;

Create TABLE Emp(
Emp_IDNO INT Not NULL,
Emp_FName varchar(30) Not Null,
Emp_LName varchar(30) Not Null,
Emp_Dept INT Not Null
Primary Key(Emp_IDNO),
Unique(Emp_IDNO));

INSERT Into Emp(
Emp_IDNO ,Emp_FName,Emp_Lname,Emp_Dept)
Values(127323,'Michale','Robbin',57),(526689,'Carlos','Snares',63),(843795,'Enric','Dosio',57),(328717,'John','Snares',63),
(444527,'Joseph','Dosni',47),(659831,'Zanifer','Emily',47),(847674,'Kuleswar','Sitaraman',57),(748681,'Henry','Gabriel',47),(555935,'Alex','Manuel',57);

SELECT * from Emp
WHERE Emp_Dept=57;