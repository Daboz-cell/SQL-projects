-- ============================================
-- Section A: String Functions
-- Name: Davy Baraka
-- Date: [19/4/2026]
-- ============================================
set search_path to nairobi_academy;

--Part 1 – String Functions ( using: Nairobi_academy)
--1)	Write a query to display each student's full name in UPPERCASE and their city in lowercase. 
--Name the columns upper_name and lower_city.
select * from students;

select 
	upper(concat(first_name,' ',last_name)) as upper_name,
	lower(city) as lower_city
from students;


--2)	Write a query to show each student's first name and the LENGTH of their first name.
-- Order the results from longest to shortest name.

select first_name, length(first_name) as length
from students
order by length desc;


--3)	Write a query to show each subject's name and a short version 
-- the first 4 characters of the subject name ... called short_name. 
--Also show the full subject name length.

select * from subjects;

select subject_name,substring(subject_name,1,4) as short_name,
length(subject_name) as full_length
from subjects;


--4)	Write a query using CONCAT to produce a sentence for each student in this format
--: 'Amina Wanjiku is in Form 3 and comes from Nairobi'. Call the column student_summary.

select * from students;s

select concat(first_name,' ',last_name,' is in ',class,' and comes from ',city) as student_summary
from students;


