Create Table Students(
    Student_ID int primary key,
    First_Name varchar(50) not null,
    Last_Name varchar(50) not null,
    Email_ID varchar(50) not null,
    Phone_No varchar(20),
    Address varchar(100),
    Department_ID int
);

insert into Students values
(1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Elm St', 1),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', '456 Oak St', 2);

SELECT * FROM Students;

-- Delete a single row
DELETE FROM Students WHERE Student_ID = 1;

-- Delete rows where  less than and grater than a certain value
DELETE FROM Students WHERE Student_ID < 3;

-- Delete multiple specific rows
DELETE FROM Students WHERE Student_ID IN (2, 3);

-- Delete all rows in the table (but keep the table structure)
DELETE FROM Students;

-- Drop the entire table (removes both data and structure)
DROP TABLE Students;

