drop
database if exists cs1_module_3;
create database cs1_module_3;
use cs1_module_3;

set foreign_key_checks = 0;
set global sql_mode = '';
create table vi_tri (
    ma_vi_tri int primary key,
    ten_vi_tri varchar(45)
);

create table trinh_do (
    ma_trinh_do int primary key,
    ten_trinh_do varchar(45)
);

create table bo_phan (
    ma_bo_phan int primary key,
    ten_bo_phan varchar(45)
);

create table nhan_vien (
    ma_nhan_vien int primary key,
    ho_ten varchar(45) not null,
    ngay_sinh date not null,
    so_cmnd varchar(45) not null,
    luong double not null,
    so_dien_thoai varchar(45) not null,
    email varchar(45),
    dia_chi varchar(45),
    ma_vi_tri int not null,
    ma_trinh_do int not null,
    ma_bo_phan int not null,
    foreign key (ma_vi_tri)
        references vi_tri (ma_vi_tri),
    foreign key (ma_bo_phan)
        references bo_phan (ma_bo_phan),
    foreign key (ma_trinh_do)
        references trinh_do (ma_trinh_do)
);


create table loai_khach (
    ma_loai_khach int primary key,
    ten_loai_khach varchar(45)
);

create table khach_hang (
    ma_khach_hang int primary key,
    ma_loai_khach int not null,
    ho_ten varchar(45) not null,
    ngay_sinh date not null,
    gioi_tinh bit(1) not null,
    so_cmnd varchar(45) not null,
    so_dien_thoai varchar(45) not null,
    email varchar(45),
    dia_chi varchar(45),
    foreign key (ma_loai_khach)
        references loai_khach (ma_loai_khach)
);

create table loai_dich_vu (
    ma_loai_dich_vu int primary key,
    ten_loai_dich_vu varchar(45)
);

create table kieu_thue (
    ma_kieu_thue int primary key,
    ten_kieu_thue varchar(45)
);

create table dich_vu (
    ma_dich_vu int primary key,
    ten_dich_vu varchar(45) not null,
    dien_tich int,
    chi_phi_thue double not null,
    so_nguoi_toi_da int,
    ma_kieu_thue int not null,
    ma_loai_dich_vu int not null,
    tieu_chuan_phong varchar(45),
    mo_ta_tien_nghi_khac varchar(45),
    dien_tich_ho_boi double,
    so_tang int,
    dich_vu_mien_phi_di_kem text,
    foreign key (ma_kieu_thue)
        references kieu_thue (ma_kieu_thue),
    foreign key (ma_loai_dich_vu)
        references loai_dich_vu (ma_loai_dich_vu)
);

create table hop_dong (
    ma_hop_dong int primary key,
    ngay_lam_hop_dong datetime not null,
    ngay_ket_thuc datetime not null,
    tien_dat_coc double not null,
    ma_nhan_vien int not null,
    ma_khach_hang int not null,
    ma_dich_vu int not null,
    foreign key (ma_nhan_vien)
        references nhan_vien (ma_nhan_vien),
    foreign key (ma_khach_hang)
        references khach_hang (ma_khach_hang),
    foreign key (ma_dich_vu)
        references dich_vu (ma_dich_vu)
);

create table dich_vu_di_kem (
    ma_dich_vu_di_kem int primary key,
    ten_dich_vu_di_kem varchar(45) not null,
    gia double not null,
    don_vi varchar(10) not null,
    trang_thai varchar(45)
);

create table hop_dong_chi_tiet (
    ma_hop_dong_chi_tiet int primary key,
    ma_hop_dong int not null,
    ma_dich_vu_di_kem int not null,
    so_luong int not null,
    foreign key (ma_hop_dong)
        references hop_dong (ma_hop_dong),
    foreign key (ma_dich_vu_di_kem)
        references dich_vu_di_kem (ma_dich_vu_di_kem)
);

-- SET @@global.sql_mode= 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';

insert into khach_hang (
  ma_khach_hang, ho_ten, ngay_sinh, 
  gioi_tinh, so_cmnd, so_dien_thoai, 
  email, dia_chi, ma_loai_khach
) 
values (
    '1', 'Nguyễn Thị Hào', '1970-11-07', 
    '0', '643431213', '0945423362', 'thihao07@gmail.com', 
    '23 Nguyễn Hoàng, Đà Nẵng', 5
  );
  
