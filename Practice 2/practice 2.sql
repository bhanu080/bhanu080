Create TABLE sale(
sale_id INT NOT NULL,
Name varchar(20) Not Null,
City varchar(20) Not Null,
Commission float
Unique(sale_id));

Insert Into sale(sale_id,Name,City,Commission)
Values(5001,'James Hoog','New York',0.15),
(5002,'Nail Knite','Paris',0.13),
(5005,'Pit Alex','London',0.11),
(5006,'MC Lyon','Paris',0.14),
(5003,'Lauson Hen',' ',0.12),
(5007,'Paul Adam','Rome',0.13);

Create TABLE custr(
custr_id INT NOT NULL,
custr_Name varchar(20) Not Null,
City varchar(20) Not Null,
sale_id INT NOT NULL,
Grade INT NOT NULL);


Insert Into custr(custr_id,custr_Name,City,Grade,sale_id)
Values(3002,'Nick Rimando','New zyork',100,5001),
(3005,'Graham Zusi','California',200,5002),
(3001,'Brad Guzan','London',' ',5005),
(3004,'Fabian Johns','Paris',300,5006),
(3007,'Brad Devis','New York',200,5001),
(3009,'Geoff Camero','Berlin',100,5003),
(3008,'Julian Green','London',300,5002),
(3003,'Jozy Altidor','Moncow',200,5007);

Create table ordr(Ord_no  INT NOT  NULL,purch_amt float NOT NULL,ord_date date not null,custr_id int not null,sale_id int not null);

Insert Into ordr(Ord_no,purch_amt,ord_date,custr_id,sale_id)
Values(70001,150.5,'2012-10-05',3005,5002),
(70009,270.65,'2012-09-10',3001,5005),
(70002,65.26,'2012-10-05',3002,5001),
(70004,110.5,'2012-08-17',3009,5003),
(70007,948.5,'2012-09-10',3005,5002),
(70005,2400.6,'2012-07-27',3007,5001),
(70008,5760,'2012-09-10',3002,50001),
(70010,1983.43,'2012-10-10',3009,5003),
(70003,2480.4,'2012-10-10',3009,5003),
(70012,250.45,'2012-06-27',3008,5002),
(70011,75.29,'2012-08-17',3003,5007),
(70013,3045.6,'2012-04-25',3002,5001);

/* Question 2 */

Select Name,City
From sale
Where city='Paris';

/* Question 3*/
 Select a.*,b.custr_name from  ordr a, custr  b where b.custr_id = a.custr_id and a.ord_date = '2012-08-17'

 /* Question 4 Query */

 Select sale_id, name from sale where 1< (Select COUNT(*) from custr where sale_id = sale.sale_id) 

/* Question 5 Query */

 Select * from ordr a where purch_amt > (select AVG(purch_amt) from ordr  b where a.custr_id= b.custr_id)

/* Question 6 Query */

 Select * from sale where sale_id in (Select distinct sale_id from custr a where not exists ( select * from custr b where a.sale_id = b.sale_id
 and a.custr_Name <> b.custr_Name))

 /* Question 7 Query */

 Select sale_id ,name from sale a where 1 < (select count(*) from custr where sale_id = a.sale_id)

 /* Question 8 Query */

 Select * from sale where city in (select city from custr)