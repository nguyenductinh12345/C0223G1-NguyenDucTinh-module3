create database ss2_chuyen_doi_ERD;
use ss2_chuyen_doi_ERD;

create table SĐT(
SĐT varchar(13) not null primary key
);

create table PHIEUXUAT(
SoPX int not null primary key auto_increment,
NgayXuat date not null
);

create table VATTU(
MaVTU int not null primary key auto_increment,
TenVTU varchar(50) not null
);

create table PHIEUNHAP(
SoPN int not null primary key auto_increment,
NgayNhap date not null
);

create table NHACC(
MaNCC int not null primary key auto_increment,
TenNCC varchar(50) not null,
DiaChi varchar(125) not null,
SĐT varchar(13) not null,
foreign key (SĐT) references SĐT(SĐT) 
);

create table DONDH (
SoDH int not null primary key auto_increment,
NgayDH date not null
);

create table chi_tiet_phieu_xuat(
SoPX int not null,
MaVTU int not null,
primary key (SoPX,MaVTU),
foreign key (SoPX) references PHIEUXUAT(SoPX),
foreign key (MaVTU) references VATTU(MaVTU),
DGXuat varchar(125) not null,
SLXuat varchar(25) not null
);

create table chi_tiet_phieu_nhap(
MaVTU int not null,
SoPN int not null,
primary key (MaVTU,SoPN),
foreign key (MaVTU) references VATTU(MaVTU),
foreign key (SoPN) references PHIEUNHAP(SoPN),
DGNhap varchar(125) not null,
SLNhap varchar(25) not null
);

create table chi_tiet_don_dat_hang(
MaVTU int not null,
SoDH int not null,
foreign key (SoDH) references DONDH(SoDH),
foreign key (MaVTU) references VATTU(MaVTU)
);

create table cung_cap(
SoDH int not null,
MaNCC int not null,
primary key (SoDH,MaNCC),
foreign key (SoDH) references DONDH(SoDH),
foreign key (MaNCC) references NHACC(MaNCC)
);