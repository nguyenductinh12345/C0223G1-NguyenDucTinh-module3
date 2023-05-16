use caseStudy;
-- task2

select *
from nhan_vien
where nhan_vien.ho_ten like "H%" 
or nhan_vien.ho_ten like "T%"
or nhan_vien.ho_ten like "K%"
and char_length(ho_ten)<=15;

-- task 3:

select * 
from khach_hang
where timestampdiff (year,ngay_sinh,curdate()) between 18 and 50
and dia_chi like "%Đà Nẵng"
or dia_chi like "%Quảng Trị";

-- task 4:

select khach_hang.ma_khach_hang,khach_hang.ho_ten,count(khach_hang.ma_khach_hang) as so_lan_dat_phong
from khach_hang
join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
where loai_khach.ten_loai_khach = "Diamond"
group by ma_khach_hang
order by so_lan_dat_phong;

-- task 5:

select khach_hang.ma_khach_hang, khach_hang.ho_ten, loai_khach.ten_loai_khach, hop_dong.ma_hop_dong,
dich_vu.ten_dich_vu, hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc,
ifnull(dich_vu.chi_phi_thue + ifnull( sum(dich_vu_di_kem.gia*hop_dong_chi_tiet.so_luong),0),0) as tong_tien
from khach_hang
left join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
left join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
left join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
group by khach_hang.ma_khach_hang , hop_dong.ma_hop_dong
order by khach_hang.ma_khach_hang;
