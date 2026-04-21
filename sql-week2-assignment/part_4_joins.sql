-- ============================================
-- Section D: Sql Joins
-- Name: Davy Baraka
-- Date: [19/4/2026]
-- ============================================
--Part 4 – SQL JOINS (Using: city_hospital)
--1)	Write an INNER JOIN query to show each appointment alongside the patient's full name,
-- the doctor's full name, the appointment date, and the diagnosis.

set search_path to city_hospital;

select *  from appointments;
select *  from departments;
select *  from doctors;
select *  from patients;
select *  from prescriptions;

select
	a.appointment_id,
	p.full_name as patient_name,
	d.full_name as doctor_name,
	a.appt_date,
	a.diagnosis
from appointments a
inner join patients p on a.patient_id=p.patient_id
inner join doctors d on a.doctor_id=d.doctor_id;
	
	
	
--2)	Write a LEFT JOIN query to show ALL patients - and if they have an appointment, 
--show the appointment date and diagnosis. Patients with no appointments should still appear with NULL values

select 
	p.full_name as patient_name,
    a.appt_date,
    a.diagnosis
from patients p
left join appointments a on p.patient_id = a.patient_id;


--3)	Write a RIGHT JOIN query to show ALL doctors - 
--and if they have seen a patient, show the patient name. 
--Doctors with no appointments should still appear.

select 
    d.full_name as doctor_name,
    p.full_name as patient_name
from appointments a
right join doctors d on a.doctor_id = d.doctor_id
left join patients p on a.patient_id = p.patient_id;
--4)	Write a query using LEFT JOIN and WHERE IS NULL to find all patients who have NEVER had an appointment.
-- Show patient full_name and city.

select 
    p.full_name,
    p.city
from patients p
left join appointments a on p.patient_id = a.patient_id
where a.appointment_id is null;


--5)	Write a three-table INNER JOIN to show each appointment with:
-- the patient name, the doctor name, and the medicine prescribed (from prescriptions).
-- Show appointment_id, patient name, doctor name, and medicine_name.

select 
    a.appointment_id,
    p.full_name as patient_name,
    d.full_name as doctor_name,
    pr.medicine_name
from appointments a
inner join patients p on a.patient_id = p.patient_id
inner join doctors d on a.doctor_id = d.doctor_id
inner join prescriptions pr on a.appointment_id = pr.appointment_id;
