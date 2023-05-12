CREATE database ss1_student;
USE ss1_student;
create table student(
`id` INT primary key not null AUTO_INCREMENT,
`name` VARCHAR(45) not null,
`age` int not null,
`country` varchar(45) not null
);
create table class(
`id` int primary key not null,
`name` varchar(45) not null
);
create table teacher(
`id` int primary key not null AUTO_INCREMENT,
`name` varchar(45) not null,
`age` int not null,
`country` varchar(45) not null
);

 