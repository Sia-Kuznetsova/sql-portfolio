SET @all_step = (SELECT COUNT(DISTINCT step_id) FROM step_student);

with cte_res_cor as (
select student_name, count(distinct step_id) as progress
from step_student
    inner join student using(student_id)
where result='correct'
group by student_name
order by 2 desc
)
select
    distinct student_name as 'Студент',
    round(progress/@all_step*100) as 'Прогресс',
    case
        when round(progress/@all_step*100) = 100 then 'Сертификат с отличием'
        when round(progress/@all_step*100) >= 80 then 'Сертификат'
        else ''
    end as 'Результат'
from student
    left join cte_res_cor using(student_name)
order by 2 desc, 1;
