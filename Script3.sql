-- Выборка заказов по городам
select o.order_id , c.city 
from orders o 
join delivery d on o.delivery_id = d.delivery_id 
join address a on a.address_id = d.address_id 
join city c on c.city_id = a.city_id;
-- Выборка возможных комбинаций имен 
select c.first_name , c2.first_name 
from customer c
cross join customer c2 
where c.first_name != c2.first_name;
-- Список заказов, по которым не было доставки
select o.order_id , d.delivery_id
from orders o 
left join delivery d on o.delivery_id = d.delivery_id
where d.delivery_id is null; 

