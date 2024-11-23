--Lab 12 by Noah Borel

--Databse link: https://sqliteonline.com/#sqltext=%23url-sqlite%3Dhttps%3A%2F%2Fraw.githubusercontent.com%2Fkamrik%2FIntroText%2Frefs%2Fheads%2Fmain%2Fexamples%2Fsql%2Ft177.db%0D%0A%23tab-name%3Dt177.db%0D%0A

--1. Concatenate Course Name and Semester:
--Write a query to list all courses, concatenating the course_name and semester fields with a hyphen between them. Like this: "IT Essentials - 2024-3"
SELECT CONCAT(course_name, ' - ', semester)
FROM courses;

--2. Find Courses with Labs on Fridays: 
--Write a query to find all courses that have a lab session scheduled on Friday. Include only the course_id, course_name, and lab_time in the result.
SELECT course_id, course_name, lab_time
FROM courses
WHERE lab_time LIKE 'Fri%';

--3. Upcoming Assignments:
--Write a query to list all assignments with a due date after the current date.
SELECT * FROM assignments 
WHERE due_date > CURRENT_DATE;

--4. Count Assignments by Status:
--Write a query to count the number of assignments for each status (e.g., "Not Started", "In Progress", "Completed"). Hint: GROUP BY
SELECT status, COUNT(*)
FROM assignments
GROUP BY status;

--5. Longest Course Name:
--Write a query to find the course with the longest course_name. Use the length() function to compare the lengths.
--Hint: either use ORDER BY ... DESC or do it in two steps - first find the length, then the course.
SELECT course_name
FROM courses
ORDER by length(course_name) DESC
LIMIT 1;

--6. Uppercase Course Names:
--Write a query to return a list of all course names in uppercase.
SELECT UPPER(course_name)
FROM courses;

--7. Assignments Due in September:
--Write a query to list the titles of all assignments that are due in September, regardless of year. Use the LIKE operator to filter due_date.
SELECT title
FROM assignments
WHERE due_date LIKE '%-09-%';

--8. Assignments with Missing Due Dates:
--Write a query to find all assignments where the due_date is missing. Note, there are no assignments with NULL due_dates initially, but one was added if you ran the INSERT statement in the examples above. Hint: due_date IS NULL
SELECT *
FROM assignments
WHERE due_date IS NULL;

--OPTIONAL TASKS
--1.Total Assignments per Course:
--Write a query to list each course_id along with the total number of assignments associated with it. Join the two tables and use the COUNT() function to aggregate the results.
SELECT courses.course_id, COUNT(assignments.course_id)
FROM courses
JOIN assignments ON courses.course_id = assignments.course_id
GROUP BY courses.course_id;

--2. Courses Without Assignments (advanced):
--Write a query to find all courses that do not have any assignments.
--Hint: LEFT JOIN ... WHERE assignments.id IS NULL
