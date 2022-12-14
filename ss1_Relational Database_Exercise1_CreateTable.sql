/*Bài tập 1: tạo bảng dữ liệu mới*/
CREATE DATABASE student_management;
/*tạo bảng có tên là class*/
CREATE TABLE class (
id int,
name varchar(255)
);
/*tạo bảng có tên là teacher*/
CREATE TABLE teacher (
id int,
name varchar(255),
age int,
country varchar(255)
);