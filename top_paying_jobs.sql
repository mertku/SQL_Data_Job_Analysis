/*
Question: What are the top-paying data analyst jobs ?
-Identify top 15 highest paying Data Analyst jobs in Berlin.
*/

SELECT  name,
        job_title_short,
        job_title,
        job_location,
        job_via,
        job_schedule_type,
        job_posted_date,
        salary_year_avg
    from (select * 
        from job_postings_fact
        INNER JOIN company_dim ON
        job_postings_fact.company_id = company_dim.company_id
        where job_title_short like '%Data Analyst%' and
        salary_year_avg is not NULL)
    where job_location like '%Berlin%'
    order by salary_year_avg desc
    limit 15

/*
[
  {
    "name": "Volt.io",
    "job_title_short": "Data Analyst",
    "job_title": "Head of Data Analytics",
    "job_location": "Berlin, Germany",
    "job_via": "via Ai-Jobs.net",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-04-18 06:15:58",
    "salary_year_avg": "166419.5"
  },
  {
    "name": "Flink",
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst/Manager - Last Mile Planning (m/f/d)",
    "job_location": "Berlin, Germany",
    "job_via": "via Ai-Jobs.net",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-01-13 20:23:50",
    "salary_year_avg": "111202.0"
  },
  {
    "name": "AUTO1 Group",
    "job_title_short": "Senior Data Analyst",
    "job_title": "(Senior) Product Data Analyst (f/m/x)",
    "job_location": "Berlin, Germany",
    "job_via": "via Ai-Jobs.net",
    "job_schedule_type": "Contractor",
    "job_posted_date": "2023-01-03 21:49:41",
    "salary_year_avg": "111202.0"
  },
  {
    "name": "Wolt",
    "job_title_short": "Senior Data Analyst",
    "job_title": "(Senior) Data Analyst, Support domain",
    "job_location": "Berlin, Germany",
    "job_via": "via Ai-Jobs.net",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-08-15 23:41:01",
    "salary_year_avg": "111175.0"
  },
  {
    "name": "Spendesk",
    "job_title_short": "Senior Data Analyst",
    "job_title": "Senior Marketing Data Analyst - Berlin",
    "job_location": "Berlin, Germany",
    "job_via": "via Ai-Jobs.net",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-01-18 22:22:50",
    "salary_year_avg": "111175.0"
  },
  {
    "name": "Wolt",
    "job_title_short": "Senior Data Analyst",
    "job_title": "Senior Data Analyst (Courier & Logistics)",
    "job_location": "Berlin, Germany",
    "job_via": "via Ai-Jobs.net",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-03-23 17:18:17",
    "salary_year_avg": "111175.0"
  },
  {
    "name": "Flink",
    "job_title_short": "Senior Data Analyst",
    "job_title": "Senior Data Analyst (m/f/d)",
    "job_location": "Berlin, Germany",
    "job_via": "via Ai-Jobs.net",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-02-16 07:14:13",
    "salary_year_avg": "111175.0"
  },
  {
    "name": "Vattenfall",
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst:in mit Schwerpunkt Marketing",
    "job_location": "Berlin, Germany",
    "job_via": "via Ai-Jobs.net",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-08-24 19:42:01",
    "salary_year_avg": "111175.0"
  },
  {
    "name": "Back Market",
    "job_title_short": "Senior Data Analyst",
    "job_title": "Senior Data Analyst -  Marketing Analytics",
    "job_location": "Berlin, Germany",
    "job_via": "via Ai-Jobs.net",
    "job_schedule_type": "Contractor",
    "job_posted_date": "2023-04-24 16:15:55",
    "salary_year_avg": "111175.0"
  },
  {
    "name": "SumUp",
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst - Growth",
    "job_location": "Berlin, Germany",
    "job_via": "via Ai-Jobs.net",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-04-24 15:15:33",
    "salary_year_avg": "111175.0"
  },
  {
    "name": "SumUp",
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - SME Sales",
    "job_location": "Berlin, Germany",
    "job_via": "via Ai-Jobs.net",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-07-05 04:12:13",
    "salary_year_avg": "105000.0"
  },
  {
    "name": "Veeva Systems",
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "job_location": "Berlin, Germany",
    "job_via": "via Ai-Jobs.net",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-01-16 10:59:59",
    "salary_year_avg": "102500.0"
  },
  {
    "name": "SIGNA Sports United",
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (f/m/d) Berlin",
    "job_location": "Berlin, Germany",
    "job_via": "via Ai-Jobs.net",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-08-30 09:30:44",
    "salary_year_avg": "100500.0"
  },
  {
    "name": "AVIV Group",
    "job_title_short": "Data Analyst",
    "job_title": "Data Model Manager",
    "job_location": "Berlin, Germany",
    "job_via": "via Ai-Jobs.net",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-02-04 17:05:13",
    "salary_year_avg": "89100.0"
  },
  {
    "name": "AVIV Group",
    "job_title_short": "Data Analyst",
    "job_title": "Data Model Manager",
    "job_location": "Berlin, Germany",
    "job_via": "via Ai-Jobs.net",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-04-28 07:15:11",
    "salary_year_avg": "89100.0"
  }
]
*/