/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focuses on job postings with specified salaries (remove nulls).
- Why? Highlight the top-paying opportunities for Data Analysts.
*/

SELECT
    fact.job_id,
    fact.job_title,
    names.name As Company_Name,
    fact.job_location,
    fact.job_schedule_type,
    fact.salary_year_avg,
    fact.job_posted_date
FROM job_postings_fact AS fact
LEFT JOIN company_dim AS Names ON fact.company_id = Names.company_id
WHERE
    job_title_short = 'Data Analyst' AND 
    job_work_from_home IS TRUE AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10