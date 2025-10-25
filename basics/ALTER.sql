ALTER TABLE job_applied
ADD contact VARCHAR(50);


ALTER TABLE job_applied
ALTER COLUMN contact TYPE TEXT;


ALTER TABLE job_applied
DROP COLUMN contact;


SELECT *
FROM job_applied;