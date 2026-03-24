select concat(module.module_id, '.', 
              lesson.lesson_position, '.', 
              lpad(step.step_position, 2, '0'), ' ', 
              step_name) as 'Шаг'
from keyword
    inner join step_keyword using(keyword_id)
    inner join step using(step_id)
    inner join lesson using(lesson_id)
    inner join module using(module_id)
   
where keyword_name regexp 'MAX|AVG'
group by step_id
having count(keyword_name)>1
order by module.module_id, lesson.lesson_position;
