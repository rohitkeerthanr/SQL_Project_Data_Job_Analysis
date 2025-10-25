INSERT INTO job_applied
            (job_id,
            application_sent_date,
             custom_resume,
        resume_file_name,
        cover_letter_sent,
        cover_letter_file_name,
        status)
VALUES      (1,
             '2025-08-01',
             true,
             'resume.1',
             true,
             'cover_letter_pdf',
             'submitted'),
             (2,
             '2025-08-01',
             true,
             'resume.1',
             true,
             'cover_letter_pdf',
             'submitted'),
             (3,
             '2025-08-01',
             true,
             'resume.1',
             true,
             'cover_letter_pdf',
             'submitted');
      
      
SELECT *
FROM job_applied;