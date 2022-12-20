drop database if exists ss4_common_function;
create database ss4_common_function;
use ss3_student_management;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select max(credit) as 'max credit' from `subject`;

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select m.mark as 'max mark', s.* from mark m
join `subject` s where m.sub_id = s.sub_id and m.mark = (select max(mark) from mark);
-- select max(mark) from mark;

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select *, avg(m.mark) as avg_mark from student s
join mark m where m.student_id = s.student_id
group by s.student_id
order by m.mark desc;