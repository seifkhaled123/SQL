WITH highest_job_count AS (
SELECT
    count(skill_id) as count_skill_id,
    skill_id
FROM skills_job_dim
GROUP BY
    skill_id
ORDER BY
    count_skill_id DESC
)
SELECT 
    skills_dim.skills,
    highest_job_count.count_skill_id
FROM skills_dim
    LEFT JOIN highest_job_count ON highest_job_count.skill_id = skills_dim.skill_id
ORDER BY
    count_skill_id DESC