use create_table;

-- Task 2: Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select 
  * 
from 
  nhan_vien 
where 
  (ho_ten like 'H%') 
  or (ho_ten like 'T%') 
  or (ho_ten like 'K%') 
  and (
    ho_ten between 1 
    and 15
  );
  
-- Task 3: Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
-- select * from khach_hang where ((dia_chi like '%Đà Nẵng%') or (dia_chi like '%Quảng Trị%')) and (year(curdate()) - year(ngay_sinh) between 18 and 50);
select 
  * 
from 
  khach_hang 
where 
  (
    (dia_chi like '%Đà Nẵng%') 
    or (dia_chi like '%Quảng Trị%')
  ) 
  and (
    round(
      datediff(
        curdate(), 
        ngay_sinh
      ) / 365, 
      0
    ) between 18 
    and 50
  );
  
-- Task 4: Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select 
  *, 
  count(kh.ma_khach_hang) as so_lan_dat_phong 
from 
  khach_hang kh 
  join loai_khach lk 
where 
  lk.ma_loai_khach = kh.ma_loai_khach 
  join hop_dong hd 
where 
  hd.ma_khach_hang = kh.ma_khach_hang 
where 
  ten_loai_khach = 'Diamond' 
group by 
  ma_khach_hang 
order by 
  so_lan_dat_phong;
  
-- Task 5: 5.Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: 
-- Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
-- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select 
  kh.ma_khach_hang, 
  kh.ho_ten, 
  lk.ten_loai_khach, 
  sum(
    chi_phi_thue + hdct.so_luong * dvdk.gia
  ) as tong_tien 
from 
  hop_dong hd 
  left join hop_dong_chi_tiet hdct 
where 
  hdct.ma_hop_dong = hd.ma_hop_dong 
  left join dich_vu_di_kem dvdk 
where 
  dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem 
  left join khach_hang kh 
where 
  kh.ma_khach_hang = hd.ma_khach_hang 
  left join loai_khach lk 
where 
  lk.ma_loai_khach = kh.ma_loai_khach 
  left join dich_vu dv 
where 
  dv.ma_dich_vu = hd.ma_dich_vu 
group by 
  hd.ma_hop_dong, 
  kh.ma_khach_hang 
order by 
  hd.ma_hop_dong desc, 
  kh.ma_khach_hang;
