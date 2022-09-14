CREATE TABLE workrs(
	WORKER_ID int NOT NULL PRIMARY KEY ,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY int,
	JOINING_DATE CHAR(25),
	DEPARTMENT CHAR(25)
);

INSERT INTO workrs 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

CREATE TABLE bonuss(
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT,
	BONUS_DATE char(25),
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Workr(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO bonuss 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
CREATE TABLE Titles (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM CHAR(25),
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Workr(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Titles 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');


 /*Question 1*/
 select distinct w.WORKER_ID,w.FIRST_NAME,w.Salary

 from workrs w,workrs w1
 where w.Salary=w1.Salary and w.WORKER_ID=w1.WORKER_ID

  /*Question 2*/

   select  max(Salary) from workrs
   where Salary not in(select max(Salary)from workrs)
 

 /*Question 3*/

  select  * from workrs
  where WORKER_ID <=(select count(WORKER_ID)/2 from workrs)

  /*Question 4*/
  select department,count(department) as 'Number of Workers' 
  from workrs 
  group by department

   /*Question 5*/
   select department,sum(Salary)
   from workrs
   group by department

    /*Question 6*/
	select FIRST_NAME,Salary from workrs
	where Salary=(select max(Salary) from workrs)

	 /*Question 7*/
	 select * from workrs
	 where WORKER_ID=(Select max(WORKER_ID)from workrs)

	  /*Question 8*/
	  select distinct Salary
	  from workrs a
	  where 3>=(select count(distinct salary)from workrs b 
	  where a.Salary >= b.Salary) 
	  order by a.Salary desc

	  /*Question 9*/
	  select c.Department,c.FIRST_NAME,c.Salary from(
	  select max(Salary)as TotalSalary,Department 
	  from workrs
	  group by Department)as TempNew
	  inner join workrs c on TempNew.Department=c.Department
	  and TempNew.TotalSalary=c.Salary