use caseStudy;
-- task 16
set sql_safe_updates = 0;

delete from  nhan_vien
where nhan_vien.ma_nhan_vien not in(
select count(hop_dong.ma_hop_dong),nhan_vien.ma_nhan_vien
from nhan_vien left join  hop_dong on
nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
where year(hop_dong.ngay_lam_hop_dong) in (2019,2020,2021)
group by nhan_vien.ma_nhan_vien
) ;

set sql_safe_updates = 1;

-- task 17

update khach_hang
set ten_loai_khach = 1
where khach_hang.ma_khach_hang = (
select ifnull(sum(dich_vu.chi_phi_thue + ifnull((dich_vu_di_kem.gia * hop_dong_chi_tiet.so_luong),0)),0) as tong_tien, khach_hang.ma_khach_hang
from hop_dong join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
join khach_hang on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
join loai_khach on loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
where year(hop_dong.ngay_lam_hop_dong) = 2021 and loai_khach.ten_loai_khach = "platinum"
group by khach_hang.ma_khach_hang
having tong_tien > 10000000);

-- task 18

delete from khach_hang
where khach_hang.ma_khach_hang = (
select khach_hang.ma_khach_hang,khach_hang.ho_ten
from khach_hang join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
where year(hop_dong.ngay_lam_hop_dong) < 2021
);

-- task 19
update dich_vu_di_kem
set gia = gia*2
where dich_vu_di_kem.ma_dich_vu_di_kem = (
select sum(hop_dong_chi_tiet.so_luong) as tong, dich_vu_di_kem.ma_dich_vu_di_kem
from hop_dong_chi_tiet join dich_vu_di_kem on
hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
join hop_dong on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
where year(hop_dong.ngay_lam_hop_dong) = 2020
group by dich_vu_di_kem.ma_dich_vu_di_kem
having tong > 10
);

-- task 20
select nv.ma_nhan_vien as id ,nv.ho_ten,nv.email,nv.so_dien_thoai,nv.ngay_sinh,nv.dia_chi
from nhan_vien nv
union
select kh.ma_khach_hang, kh.ho_ten,kh.email,kh.so_dien_thoai,kh.ngay_sinh,kh.dia_chi
from khach_hang kh

-- task 21
