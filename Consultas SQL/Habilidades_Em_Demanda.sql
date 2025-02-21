-- O objetivo desta consulta é analizar as habilidades mais requisitadas para um analista de dados pelo mercado de trabalho

SELECT skills, COUNT(skills) as Incidence
FROM skills_dim AS sd
INNER JOIN skills_job_dim AS sjd ON sjd.skill_id = sd.skill_id
INNER JOIN job_postings_fact AS jpf ON jpf.job_id = sjd.job_id
WHERE jpf.job_title LIKE '%Data Analyst%' AND jpf.salary_year_avg IS NOT NULL
GROUP BY sd.skills
ORDER BY Incidence DESC
LIMIT 10;
