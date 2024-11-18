with Full_Year as 
(
select *
,'January' as Month_Name
from pd2023_wk04_january
pivot(min(value) for demographic in ('Ethnicity','Account Type','Date of Birth'))

union

select *
,'February' as Month_Name
from pd2023_wk04_february
pivot(min(value) for demographic in ('Ethnicity','Account Type','Date of Birth'))

union

select *
,'March' as Month_Name
from pd2023_wk04_March
pivot(min(value) for demographic in ('Ethnicity','Account Type','Date of Birth'))

union

select *
,'April' as Month_Name
from pd2023_wk04_April
pivot(min(value) for demographic in ('Ethnicity','Account Type','Date of Birth'))

union

select *
,'May' as Month_Name
from pd2023_wk04_May
pivot(min(value) for demographic in ('Ethnicity','Account Type','Date of Birth'))

union

select *
,'June' as Month_Name
from pd2023_wk04_June
pivot(min(value) for demographic in ('Ethnicity','Account Type','Date of Birth'))
union

select *
,'July' as Month_Name
from pd2023_wk04_July
pivot(min(value) for demographic in ('Ethnicity','Account Type','Date of Birth'))

union

select *
,'August' as Month_Name
from pd2023_wk04_August
pivot(min(value) for demographiic in ('Ethnicity','Account Type','Date of Birth'))

union

select *
,'September' as Month_Name
from pd2023_wk04_September
pivot(min(value) for demographic in ('Ethnicity','Account Type','Date of Birth'))

union

select *
,'October' as Month_Name
from pd2023_wk04_October
pivot(min(value) for demagraphic in ('Ethnicity','Account Type','Date of Birth'))

union 

select *
,'November' as Month_Name
from pd2023_wk04_November
pivot(min(value) for demographic in ('Ethnicity','Account Type','Date of Birth'))

union

select *
,'December' as Month_Name
from pd2023_wk04_December
pivot(min(value) for demographic in ('Ethnicity','Account Type','Date of Birth'))
)

select ID
,TO_DATE(joining_day||'/'||Month_Name||'/'||2023, 'dd/mmmm/yyyy') as _date_
,'account_type' as Account_Type
,'date of birth' as DOB
,"'Ethnicity'" as Ethnicity
from full_year
