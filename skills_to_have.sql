/*
Question: Which skills are in demand and pays well?
 -Identify skills in high demand and have high average salaries for Data Analyst roles.
*/

with demanded_skills as (
    select * 
    from job_postings_fact as jobs
    inner join skills_job_dim skj on jobs.job_id = skj.job_id
    where jobs.job_title_short = 'Data Analyst' and
    jobs.salary_year_avg is not null 
    )

    select sk.skills, count(sk.skills) as count,
        round(avg(demanded_skills.salary_year_avg),0) as avg_salary
    from demanded_skills
    inner join skills_dim sk on demanded_skills.skill_id=sk.skill_id
    group by sk.skills
    having count(sk.skills) > 40 
    order by  avg_salary desc , count desc
    LIMIT  25

/*
[
  {
    "skills": "airflow",
    "count": "71",
    "avg_salary": "116387"
  },
  {
    "skills": "scala",
    "count": "59",
    "avg_salary": "115480"
  },
  {
    "skills": "linux",
    "count": "58",
    "avg_salary": "114883"
  },
  {
    "skills": "confluence",
    "count": "62",
    "avg_salary": "114153"
  },
  {
    "skills": "pyspark",
    "count": "49",
    "avg_salary": "114058"
  },
  {
    "skills": "mongodb",
    "count": "52",
    "avg_salary": "113608"
  },
  {
    "skills": "gcp",
    "count": "78",
    "avg_salary": "113065"
  },
  {
    "skills": "spark",
    "count": "187",
    "avg_salary": "113002"
  },
  {
    "skills": "databricks",
    "count": "102",
    "avg_salary": "112881"
  },
  {
    "skills": "git",
    "count": "74",
    "avg_salary": "112250"
  },
  {
    "skills": "snowflake",
    "count": "241",
    "avg_salary": "111578"
  },
  {
    "skills": "shell",
    "count": "44",
    "avg_salary": "111496"
  },
  {
    "skills": "hadoop",
    "count": "140",
    "avg_salary": "110888"
  },
  {
    "skills": "pandas",
    "count": "90",
    "avg_salary": "110767"
  },
  {
    "skills": "nosql",
    "count": "108",
    "avg_salary": "108331"
  },
  {
    "skills": "express",
    "count": "96",
    "avg_salary": "108221"
  },
  {
    "skills": "redshift",
    "count": "90",
    "avg_salary": "107969"
  },
  {
    "skills": "jira",
    "count": "145",
    "avg_salary": "107931"
  },
  {
    "skills": "numpy",
    "count": "54",
    "avg_salary": "107398"
  },
  {
    "skills": "postgresql",
    "count": "44",
    "avg_salary": "106853"
  },
  {
    "skills": "aws",
    "count": "291",
    "avg_salary": "106440"
  },
  {
    "skills": "c++",
    "count": "68",
    "avg_salary": "105696"
  },
  {
    "skills": "alteryx",
    "count": "124",
    "avg_salary": "105580"
  },
  {
    "skills": "azure",
    "count": "319",
    "avg_salary": "105400"
  },
  {
    "skills": "bigquery",
    "count": "84",
    "avg_salary": "105238"
  }
]
*/
    

