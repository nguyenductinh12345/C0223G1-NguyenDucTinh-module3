use caseStudy;
-- task 11
 -- select distinct dich_vu_di_kem.* , khach_hang.dia_chi
 -- from dich_vu_di_kem
 -- join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
 -- join hop_dong on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
 -- join khach_hang on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
 -- join loai_khach on loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
 -- where exists (select * from loai_khach where loai_khach.ten_loai_khach = "diamond") and exists
 -- (select * from khach_hang where khach_hang.dia_chi in ("Vinh" or "Quảng Ngãi"));
 
 select  dich_vu_di_kem.* , khach_hang.dia_chi
 from dich_vu_di_kem
 join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
 join hop_dong on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
 join khach_hang on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
 join loai_khach on loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
 where khach_hang.dia_chi like "%Vinh" or  khach_hang.dia_chi like "%Quảng Ngãi"
 and loai_khach.ten_loai_khach ="Diamond";
 
 -- task 12
 select hd.ma_hop_dong, nv.ho_ten, kh.ho_ten, kh.so_dien_thoai, dv.ten_dich_vu,hd.tien_dat_coc,
 ifnull(sum(dvdk.ma_dich_vu_di_kem),0) as so_luong_dich_vu_di_kem
 from hop_dong hd
 left join nhan_vien nv on nv.ma_nhan_vien = hd.ma_nhan_vien
 left join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
 left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
 left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
 left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
 where month(ngay_lam_hop_dong) in(10,11,12) and year(ngay_lam_hop_dong)=2020
 and dv.ma_dich_vu not in (
 select hd.ma_dich_vu from hop_dong hd where month(hd.ngay_lam_hop_dong) in(1,2,3,4,5,6) and year(hd.ngay_lam_hop_dong)=2021
)
 group by hd.ma_hop_dong;
 
 -- task 13
 
 select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, ifnull(sum(hdct.so_luong),0) as tong_so_lan_su_dung
 from dich_vu_di_kem dvdk join hop_dong_chi_tiet hdct 
 on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
 join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
 join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
 group by (dvdk.ma_dich_vu_di_kem)
 having tong_so_lan_su_dung = (
  select ifnull(sum(hdct.so_luong),0) as tong_so_lan_su_dung
 from dich_vu_di_kem dvdk join hop_dong_chi_tiet hdct 
 on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
 join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
 join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
 group by dvdk.ma_dich_vu_di_kem 
 order by tong_so_lan_su_dung desc
 limit 1
 );
 
 -- task 14
 
  select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, ifnull(count(hdct.so_luong),0) as tong_so_lan_su_dung
 from dich_vu_di_kem dvdk join hop_dong_chi_tiet hdct 
 on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
 join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
 join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
 group by (dvdk.ma_dich_vu_di_kem)
 having tong_so_lan_su_dung = 1;

-- task 15

select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, 
nv.so_dien_thoai, nv.dia_chi, count(hd.ma_nhan_vien) as so_luong_hop_dong_lap_duoc
from nhan_vien nv join trinh_do td on td.ma_trinh_do = nv.ma_trinh_do
join bo_phan bp on bp.ma_bo_phan = nv.ma_bo_phan
join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
group by nv.ma_nhan_vien
having so_luong_hop_dong_lap_duoc<= 3;

