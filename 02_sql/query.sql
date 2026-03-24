select f as 'Группа',
case
    when f="I" then 'от 0 до 10'
    when f="II" then 'от 11 до 15'
    when f="III" then 'от 16 до 27'
    else 'больше 27'
end as 'Интервал',
count(*) as 'Количество' 
from (
select
case
    when count(distinct step_id) <= 10 then "I"
    when count(distinct step_id) <= 15 then "II"
    when count(distinct step_id) <= 27 then "III"
    else "IV"
end as 'f'
from step_student
where result='correct'
group by student_id) q
group by f
order by f;
