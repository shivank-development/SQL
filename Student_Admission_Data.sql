----------------------------------------------Collage Database--------------------------------------------

-- Departments Table
Create Table Departments(
    Department_ID int primary key,
    Department_Name varchar(50) not null
);

-- Teacher Table
Create Table Teacher(
    Teacher_ID int primary key,
    First_Name varchar(50) not null,
    Last_Name varchar(50) not null,
    Email_ID varchar(50) not null,
    Phone_No varchar(20),
    Address varchar(100),
    Department_ID int,
    foreign key (Department_ID) references Departments(Department_ID)
);

-- Courses Table
Create Table Courses(
    Course_ID int primary key,
    Course_Name varchar(50) not null,
    Credits int not null
);

-- Students Table
Create Table Students(
    Student_ID int primary key,
    First_Name varchar(50) not null,
    Last_Name varchar(50) not null,
    Email_ID varchar(50) not null,
    Phone_No varchar(20),
    Address varchar(100),
    Department_ID int,
    Enrollment_Year int not null,
    Graduation_Year int,
    Status varchar(20) not null,
    Addmission_Date date not null,
    Score float,
    Mentor_ID int,
    foreign key (Department_ID) references Departments(Department_ID),
    foreign key (Mentor_ID) references Teacher(Teacher_ID)
);

-- Enrollments Table
Create table Enrollments(
    Enrollment_ID int primary key,
    Student_ID int,
    Course_ID int,
    foreign key (Student_ID) references Students(Student_ID),
    foreign key (Course_ID) references Courses(Course_ID)
);

-- Assignments Table
Create table Assignments(
    Assignment_ID int primary key,
    Assignment_Name varchar(50) not null,
    Course_ID int,
    foreign key (Course_ID) references Courses(Course_ID)
);

-- Insert Departments
insert into Departments (Department_ID, Department_Name) values
(1, 'Computer Science'),
(2, 'Electrical Engineering'),
(3, 'Mechanical Engineering'),
(4, 'Civil Engineering'),
(5, 'Business Administration');

-- Insert Teachers
insert into Teacher (Teacher_ID, first_Name, Last_Name, Email_ID, Phone_No, Address, Department_ID) values
(1, 'David', 'Clark', 'david.clark@example.com', '111-111-1111', '12 King St', 1),
(2, 'Emma', 'Jones', 'emma.jones@example.com', '222-222-2222', '34 Queen St', 2),
(3, 'Daniel', 'White', 'daniel.white@example.com', '333-333-3333', '56 Prince St', 3),
(4, 'Sophia', 'Hall', 'sophia.hall@example.com', '444-444-4444', '78 Duke St', 4),
(5, 'Liam', 'Adams', 'liam.adams@example.com', '555-555-5555', '90 Earl St', 5);

-- Now Students (your insert works fine after above data exists)
insert into Students (Student_ID, First_Name, Last_Name, Email_ID, Phone_No, Address, Department_ID, Enrollment_Year, Graduation_Year, Status, Addmission_Date, Score, Mentor_ID) values
(1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Elm St', 1, 2020, 2024, 'Active', '2020-08-15', 3.5, 1),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', '456 Oak St', 1, 2021, 2025, 'Active', '2021-08-15', 3.8, 1),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', '0000000000', '789 Pine St', 2, 2022, 2026, 'Active', '2022-08-15', 3.2, 2),
(4, 'Bob', 'Williams', 'bob.williams@example.com', '0000000000', '321 Cedar St', 2, 2023, 2027, 'Active', '2023-08-15', 3.9, 2),
(5, 'Eva', 'Brown', 'eva.brown@example.com', '0000000000', '654 Birch St', 3, 2024, 2028, 'Active', '2024-08-15', 3.7, 3),
(6, 'Michael', 'Davis', 'michael.davis@example.com', '0000000000', '987 Maple St', 3, 2025, 2029, 'Active', '2025-08-15', 3.6, 3),
(7, 'Sophia', 'Miller', 'sophia.miller@example.com', '0000000000', '123 Walnut St', 4, 2026, 2030, 'Active', '2026-08-15', 3.4, 4),
(8, 'William', 'Wilson', 'william.wilson@example.com', '0000000000', '456 Spruce St', 4, 2027, 2031, 'Active', '2027-08-15', 3.3, 4),
(9, 'Olivia', 'Moore', 'olivia.moore@example.com', '0000000000', '789 Fir St', 5, 2028, 2032, 'Active', '2028-08-15', 3.1, 5),
(10, 'James', 'Taylor', 'james.taylor@example.com', '0000000000', '321 Pine St', 5, 2029, 2033, 'Active', '2029-08-15', 3.0, 5);

-- Test Select
select * from Students;
select * from Teacher;
select * from Departments;

