create database ss2_xay_dung_CSDL;
use ss2_xay_dung_CSDL;
create table customer(
cID int not null primary key auto_increment,
cName varchar(45) not null,
cAge int not null
);

create table product(
pID int not null primary key auto_increment,
pName varchar(50) not null,
pPrice double not null
);

create table `order`(
oID int not null primary key auto_increment,
cID int not null,
foreign key (cID) references customer(cID),
oDate date not null,
oTotalPrice double
);

create table Orderdetail(
oID int not null,
pID int not null,
primary key (oID,pID),
foreign key (oID) references `order`(oID),
foreign key (pID) references product(pID),
odQTY varchar(125)
);