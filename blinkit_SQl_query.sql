create database blinkit_data;
use blinkit_data;
select * from blinkit_grocery;

-- create a backup table 
create table blinkit_table like blinkit_grocery;

insert blinkit_table select * from blinkit_grocery;
-- DATA Cleaning
select * from blinkit_table;
update  blinkit_table
set `Item Fat Content`=	
case 
when `Item Fat Content` in ('LF','low fat') then 'Low Fat'
when `Item Fat Content`='reg' then 'Regular'
else `Item Fat Content`
end
;
-- find duplicated row
 with duplicaed as (select 
* ,
row_number()   over(partition by `Item Fat Content`	,`Item Identifier`,`Item Type`,`Outlet Establishment Year`,`Outlet Identifier`,
`Outlet Location Type`,`Outlet Size`,`Item Visibility`,`Item Weight`,`Sales`,`Rating`) as row_num
from blinkit_table)
select count(*) from duplicaed 
where row_num>1;
-- E-commerce order data mein agar Customer_ID, Product_ID, aur Order_Date same hai, to ho sakta hai ki customer ne same product baar-baar order kiya ho.

-- Reason: Business behavior ka part ho sakta hai.

-- Action: Domain knowledge se samjho ki duplicate ka matlab kya hai.

select `Item Fat Content`, count(`Item Fat Content`)  as count_item_fat_content from blinkit_table
group by  `Item Fat Content`;

-- Low_fat content is greater Regular content

select * from blinkit_table;
-- highest sale Item
select `Item Type`, count(`Item Identifier`) from blinkit_table
group by `Item Type` order by count(`Item Identifier`) desc ;

-- count the outlet location type per outlet
select `Outlet Location Type` ,count(`Outlet Location Type`) from blinkit_table
group by `Outlet Location Type`;
-- count which size oulet are most ;
select `Outlet Size` , count(`Outlet Size`) from blinkit_table
group by `Outlet Size`;

-- count outlet type;
select `Outlet Type`, count(`Outlet Type`) from  blinkit_table
group by `Outlet Type`;


-- total_sales and avg_sales and percent and avg rating find for Item Fat Content
select `Item Fat Content`, round(sum(sales),2) as tota_sales ,round (avg(sales),2) as avg_sales, 
round((sum(sales)*100/sum(sum(sales))over() ) ,2) as percent, avg(Rating) as avg_rating from  blinkit_table
group by `Item Fat Content`;


--  item type  aggregation
select `Item Type`, round(sum(sales),2) as tota_sales ,round (avg(sales),2) as avg_sales, 
round((sum(sales)*100/sum(sum(sales))over() ) ,2) as percent, avg(Rating) as avg_rating from  blinkit_table
group by `Item Type`order by  tota_sales desc;

select * from blinkit_table;
select `Outlet Establishment Year`, `Item Type`, round(sum(sales),2) as tota_sales ,round (avg(sales),2) as avg_sales, 
round((sum(sales)*100/sum(sum(sales))over() ) ,2) as percent, avg(Rating) as avg_rating from  blinkit_table

group by `Outlet Establishment Year`, `Item Type`  order by  tota_sales desc;

-- Total_sales by outlet LOcation type
select * from blinkit_table;
select `Outlet Location Type`,`Outlet Size`, round(sum(sales),2) from blinkit_table
group by `Outlet Location Type` , `Outlet Size`order by 2 desc;



SELECT 
  `Outlet Location Type`,
  ROUND(SUM(CASE WHEN `Outlet Size` = 'Small' THEN Sales ELSE 0 END), 2) AS Small_Sales,
  ROUND(SUM(CASE WHEN `Outlet Size` = 'Medium' THEN Sales ELSE 0 END), 2) AS Medium_Sales,
  ROUND(SUM(CASE WHEN `Outlet Size` = 'High' THEN Sales ELSE 0 END), 2) AS High_Sales,
  ROUND(SUM(Sales), 2) AS Total_Sales
FROM 
  blinkit_table
GROUP BY 
  `Outlet Location Type`
ORDER BY 
  Total_Sales DESC;
 --  find the most visibility item
select `Item Type`, count(`Item Visibility`) from blinkit_table
group by `Item Type`
order by  count(`Item Visibility`) desc ;
-- most of salesing item 
select `Item Type`, round(sum(sales),2) as total_Sales, avg(Rating) as avg_rating  from blinkit_table
group by `Item Type` order by total_Sales,avg_rating desc;

