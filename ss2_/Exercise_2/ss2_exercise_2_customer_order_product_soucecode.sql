drop 
  database if exists ss2_customer_order_product;
create database ss2_customer_order_product;
use ss2_customer_order_product;

create table customer(
  id int primary key, 
  cus_name varchar(50), 
  age int
);
create table `order`(
  id int, 
  cus_id int, 
  primary key(id, cus_id), 
  order_date date, 
  total_price float, 
  foreign key(cus_id) references customer(id)
);
create table product(
  id int auto_increment primary key, 
  proct_name varchar(50), 
  proct_price float
);
create table order_detail(
  order_id int, 
  product_id int, 
  primary key(order_id, product_id), 
  order_quantity int, 
  foreign key(order_id) references `order`(id), 
  foreign key(product_id) references product(id)
);

insert into product 
values 
  (1, 'carrot', 23);
select 
  * 
from 
  product;
