create database pizza_db;
use pizza_db;
select* from pizza_sales;

describe pizza_sales;

#Total Revenue
select  sum(total_price) as Total_Revenue from pizza_sales;


#Average Order values
select sum(total_price)/count(distinct order_id) as Avg_order_value from pizza_sales;

#Total Pizza Sold
select sum(quantity) as Total_pizza_sold from pizza_sales;

#Total Order placed
select count(distinct order_id) as Total_order_placed from pizza_sales ;


#Average Pizzas pre-order

select round(count(quantity)/count( distinct order_id),2) as Avg_pizza_perorder from pizza_sales;


#Daily Trend for total order
SELECT DAYNAME(order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DAYNAME(order_date);

#Monthly trend for total order
select month(order_date) as order_month, count(distinct order_id) as total_orders
from pizza_sales
group by  order_month
order by total_orders Desc;

#Percentage of Sales by pizza category
select pizza_category,sum(total_price) as total_sales, sum(total_price)*100/(select sum(total_price) from pizza_sales) as PTC 
from pizza_sales
group by pizza_category;


select pizza_category,sum(total_price) as total_sales, sum(total_price)*100/(select sum(total_price) from pizza_sales where month (order_date)=1) as PTC 
from pizza_sales
where month (order_date)=1
group by pizza_category;

#Precentage of Sales by pizza size
select pizza_size,sum(total_price) as total_sales, sum(total_price)*100/(select sum(total_price) from pizza_sales) as PTC 
from pizza_sales
group by pizza_size
order by PTC DESC;


#Total pizza Sold by pizza Category
select Pizza_category,sum(quantity) as Total_pizza_Sold  from pizza_sales group by Pizza_category
ORDER BY Total_pizza_Sold DESC ;

#Top 5 Best Sellers by Revenue, Total Quality and Total Orders
select pizza_name, sum(total_price) as Total_revenue, sum(quantity) as Total_quantity, sum(distinct order_id) as Total_orders from pizza_sales
group by pizza_name 
order by Total_revenue DESC
limit 5;


SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC limit 5;


#Bottom 5 best sellers by Revenue, Total quantity and total orders

 

