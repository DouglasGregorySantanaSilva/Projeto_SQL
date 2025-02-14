-- Esta query possuí o objetivo de informar as habilidades mais bem remuneradas do mercado de trabalho para um Analista de Dados 

SELECT sd.skills, ROUND(AVG(jpf.salary_year_avg), 2) AS avaregy_salary 
FROM job_postings_fact as jpf
INNER JOIN company_dim as cd ON jpf.company_id = cd.company_id
INNER JOIN skills_job_dim as sjd ON sjd.job_id = jpf.job_id
INNER JOIN skills_dim as sd ON sd.skill_id = sjd.skill_id
WHERE jpf.job_title LIKE '%Data Analyst%' AND jpf.salary_year_avg IS NOT NULL 
GROUP BY sd.skills
ORDER BY avaregy_salary DESC
LIMIT 10;