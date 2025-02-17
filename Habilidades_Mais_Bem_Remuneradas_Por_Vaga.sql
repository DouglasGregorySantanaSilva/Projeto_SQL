-- Esta consulta retorna as habilidades mais bem remuneradas para a posição de Analista de Dados

SELECT jpf.job_id, cd.name as Company_Name, jpf.job_title, STRING_AGG(sd.skills, ', ') as Skills, jpf.job_location,  jpf.job_via,  jpf.job_schedule_type,  jpf.search_location,  jpf.job_posted_date,  jpf.salary_year_avg
FROM job_postings_fact as jpf
INNER JOIN company_dim as cd ON jpf.company_id = cd.company_id
INNER JOIN skills_job_dim as sjd ON sjd.job_id = jpf.job_id
INNER JOIN skills_dim as sd ON sd.skill_id = sjd.skill_id
WHERE ((jpf.job_title like '%Data Analyst%' and jpf.job_location = 'Anywhere') and jpf.salary_year_avg is not null)
GROUP BY jpf.job_id, cd.name
ORDER BY jpf.salary_year_avg desc
LIMIT 10;
