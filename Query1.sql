SELECT jpf.job_id, cd.name as Company_Name, jpf.job_title, jpf.job_location,  jpf.job_via,  jpf.job_schedule_type,  jpf.search_location,  jpf.job_posted_date,  jpf.salary_year_avg
FROM job_postings_fact as jpf
LEFT JOIN company_dim as cd ON jpf.company_id = cd.company_id
WHERE ((jpf.job_title like '%Data Analyst%' and jpf.job_location = 'Anywhere') and jpf.salary_year_avg is not null)
ORDER BY jpf.salary_year_avg desc
LIMIT 10;
