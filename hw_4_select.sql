use hw3;

select o.id, o.date, c.name, c.contact, c.address, c.city, c.postal_code, c.country, 
e.last_name, e.first_name, e.birthdate, e.photo, e.notes, sh.name, sh.phone, 
p.name, p.unit, p.price, sup.name, sup.contact, sup.address, sup.city, sup.postal_code, sup.country, sup.phone, 
cat.name, cat.description, od.quantity
from orders as o
inner join customers as c on c.id = o.customer_id
inner join employees as e on e.employee_id = o.employee_id
inner join shippers as sh on  sh.id = o.shipper_id
inner join order_details as od on o.id = od.order_id
inner join products as p on p.id = od.product_id
inner join suppliers as sup on sup.id = p.supplier_id
inner join categories as cat on cat.id = p.category_id;

select count(*) from orders as o
inner join customers as c on c.id = o.customer_id
inner join employees as e on e.employee_id = o.employee_id
inner join shippers as sh on  sh.id = o.shipper_id
inner join order_details as od on o.id = od.order_id
inner join products as p on p.id = od.product_id
inner join suppliers as sup on sup.id = p.supplier_id
inner join categories as cat on cat.id = p.category_id;

/*
В нашому випадку зміна inner join на rigth join чи left join нічого не змінює тому що ви всюди обираємо записи які є в усіх таблицях. 
*/

select e.employee_id, o.id, o.date, c.name, c.contact, c.address, c.city, c.postal_code, c.country, 
e.last_name, e.first_name, e.birthdate, e.photo, e.notes, sh.name, sh.phone, 
p.name, p.unit, p.price, sup.name, sup.contact, sup.address, sup.city, sup.postal_code, sup.country, sup.phone, 
cat.name, cat.description, od.quantity
from orders as o
inner join customers as c on c.id = o.customer_id
inner join employees as e on e.employee_id = o.employee_id
inner join shippers as sh on  sh.id = o.shipper_id
inner join order_details as od on o.id = od.order_id
inner join products as p on p.id = od.product_id
inner join suppliers as sup on sup.id = p.supplier_id
inner join categories as cat on cat.id = p.category_id
where e.employee_id > 3 and e.employee_id <= 10;

select cat.name, count(*) as count, avg(od.quantity) 
from orders as o
inner join customers as c on c.id = o.customer_id
inner join employees as e on e.employee_id = o.employee_id
inner join shippers as sh on  sh.id = o.shipper_id
inner join order_details as od on o.id = od.order_id
inner join products as p on p.id = od.product_id
inner join suppliers as sup on sup.id = p.supplier_id
inner join categories as cat on cat.id = p.category_id
group by cat.name
having avg(od.quantity) > 21
order by count desc
limit 1, 4;
