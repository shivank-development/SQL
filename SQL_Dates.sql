CREATE TABLE Students (
    StudentID int,
    StudentName varchar(255),
    EnrollmentDate date,
    GraduationDate date
);

Insert into Students (StudentID, StudentName, EnrollmentDate, GraduationDate) values
(1, 'Alice', '2008-11-11', '2008-11-12'),
(2, 'Bob', '2009-01-15', '2013-05-20'),
(3, 'Charlie', '2010-09-01', '2014-06-30');


SELECT * FROM Students WHERE EnrollmentDate='2008-12-28'
AND GraduationDate='2008-11-02';

SELECT * FROM Students WHERE EnrollmentDate='2008-12-28';


SELECT * FROM Students WHERE EnrollmentDate>='2008-11-11'
AND GraduationDate<='2008-12-28';

SELECT * FROM Students WHERE EnrollmentDate<='2008-11-11';

SELECT * FROM Students WHERE EnrollmentDate>='2008-11-11'
AND GraduationDate<='2008-11-12';

SELECT * FROM Students WHERE EnrollmentDate>='2008-11-11'
AND GraduationDate<='2008-11-12';

SELECT * FROM Students WHERE EnrollmentDate>='2008-11-11'
AND GraduationDate=='2008-11-12';

SELECT * FROM Students WHERE EnrollmentDate<='2008-11-11'
AND GraduationDate='2008-11-12';

SELECT * FROM Students WHERE EnrollmentDate>='2008-11-11'
AND GraduationDate>='2008-11-12';
