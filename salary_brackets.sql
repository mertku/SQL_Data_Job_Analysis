/*
Question: Do required skills change for different salary ranges?
 -Split job postings into three different salary ranges.
 -Count how many times each skill appeared in job postings.
 -Create a table with top 10 skills for each bracket.
*/

select case
    when salary_year_avg >= 130000 then 'Top'
    when salary_year_avg between 60000 and 129999 then 'Standart'
    else 'Low'
    end as Salarybrackets ,sk.skills, count(sk.skills)
from job_postings_fact as jobs
left join skills_job_dim as skj on jobs.job_id=skj.job_id
left join skills_dim as sk on skj.skill_id = sk.skill_id 
where 
    salary_year_avg is not null and job_title_short = 'Data Scientist'
group by Salarybrackets , sk.skills
order by salarybrackets desc ,count(sk.skills) desc



/*

          Top  Standart      Low
1      python    python   python
2         sql       sql      sql
3           r         r        r
4     tableau       sas    excel
5         aws   tableau      sas
6       spark       aws  tableau
7         sas     spark     java
8  tensorflow     excel    spark
9     pytorch  power bi      aws
10      azure     azure   hadoop

*/