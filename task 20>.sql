use caseStudy;
-- task 21: .	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là
-- “Huế” và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “2020-07-14”.

create view v_nhan_vien as
select nv.*, hd.ngay_lam_hop_dong  from nhan_vien nv
join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
where nv.dia_chi like"%Huế" and hd.ngay_lam_hop_dong ="2020-07-14";

select * from v_nhan_vien;

-- task 22

update v_nhan_vien
set v_nhan_vien.dia_chi = "Liên Chiểu";

-- task 23 Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được
-- truyền vào như là 1 tham số của sp_xoa_khach_hang.

delimiter //
create procedure sp_xoa_khach_hang()
begin


