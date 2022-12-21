drop 
database if exists ss5_demo;
create database ss5_demo;
use ss5_demo;
create table products(
  id int auto_increment primary key, 
  product_code varchar(45), 
  product_name varchar(45), 
  product_price int, 
  product_amount int, 
  product_description varchar(45), 
  product_status varchar(45)
);
insert into products 
values 
  (
    1, 'A1', 'Oppo', 400, 5, 'second-hand', 
    'sold-out'
  );
insert into products 
values 
  (
    2, 'A2', 'Blackberrry', 300, 3, 'new', 
    'on sales'
  );
insert into products 
values 
  (
    3, 'A3', 'Sony Ericson', 500, 4, 'second-hand', 
    'on sales'
  );
insert into products 
values 
  (
    4, 'A4', 'iPhone', 600, 2, 'second-hand', 
    'sold-out'
  );
insert into products 
values 
  (
    5, 'A5', 'Motorola', 800, 1, 'new', 'on sales'
  );
insert into products 
values 
  (
    6, 'A6', 'Xiaomi', 700, 5, 'new', 'on sales'
  );
insert into products 
values 
  (
    7, 'A7', 'iPhone', 900, 2, 'second-hand', 
    'on sales'
  );
------------------------------------------------------------------------------------
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index i_product_code on products(product_code);
-- Xóa index
-- alter table products drop index i_product_status;
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index p_name_price on products (product_name, product_price);
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL thực thi như nào
explain 
select 
  * 
from 
  products 
where 
  product_name = 'iPhone';
------------------------------------------------------------------------------------
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view view_products as 
select 
  product_code, 
  product_name, 
  product_price, 
  product_status 
from 
  products;
-- Tiến hành sửa đổi view
update 
  view_products 
set 
  product_status = 'OUT OF STOCK' 
where 
  product_name = 'Blackberrry';
select 
  * 
from 
  products;
-- Tiến hành xoá view
delete from 
  view_products 
where 
  product_name = 'iPhone' 
  and product_code = 'A4';
------------------------------------------------------------------------------------
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter $$ create procedure show_all_products() begin 
select 
  products.* 
from 
  products;
end $$ delimiter;
-- Tạo store procedure thêm một sản phẩm mới
delimiter $$ create procedure add_new_product() begin insert into products 
values 
  (
    'A8', 'GalaxySS', 1000, 3, 'new', 'checking'
  );
end $$ delimiter;
-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter $$ create procedure edit_product_by_id(
  in edit_id int, 
  p_code varchar(45), 
  p_name varchar(45), 
  p_price int, 
  p_amount int, 
  p_description varchar(45), 
  p_status varchar(45)
) begin 
update 
  products 
set 
  product_code = p_code, 
  product_name = p_name, 
  product_price = p_price, 
  product_amount = p_amount, 
  product_description = p_description, 
  product_status = p_status 
where 
  id = edit_id, 
  end // delimiter ;
call edit_product_by_id(
  1, 'B3', 'LG Promax', 700, 6, 'new', 
  'importing'
);
-- Tạo store procedure xoá sản phẩm theo id
delimiter $$ 
create procedure delete_product_by_id(in delete_id int) 
begin 
delete from 
  products 
where 
  id = delete_id
  end // delimiter ;
call delete_product_by_id(6);
