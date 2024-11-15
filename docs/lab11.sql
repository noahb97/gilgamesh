--Lab 11 SQL file for all the queries


--1. Assignments for a Specific Course
--Write a query to display the title and due_date of assignments for the course COMP1234.
SELECT course_id, title, due_date
FROM assignments
WHERE course_id = 'COMP1234'
ORDER BY due_date;

--Result:
"COMP1234"	"HTML/CSS Basics"	"2024-09-20"
"COMP1234"	"JavaScript Interactive Page"	"2024-10-10"


--2.Earliest Assignment Due Date
--Write a query to find the earliest assignment due date in the assignments table. Hint: use SELECT min()
SELECT min(due_date)
FROM assignments;

--Result:
"2024-09-10"


--3.Latest Assignment Due Date
--Write a query to find the latest assignment due date in the assignments table.
SELECT max(due_date)
FROM assignments;

--Result:
"2025-03-20"


--4.Assignments Due on a Specific Date
--Write a query to find the title and course_id of assignments due on 2024-10-08.
SELECT title, course_id
FROM assignments
WHERE due_date = '2024-10-08';

--Result:
"COMP1234"	"HTML/CSS Basics"	"2024-09-20"
"COMP1234"	"JavaScript Interactive Page"	"2024-10-10"


--5.Find All Assignments Due in October
--Write a query to display the title and due_date of assignments due in October 2024. Hint: use LIKE '2024-10%'
SELECT title, due_date
FROM assignments
WHERE due_date LIKE '2024-10%'
ORDER BY due_date;

--Result:
"Hardware Installation Project"	"2024-10-01"
"Algorithm Design Task"	"2024-10-05"
"Data Normalization Task"	"2024-10-08"
"JavaScript Interactive Page"	"2024-10-10"
"Linear Algebra Quiz"	"2024-10-15"
"Presentation Project"	"2024-10-20"


--6.Find the Most Recent Completed Assignment
--Write a query to find the most recent due_date of assignments with a status of "Completed".
SELECT min(due_date)
FROM assignments
WHERE status = 'Completed';

--Result:
"2024-09-10"
 

--Optional tasks

--1.Count of "Not Started" Assignments
--Write a query to find the total number of assignments with a status of "Not Started". Remember to use single quotes for strings in SQL.
SELECT count(*) 
FROM assignments
WHERE status = 'Not Started';

--Result:
"9"


--2.Find Courses with Labs on Tuesday
--Write a query to find the course_id and course_name of courses that have lab sessions on Tuesday. Hint: use LIKE 'Tue%
SELECT course_id, course_name
FROM courses
WHERE lab_time like 'Tue%';

--Result:
"COMP1238"	"Introduction to Data Management"
"COMM2000"	"Communicating Across Contexts"
"COMP3044"	"Linux Essentials"
"COMP2139"	"Web Application Development"
"COMP2148"	"Professional Workplace Competencies"
"COMP3059"	"Capstone Project I"
"COMP3123"	"Full Stack Development I"
"COMP3133"	"Full Stack Development II"


--3.Write a query that joins the two tables
--Hint: ...
--JOIN the_other_table 
--  ON courses.course_id = assignments.course_id

SELECT *
FROM assignments
JOIN courses 
ON courses.course_id = assignments.course_id;

