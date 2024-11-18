select 
regexp_replace(regexp_replace(model,'[0-9]',''),'/') as Brand
,bike_type
,sum(quantity) as Quantity_sold
,sum(quantity*value_per_bike) as Order_value
,avg(value_per_bike) as Avg_Bike_Value_per_Brand

from pd2021_wk02_bike_sales
group by Brand,BIKE_TYPE;



select 
regexp_replace(regexp_replace(model,'[0-9]',''),'/') as Brand
,store
,sum(quantity) as Quantity_sold
,sum(quantity*value_per_bike) as Order_value
,avg(datediff(day,to_date(order_date,'DD/MM/YYYY'),to_date(shipping_date,'DD/MM/YYYY'))) as Avg_Days_to_Ship

from pd2021_wk02_bike_sales
group by Brand,store
