CREATE TABLE Students(
    Student_ID int primary key,
    First_Name varchar(50) not null,
    Last_Name varchar(50) not null,
    Email_ID varchar(50) not null,
    Phone_No varchar(20),
    Address varchar(100),
    Department_ID int,
    Enrollment_Year int not null,
    Graduation_Year int
);

INSERT INTO Students 
    (Student_ID, First_Name, Last_Name, Email_ID, Phone_No, Address, Department_ID, Enrollment_Year, Graduation_Year)
VALUES
    (1,'John','Doe','john.doe@example.com','1234567890','123 Main St, City, Country',1,2020,2024),
    (2,'Janny','Doe','janny.doe@example.com','1231231231','123 Mansi St, City, Countries',2,2021,2025);

select * from Students;

--order by keyword
SELECT * FROM Students
ORDER BY Enrollment_Year DESC;

--group by keyword
SELECT Department_ID, COUNT(*) AS Student_Count
FROM Students
GROUP BY Department_ID;

--having keyword
SELECT Department_ID, COUNT(*) AS Student_Count
FROM Students
GROUP BY Department_ID
HAVING COUNT(*) > 1;

--distinct keyword
SELECT DISTINCT Department_ID
FROM Students;

--between keyword
SELECT * FROM Students
WHERE Enrollment_Year BETWEEN 2020 AND 2021;

--like keyword
SELECT * FROM Students
WHERE First_Name LIKE 'J%';

--is null keyword
SELECT * FROM Students
WHERE Graduation_Year IS NULL;

--is not null keyword
SELECT * FROM Students
WHERE Graduation_Year IS NOT NULL;

--in keyword
SELECT * FROM Students
WHERE Department_ID IN (1, 2);

--exists keyword
SELECT * FROM Students S
WHERE EXISTS (SELECT 1 FROM Students WHERE Department_ID = S.Department_ID AND Enrollment_Year = 2020);

--union keyword
SELECT First_Name, Last_Name FROM Students WHERE Department_ID = 1
UNION
SELECT First_Name, Last_Name FROM Students WHERE Department_ID = 2;

--union all keyword
SELECT First_Name, Last_Name FROM Students WHERE Department_ID = 1
UNION ALL
SELECT First_Name, Last_Name FROM Students WHERE Department_ID = 2;

--intersect keyword
SELECT First_Name, Last_Name FROM Students WHERE Enrollment_Year = 2020
INTERSECT
SELECT First_Name, Last_Name FROM Students WHERE Graduation_Year = 2024;

--except keyword
SELECT First_Name, Last_Name FROM Students WHERE Enrollment_Year = 2020
EXCEPT
SELECT First_Name, Last_Name FROM Students WHERE Graduation_Year = 2024;

--case keyword
SELECT First_Name, Last_Name,
    CASE 
        WHEN Graduation_Year IS NULL THEN 'Not Graduated'
        ELSE 'Graduated'
    END AS Graduation_Status;

--cast keyword
SELECT First_Name, Last_Name,
    CAST(Enrollment_Year AS varchar) AS Enrollment_Year_String
FROM Students;

--convert keyword
SELECT First_Name, Last_Name,
    CONVERT(varchar, Enrollment_Year) AS Enrollment_Year_String
FROM Students;

--top keyword
SELECT TOP 1 * FROM Students;

--offset fetch keyword
SELECT * FROM Students
ORDER BY Student_ID
OFFSET 1 ROWS
FETCH NEXT 1 ROWS ONLY;

--with keyword (Common Table Expression)
WITH Recent_Students AS (
    SELECT * FROM Students WHERE Enrollment_Year >= 2021
)
SELECT * FROM Recent_Students;

--over keyword
SELECT Student_ID, First_Name, Last_Name,
    COUNT(*) OVER (PARTITION BY Department_ID) AS Students_In_Department
FROM Students;

--partition by keyword
SELECT Student_ID, First_Name, Last_Name,
    ROW_NUMBER() OVER (PARTITION BY Department_ID ORDER BY Enrollment_Year) AS Dept_Rank
FROM Students;

--row_number keyword
SELECT Student_ID, First_Name, Last_Name,
    ROW_NUMBER() OVER (ORDER BY Enrollment_Year) AS Row_Number
FROM Students;

--rank keyword
SELECT Student_ID, First_Name, Last_Name,
    RANK() OVER (ORDER BY Enrollment_Year) AS Rank
FROM Students;

--dense_rank keyword
SELECT Student_ID, First_Name, Last_Name,
    DENSE_RANK() OVER (ORDER BY Enrollment_Year) AS Dense_Rank
FROM Students;

--ntile keyword
SELECT Student_ID, First_Name, Last_Name,
    NTILE(2) OVER (ORDER BY Enrollment_Year) AS NTile
FROM Students;

--lag keyword
SELECT Student_ID, First_Name, Last_Name, Enrollment_Year,
    LAG(Enrollment_Year) OVER (ORDER BY Enrollment_Year) AS Previous_Enrollment_Year
FROM Students;

