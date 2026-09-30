 -- Coding Challenge
-- Domain: College Student Management System
-- Problem Statement
-- Assume that you are an Data Analyst you need to analyze a college which maintains students, courses, marks.

use dailychallenge;

-- Students Table
CREATE TABLE students (
 student_id INT PRIMARY KEY,
 student_name VARCHAR(50),
 gender VARCHAR(10),
 city VARCHAR(50),
 join_year INT
);

-- Courses Table
CREATE TABLE courses (
 course_id INT PRIMARY KEY,
 course_name VARCHAR(100),
 department VARCHAR(50)
);


-- Marks Table
CREATE TABLE marks (
 mark_id INT PRIMARY KEY,
 student_id INT,
 course_id INT,
 marks INT,
 FOREIGN KEY (student_id) REFERENCES students(student_id),
 FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


-- Insert into students
INSERT INTO students (student_id, student_name, gender, city, join_year) VALUES
(1, 'Anu', 'F', 'Tumakuru', 2024),
(2, 'Ravi', 'M', 'Bengaluru', 2023),
(3, 'Kiran', 'M', 'Tumakuru', 2024),
(4, 'Sneha', 'F', 'Mysuru', 2023),
(5, 'Manu', 'M', 'Tumakuru', 2022);


-- Insert into courses
INSERT INTO courses (course_id, course_name, department) VALUES
(101, 'SQL Basics', 'Computer Science'),
(102, 'Excel for Analysts', 'Commerce'),
(103, 'Statistics', 'Mathematics');

-- Insert into marks
INSERT INTO marks (mark_id, student_id, course_id, marks) VALUES
(1, 1, 101, 85),
(2, 2, 101, 72),
(3, 3, 101, 90),
(4, 4, 102, 88),
(5, 5, 103, 67),
(6, 1, 103, 79),
(7, 2, 102, 81);



-- 1. Display all students.
select * from students;


-- 2. Display only student_name and city from students table.
select student_name,city from students;

-- 3. Show all courses.
select * from courses;


-- 4. Display students who are from Tumakuru.
select * from students
where city = "Tumakuru";


-- 5. Display students who joined in 2024. 
select * from students
where join_year = 2024;


-- 6. Show students whose gender is F.
select * from students
where gender = "F";

-- 7. Show marks greater than 80.
select * from marks
where marks >80;


-- 8. Display course names from Commerce department.
select course_name from courses
where department = "commerce";

-- 9. Show students who are not from Bengaluru.
select * from students
where city <> "Bengaluru";


-- 10. Display marks between 70 and 90. 
select * from marks
where marks between 70 and 90;

-- 11. Display all students ordered by student_name ascending.
select * from students
order by student_name asc;


-- 12. Show marks ordered from highest to lowest.
select * from marks
order by marks desc;


-- 13. Display students ordered by join_year descending. 
select * from students
order by join_year desc;

-- 14. Find total number of students.
select sum(marks) as total_marks from students s
join marks m
on s.student_id = m.student_id;


-- 15. Find average marks.
select avg(marks) as Average_marks from students s
join marks m
on s.student_id = m.student_id;



-- 16. Find highest marks.
select max(marks) as highest_marks from students s
join marks m
on s.student_id = m.student_id;

-- 17. Find lowest marks.
select min(marks) as lowest_marks from students s
join marks m
on s.student_id = m.student_id;


-- 18. Find total marks scored by all students.
select s.student_name as student_name,sum(m.marks) as total_marks from students s
join marks m
on s.student_id = m.student_id
group by s.student_name;