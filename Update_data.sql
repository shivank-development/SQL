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

--update data
UPDATE Students
SET First_Name='Jane', Last_Name='Smith', Email_ID='jane.smith@example.com', Phone_No='0987654321', Address='456 Elm St, City, Country', Department_ID=2, Enrollment_Year=2021, Graduation_Year=2025
WHERE Student_ID=1;
select * from Students

--update single column
UPDATE Students
SET Phone_No='1112223333'
WHERE Student_ID=2;
select * from Students;

--update multiple rows
UPDATE Students
SET Department_ID=2
WHERE Enrollment_Year=2021;
select * from Students;

--update multiple columns
UPDATE Students
SET Phone_No='1112223333', Address='456 Elm St, City, Country'
WHERE Student_ID=2;
select * from Students;

--update with condition
UPDATE Students
SET Phone_No='2223334444'
WHERE Student_ID=1;

--update with subquery
UPDATE Students
SET Department_ID = (SELECT Department_ID FROM Departments WHERE Department_Name = 'Computer Science')
WHERE Student_ID = 1;

--update with join
UPDATE Students S
JOIN Departments D ON S.Department_ID = D.Department_ID
SET S.Department_ID = (SELECT Department_ID FROM Departments WHERE Department_Name = 'Information Technology')
WHERE S.Student_ID = 1;

--update with case
UPDATE Students
SET Department_ID = CASE
    WHEN Enrollment_Year = 2020 THEN 1
    WHEN Enrollment_Year = 2021 THEN 2
    ELSE Department_ID
END;


--update with limit
UPDATE Students
SET Phone_No = '9998887777'
WHERE Student_ID IN (SELECT Student_ID FROM Students LIMIT 1);

--update with order by
UPDATE Students
SET Phone_No = '8887776666'
WHERE Student_ID IN (SELECT Student_ID FROM Students ORDER BY Enrollment_Year LIMIT 1);

--update with alias
UPDATE Students AS S
SET S.Phone_No = '7776665555'
WHERE S.Student_ID = 2;

--update with transaction
START TRANSACTION;
UPDATE Students
SET Phone_No = '6665554444'
WHERE Student_ID = 2;
COMMIT;
select * from Students;

--rollback
START TRANSACTION;
UPDATE Students
SET Phone_No = '5554443333'
WHERE Student_ID = 2;
ROLLBACK;
select * from Students;

--update with null
UPDATE Students
SET Phone_No = NULL
WHERE Student_ID = 2;

--update with not null
UPDATE Students
SET Phone_No = '1234567890'
WHERE Student_ID = 2;

--update with default
ALTER TABLE Students
ALTER COLUMN Phone_No SET DEFAULT 'N/A';

--update with auto increment
CREATE TABLE Departments(
    Department_ID int primary key auto_increment,
    Department_Name varchar(50) not null
);

--insert data into Departments table
INSERT INTO Departments (Department_Name)
VALUES ('Computer Science'), ('Mathematics'), ('Physics');
select * from Departments;