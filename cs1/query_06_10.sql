use create_table;

-- 6.Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được
-- khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select * from dich_vu dv
join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
where not exists (select * from khach_hang kh where kh.ma_khach_hang = hd.ma_khach_hang and quarter(ngay_lam_hop_dong) = 1);

-- 7.Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các
-- loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select * from dich_vu dv
join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang 
where year(ngay_lam_hop_dong) = '2020' 
and 
not exists (select * from hop_dong hd where hd.ma_dich_vu = dv.ma_dich_vu and year(ngay_lam_hop_dong) = '2021');

-- 8.Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
select kh.ho_ten from khach_hang kh
union 
select nv.ho_ten from nhan_vien nv;

-- 9.Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 
-- thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select *, sum(dv.chi_phi_thue+hdct.so_luong*dvdk.gia) as doanh_thu from hop_dong hd 
join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
where year(ngay_lam_hop_dong) = '2021' 
group by month(hd.ngay_lam_hop_dong);

-- 10.Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, sum(hdct.so_luong) as so_luong_dich_vu_di_kem from hop_dong hd 
join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
group by hd.ma_hop_dong;