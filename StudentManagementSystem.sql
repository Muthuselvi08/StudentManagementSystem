CREATE DATABASE StudentManagement;

USE StudentManagement;

-- TABLE STUDENT
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT CHECK (age >= 16),
    city VARCHAR(50)
);

-- TABLE COURSES
CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    duration VARCHAR(50)
);

-- TABLE ENROLLMENTS 
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrollment_date DATE,

    FOREIGN KEY (student_id)
        REFERENCES Students(student_id),

    FOREIGN KEY (course_id)
        REFERENCES Courses(course_id),

    UNIQUE (student_id, course_id)
);

INSERT INTO Students (name, email, age, city)
VALUES
('Arun', 'arun@gmail.com', 21, 'Chennai'),
('Priya', 'priya@gmail.com', 22, 'Madurai'),
('Karthik', 'karthik@gmail.com', 20, 'Coimbatore'),
('Divya', 'divya@gmail.com', 21, 'Chennai');

INSERT INTO Courses (course_name, duration)
VALUES
('Java', '3 Months'),
('Python', '2 Months'),
('MySQL', '1 Month'),
('React', '2 Months');

INSERT INTO Enrollments
(student_id, course_id, enrollment_date)
VALUES
(1, 1, '2026-01-10'),
(1, 3, '2026-01-12'),
(2, 2, '2026-01-15'),
(2, 3, '2026-01-18'),
(3, 1, '2026-01-20'),
(4, 4, '2026-01-22');

-- NEW VALUE ADDED
INSERT INTO Students (name, email, age, city)
VALUES
('Muthu', 'Muthu@gmail.com', 18, 'Madurai'),
('Bharu', 'Bharu@gmail.com', 17, 'Madurai');

-- DiSPLAY ALL STUDENTS
SELECT * FROM Students;

-- UPDATE
UPDATE Students SET
      city = 'Bangalore' Where Student_id=1;
	
DELETE FROM Students 
where Student_id=6;

-- JOINS
--  Display students with their enrolled courses
SELECT Students.name,Courses.course_name FROM Students
INNER JOIN Enrollments
ON Students.Student_id=Enrollments.Student_id
INNER JOIN Courses
ON Enrollments.course_id=Courses.course_id;

-- Display all students, including students who haven't enrolled
SELECT Students.name,Courses.course_name FROM Students
LEFT JOIN Enrollments
ON Students.Student_id=Enrollments.Student_id
LEFT JOIN Courses
ON Enrollments.course_id=Courses.course_id;

-- Count students enrolled in each course
SELECT Courses.Course_name,count(Enrollments.Student_id) AS Course_count FROM Courses
INNER JOIN Enrollments
ON Courses.Course_id=Enrollments.Course_id
GROUP BY Courses.Course_id;

-- Find students enrolled in more than one course
SELECT Students.name FROM Students
INNER JOIN Enrollments
ON Students.Student_id=Enrollments.Student_id
GROUP BY Students.Student_id
HAVING count(Enrollments.course_id)>1;

-- Find students who haven't enrolled in any course
SELECT Students.name FROM Students
LEFT JOIN Enrollments
ON Students.Student_id=Enrollments.Student_id
WHERE Enrollments.Student_id IS NULL;




