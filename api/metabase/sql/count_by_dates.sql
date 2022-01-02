select
    date_format(tsh.created_at, '%Y/%m/%d') as dates,
    count(distinct t.id)
from `tasks` t
join `task_status_histories` tsh on t.id = tsh.task_id
where
    tsh.before_status = 2
and tsh.after_status = 3
and t.external_id != ''
group by dates
