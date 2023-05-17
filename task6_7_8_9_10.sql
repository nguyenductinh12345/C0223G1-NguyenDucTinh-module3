use caseStudy;
 
 -- task 6
 
select  dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich ,dich_vu.chi_phi_thue
from dich_vu where dich_vu.ma_dich_vu not in (select dich_vu.ma_dich_vu
												from dich_vu
												join loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
												join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
												where ((month(ngay_lam_hop_dong) in (1, 2, 3)and year(ngay_lam_hop_dong) = 2021))
group by dich_vu.ma_dich_vu);

-- task 7

select dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich,dich_vu.so_nguoi_toi_da, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
from dich_vu join loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
 where dich_vu.ma_dich_vu not in (select dich_vu.ma_dich_vu
from dich_vu
join loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
where year(ngay_lam_hop_dong) = 2021);
-- cach hay hơn
select dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich,dich_vu.so_nguoi_toi_da, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
from dich_vu
join loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
where exists (select * from hop_dong
where hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
and year(ngay_lam_hop_dong) = 2020
) and not exists(select * from hop_dong
where hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
and year(ngay_lam_hop_dong) = 2021
) group by dich_vu.ma_dich_vu;


-- task 8
-- cach 1
select ho_ten from khach_hang
group by khach_hang.ho_ten;

-- cach 2
select distinct ho_ten from khach_hang;

-- cach 3
select ho_ten from khach_hang
union
select ho_ten from khach_hang;

-- task 9
select month(ngay_lam_hop_dong) as thang,count(ma_khach_hang) as lan_thue
from hop_dong 
where year(ngay_lam_hop_dong) = 2021
group by thang
order by thang;

-- task 10

select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc,
 ifnull(sum(hdct.so_luong), 0) as so_luong_dich_vu_di_kem
from hop_dong hd
left join hop_dong_chi_tiet hdct
on hd.ma_hop_dong = hdct.ma_hop_dong
left join dich_vu_di_kem dvdk
on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by hd.ma_hop_dong;

