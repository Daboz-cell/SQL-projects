create schema nairobi_academy;

set search_path = nairobi_academy;

CREATE TABLE students (
    student_id   INT PRIMARY KEY,
    first_name   VARCHAR(50) NOT NULL,
    last_name    VARCHAR(50) NOT NULL,
    gender       VARCHAR(1),
    date_of_birth DATE,
    class        VARCHAR(10),
    city         VARCHAR(50)
);

CREATE TABLE subjects (
    subject_id   INT PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL UNIQUE,
    department   VARCHAR(50),
    teacher_name VARCHAR(100),
    credits      INT
);

CREATE TABLE exam_results (
    result_id  INT PRIMARY KEY,
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    marks      INT NOT NULL,
    exam_date  DATE,
    grade      VARCHAR(2)
);

--Q5  Adding phone_number column to students

alter table students 
add column phone_number varchar(20);

--Q6  Renaming column name credits to credit_hours 
alter table subjects
rename column credits to credit_hours;

--Q7  Removing phone_number column in table students
alter table students
drop column phone_number;

--Q8 Insert 10 students
insert into  students (student_id, first_name, last_name, gender, date_of_birth, class, city) values
(1,  'Amina',   'Wanjiku', 'F', '2008-03-12', 'Form 3', 'Nairobi'),
(2,  'Brian',   'Ochieng', 'M', '2007-07-25', 'Form 4', 'Mombasa'),
(3,  'Cynthia', 'Mutua',   'F', '2008-11-05', 'Form 3', 'Kisumu'),
(4,  'David',   'Kamau',   'M', '2007-02-18', 'Form 4', 'Nairobi'),
(5,  'Esther',  'Akinyi',  'F', '2009-06-30', 'Form 2', 'Nakuru'),
(6,  'Felix',   'Otieno',  'M', '2009-09-14', 'Form 2', 'Eldoret'),
(7,  'Grace',   'Mwangi',  'F', '2008-01-22', 'Form 3', 'Nairobi'),
(8,  'Hassan',  'Abdi',    'M', '2007-04-09', 'Form 4', 'Mombasa'),
(9,  'Ivy',     'Chebet',  'F', '2009-12-01', 'Form 2', 'Nakuru'),
(10, 'James',   'Kariuki', 'M', '2008-08-17', 'Form 3', 'Nairobi');

--Q9 Insert 10 subjects
insert into subjects (subject_id, subject_name, department, teacher_name, credit_hours) values
(1,  'Mathematics',     'Sciences',   'Mr. Njoroge',  4),
(2,  'English',         'Languages',  'Ms. Adhiambo', 3),
(3,  'Biology',         'Sciences',   'Ms. Otieno',   4),
(4,  'History',         'Humanities', 'Mr. Waweru',   3),
(5,  'Kiswahili',       'Languages',  'Ms. Nduta',    3),
(6,  'Physics',         'Sciences',   'Mr. Kamande',  4),
(7,  'Geography',       'Humanities', 'Ms. Chebet',   3),
(8,  'Chemistry',       'Sciences',   'Ms. Muthoni',  4),
(9,  'Computer Studies','Sciences',   'Mr. Oduya',    3),
(10, 'Business Studies','Humanities', 'Ms. Wangari',  3);

--Q10 Insert 10 results
insert into exam_results (result_id, student_id, subject_id, marks, exam_date, grade) values
(1,  1, 1, 78, '2024-03-15', 'B'),
(2,  1, 2, 85, '2024-03-16', 'A'),
(3,  2, 1, 92, '2024-03-15', 'A'),
(4,  2, 3, 55, '2024-03-17', 'C'),
(5,  3, 2, 49, '2024-03-16', 'D'),
(6,  3, 4, 71, '2024-03-18', 'B'),
(7,  4, 1, 88, '2024-03-15', 'A'),
(8,  4, 6, 63, '2024-03-19', 'C'),
(9,  5, 5, 39, '2024-03-20', 'F'),
(10, 6, 9, 95, '2024-03-21', 'A');

--Q11 confirm all rows exist in all tables
select * from students;
select * from subjects;
select * from exam_results;

--Q12 update Esther Akinyi 
update students
set city='Nairobi'
where student_id='5';

select * from students;

--Q13 Update marks for result_id 5
update exam_results
set marks='59'
where result_id='5';

--Q14 Delete exam result_id 9
delete from exam_results
where result_id='9';

--Q15 Find all students who are in form 4
select * from students
where class='Form 4';

--Q16 Find all subjects in the science department
select * from subjects
where department='Sciences';

--Q17 Find all results which are greater and equal to 70
select * from exam_results
where marks>=70;

--Q18 Find all female students
select * from students
where gender='F';

--Q19 Find all Form 3 students from Nairobi
select * from students
where class='Form 3' and city='Nairobi';

--Q20 Find all Form 2 or Form 4 Stuents
select * from students
where class='Form 2' or class='Form 4';

--PART2 - BETWEEN, IN/NOT IN, LIKE, COUNT, and CASE WHEN

--Q1 Find all exam results where marks are between 50 and 80 (inclusive).
select * from exam_results
where marks>=50 and marks<=80;

--Q2 Find all exams that took place between 15th March 2024 and 18th March 2024.
select * from exam_results
where exam_date between '2024-03-15' and '2024-03-18';

--Q3 Find all students who live in Nairobi, Mombasa, or Kisumu - use IN.
select * from students
where city in('Nairobi','Mombasa','Kisumu');

--Q4 Find all students who are NOT in Form 2 or Form 3 - use NOT IN.
select * from students 
where class not in('Form 2','Form 3');

--Q5 Find all students whose first name starts with the letter 'A' or 'E' - use LIKE.
select * from students
where first_name like 'A%'or first_name like 'E%';

--Q6 Find all subjects whose subject name contains the word 'Studies'
select * from subjects
where subject_name like '%Studies%';

--Q7 Find how many students are currently in Form 3
select count(*)  as Total_form3_students from students
where class='Form 3';

--Q8 Find how many exam results have a mark of 70 or above
select count(*) as Total_marks  from exam_results
where marks>=70;

--Q9 Write a query using CASE WHEN to label each exam result with a grade description:
--•	'Distinction' if marks >= 80
--•	'Merit' if marks >= 60
--•	'Pass' if marks >= 40
--•	'Fail' if marks below 40
--Call the new column performance.

select 
	result_id,
	marks,
	case 
		when marks>=80 then 'Distinction'
		when marks>=60 then 'Merit'
		when marks>=40 then 'Pass'
		else 'Fail'
	end as performance
from exam_results;


	



