-- Какое количество платежей было совершено?
select count (*)
from orders o 
where o.amount is not null;
-- Какое количество товаров находится в категории “Игрушки”?
select c.category, count(*) 
from product p 
left join category c on p.category_id = c.category_id 
where lower(c.category) = 'игрушки'
group by category;
-- В какой категории находится больше всего товаров?
select c.category , count(*)
from product p 
left join category c on p.category_id = c.category_id 
group by category
order by count(*) desc;
-- Сколько “Черепах” купила Williams Linda?
select p.product , count(*) 
from orders o 
join customer c on o.customer_id = c.customer_id
join order_product_list opl on o.order_id = opl.order_id
join product p on opl.product_id = p.product_id  
where (lower(c.first_name) = 'linda' and lower(c.last_name) = 'williams')
and lower(p.product) like '%черепах%'
group by product;

