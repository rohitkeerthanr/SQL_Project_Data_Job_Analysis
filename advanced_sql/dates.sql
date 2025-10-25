SELECT 
    job_title_short AS title,
    job_location AS location ,
    job_posted_date :: DATE AS date_time
FROM 
    job_postings_fact
    LIMIT 10;