--lead keyword
SELECT Student_ID, First_Name, Last_Name, Enrollment_Year,
    LEAD(Enrollment_Year) OVER (ORDER BY Enrollment_Year) AS Next_Enrollment_Year
FROM Students;

--first_value keyword
SELECT Student_ID, First_Name, Last_Name, Enrollment_Year,
    FIRST_VALUE(Enrollment_Year) OVER (ORDER BY Enrollment_Year) AS First_Enrollment_Year
FROM Students;

--last_value keyword
SELECT Student_ID, First_Name, Last_Name, Enrollment_Year,
    LAST_VALUE(Enrollment_Year) OVER (ORDER BY Enrollment_Year ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS Last_Enrollment_Year
FROM Students;

--nth_value keyword
SELECT Student_ID, First_Name, Last_Name, Enrollment_Year,
    NTH_VALUE(Enrollment_Year, 1) OVER (ORDER BY Enrollment_Year ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS First_Enrollment_Year
FROM Students;

--fetch keyword
SELECT * FROM Students
FETCH FIRST 10 ROWS ONLY;

--insert keyword
INSERT INTO Students (Student_ID, First_Name, Last_Name, Email_ID, Phone_No, Address, Department_ID, Enrollment_Year, Graduation_Year)
VALUES (3, 'Alice', 'Smith', 'alice.smith@example.com', '555-1234', '123 Main St', 1, 2020, 2024);

--update keyword
UPDATE Students
SET Email_ID = 'alice.smith@university.com', Phone_No = '555-5678'
WHERE Student_ID = 3;

--delete keyword
DELETE FROM Students
WHERE Student_ID = 3;

--aggregate functions
SELECT COUNT(*) AS Total_Students
FROM Students;

-- avg function
SELECT AVG(Enrollment_Year) AS Average_Enrollment_Year
FROM Students;

-- sum function
SELECT SUM(Department_ID) AS Sum_of_Department_IDs
FROM Students;

-- min function
SELECT MIN(Enrollment_Year) AS Earliest_Enrollment_Year
FROM Students;

-- max function
SELECT MAX(Enrollment_Year) AS Latest_Enrollment_Year
FROM Students;

--join keyword
SELECT S.Student_ID, S.First_Name, S.Last_Name, D.Department_Name
FROM Students S
JOIN Departments D ON S.Department_ID = D.Department_ID;

--primary key keyword
ALTER TABLE Students
ADD CONSTRAINT PK_Students PRIMARY KEY (Student_ID);

--foreign key keyword
ALTER TABLE Students
ADD CONSTRAINT FK_Students_Departments FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID);

--check keyword
ALTER TABLE Students
ADD CONSTRAINT CHK_Students_Enrollment_Year CHECK (Enrollment_Year >= 2000);

--default keyword
ALTER TABLE Students
ADD CONSTRAINT DF_Students_Enrollment_Year DEFAULT (YEAR(GETDATE())) FOR Enrollment_Year;

--zero keyword
SELECT * FROM Students
WHERE Graduation_Year = 0;

--quotename keyword
SELECT QUOTENAME(First_Name) AS Quoted_First_Name, QUOTENAME(Last_Name) AS Quoted_Last_Name
FROM Students;

--escape keyword
SELECT * FROM Students
WHERE First_Name LIKE 'J!%' ESCAPE '!';

--collate keyword
SELECT * FROM Students
WHERE First_Name COLLATE Latin1_General_CS_AS = 'john';

--set keyword
SET NOCOUNT ON;

--declare keyword
DECLARE @TotalStudents INT;
--Or
SELECT @TotalStudents = COUNT(*) FROM Students;
PRINT 'Total Students: ' + CAST(@TotalStudents AS VARCHAR);

--yield keyword
SELECT TOP 1 * FROM Students
ORDER BY NEWID();

--update statistics keyword
UPDATE STATISTICS Students;

--analyze keyword
--Note: SQL Server does not have an ANALYZE command like some other SQL databases.
--Instead, you can use the following command to update statistics:
EXEC sp_updatestats;

--explain keyword
--Note: SQL Server does not have an EXPLAIN command like some other SQL databases.
--Instead, you can use the following command to display the execution plan:
SET SHOWPLAN_ALL ON;

--pragma keyword
--Note: SQL Server does not support the PRAGMA command as it is specific to SQLite.
--However, you can use the following command to set certain database options:
EXEC sp_dboption 'YourDatabaseName', 'YourOptionName', 'ON';

--optimizer keyword
--Note: SQL Server does not have a specific OPTIMIZER command.
--However, you can use query hints to influence the query optimizer's behavior.
SELECT * FROM Students WITH (INDEX(YourIndexName));

--procedure keyword
CREATE PROCEDURE GetStudents
AS
BEGIN
    SELECT * FROM Students;
END;

--execute keyword
EXEC GetStudents;

--function keyword
CREATE FUNCTION GetStudentCount()
RETURNS INT
AS
BEGIN
    DECLARE @TotalStudents INT;
    SELECT @TotalStudents = COUNT(*) FROM Students;
    RETURN @TotalStudents;
END;
SELECT dbo.GetStudentCount() AS Total_Students;

--trigger keyword
CREATE TRIGGER trgAfterInsert
ON Students
AFTER INSERT
AS
BEGIN
    PRINT 'A new student has been added.';
END;

--cursor keyword
DECLARE student_cursor CURSOR FOR
SELECT Student_ID, First_Name, Last_Name FROM Students;

--xml keyword
SELECT Student_ID, First_Name, Last_Name
FROM Students
FOR XML PATH('Student'), ROOT('Students');

--json keyword
SELECT Student_ID, First_Name, Last_Name
FROM Students
FOR JSON PATH;

--json_modify keyword
DECLARE @json NVARCHAR(MAX) = N'{"Student_ID":1,"First_Name":"John","Last_Name":"Doe"}';
SET @json = JSON_MODIFY(@json, '$.First_Name', 'Jane');
--other example
SET @json = JSON_MODIFY(@json, '$.Graduation_Year', 2024);
SELECT @json AS ModifiedJson;
GROUP BY Country;

--select ALL
INSERT INTO table2
SELECT * FROM table1;
--condition;
WHERE condition;

--select only some column_name(s)
INSERT INTO table2 (column1, column2, column3)
SELECT column1, column2, column3 FROM table1;

--operater
SELECT * FROM Products
WHERE Price = 18;

--less than or equal to
SELECT * FROM Products
WHERE Price <= 30;

--primary key and not null
CREATE TABLE Persons (
    ID int NOT NULL PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);

--auto keyword
CREATE TABLE Orders (
    OrderID int NOT NULL AUTO_INCREMENT,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID)
);

