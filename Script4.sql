-- Агрегация и группировка
-- Данные по сумме платежей, среднему платежу, мин и макс платежам и количеству платежей 
-- с группировкой по пользователям
select c.first_name , c.last_name , sum(amount) , min(amount) , max(amount) , avg(amount) 
from customer c 
join orders o on o.customer_id = c.customer_id 
group by c.customer_id;
-- Данные платежей по пользователям, сумма , мин, мах, количество платежей, размер платежа больше
-- 100 , сумма платежей больше 20000
select c.first_name , c.last_name , sum(amount) , min(amount) , max(amount) , avg(amount) 
from customer c 
join orders o on o.customer_id = c.customer_id 
where amount > 100
group by c.customer_id
having sum(amount) > 20000;