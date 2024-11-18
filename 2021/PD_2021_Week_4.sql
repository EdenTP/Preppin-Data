with Unioned as 
(select *,'Birmingham' as City from pd2021_wk03_birmingham
union
select *,'Leeds' from pd2021_wk03_leeds
union
select *,'London' from pd2021_wk03_london
union
select *,'Manchester' from pd2021_wk03_manchester
union
select *,'York' from pd2021_wk03_york),
Pivoted as
(
SELECT *,
from UNIONED
unpivot(
Sales for Product in
("New_-_Saddles","New_-_Bags","New_-_Mudguards","New_-_Wheels",
"Existing_-_Saddles","Existing_-_Bags","Existing_-_Mudguards","Existing_-_Wheels")
))
select
quarter(to_date("Date")) as "Quarter"
,split_part(product,'_',3) as "Product"
,sum(sales) as Products_Sold
from pivoted
group by "Quarter","Product"


