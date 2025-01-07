/*
Question: Do required skills change for different salary ranges?
 -Split job postings into three different salary ranges.
 -Count how many times each skill appeared in job postings.
 -Create a table with top 10 skills for each bracket.
*/

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



/*
          Top    Standard         Low
1         sql         sql       excel
2      python       excel         sql
3     tableau      python     tableau
4       excel     tableau      python
5           r    power bi    power bi
6    power bi           r         sas
7         sas         sas        word
8   snowflake  powerpoint           r
9  powerpoint        word  powerpoint
10       azure      oracle         go

*/