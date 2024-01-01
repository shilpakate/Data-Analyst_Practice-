--EMP Table

select * from Employee
select * from Dept

-- Cumulative Salary dept wise
select
d.Deptname, 
sum(e.Salary)Cumulative_salary
from Employee e Inner Join Dept d on
e.Empid=d.EmpId
group by  d.Deptname
order by d.Deptname

--Add column into table
ALTER TABLE Employee
ADD Mon_2023 VARCHAR(10); -- Replace VARCHAR(10) with your desired data type and size

--Rename the column
EXEC sp_rename 'Employee.Year2023', 'Month', 'COLUMN';

--delete unwanted records
delete from Employee where Year2023='January'

--update 
UPDATE Employee
SET  Year2023='January'
WHERE EmpId  in (1,3,4,5,6)


---insert new rcords

INSERT INTO Employee
VALUES(1,'John','King','john.king@abc.com','123.123.1834',33000,'February'),
(3,'Neena','Kochhar','neena@test.com','123.456.4568',17000,'February'),
(4,'Lex','De Haan','lex@test.com','123.456.4569',15000,'February'),
(5,'Neenashi','Kochhar','neessna@test.com','193.456.4568',190000,'February'),
(6,'Lexi','De Haan','lessx@test.com','193.456.4569',105000,'February'),
(1,'John','King','john.king@abc.com','123.123.1834',33000,'March'),
(3,'Neena','Kochhar','neena@test.com','123.456.4568',17000,'March'),
(4,'Lex','De Haan','lex@test.com','123.456.4569',15000,'March'),
(5,'Neenashi','Kochhar','neessna@test.com','193.456.4568',190000,'March'),
(6,'Lexi','De Haan','lessx@test.com','193.456.4569',105000,'March');

--Display all
select * from Employee


--4. Cumulative Sum of Salary (Jan to March)

SELECT
    Empid,
    Firstname, 
    SUM(Salary) OVER ( partition by Empid order by Month ) AS Cumulative_Salary
FROM
    (
	SELECT
        Empid,
        Firstname,
        Salary,
        ROW_NUMBER() OVER (PARTITION BY Empid ORDER BY Month DESC) AS RowNum
    FROM
        Employee e
    WHERE
       -Month IN ('January', 'February', 'March')
		e. Month IN ('January', 'February', 'March')
) AS RankedData
WHERE
    RowNum = 1;







	SELECT
    Empid,
    Firstname, 
    SUM(Salary) OVER (PARTITION BY Empid ORDER BY Year2023) AS Cumulative_Salary
FROM
    Employee 
WHERE
   Year2023 IN ('January', 'March');




   SELECT
    E.Emp_id,
    E.Firstname,
    Y.Month,
    SUM(E.Salary) OVER (PARTITION BY E.Emp_id ORDER BY Y.Month) AS Cumulative_Salary
FROM
    Employee E
JOIN
    Year2023 Y ON E.Month = Y.Month
WHERE
    Y.Month IN ('January', 'February', 'March');







