SELECT
    job_schedule_type,
    job_location
FROM
    job_postings_fact
GROUP BY 
    job_schedule_type,
    job_location;



    SELECT job_schedule_type, salary_year_avg, salary_hour_avg
FROM job_postings_fact
GROUP BY job_schedule_type, salary_year_avg;
    

SELECT
    job_schedule_type,
    salary_year_avg,
    salary_hour_avg,
    MIN(job_posted_date::DATE) AS first_posted_date
FROM
    job_postings_fact
GROUP BY 
    job_schedule_type,
    salary_year_avg;




 
