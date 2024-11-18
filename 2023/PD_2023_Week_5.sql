
with Month_Rank as
(
select split_part(transaction_code,'-',1) as bank
,monthname(to_date(transaction_date,'dd/mm/yyyy hh:mi:ss')) as _Month_
,sum(value) as Total_value
,RANK() OVER (PARTITION BY _month_ ORDER BY total_value DESC) as Rank_That_Month



from pd2023_wk01
group by bank,_month_
order by _month_, Rank_That_Month

), Avg_Rank as
(select avg(Rank_That_Month)
,bank
from 
Month_Rank
group by bank



)
select *
from avg_rank

