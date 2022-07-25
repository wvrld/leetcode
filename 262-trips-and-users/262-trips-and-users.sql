# Write your MySQL query statement below
select t.Request_at as Day,
       round (cast(sum(case when t.Status = 'completed' then 0 else 1 end) as float) / count(t.Status), 2) as 'Cancellation Rate' 
from trips t
  left join users u1 ON t.Client_ID = u1.Users_Id
  left join users u2 ON t.Driver_ID = u2.Users_Id
where Request_at between '2013-10-01' and '2013-10-03' 
  and u1.Banned = 'No'
  and u2.Banned = 'No'
group by t.Request_at