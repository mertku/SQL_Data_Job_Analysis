/*
Question: What are the top skills based on average salary?
- Look at the average salary associated with each skill for Data Analyst positions
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary,
    count(job_postings_fact.job_id) as count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25

/*
[
  {
    "skills": "svn",
    "avg_salary": "400000",
    "count": "1"
  },
  {
    "skills": "solidity",
    "avg_salary": "179000",
    "count": "1"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515",
    "count": "1"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486",
    "count": "1"
  },
  {
    "skills": "golang",
    "avg_salary": "155000",
    "count": "2"
  },
  {
    "skills": "mxnet",
    "avg_salary": "149000",
    "count": "2"
  },
  {
    "skills": "dplyr",
    "avg_salary": "147633",
    "count": "3"
  },
  {
    "skills": "vmware",
    "avg_salary": "147500",
    "count": "1"
  },
  {
    "skills": "terraform",
    "avg_salary": "146734",
    "count": "3"
  },
  {
    "skills": "twilio",
    "avg_salary": "138500",
    "count": "2"
  },
  {
    "skills": "gitlab",
    "avg_salary": "134126",
    "count": "7"
  },
  {
    "skills": "kafka",
    "avg_salary": "129999",
    "count": "40"
  },
  {
    "skills": "puppet",
    "avg_salary": "129820",
    "count": "2"
  },
  {
    "skills": "keras",
    "avg_salary": "127013",
    "count": "3"
  },
  {
    "skills": "pytorch",
    "avg_salary": "125226",
    "count": "20"
  },
  {
    "skills": "perl",
    "avg_salary": "124686",
    "count": "20"
  },
  {
    "skills": "ansible",
    "avg_salary": "124370",
    "count": "2"
  },
  {
    "skills": "hugging face",
    "avg_salary": "123950",
    "count": "2"
  },
  {
    "skills": "tensorflow",
    "avg_salary": "120647",
    "count": "24"
  },
  {
    "skills": "cassandra",
    "avg_salary": "118407",
    "count": "11"
  },
  {
    "skills": "notion",
    "avg_salary": "118092",
    "count": "6"
  },
  {
    "skills": "atlassian",
    "avg_salary": "117966",
    "count": "15"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "116712",
    "count": "6"
  },
  {
    "skills": "airflow",
    "avg_salary": "116387",
    "count": "71"
  },
  {
    "skills": "scala",
    "avg_salary": "115480",
    "count": "59"
  }
]
*/