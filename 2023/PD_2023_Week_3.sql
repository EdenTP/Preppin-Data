with targets as (
  SELECT 
    * 
  FROM 
    pd2023_wk03_targets UNPIVOT (
      Target FOR Quarter IN (Q1, Q2, Q3, Q4)
    )
), 
Quarter_Values as (
  select 
    'Q' || quarter(
      to_date(
        left(transaction_date, 10), 
        'DD/MM/yyyy'
      )
    ) as quarter_clean, 
    split_part(transaction_code, '-', 1) as Bank, 
    case when online_or_in_person = 1 then 'Online' when online_or_in_person = 2 then 'In-Person' end as online_or_in_person, 
    sum(value) as value 
  from 
    pd2023_wk01 as tr 
  Where 
    bank = 'DSB' 
  group by 
    quarter_clean, 
    bank, 
    online_or_in_person
) 
select 
  q.online_or_in_person, 
  t.quarter, 
  value, 
  target as quarterly_targets, 
  value - quarterly_targets as variance_to_target 
from 
  quarter_values as q 
  left join targets as t on q.quarter_clean = t.quarter 
  and t.online_or_in_person = q.online_or_in_person;
