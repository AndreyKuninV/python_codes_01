-- Персонал с зарплатой после учета налогов
select staff_id , first_name , last_name , salary -(salary *0.2)-(salary*0.13)-(salary*0.08)
from staff;
-- Пользователи с именами, начинающимися на B
select customer_id , first_name , last_name 
from customer
where first_name like 'B%';
-- Товар начинается на Д и заканчивается на 1
select product_id , product
from product
where product ilike 'д%1';
-- У Пользователей с именами, начинающимися на B, меняем B на X
select customer_id , first_name , last_name , overlay (first_name placing 'X' from 1 for 1)
from customer
where first_name like 'B%';
-- Получить год из даты 23.02.2022
select date_part('year','2022.02.23'::date) ;
-- Получить день из даты 23.02.2022
select date_part('day','2022.02.23'::date);
-- Получить месяц с учетом года из даты 23.02.2022
select date_trunc('month','2022.02.23'::date);
-- Получить день с учетом года из даты 23.02.2022
select date_trunc('day','2022.02.23'::date);

