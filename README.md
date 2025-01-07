# Introduction
Diving into data job market ! In this project , i wanted to explore top paying jobs , in demand skills  and must-have skills where high demand meets high salary. 

### The questions I wanted to answer through my SQL queries were:

1. What are the top-paying data analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. Do required skills differ for different salary ranges?
6. What are the most optimal skills to have?

Here are my  SQL queries for the project : [Data Job Analysis](/project_sql/)

Data i use hails from [Luke Barousse](https://lukebarousse.com/sql) , which they scrape job postings  from Google's search results for different data roles. 

# Tools I Used
For my deep dive into the data analyst job market, I used several key tools:

- **SQL:** Main tool of my analysis, allowing me to query the database and explore important insights.
- **PostgreSQL:** The chosen database management system.
- **Python:** Used pandas and matplotlib to generate graphs.
- **Visual Studio Code:** Personal favorite code editor . Allows me to work on different languages at the same time .
- **Git & GitHub:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# Analysis
Each query for the project aimed to explore specific aspects of the data job market. 
### 1. Top Paying Data Analysis Jobs 
To identify highest paying roles , I filtered data analysis roles by average salary and location . Focusing on Berlin where my goal is to live and work in .Limiting

```sql
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
```
**Here is the breakdown of top paying data analyst roles :**

- **Salary Variability:** Salaries range from $89,000 to $166,000 yearly, with senior-level roles (e.g., "Head of Data Analytics") offering significantly higher pay than standard "Data Analyst" positions.
- **Job Title Trends:** Senior-level roles like "Senior Data Analyst" dominate the listings, highlighting strong demand for experienced professionals.
- **Company Highlights:** Volt.io offers the highest salary, while companies like Flink, Wolt, and Spendesk maintain competitive averages for similar positions.

![Top Paying Roles](/assets/toppayingroles.png)

*Bar graph visualizing the salary for the top paying data analyst roles*
### 2. Skills for Top Paying Jobs
To understand what skills are required for the top-paying jobs, I joined the job postings table with the skills data table, providing insights into what employers value for high-compensation roles.
```sql
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
```
**Key Observations:**

- **SQL** is by far the most frequently listed skill. This strongly suggests that SQL proficiency is a fundamental requirement for data analyst roles in Berlin.
- **Tableau** is another very common skill, indicating that data visualization is a key part of these roles. Looker and Power BI also appear, though less frequently.
-  **Python and R** are both present, showing that programming skills are valued, especially Python. Go and Matlab appear less frequently.

![Required Skills For Top Paying Roles](/assets/requiredskills.png)

*Bar graph visualizing the count of skills for the top paying data analysts roles in Berlin.*
### 3. In-Demand Skills for Data Analysts

This query identifies the skills most frequently requested in job postings, shifting  focus to the whole market rather than just Berlin.

```sql
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
```
**Key Observations:**
- **SQL** and **Excel** remain fundamental, emphasizing the need for strong foundational skills in data processing and spreadsheet manipulation.
- **Programming** and **Visualization Tools** like **Python**, **Tableau**, and **Power BI** are essential, pointing towards the increasing importance of technical skills in data storytelling and decision support.

| Skills   | Demand  |
|----------|--------------|
| SQL      | 92628        |
| Excel    | 67031        |
| Python   | 57326        |
| Tableau  | 46554        |
| Power BI | 39468        |

*Table of the demand for the top 5 skills in data analyst job postings*

### 4. Skills Based on Salary
This query explores the average salaries of different skills and sorts them based on the salaries. 
```sql
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
```
**Key takeaways from the result of the query:**
- Niche skills can be lucrative but risky. Skills like **svn**, **solidity**, **couchbase**  show that highly specialized skills can command very high salaries. However, the low counts also indicate that there might be fewer job openings requiring these skills.

| Skills        | Average Salary ($) |  Demand  |
|---------------|--------------------|----------|
| svn           |         400,000    |   1      |
| solidity      |         179,000    |   1      |
| couchbase     |         160,515    |   1      |
| datarobot     |         155,486    |   1
| golang        |         155,000    |   2
| mxnet         |         149,000    |   2
| dplyr         |         147,633    |   3
| vmware        |         147,500    |   1
| terraform     |         146,734    |   3
| twilio        |         138,500    |   2

*Table of the average salary for the top 10 paying skills for data analysts*

### 5. Skills Based on Salary Ranges
This query explores if demanded skills differ for different salary ranges. I divided job postings into three different groups where **Top** is above **110000$** , **Standard** is between **70000$** and **110000$** and **Low** is below **70000$**.

```sql
select case
    when salary_year_avg >= 110000 then 'Top'
    when salary_year_avg between 70000 and 109999 then 'Standard'
    else 'Low'
    end as Salarybrackets ,sk.skills, count(sk.skills)
from job_postings_fact as jobs
left join skills_job_dim as skj on jobs.job_id=skj.job_id
left join skills_dim as sk on skj.skill_id = sk.skill_id 
where 
    salary_year_avg is not null and job_title_short = 'Data Analyst'
group by Salarybrackets , sk.skills
order by salarybrackets desc ,count(sk.skills) desc
```
**Key takeaways from the results:**
- **SQL** is a very crucial for all ranges. Managing and manipulating databases is a very important skill for data analysis role .
- Data visualization tools like **Tableau** and **Power BI** are important for all ranges . 
- Programing languages like **Python** and **R** in less demand for lower ranges. This suggests these skills are more important for advanced or specialized positions.
- Traditional office softwares **(Word,Powerpoint)** are still relevant . 
- Database services such as **Oracle**, **Azure** , **Snowflake** are less frequently demanded for roles that are at the lower end . 

| | Top      | Standard |  Low  |
|-|----------|--------------------|----------|
|1| SQL      |         SQL    |   Excel  |
|2| Python   |         Excel    |   SQL      |
|3| Tableau  |        Python    |   Tableau  |
|4| Excel    |     Tableau   |   Python
|5| R        |         Power BI    |   Power BI
|6| Power BI |         R    |   Sas
|7| Sas      |         Sas    |   Word
|8| Snowflake|       Powerpoint    |   R
|9| Powerpoint|        Word    |   Powerpoint
|10| Azure  |       Oracle    |   Go

### 6. Most Optimal Skills 
Combining insights from previous queries , this query aimed to pinpoint skills that are both in high demand and have high salaries.
```sql
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
```
**In this query, I only included skills that are at least in 40 different job postings and sorted them based on average salaries associated with them.**

| Skills     | Demand       | Average Salary ($) |
|------------|--------------|-------------------:|
| airflow    | 71           |            116,387 |
| scala      | 59           |            115,480 |
| linux      | 58           |            114,883 |
| confluence | 62           |            114,153 |
| pyspark    | 49           |            114,058 |
| mongodb    | 52           |            113,608 |
| gcp        | 78           |            113,065 |
| spark      | 187          |            113,002 |
| databricks | 102          |            112,881 |
| git        | 74           |            112,250 |

**Key Observations**
- **Cloud Tools and Technologies:** Skills in specialized technologies such as Snowflake, Azure, AWS, and BigQuery show significant demand with relatively high average salaries, pointing towards the growing importance of cloud platforms and big data technologies in data analysis.
- **Programming & Analytics:** Pandas, NumPy, and Scala stand out as essential tools for developers and data scientists.
- **Data Visualization Tools (e.g., Snowflake, Pandas):** Snowflake (241 mentions, $111,578 avg salary) is critical for preparing structured data for platforms like Tableau and Power BI, while Pandas (90 mentions, $110,767 avg salary) is essential for data manipulation, indicating high demand for backend data preparation in visualization workflows.
- **Business Information Tools (e.g., Jira, Confluence):** Jira (145 mentions, $107,931 avg salary) dominates in agile project management, and Confluence (62 mentions, $114,153 avg salary) is highly valued for collaborative documentation, reflecting their importance in managing business insights and team productivity.

# Conclusion
### Insights
Deep diving into data job market allowed me to gather some insights about it :
1. **Top-Paying Data Analyst Jobs**: Data Analyst jobs in Berlin offer salaries ranging from $89,000 to $166,000 yearly.
2. **Skills for Top-Paying Jobs**: High-paying data analyst jobs require advanced proficiency in SQL, suggesting it’s a critical skill for earning a top salary.
3. **Most In-Demand Skills**: SQL is also the most demanded skill in the data analyst job market, closely followed by Python and Excel.
4. **Skills with Higher Salaries**: Specialized skills, such as SVN and Solidity, are associated with the highest average salaries.
5. **Optimal Skills for Job Market Value**: SQL leads in demand and offers for a high average salary, positioning it as one of the most optimal skills for data analysts to learn .

### Closing Thoughts
This project greatly improved my SQL skills as well as python and git. In addition to that provided me valueable insights about data job market. Those insights will guide me through my process of skill development and job searching . Focusing on high demand skills will improve my chances of getting hired hopefully in where i dream to be .


