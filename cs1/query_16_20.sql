use create_table;

-- 16.Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
set sql_safe_updates = 0;

delete from nhan_vien nv
where 
nv.ma_nhan_vien not in (
select abc.ma_nhan_vien from 
(select nv.ma_nhan_vien,count(nv.ma_nhan_vien) as so_luong_hop_dong
from nhan_vien nv
join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien 
where year(hd.ngay_lam_hop_dong) in (2019,2020,2021)
group by nv.ma_nhan_vien
having so_luong_hop_dong >= 1
) abc) ;

  select * from nhan_vien;

-- 17.Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
update khach_hang 
set ten_loai_khach = 'Diamond'
 where (
select kh.ho_ten, sum(dv.chi_phi_thue + dvdk.gia*hdct.so_luong) as tong_tien_tt from khach_hang kh 
join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang 
join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
where year(hd.ngay_lam_hop_dong) = '2021' and lk.ten_loai_khach = 'Platinium'
group by kh.ma_khach_hang
having tong_tien_tt > 1000000);

-- 18.Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
set sql_safe_updates = 0;
delete from khach_hang kh
where kh.ma_khach_hang in (
select abc.ma_khach_hang from (
select kh.ma_khach_hang, hd.ngay_lam_hop_dong from khach_hang kh
join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
where year(hd.ngay_lam_hop_dong) = '2020'
group by kh.ma_khach_hang) abc)
;

-- 19.Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
update dich_vu_di_kem
set gia = 2*gia
where dvdk.ma_dich_vu_di_kem in (
select dvdk.ma_dich_vu_di_kem from (
select dvdk.ma_dich_vu_di_kem, count(hdct.so_luong) as so_lan_su_dung from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
where year(hd.ngay_lam_hop_dong) = '2020'
group by dvdk.ma_dich_vu_di_kem
having so_lan_su_dung > 10 
) )
;

-- 20.Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id 
-- (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select kh.ma_khach_hang as id, kh.ho_ten, kh.email, kh.so_dien_thoai, kh.ngay_sinh, kh.dia_chi from khach_hang kh
union all
select nv.ma_nhan_vien as id, nv.ho_ten, nv.email, nv.so_dien_thoai, nv.ngay_sinh, nv.dia_chi from nhan_vien nv;
