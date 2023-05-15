create database castady;
use castady;
create table vi_tri(
`ma_vi_tri` int not null primary key auto_increment ,
`ten_vi_tri` varchar(45)
);
create table trinh_do(
`ma_trinh_do` int not null primary key auto_increment,
`ten_trinh_do` varchar(45)
);
create table bo_phan(
`ma_bo_phan` int not null primary key auto_increment,
`ten_bo_phan` varchar(45)
);
create table nhan_vien(
`ma_nhan_vien` int not null primary key auto_increment,
`ho_ten` varchar(45) not null,
`ngay_sinh` date not null,
`so_cmnd` varchar(45) not null,
`luong` double not null,
`so_dien_thoai` varchar(45) not null,
`email` varchar(45),
`dia_chi` varchar(45),
`ma_vi_tri` int not null,
foreign key (ma_vi_tri) references vi_tri(ma_vi_tri),
`ma_trinh_do` int not null,
foreign key (ma_trinh_do) references trinh_do(ma_trinh_do),
`ma_bo_phan` int not null ,
foreign key (ma_bo_phan) references bo_phan(ma_bo_phan)

);
create table dich_vu_di_kem(
ma_dich_vu_di_kem int not null primary key auto_increment,
ten_dich_vu_di_kem varchar(45) not null,
gia double not null,
don_vi varchar(10) not null,
trang_thai varchar(45)
);
create table kieu_thue(
ma_kieu_thue int not null primary key auto_increment,
ten_kieu_thue varchar(45)
);
create table loai_dich_vu(
ma_loai_dich_vu int primary key auto_increment,
ten_loai_dich_vu varchar(45)
);
create table loai_khach(
ma_loai_khach int not null primary key auto_increment,
ten_loai_khach varchar(45)
);
create table dich_vu(
ma_dich_vu int not null primary key auto_increment,
ten_dich_vu varchar(45)not null,
dien_tich int,
chi_phi_thue double not null,
so_nguoi_toi_da int,
ma_kieu_thue int not null, 
foreign key(ma_kieu_thue)references kieu_thue(ma_kieu_thue),
ma_loai_dich_vu int not null, 
foreign key(ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu),
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi double,
so_tang int
);
create table khach_hang(
ma_khach_hang int not null primary key auto_increment,
ma_loai_khach int not null,
foreign key(ma_loai_khach)references loai_khach(ma_loai_khach),
ho_ten varchar(45) not null,
ngay_sinh date not null,
gioi_tinh bit(1) not null,
so_cmnd varchar(45) not null,
so_dien_thoai varchar(45),
email varchar(45),
dia_chi varchar(45) 
);
create table hop_dong(
ma_hop_dong int not null primary key auto_increment,
ngay_lam_hop_dong datetime not null,
ngay_ket_thuc datetime not null,
tien_dat_coc double not null,
ma_nhan_vien int not null,
foreign key (ma_nhan_vien) references nhan_vien(ma_nhan_vien),
ma_khach_hang int not null,
foreign key (ma_khach_hang)references khach_hang(ma_khach_hang),
ma_dich_vu int, FOREIGN KEY(ma_dich_vu) references dich_vu(ma_dich_vu)
);
create table hop_dong_chi_tiet(
ma_hop_dong_chi_tiet int not null primary key auto_increment,
ma_hop_dong int not null,foreign key(ma_hop_dong)references hop_dong(ma_hop_dong),
ma_dich_vu_di_kem int not null,foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem),
so_luong int not null
);
insert into vi_tri(ten_vi_tri)
values
 ("Lễ tân"),("Phục vụ"),("Chuyên viên"),("Giám sát"),("Quản lý"),("Giám đốc");

insert into trinh_do(ten_trinh_do)
values
("Trung cấp"),("Cao đẳng"),("Đại học"),("Sau đại học");

insert into bo_phan(ten_bo_phan)
values
 ("Sale-Mảketing"),("Hành chính"),("Phục vụ"),("Quản lý");

insert into nhan_vien(ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan)
values
("Mai Tài Lanh",19990505,123456789,12000,0987654321,"tailanh@gmail.com","Chưa Rõ",2,2,3),
("Trần Đình Sang Sảng",19990606,987654321,22000,0123456789,"sangsang@gmail.com","Đà Nẵng",3,3,4),
("Nguyễn Quốc La",19950707,123123123,20000,0123123123,"quocla@gmail.com","Chưa Rõ",3,2,3),
("Đặng Vũ Phu",19980808,123412341,21000,0123412341,"vuphu@gmail.com","Vũng Tàu",3,4,4),
("Võ Thái Dúi",19960909,121212121,23000,0121212121,"thaidui@gmail.com","KonTum",5,3,4),
("Nguyễn Vũ Nhây",19971010,101010101,24000,0101010101,"vunhay@gmail.com","Sài Gòn",4,2,1);

insert into loai_khach (ten_loai_khach)
values ("Diamond"),("Platinum"),("Gold"),("Silver"),("Member");

insert into khach_hang(ma_loai_khach, ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi)
values 
(1,"Nguyễn Đức Tính",19970628,1,987654321,0987654321,"ductinh@gmail.com","Quảng Ngãi"),
(2,"Trương Đình Ngọc Sang",19990606,1,123123123,0123123123,"ngocsang@gmail.com","Đà Nẵng"),
(3,"Mai PHước Tài",20001212,1,121212121,0121212121,"phuoctai@gmail.com","Quảng Trị"),
(2,"Nguyễn Hữu Quốc",19950112,1,123456789,0123456789,"huuquoc@gmail.com","Sầm Sơn"),
(1,"Đặng Tuấn Vũ",19990909,1,123412341,0123412341,"tuanvu@gmail.com","An Thiên Môn"),
(1,"Lê Minh Khuê",19970621,0,111111111,0123456789,"minhkhue@gmail.com","Đà Nẵng");

insert into hop_dong(ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
values 
(20230101120000,20230103120000,25000,1,1,1),
(20230202120000,20230204120000,30000,2,2,2),
(20230303120000,20230305120000,31000,1,2,1);
select * from hop_dong;

insert into dich_vu_di_kem(ten_dich_vu_di_kem, gia, don_vi, trang_thai)
values
("massage",25000,"Giờ","Ngon lành"),
("karaoke",15000,"Giờ","OkeLa"),
("thức ăn",5000,"Suất","Thượng hạng"),
("nước uống",2000,"Chai","Từ thiên nhiên"),
("thuê xe di chuyển",8000,"Lần","Chất lượng");
 
insert into hop_dong_chi_tiet(ma_hop_dong,ma_dich_vu_di_kem,so_luong)






