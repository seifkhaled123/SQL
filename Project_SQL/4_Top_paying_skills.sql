/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and
helps identify the most financially rewarding skills to acquire or improve
*/

SELECT
    skills_dim.skills,
    ROUND(AVG(fact.salary_year_avg),0) AS AVG_Salary
FROM job_postings_fact AS fact
INNER JOIN skills_job_dim ON fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skills
ORDER BY
    AVG_Salary DESC
LIMIT 25;