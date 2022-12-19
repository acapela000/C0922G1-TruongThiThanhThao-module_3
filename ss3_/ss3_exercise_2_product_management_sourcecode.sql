drop
database if exists ss3_product_management;
create database ss3_product_management;
use ss3_product_management;

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

insert into customer 
values 
  (1,'Minh Quan',10),
  (2,'Ngoc Oanh',20),
  (3,'Hong Ha',50);

insert into `order` 
values 
  (1,1,'2006-3-21',null),
  (2,2,'2006-3-23',null),
  (3,1,'2006-3-16',null);

insert into product 
values 
  (1,'May Giat', 3),
  (2,'Tu Lanh',5),
  (3,'Dieu Hoa',7),
  (4,'Quat',1),
  (5,'Bep Dien',2);
  
  insert into order_detail 
values 
  (1,1,3),
  (1,3,7),
  (1,4,2),
  (2,1,1),
  (3,1,8),
  (2,5,4),
  (2,3,3);
  
  -- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select 
   id,order_date,total_price
from 
  `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select distinct
   cus_name, proct_name
from 
	customer c
join `order` o on o.cus_id = c.id
join order_detail od on od.order_id = o.id 
join product p on od.product_id = p.id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select 
    cus_name
from
    customer c
where
    not exists( select 
            *
        from
            `order` o
        where
            o.cus_id = c.id);
            
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn
-- được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
-- Giá bán của từng loại được tính = odQTY*pPrice) 

set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');
select        
	o.id, o.order_date, sum(od.order_quantity*p.proct_price) as total_price
from
	`order` o
join order_detail od on od.order_id = o.id
join product p on p.id = od.product_id
group by o.id;


