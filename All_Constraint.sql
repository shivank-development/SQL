--NOT NULL and ALTER KEYWORD

CREATE TABLE students (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int
);


ALTER TABLE students
ALTER COLUMN Age int NOT NULL;

ALTER TABLE students
MODIFY COLUMN Age int NOT NULL;

ALTER TABLE students
MODIFY Age int NOT NULL;

ALTER TABLE students
ADD CHECK (Age>=18);


--unique
CREATE TABLE students_unique (
    ID int NOT NULL UNIQUE,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);

--or

CREATE TABLE students_unique (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT UC_Person UNIQUE (ID,LastName)
);

ALTER TABLE students_unique
ADD UNIQUE (ID);

ALTER TABLE students_unique
ADD CONSTRAINT UC_Person UNIQUE (ID,LastName);

ALTER TABLE students_unique
DROP INDEX UC_Person;


ALTER TABLE Persons
DROP CONSTRAINT UC_Person;


--primary key

CREATE TABLE students (
    ID int NOT NULL PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);

---or

CREATE TABLE students (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT PK_Person PRIMARY KEY (ID,LastName)
);

ALTER TABLE students
ADD PRIMARY KEY (ID);

ALTER TABLE students
ADD CONSTRAINT PK_Person PRIMARY KEY (ID,LastName);

ALTER TABLE students
DROP PRIMARY KEY;

ALTER TABLE students
DROP PRIMARY KEY;

ALTER TABLE students
DROP CONSTRAINT PK_Person;


---foreign key

CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID)
    REFERENCES Persons(PersonID)
);

--or

CREATE TABLE Orders (
    OrderID int NOT NULL PRIMARY KEY,
    OrderNumber int NOT NULL,
    PersonID int FOREIGN KEY REFERENCES Persons(PersonID)
);

ALTER TABLE Orders
ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);

ALTER TABLE Orders
ADD CONSTRAINT FK_PersonOrder
FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);

ALTER TABLE Orders
DROP FOREIGN KEY FK_PersonOrder;

ALTER TABLE Orders
DROP CONSTRAINT FK_PersonOrder;

--check

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255),
    CONSTRAINT CHK_Person CHECK (Age>=18 AND City='Sandnes')
);

--or

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int CHECK (Age>=18)
);

ALTER TABLE students
ADD CONSTRAINT CHK_Age CHECK (Age >= 18);

ALTER TABLE Persons
ADD CHECK (Age>=18);

ALTER TABLE Persons
ADD CONSTRAINT CHK_PersonAge CHECK (Age>=18 AND City='Sandnes');

ALTER TABLE Persons
DROP CONSTRAINT CHK_PersonAge;

ALTER TABLE Persons
DROP CHECK CHK_PersonAge;

--default
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Sandnes'
);

--or

CREATE TABLE Orders (
    ID int NOT NULL,
    OrderNumber int NOT NULL,
    OrderDate date DEFAULT GETDATE()
);

ALTER TABLE Persons
ALTER COLUMN City SET DEFAULT 'Stavanger';

ALTER TABLE Persons
ALTER City SET DEFAULT 'Sandnes';

ALTER TABLE Persons
ADD CONSTRAINT df_City
DEFAULT 'Sandnes' FOR City;

ALTER TABLE Persons
ALTER COLUMN City SET DEFAULT 'Sandnes';

ALTER TABLE Persons
MODIFY City DEFAULT 'Sandnes';

ALTER TABLE Persons
ALTER City DROP DEFAULT;

ALTER TABLE Persons
ALTER COLUMN City DROP DEFAULT;
