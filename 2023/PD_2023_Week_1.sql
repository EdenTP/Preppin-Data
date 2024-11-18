select 
split_part(transaction_code,'-',1) as Bank,
replace(replace(online_or_in_person,'1','Online'),'2','In-Person') as ONLINE_OR_IN_PERSON,
dayname(to_date(left(transaction_date,10),'dd/mm/yyyy')) as dayoftheweek,
value
from pd2023_wk01;

select
split_part(transaction_code,'-',1) as Bank,
sum(value) as Value
from pd2023_wk01
group by Bank;

select
split_part(transaction_code,'-',1) as Bank,
replace(replace(online_or_in_person,'1','Online'),'2','In-Person') as ONLINE_OR_IN_PERSON,
dayname(to_date(left(transaction_date,10),'dd/mm/yyyy')) as dayoftheweek,
sum(value) as Value,
from pd2023_wk01
group by Bank,ONLINE_OR_IN_PERSON,dayoftheweek;

select
split_part(transaction_code,'-',1) as Bank,
customer_code,
sum(value) as Value,
from pd2023_wk01
group by Bank,customer_code;