drop 
  database if exists ss2_erd_to_table;
create database ss2_erd_to_table;
use ss2_erd_to_table;

create table phieu_xuat(
  so_px int auto_increment primary key, 
  ngay_xuat date
);

create table vat_tu(
  ma_vtu int auto_increment primary key, 
  ten_vtu varchar(50)
);

create table chi_tiet_phieu_xuat(
  so_phieu_xuat int, 
  ma_vat_tu_px int, 
  primary key(so_phieu_xuat, ma_vat_tu_px), 
  don_gia_xuat float, 
  so_luong_xuat int, 
  foreign key(so_phieu_xuat) references phieu_xuat(so_px), 
  foreign key(ma_vat_tu_px) references vat_tu(ma_vtu)
);

create table phieu_nhap(
  so_pn int auto_increment primary key, 
  ngay_nhap date
);

create table chi_tiet_phieu_nhap(
  so_phieu_nhap int, 
  ma_vat_tu_pn int, 
  primary key(so_phieu_nhap, ma_vat_tu_pn), 
  don_gia_nhap float, 
  so_luong_nhap int, 
  foreign key(so_phieu_nhap) references phieu_nhap(so_pn), 
  foreign key(ma_vat_tu_pn) references vat_tu(ma_vtu)
);

create table nha_cung_cap(
  ma_nha_cc int auto_increment primary key, 
  ten_nha_cc varchar(50), 
  dia_chi varchar(50)
);

create table so_dt(
  nha_cc_sdt int, 
  sdt_nha int, 
  sdt_van_phong int, 
  primary key (nha_cc_sdt), 
  foreign key(nha_cc_sdt) references nha_cung_cap(ma_nha_cc)
);

create table don_dat_hang(
  ma_ncc_dondh int, 
  so_don_hang int, 
  primary key (so_don_hang, ma_ncc_dondh), 
  ngay_dat_hang date, 
  foreign key(
    ma_ncc_dondh
  ) references nha_cung_cap(ma_nha_cc)
);

insert into phieu_xuat (so_px, ngay_xuat) 
values 
  (5, '2022-12-12');
select 
  * 
from 
  phieu_xuat;
