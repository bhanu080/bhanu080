
/*Question 1*/
Select FIRST_NAME,LAST_NAME,ROUND(SALARY/12,2) AS 'Monthly Salary'
FROM EMPLOYEES

/*Question 2*/
select MANAGER_ID,MIN(SALARY)
FROM EMPLOYEES 
WHERE MANAGER_ID IS NOT NULL
GROUP BY MANAGER_ID
ORDER BY MIN(SALARY) DESC;

/*Question 3*/

Select DEPARTMENT_ID,AVG(SALARY),COUNT(*)
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID
HAVING COUNT(*)>10

/*Question 4*/
Select FIRST_NAME,LAST_NAME
FROM EMPLOYEES
WHERE SALARY >(SELECT SALARY FROM EMPLOYEES WHERE EMPLOYEE_ID=163)

/*Question 5*/
Select FIRST_NAME,LAST_NAME
FROM EMPLOYEES
WHERE SALARY IN(SELECT MIN(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID)


/*Question 6*/
SELECT  FIRST_NAME,LAST_NAME,EMPLOYEE_ID,SALARY
FROM EMPLOYEES
WHERE MANAGER_ID=(SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE FIRST_NAME='Payam')