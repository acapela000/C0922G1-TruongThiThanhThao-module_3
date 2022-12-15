/*Bài tập 1: tạo bảng dữ liệu mới*/
create database student_management;
/*tạo bảng có tên là class*/
create table class (
  id int,
  name varchar(255)
);
/*tạo bảng có tên là teacher*/
create table teacher (
  id int,
  name varchar(255),
  age int,
  country varchar(255)
);
