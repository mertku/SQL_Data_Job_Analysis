/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 15 highest paying Data Analyst jobs from the first query.
- Add the specific skills required for these roles
*/

with top_paying as (
SELECT *
    from (select * 
        from job_postings_fact
        INNER JOIN company_dim ON
        job_postings_fact.company_id = company_dim.company_id
        where job_title_short like '%Data Analyst%' and
        salary_year_avg is not NULL and job_location like '%Berlin%')
    order by salary_year_avg desc
    limit 15 )

select  top_paying.name,
        top_paying.job_title_short,
        top_paying.job_location,
        top_paying.salary_year_avg,
        sk.skills
    from top_paying
    INNER JOIN skills_job_dim as skj on top_paying.job_id = skj.job_id
    INNER JOIN skills_dim as sk   on skj.skill_id = sk.skill_id
/*
[
  {
    "name": "Volt.io",
    "job_title_short": "Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "166419.5",
    "skills": "sql"
  },
  {
    "name": "Volt.io",
    "job_title_short": "Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "166419.5",
    "skills": "python"
  },
  {
    "name": "Volt.io",
    "job_title_short": "Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "166419.5",
    "skills": "tableau"
  },
  {
    "name": "Volt.io",
    "job_title_short": "Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "166419.5",
    "skills": "power bi"
  },
  {
    "name": "AUTO1 Group",
    "job_title_short": "Senior Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "111202.0",
    "skills": "sql"
  },
  {
    "name": "AUTO1 Group",
    "job_title_short": "Senior Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "111202.0",
    "skills": "excel"
  },
  {
    "name": "AUTO1 Group",
    "job_title_short": "Senior Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "111202.0",
    "skills": "tableau"
  },
  {
    "name": "Flink",
    "job_title_short": "Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "111202.0",
    "skills": "python"
  },
  {
    "name": "Flink",
    "job_title_short": "Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "111202.0",
    "skills": "r"
  },
  {
    "name": "Back Market",
    "job_title_short": "Senior Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "111175.0",
    "skills": "sql"
  },
  {
    "name": "Flink",
    "job_title_short": "Senior Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "111175.0",
    "skills": "sql"
  },
  {
    "name": "Flink",
    "job_title_short": "Senior Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "111175.0",
    "skills": "go"
  },
  {
    "name": "Flink",
    "job_title_short": "Senior Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "111175.0",
    "skills": "bigquery"
  },
  {
    "name": "Flink",
    "job_title_short": "Senior Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "111175.0",
    "skills": "looker"
  },
  {
    "name": "SumUp",
    "job_title_short": "Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "111175.0",
    "skills": "sql"
  },
  {
    "name": "SumUp",
    "job_title_short": "Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "111175.0",
    "skills": "python"
  },
  {
    "name": "SumUp",
    "job_title_short": "Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "111175.0",
    "skills": "r"
  },
  {
    "name": "SumUp",
    "job_title_short": "Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "111175.0",
    "skills": "matlab"
  },
  {
    "name": "SumUp",
    "job_title_short": "Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "111175.0",
    "skills": "tableau"
  },
  {
    "name": "Wolt",
    "job_title_short": "Senior Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "111175.0",
    "skills": "sql"
  },
  {
    "name": "Wolt",
    "job_title_short": "Senior Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "111175.0",
    "skills": "python"
  },
  {
    "name": "Wolt",
    "job_title_short": "Senior Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "111175.0",
    "skills": "r"
  },
  {
    "name": "Wolt",
    "job_title_short": "Senior Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "111175.0",
    "skills": "go"
  },
  {
    "name": "Wolt",
    "job_title_short": "Senior Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "111175.0",
    "skills": "matlab"
  },
  {
    "name": "Wolt",
    "job_title_short": "Senior Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "111175.0",
    "skills": "tableau"
  },
  {
    "name": "Wolt",
    "job_title_short": "Senior Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "111175.0",
    "skills": "looker"
  },
  {
    "name": "Wolt",
    "job_title_short": "Senior Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "111175.0",
    "skills": "sql"
  },
  {
    "name": "Wolt",
    "job_title_short": "Senior Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "111175.0",
    "skills": "python"
  },
  {
    "name": "Wolt",
    "job_title_short": "Senior Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "111175.0",
    "skills": "r"
  },
  {
    "name": "Wolt",
    "job_title_short": "Senior Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "111175.0",
    "skills": "go"
  },
  {
    "name": "Wolt",
    "job_title_short": "Senior Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "111175.0",
    "skills": "tableau"
  },
  {
    "name": "Wolt",
    "job_title_short": "Senior Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "111175.0",
    "skills": "looker"
  },
  {
    "name": "Spendesk",
    "job_title_short": "Senior Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "111175.0",
    "skills": "snowflake"
  },
  {
    "name": "Spendesk",
    "job_title_short": "Senior Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "111175.0",
    "skills": "excel"
  },
  {
    "name": "Vattenfall",
    "job_title_short": "Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "111175.0",
    "skills": "looker"
  },
  {
    "name": "SumUp",
    "job_title_short": "Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "105000.0",
    "skills": "tableau"
  },
  {
    "name": "SumUp",
    "job_title_short": "Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "105000.0",
    "skills": "sap"
  },
  {
    "name": "SumUp",
    "job_title_short": "Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "105000.0",
    "skills": "git"
  },
  {
    "name": "Veeva Systems",
    "job_title_short": "Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "102500.0",
    "skills": "sql"
  },
  {
    "name": "Veeva Systems",
    "job_title_short": "Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "102500.0",
    "skills": "tableau"
  },
  {
    "name": "Veeva Systems",
    "job_title_short": "Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "102500.0",
    "skills": "atlassian"
  },
  {
    "name": "SIGNA Sports United",
    "job_title_short": "Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "100500.0",
    "skills": "sql"
  },
  {
    "name": "SIGNA Sports United",
    "job_title_short": "Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "100500.0",
    "skills": "aws"
  },
  {
    "name": "SIGNA Sports United",
    "job_title_short": "Data Analyst",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "100500.0",
    "skills": "tableau"
  }
]
*/