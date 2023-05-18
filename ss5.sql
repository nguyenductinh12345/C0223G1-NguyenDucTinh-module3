create database ss5;
use ss5;
create table Products( 
id int primary key auto_increment,
productCode varchar(50),
productName varchar(50),
productPrice double,
productAmount varchar(10),
productDescription varchar(50),
productStatus bit(1)
);
insert into products(productCode, productName, productPrice, productAmount, productDescription, productStatus)
value ("p01", "cá kho", 80, 5, "cá tươi roi rói", 1),
	  ("p02", "bún bò", 70, 3, "ngon nhất miền trung", 1),
	  ("p03", "bún riêu cua", 90, 6, "Siêu to", 0),
	  ("p04", "thịt kho hột vịt", 110, 10, "Siêu ngon siêu bổ", 1),
	  ("p05", "rau muống cháy tỏi", 35, 7, "Siêu xanh siêu ngon", 1);
 create unique index productCode_index on products (productCode);     
 
 create index composite_index on products(productName, productPrice);
 
 explain select * from products;
 
 create view product_view(pdCode,pdName,price,amount) as
 select productCode, productName, productPrice, productDescription
 from products;
 
 update product_view
 set price = 200
 where pdCode = "p02";
 
 select *
 from product_view;
 
 drop view product_view;
 
 delimiter //
 create procedure product_procedure()
 begin
 select * from products;
 end ;
 //delimiter ;
 
 call product_procedure;
      
delimiter //
create procedure add_product(`code` varchar(50),`name` varchar(50),price double, amount int
,`description` varchar(150),`status` bit)
begin
insert into product(product_code, product_name, product_price, product_amount, product_description, product_status)
value(`code`, `name`, price, amount, `description`, `status`);
end;
// delimiter ;
call add_product("p06","Bò viên",40,20,"Bò kobe",0);
delimiter //

create procedure edit_product(id int, `code` varchar(45), `name` varchar(45),
price double,amount int, `description` varchar(255), `status` bit)
begin
update product
set productCode = `code`, 
	productName = `name`,
	productPrice = price,
	productAmount = amount, 
	productDescription = `description`, 
	productStatus = `status`
where productId = id;
end;
// delimiter ;


delimiter //
create procedure delete_procedure(id int)
begin
delete from product
where productId = id;
end;
// delimiter ;

      
      