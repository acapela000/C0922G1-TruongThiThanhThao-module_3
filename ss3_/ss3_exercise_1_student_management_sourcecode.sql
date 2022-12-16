drop
database if exists ss3_quan_ly_sinh_vien;
create database ss3_quan_ly_sinh_vien;
use ss3_quan_ly_sinh_vien;

create table class (
    class_id int auto_increment primary key not null,
    class_name varchar(60) not null,
    start_date datetime not null,
    status bit
);

create table student (
    student_id int auto_increment primary key not null,
    student_name varchar(30) not null,
    address varchar(50),
    phone varchar(20),
    `status` bit,
    class_id int not null,
    foreign key (class_id)
        references class (class_id)
);

create table `subject` (
    sub_id int auto_increment primary key not null,
    sub_name varchar(30) not null,
    credit tinyint not null default 1 check (credit >= 1),
    `status` bit default 1
);

create table mark (
    mark_id int auto_increment primary key not null,
    sub_id int not null,
    student_id int not null,
    unique key (sub_id , student_id),
    mark float default 0 check (mark between 0 and 100),
    exam_times tinyint default 1,
    foreign key (sub_id)
        references `subject` (sub_id),
    foreign key (student_id)
        references student (student_id)
);

insert into class values (1,'A1','2008-12-20',1),(2,'A2','2008-12-22',1),(3,'B3','2022-10-16',0);
insert into student values (1,'Hung','Ha Noi','0912113113',1,1),(2,'Hoa','Hai Phong','',1,1),(3,'Manh','HCM','0123123123',0,2);
insert into `subject` values (1,'CF',5,1),(2,'C',6,1),(3,'HDJ',5,1),(4,'RDBMS',10,1);
insert into mark values (1,1,1,8,1),(2,1,2,10,2),(3,2,1,12,1);

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’.
select 
    student_name
from
    student
where
    student_name like 'h%';
    
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select 
  start_date 
from 
  class 
where 
  start_date like '%12%';
  
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select 
  * 
from 
  `subject` 
where 
  credit >= 3 
  and credit <= 5;
  
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
set 
  sql_safe_updates = 0;
update 
  student 
set 
  class_id = 2 
where 
  student_name = 'hung';
  
-- Hiển thị các thông tin: Studentname, SubName, Mark.
-- Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select 
  student_name, 
  sub_name, 
  mark 
from 
  mark m 
  join student s on m.student_id = s.student_id 
  join `subject` sub on sub.sub_id = m.sub_id 
order by 
  mark desc, 
  s.student_name asc;
  
select 
  * 
from 
  `subject`;
