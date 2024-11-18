with Targets as 
(SELECT * 
FROM pd2023_wk03_targets
UNPIVOT( Target for Quarter_Column in (Q1,Q2,Q3,Q4)))

, table_1 as (select 

replace(replace(tr.online_or_in_person,1,'Online'),2,'In-Person') as Online_InPerson
,'Q'||quarter(to_date(transaction_date,'DD/MM/YYYY hh:mi:ss')) as "Quarter"
,sum(value) as Value_2
,min(t.target) as Quarterly_Target
,value_2-Quarterly_Target as Variance_to_Target

from pd2023_wk01 tr
inner join TARGETS t
on Quarter_Column="Quarter" and t.online_or_in_person=Online_InPerson

where left(transaction_code,3)='DSB'
group by "Quarter",Online_InPerson)


select 
Online_InPerson
,replace("Quarter",'Q','') as Quart
,Value_2
,Quarterly_Target
,Variance_to_Target
from table_1