--date 
SELECT * FROM Orders WHERE OrderDate='2008-11-11';

--insert date
INSERT INTO Orders (OrderID, OrderNumber, PersonID, OrderDate)
VALUES (1, 1001, 1, '2008-11-11');

--update date
UPDATE Orders
SET OrderDate = '2008-11-12'
WHERE OrderID = 1;

--delete date
DELETE FROM Orders
WHERE OrderID = 1;

--select date
SELECT * FROM Orders
WHERE OrderDate = '2008-11-11';

--and keyword
SELECT * FROM EMPLOYEE
WHERE dept='Sales' AND Country='Germany';

--or keyword
SELECT * FROM EMPLOYEE
WHERE dept='Sales' OR Country='Germany';

--not keyword
SELECT * FROM EMPLOYEE
WHERE NOT dept='Sales';

--like keyword
SELECT * FROM EMPLOYEE
WHERE FirstName LIKE 'J%';

--where keyword
SELECT * FROM EMPLOYEE
WHERE FirstName = 'John';

--with keyword
WITH SalesEmployees AS (
    SELECT * FROM EMPLOYEE WHERE dept='Sales'
)

--having keyword
SELECT dept, COUNT(*) AS EmployeeCount
FROM SalesEmployees
GROUP BY dept
HAVING COUNT(*) > 5;

--select into keyword
SELECT * INTO NewEmployeeTable
FROM EMPLOYEE
WHERE dept='Sales';

--daltabase keyword
CREATE DATABASE CompanyDB;

--table keyword
CREATE TABLE EMPLOYEE ();

--view keyword
CREATE VIEW SalesEmployees AS
SELECT * FROM EMPLOYEE WHERE dept='Sales';

--index keyword
CREATE INDEX idx_lastname ON EMPLOYEE (LastName);

--alter keyword
ALTER TABLE EMPLOYEE
ADD COLUMN MiddleName VARCHAR(255);

--drop keyword
DROP TABLE NewEmployeeTable;

--truncate keyword
TRUNCATE TABLE EMPLOYEE;

--commit keyword
COMMIT;

--rollback keyword
ROLLBACK;

--savepoint keyword
SAVEPOINT Savepoint1;

--release savepoint keyword
RELEASE SAVEPOINT Savepoint1;

--grant keyword
GRANT SELECT ON EMPLOYEE TO User1;

--revoke keyword
REVOKE SELECT ON EMPLOYEE FROM User1;

--transaction keyword
BEGIN TRANSACTION;

--end transaction keyword
END TRANSACTION;

--cursor keyword
DECLARE emp_cursor CURSOR FOR
SELECT * FROM EMPLOYEE;

--fetch keyword
FETCH NEXT FROM emp_cursor;

--close keyword
CLOSE emp_cursor;

--deallocate keyword
DEALLOCATE emp_cursor;

--explain keyword
EXPLAIN SELECT * FROM EMPLOYEE;

--analyze keyword
ANALYZE TABLE EMPLOYEE;

--optimize keyword
OPTIMIZE TABLE EMPLOYEE;

--pragma keyword
PRAGMA foreign_keys = ON;

--comment keyword
-- This is a single-line comment
/* This is a
multi-line comment */

--go keyword
GO

--hint keyword
SELECT * FROM EMPLOYEE WITH (NOLOCK);

--keyword
SELECT * FROM EMPLOYEE WHERE dept='Sales';

--from keyword
SELECT * FROM EMPLOYEE;