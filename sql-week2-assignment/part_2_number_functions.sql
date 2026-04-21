-- ============================================
-- Section B: Number Functions
-- Name: Davy Baraka
-- Date: [19/4/2026]
-- ============================================

--Part 2- Number Functions  (using: Nairobi_academy) 
--1)	Write a query to show each exam result alongside the mark rounded to 1 decimal place,
-- the mark rounded UP to the nearest 10 using CEIL, and the mark rounded DOWN using FLOOR.
set search_path to nairobi_academy;

select * from exam_results;

select
	result_id,
	marks,
	round(marks,1) as round_1dp,
	ceil(marks/10)*10 as ceil_value,
	floor(marks/10)*10 as floor_value	
from exam_results;
	


--2)	Write a query to calculate the following summary statistics for exam_results in one query
--: total number of results (COUNT), average mark (AVG rounded to 2 decimal places),
-- highest mark (MAX), lowest mark (MIN), and total marks added together (SUM).


select 
	count(*) as total_results,
	round(avg(marks),2) as average_mark,
	max(marks) as highest_mark,
	min(marks) as lowest_mark,
	sum(marks) as total_marks
from  exam_results;
	
--3)	The school wants to apply a 10% bonus to all marks.
-- Write a query to show each result_id, the original marks, 
--and the new boosted_mark rounded to the nearest whole number.

select 
	result_id,
	marks as original_marks,
	round(marks*1.10) as boosted_mark
from exam_results;
