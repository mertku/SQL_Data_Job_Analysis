/*
Question: What are the most in-demand skills for data analysts?
-Focusing on all job postings , identified top 10 skills for Data Analysts.
*/

with demanded_skills as (
    select *  
    from job_postings_fact as jobs
    left join skills_job_dim skj
    on jobs.job_id = skj.job_id
    where jobs.job_title_short = 'Data Analyst')

    select sk.skills, count(sk.skills) as count
    from demanded_skills
    inner join skills_dim as sk 
    on demanded_skills.skill_id=sk.skill_id
    group by sk.skills
    order by count desc
    limit 5



/*
[
  {
    "skills": "sql",
    "count": "92628"
  },
  {
    "skills": "excel",
    "count": "67031"
  },
  {
    "skills": "python",
    "count": "57326"
  },
  {
    "skills": "tableau",
    "count": "46554"
  },
  {
    "skills": "power bi",
    "count": "39468"
  }
]
*/