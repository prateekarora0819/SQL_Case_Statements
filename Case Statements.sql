
Select * from EMPLOYEES
Select * from Company_and_Courses


-- CASE STATEMENTS
--=======================

-- Example - 1
---------------------------
--BASIC CASE STATEMENT
---------------------------
Select e.E_ID, Name ,Salary,
	CASE
		WHEN Salary >= 55000 THEN 'Senior'
		WHEN Salary >= 40000 THEN 'Associate'
		WHEN Salary <= 40000 THEN 'Trainee'
	END AS LEVEL
from EMPLOYEES e


-- Example - 2 
---------------------------------
-- CASE STATEMENTS WITH JOINS
----------------------------------
Select e.E_ID, Name ,Salary, c.Department,
	CASE
		WHEN Salary >= 55000 THEN 'Senior'
		WHEN Salary >= 40000 THEN 'Associate'
		WHEN Salary <= 40000 THEN 'Trainee'
	END AS LEVEL
from EMPLOYEES e
INNER JOIN Company_and_Courses c
ON e.E_ID = c.E_ID
Order by LEVEL


-- Example - 3 
------------------------
-- CASE STATEMENT with AGE
------------------------
Select E_ID, Name , AGE, Jobtitle,
	CASE
		WHEN AGE >= 25 THEN 'Sr. '
		WHEN AGE >= 22 THEN 'Jr.'
		WHEN AGE <= 22 THEN 'Graduate'
		--ELSE 
	END AS Seniority
from EMPLOYEES 


-- Example - 4 
----------------------------
-- CASE STATEMENT with Salary
----------------------------

Select E_ID, NAME, SALARY, 
	CASE 
		WHEN JOBTITLE like '%ANLAYST' then Salary + 0.16 * Salary
		WHEN JOBTITLE like '%DEVELOPER' then Salary + 0.20 * Salary
		WHEN JOBTITLE like '%Engineer' then Salary + 0.12 * Salary
		ELSE Salary + 0.14 * Salary
	END AS Updated_Salary
from EMPLOYEES


-- Example - 5 
------------------------------------------------------------------------------------
-- CASE STATEMENT with Updated Salary with reference to the salary_hike using Joins
------------------------------------------------------------------------------------

Select e.E_ID, e.NAME, e.SALARY, c.Salary_hike, e.Jobtitle,
	CASE 
		WHEN JOBTITLE like '%ANLAYST' then Salary + c.Salary_hike * Salary
		WHEN JOBTITLE like '%DEVELOPER' then Salary + c.Salary_hike * Salary
		WHEN JOBTITLE like '%Engineer' then Salary + c.Salary_hike * Salary
		ELSE Salary + 0.14 * Salary
	END AS Updated_Salary
from EMPLOYEES e
Inner join Company_and_Courses c
ON e.E_ID = c.E_ID