--Result:
"1"	"COMP1151"	"Network Setup Assignment"	"Not Started"	"2024-09-15"	"COMP1151"	"2024-3"	"IT Essentials"	"Wed 09"	"Mon 13"	"Basics of IT infrastructure."
"2"	"COMP1151"	"Hardware Installation Project"	"In Progress"	"2024-10-01"	"COMP1151"	"2024-3"	"IT Essentials"	"Wed 09"	"Mon 13"	"Basics of IT infrastructure."
"3"	"COMP1236"	"Logic Gates Exercise"	"Completed"	"2024-09-10"	"COMP1236"	"2024-3"	"Fundamentals of Computing Logic"	"Thu 14"	"Tue 10"	"Focus on logic and algorithms."
"4"	"COMP1236"	"Algorithm Design Task"	"In Progress"	"2024-10-05"	"COMP1236"	"2024-3"	"Fundamentals of Computing Logic"	"Thu 14"	"Tue 10"	"Focus on logic and algorithms."
"5"	"COMP1234"	"HTML/CSS Basics"	"Not Started"	"2024-09-20"	"COMP1234"	"2024-3"	"Introduction To Web Development"	"Fri 11"	"Wed 15"	"Introduction to HTML, CSS, and JavaScript."
"6"	"COMP1234"	"JavaScript Interactive Page"	"Not Started"	"2024-10-10"	"COMP1234"	"2024-3"	"Introduction To Web Development"	"Fri 11"	"Wed 15"	"Introduction to HTML, CSS, and JavaScript."
"7"	"COMP1238"	"SQL Query Assignment"	"Completed"	"2024-09-18"	"COMP1238"	"2024-3"	"Introduction to Data Management"	"Tue 13"	"Thu 09"	"Basic concepts of data storage and retrieval."
"8"	"COMP1238"	"Data Normalization Task"	"In Progress"	"2024-10-08"	"COMP1238"	"2024-3"	"Introduction to Data Management"	"Tue 13"	"Thu 09"	"Basic concepts of data storage and retrieval."
"9"	"MATH1162"	"Calculus Problem Set"	"Completed"	"2024-09-12"	"MATH1162"	"2024-3"	"Mathematics for Computer Technology I"	"Mon 10"	"Fri 12"	"Mathematical principles for computing."
"10"	"MATH1162"	"Linear Algebra Quiz"	"Not Started"	"2024-10-15"	"MATH1162"	"2024-3"	"Mathematics for Computer Technology I"	"Mon 10"	"Fri 12"	"Mathematical principles for computing."
"11"	"COMM2000"	"Communication Skills Essay"	"In Progress"	"2024-09-25"	"COMM2000"	"2024-3"	"Communicating Across Contexts"	"Tue 09"	"Thu 11"	"Effective communication in various settings."
"12"	"COMM2000"	"Presentation Project"	"Not Started"	"2024-10-20"	"COMM2000"	"2024-3"	"Communicating Across Contexts"	"Tue 09"	"Thu 11"	"Effective communication in various settings."
"13"	"COMP1168"	"Database Design Project"	"Not Started"	"2025-02-10"	"COMP1168"	"2025-1"	"Database Management"	"Fri 10"	"Mon 14"	"Introduction to database systems."
"14"	"COMP1168"	"SQL Optimization Assignment"	"In Progress"	"2025-03-01"	"COMP1168"	"2025-1"	"Database Management"	"Fri 10"	"Mon 14"	"Introduction to database systems."
"15"	"COMP1202"	"Java OOP Basics"	"Completed"	"2025-02-05"	"COMP1202"	"2025-1"	"Object-Oriented Programming"	"Wed 13"	"Tue 11"	"Core concepts of OOP using Java."
"16"	"COMP1202"	"Inheritance and Polymorphism Task"	"Not Started"	"2025-03-15"	"COMP1202"	"2025-1"	"Object-Oriented Programming"	"Wed 13"	"Tue 11"	"Core concepts of OOP using Java."
"17"	"COMP1235"	"Frontend Development Exercise"	"Completed"	"2025-02-18"	"COMP1235"	"2025-1"	"Introduction To Full-Stack Development"	"Thu 10"	"Mon 15"	"Web development from front to back end."
"18"	"COMP1235"	"Backend API Development"	"In Progress"	"2025-03-10"	"COMP1235"	"2025-1"	"Introduction To Full-Stack Development"	"Thu 10"	"Mon 15"	"Web development from front to back end."
"19"	"COMP3044"	"Linux Command Line Basics"	"Not Started"	"2025-02-25"	"COMP3044"	"2025-1"	"Linux Essentials"	"Tue 14"	"Wed 12"	"Introduction to Linux OS."
"20"	"COMP3044"	"Shell Scripting Project"	"Completed"	"2025-03-20"	"COMP3044"	"2025-1"	"Linux Essentials"	"Tue 14"	"Wed 12"	"Introduction to Linux OS."
"21"	"GSSC1027"	"Budget Planning Assignment"	"In Progress"	"2025-02-22"	"GSSC1027"	"2025-1"	"Personal Finance"	"Fri 09"	"Thu 13"	"Managing personal financial matters."
"22"	"GSSC1027"	"Investment Strategies Essay"	"Not Started"	"2025-03-12"	"GSSC1027"	"2025-1"	"Personal Finance"	"Fri 09"	"Thu 13"	"Managing personal financial matters."
"23"	"MATH1172"	"Probability Problem Set"	"Completed"	"2025-02-15"	"MATH1172"	"2025-1"	"Mathematics for Computer Technology II"	"Mon 11"	"Fri 15"	"Advanced mathematical concepts."
"24"	"MATH1172"	"Complex Numbers Quiz"	"In Progress"	"2025-03-05"	"MATH1172"	"2025-1"	"Mathematics for Computer Technology II"	"Mon 11"	"Fri 15"	"Advanced mathematical concepts."
