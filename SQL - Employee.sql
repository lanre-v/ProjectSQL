--Create tables Employee Demographics and Employee Salary.
--Create columns Employee ID, first name, last name, age, and gender in Employee demographics
--create column employee ID, job title, and salary in Employee salary.


Create table EmployeeDemographics
(EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50),
)

Create table EmployeeSalary
(EmployeeID int,
JobTitle varchar(50),
Salary varchar(50)
)


-- Insert new data into tables (EmployeeDemographics)
--(1002, 'Pam', 'Beasley', 30, 'Female'),
--(1003, 'Dwight', 'Schrute', 29, 'Male'),
--(1004, 'Angela', 'Martin', 31, 'Female'),
--(1005, 'Toby', 'Flenderson', 32, 'Male'),
--(1006, 'Michael', 'Scott', 35, 'Male'),
--(1007, 'Meredith', 'Palmer', 32, 'Female'),
--(1008, 'Stanley', 'Hudson', 38, 'Male'),
--(1009, 'Kevin', 'Malone', 31, 'Male')

insert into EmployeeDemographics
values
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')

--Insert new data into employee salary
--(1002, 'Receptionist', 36000),
--(1003, 'Salesman', 63000),
--(1004, 'Accountant', 47000),
--(1005, 'HR', 50000),
--(1006, 'Regional Manager', 65000),
--(1007, 'Supplier Relations', 41000),
--(1008, 'Salesman', 48000),
--(1009, 'Accountant', 42000)

insert into EmployeeSalary
values
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)

-- In Employee Demographics select first name and last name 
select FirstName, LastName from EmployeeDemographics

-- view the top 5 employee information from employee demo
SELECT TOP 5 *
FROM EmployeeDemographics

sELECT DISTINCT(Age)
FROM EmployeeDemographics

-- view employee with the highest salary

SELECT EmployeeID, JobTitle, Salary 
FROM EmployeeSalary
WHERE Salary = (SELECT MAX(Salary) FROM EmployeeSalary)
ORDER BY EmployeeID;

-- view employee with the first name 'Pam'

select * 
from EmployeeDemographics
where FirstName = 'Pam'

Select EmployeeID, FirstName, LastName 
from EmployeeDemographics
where FirstName = 'Pam'

-- check all employees above 30
select * from EmployeeDemographics
where Age > 30

Select * from EmployeeDemographics
where Age > 30
and Gender = 'Male'

select * from EmployeeDemographics
where LastName like 'S%'

-- employee with s in their last name

select * from EmployeeDemographics
where LastName like '%S%'

-- name includes S and O
SELECT * 
FROM EmployeeDemographics
WHERE LastName LIKE 'S%o%'

-- employees with first name as Pam and Micheal
SELECT * 
FROM EmployeeDemographics
WHERE FirstName IN ('Pam', 'Michael')


-- count gender in employee demographics
select Gender, count(Gender) as 'Total Gender'
from EmployeeDemographics
group by Gender

-- view emplyee salary information
SELECT * FROM EmployeeSalary

-- merge ALL employee demo and salary data 
select * from EmployeeDemographics
inner join EmployeeSalary
on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

select EmployeeDemographics.EmployeeID,  FirstName, LastName, Salary 
from EmployeeDemographics
inner join EmployeeSalary
on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

-- view employee salary rank from highest to lowest
select EmployeeDemographics.EmployeeID,  FirstName, LastName, Salary 
from EmployeeDemographics
inner join EmployeeSalary
on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
order by Salary desc

select   FirstName, LastName, Salary 
from EmployeeDemographics
inner join EmployeeSalary
on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


-- average salary of salesmen then view by highest salary

select  JobTitle, AVG(salary) as 'Average Salary'
from EmployeeSalary
inner join EmployeeDemographics
on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
where JobTitle = 'Salesmen'
Group by JobTitle

SELECT JobTitle, AVG(Salary) as 'Average Salary'
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle = 'Salesman'
GROUP BY JobTitle;

SELECT JobTitle, AVG(Salary) AS 'Avg Salary'
FROM [SQL Tutorial].dbo.EmployeeDemographics
Inner Join [SQL Tutorial].dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle = 'Salesman'
GROUP BY JobTitle


SELECT JobTitle, AVG(Salary) AS 'Average Salary'
FROM [ProjectSQL].dbo.EmployeeDemographics
INNER JOIN [ProjectSQL].dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle = 'Salesman'
GROUP BY JobTitle


select * from EmployeeSalary

--SELECT JobTitle, AVG(Salary) AS 'Avg Salary'
--FROM [SQL Tutorial].dbo.EmployeeDemographics
--Inner Join [SQL Tutorial].dbo.EmployeeSalary
--ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--WHERE JobTitle = 'Salesman'
--GROUP BY JobTitle

--Create Procedure Test 
--AS
--Select * 
--From EmployeeDemographics

--Exec Test

--Select * from EmployeeSalary

Select EmployeeID, JobTitle, Salary
from EmployeeSalary
Where EmployeeID
in (select EmployeeID from EmployeeDemographics where Age > 30)



select * from EmployeeDemographics