/*
Find job postings from the first quarter that have a salary greater than $70K
Combine job posting tables from the first quarter of 2023 (Jan-Mar)
Gets job postings with an average yearly salary > $70,000
*/
SELECT
    quarter_one.job_title_short,
    quarter_one.job_location,
    quarter_one.job_via,
    quarter_one.job_posted_date::DATE,
    quarter_one.salary_year_avg
    FROM
    (
        SELECT *
        FROM january_jobs

        UNION ALL

        SELECT *
        FROM february_jobs

        UNION ALL

        SELECT *
        FROM march_jobs) AS quarter_one
WHERE quarter_one.salary_year_avg > 70000 AND
quarter_one.job_title_short = 'Data Analyst'
ORDER BY quarter_one.salary_year_avg DESC;