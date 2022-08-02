-- Отношение стоимости товаров к стоимости единицы стоимости товаров
select opl.product_id , sum(o.amount) 
from orders o 
join order_product_list opl on o.order_id = opl.order_id 
group by opl.product_id;

select product_id , price 
from product p;
-- вариант 1
select t1.product_id , sum / price 
from (select opl.product_id , sum(o.amount) 
from orders o 
join order_product_list opl on o.order_id = opl.order_id 
group by opl.product_id) t1
join (select product_id , price 
from product p) t2 on t1.product_id = t2.product_id;

-- вариант 2
select t1.product_id , (sum / (select price 
from product p where t1.product_id = p.product_id)) as counting
from (select opl.product_id , sum(o.amount) 
from orders o 
join order_product_list opl on o.order_id = opl.order_id 
group by opl.product_id) t1;

-- Оконные функции
--
select distinct opl.product_id , sum(o.amount) over (partition by p.product_id) / price
from orders o 
join order_product_list opl on o.order_id = opl.order_id
join product p on p.product_id = opl.product_id;

-- Данные о каждом 1000-м заказе
select *
from 
(select order_id , customer_id , amount , 
row_number () over (order by order_id)
from orders o) t1
where t1.row_number%1000 = 0;

-- Накопительные суммы платежей по каждому пользователю
select order_id , customer_id , amount , 
sum(amount) over (partition by customer_id order by order_id)
from orders;

-- Представления
-- Последний заказ каждого пользователя
create view task_1 as 
select *
from 
( select order_id , customer_id , amount ,
row_number() over (partition by customer_id order by order_id desc)
from orders ) t1
where row_number = 1;

select * from task_1;

-- Последний заказ каждого пользователя, материализованное представление
create materialized view task_2 as 
select *
from 
( select order_id , customer_id , amount ,
row_number() over (partition by customer_id order by order_id desc)
from orders ) t1
where row_number = 1
with no data;
-- обновление материализованных данных
refresh materialized view task_2;
-- очистка материализованных данных
drop materialized view task_2;
-- использование материализованных данных
select * from task_2;





