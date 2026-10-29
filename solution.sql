create database kaviya;
use kaviya;
-- Create Department table
CREATE TABLE Department (
    DepartmentID NUMBER(5) PRIMARY KEY,
    DepartmentName VARCHAR2(30)
);

-- Create Student table
CREATE TABLE Student (
    StudentID NUMBER(5) PRIMARY KEY,
    StudentName VARCHAR2(20),
    DepartmentID NUMBER(5),
    FOREIGN KEY (DepartmentID)
    REFERENCES Department(DepartmentID)
);

-- Create Course table
CREATE TABLE Course (
    CourseID NUMBER(5) PRIMARY KEY,
    CourseName VARCHAR2(30)
);

-- Create Enrollment table
CREATE TABLE Enrollment (
    EnrollmentID NUMBER(5) PRIMARY KEY,
    StudentID NUMBER(5),
    CourseID NUMBER(5),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- Insert Department values
INSERT INTO Department VALUES (101, 'Computer Science');
INSERT INTO Department VALUES (102, 'Mathematics');
INSERT INTO Department VALUES (103, 'Physics');

-- Insert Student values
INSERT INTO Student VALUES (1001, 'Arun', 101);
INSERT INTO Student VALUES (1002, 'Divya', 102);
INSERT INTO Student VALUES (1003, 'Karthik', 101);

-- Insert Course values
INSERT INTO Course VALUES (201, 'Database Systems');
INSERT INTO Course VALUES (202, 'Data Structures');
INSERT INTO Course VALUES (203, 'Mathematics');

-- Insert Enrollment values
INSERT INTO Enrollment VALUES (1, 1001, 201);
INSERT INTO Enrollment VALUES (2, 1001, 202);
INSERT INTO Enrollment VALUES (3, 1002, 203);
INSERT INTO Enrollment VALUES (4, 1003, 201);

-- Create StudentDetails view
CREATE VIEW StudentDetails AS
SELECT S.StudentName,
       C.CourseName,
       D.DepartmentName
FROM Student S
JOIN Department D
ON S.DepartmentID = D.DepartmentID
JOIN Enrollment E
ON S.StudentID = E.StudentID
JOIN Course C
ON E.CourseID = C.CourseID;

-- Display the view
SELECT * FROM StudentDetails;
