-- Esta consulta retorna as hab

WITH skill_distribuition AS (
    SELECT skills, COUNT(skills) as Incidence
    FROM skills_dim AS sd
    INNER JOIN skills_job_dim AS sjd ON sjd.skill_id = sd.skill_id
    INNER JOIN job_postings_fact AS jpf ON jpf.job_id = sjd.job_id
    WHERE jpf.job_title LIKE '%Data Analyst%' AND jpf.salary_year_avg IS NOT NULL
    GROUP BY sd.skills
),

skill_avg_demand AS (
    SELECT sd.skills, ROUND(AVG(jpf.salary_year_avg), 2) AS avarege_salary 
    FROM job_postings_fact as jpf
    INNER JOIN company_dim as cd ON jpf.company_id = cd.company_id
    INNER JOIN skills_job_dim as sjd ON sjd.job_id = jpf.job_id
    INNER JOIN skills_dim as sd ON sd.skill_id = sjd.skill_id
    WHERE jpf.job_title LIKE '%Data Analyst%' AND jpf.salary_year_avg IS NOT NULL 
    GROUP BY sd.skills
)

SELECT skd.skills, skd.Incidence, sad.avarege_salary
FROM skill_distribuition AS skd
INNER JOIN skill_avg_demand AS sad ON sad.skills = skd.skills
ORDER BY skd.Incidence DESC, sad.avarege_salary DESC
LIMIT 10
