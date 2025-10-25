/*
Question: What are the top-paying data analyst jobs?
- Indentify the top 10 highest-paying Data Analyst role that are available remotely.
-Focuses on job postings with specified salaries (remove nulls).
-Why? Highlight the top-paying opportunities for the Data Analysts, offering insigts  into
*/

SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
WHERE
    job_title_short