-- Создаем таблицу доставки.
create table delivery (delivery_id serial primary key, 
address_id int references address(address_id) not null, 
delivery_date date not null, time_range text[] not null,
staff_id int references staff (staff_id) not null,
status del_status not null default 'в обработке',
last_update timestamp, create_date timestamp default now(),
deleted boolean not null default false);
-- Просмотр таблицы delivery
select * from delivery;
-- Ограничение внешнего ключа для столбца с доставкой в таблице заказов
alter table orders add constraint orders_delivery_fkey foreign key (delivery_id)
references delivery (delivery_id);
-- Изменение данных о заказах
insert into delivery (address_id, delivery_date, time_range, staff_id) 
values (102, '2022.02.25', array['10:00:00', '12:00:00'],2),
(34, '2022.02.23', array['11:00:00', '12:00:00'],2),
(35, '2022.02.23', array['10:00:00', '12:00:00'],4),
(36, '2022.02.25', array['10:00:00', '13:00:00'],1);
update orders 
set delivery_id = 1
where order_id = 1;
update orders 
set delivery_id = 2
where order_id = 2;
update orders 
set delivery_id = 3
where order_id = 3;
update orders 
set delivery_id = 4
where order_id = 4;
-- Просмотр таблицы orders
select * from orders;
-- Проверка связи таблиц при попытке удалить внешний ключ
delete from delivery where delivery_id = 1;
