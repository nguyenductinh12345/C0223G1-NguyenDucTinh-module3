create database quan_ly_ban_hang;
use quan_ly_ban_hang;
create table Customer (
cId int not null primary key auto_increment,
cName varchar(50),
cAge int
);

create table Product (
pId int not null primary key auto_increment,
pName varchar(50),
pPrice double
);

create table `Order` (
oId int not null primary key auto_increment,
cId int not null,
foreign key (cId) references Customer(cId),
oDate datetime,
oTotalPrice double
);

create table OrderDetail (
oId int not null,
pId int not null,
primary key(oId,pId),
foreign key (oId) references `Order`(oId),
foreign key (pId) references Product(pId),
odQTY int
);

insert into Customer (cName,cAge)
values ("Minh Quan",10),("Ngoc Oanh",20),("Hong Ha",50);

insert into `Order`(cId,oDate,oTotalPrice)
values(1,"2006-03-21",null),(2,"2006-03-23",null),(1,"2006-03-16",null);

insert into Product (pName,pPrice)
values ("May Giat",3), ("Tu Lanh",5), ("Dieu Hoa",7), ("Quat",1), ("Bep Dien",2);

insert into OrderDetail(oId,pId,odQTY)
values (1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);

select oId,oDate,oTotalPrice
from `Order`;

select Customer.cName,Product.pName
from Customer 
join `Order` on Customer.cId = `Order`.cId
join  OrderDetail on `Order`.oId = OrderDetail.oId
join Product on OrderDetail.pId = Product.pId;

select Customer.cName
from Customer
left join `Order` on Customer.cId = `Order`.cId
left join OrderDetail on `Order`. oId = OrderDetail.oId
where OrderDetail.pId is null ;

select `Order`.oId as Ma_order, `Order`.oDate as Ngay_order, sum( odQTY * pPrice) as tong
from `Order`
join OrderDetail on `Order`.oId = OrderDetail.oId
join Product on OrderDetail.pId = Product.pId
group by `Order`.oId;