insert into khach_hang (
  ma_khach_hang, ho_ten, ngay_sinh, 
  gioi_tinh, so_cmnd, so_dien_thoai, 
  email, dia_chi, ma_loai_khach
) 
values (
    '2', 'Phạm Xuân Diệu', '1992-08-08', 
    '1', '865342123', '0954333333', 'xuandieu92@gmail.com', 
    'K77/22 Thái Phiên, Quảng Trị', 3
  );
  
insert into khach_hang (
  ma_khach_hang, ho_ten, ngay_sinh, 
  gioi_tinh, so_cmnd, so_dien_thoai, 
  email, dia_chi, ma_loai_khach
) 
values (
    '3', 'Trương Đình Nghệ', '1990-02-27', 
    '1', '488645199', '0373213122', 'nghenhan2702@gmail.com', 
    'K323/12 Ông Ích Khiêm, Vinh', 1
  );
  
insert into khach_hang (
  ma_khach_hang, ho_ten, ngay_sinh, 
  gioi_tinh, so_cmnd, so_dien_thoai, 
  email, dia_chi, ma_loai_khach
) 
values (
    '4', 'Dương Văn quan', '1981-07-08', 
    '1', '543432111', '0490039241', 'duongquan@gmail.com', 
    'K453/12 Lê Lợi, Đà Nẵng', 1
  );
  
insert into khach_hang (
  ma_khach_hang, ho_ten, ngay_sinh, 
  gioi_tinh, so_cmnd, so_dien_thoai, 
  email, dia_chi, ma_loai_khach
) 
values (
    '5', 'Hoàng Trần Nhi Nhi', '1995-12-09', 
    '0', '795453345', '0312345678', 'nhinhi123@gmail.com', 
    '224 Lý Thái Tổ, Gia Lai', 4
  );
  
insert into khach_hang (
  ma_khach_hang, ho_ten, ngay_sinh, 
  gioi_tinh, so_cmnd, so_dien_thoai, 
  email, dia_chi, ma_loai_khach
) 
values (
    '6', 'Tôn Nữ Mộc Châu', '2005-12-06', 
    '0', '732434215', '0988888844', 'tonnuchau@gmail.com', 
    '37 Yên Thế, Đà Nẵng', 4
  );
  
insert into khach_hang (
  ma_khach_hang, ho_ten, ngay_sinh, 
  gioi_tinh, so_cmnd, so_dien_thoai, 
  email, dia_chi, ma_loai_khach
) 
values (
    '7', 'Nguyễn Mỹ Kim', '1984-04-08', 
    '0', '856453123', '0912345698', 'kimcuong84@gmail.com', 
    'K123/45 Lê Lợi, Hồ Chí Minh', 1
  );
  
insert into khach_hang (
  ma_khach_hang, ho_ten, ngay_sinh, 
  gioi_tinh, so_cmnd, so_dien_thoai, 
  email, dia_chi, ma_loai_khach
) 
values (
    '8', 'Nguyễn Thị Hào', '1999-04-08', 
    '0', '965656433', '0763212345', 'haohao99@gmail.com', 
    '55 Nguyễn văn Linh, kon Tum', 3
  );
  
insert into khach_hang (
  ma_khach_hang, ho_ten, ngay_sinh, 
  gioi_tinh, so_cmnd, so_dien_thoai, 
  email, dia_chi, ma_loai_khach
) 
values (
    '9', 'Trần đại Danh', '1994-07-01', 
    '1', '432341235', '0643343433', 'danhhai99@gmail.com', 
    '24 lý Thường Kiệt, Quảng Ngãi', 1
  );
  
insert into khach_hang (
  ma_khach_hang, ho_ten, ngay_sinh, 
  gioi_tinh, so_cmnd, so_dien_thoai, 
  email, dia_chi, ma_loai_khach
) 
values (
    '10', 'Nguyễn Tâm Đắc', '1989-07-01', 
    '1', '344343432', '0987654321', 'dactam@gmail.com', 
    '22 Ngô Quyền, Đà Nẵng', 2
  );
select * from khach_hang;