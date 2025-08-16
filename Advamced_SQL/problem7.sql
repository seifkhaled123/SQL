/*
Find the count of the number of remote job postings per skill
- Display the top 5 skills by their demand in remote jobs
- Include skill ID, name, and count of postings requiring the skill

*/
WITH top_skills AS (
SELECT
    count(skills_job_dim.skill_id) AS count_of_postings_require_the_Skill,
    skills_job_dim.skill_id
FROM job_postings_fact
LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
WHERE
    job_work_from_home IS TRUE AND
    job_title_short = 'Data Analyst'
GROUP BY
    skills_job_dim.skill_id
)

SELECT 
    skills_dim.skill_id,
    skills_dim.skills as name,
    top_skills.count_of_postings_require_the_Skill
FROM 
    skills_dim
    LEFT JOIN top_skills ON top_skills.skill_id = skills_dim.skill_id
WHERE
    top_skills.count_of_postings_require_the_Skill IS NOT NULL
ORDER BY
    top_skills.count_of_postings_require_the_Skill DESC
LIMIT 5;