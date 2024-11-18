select *,
split_part(store_bike,' - ',1) as Store
,replace(replace(replace(replace(replace(split_part(store_bike,' - ',2),'Mountaen','Mountain'),'Gravle','Gravel'),'Rowd','Road'),'Rood','Road'),'Graval','Gravel') as Bike
,dayofmonth(date) as Day_of_Month
,quarter(date) as Quarter,
from pd2021_wk01
where order_id>10
