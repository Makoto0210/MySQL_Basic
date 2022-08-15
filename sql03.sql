##創建公司資料庫 example

create table `employee`(
	`emp_id` int primary key,
    `name` varchar(20),
    `date` date,
    `sex` varchar(1),
    `salary` int , 
    `branch_id` int,
    `sup_id` int
);

##創建部門branch表格
create table `branch`(
	`branch_id` int primary key,
    `beanch_name` varchar(20) , 
    `manager_id` int,
    foreign key(`manager_id`) references `employee`(`emp_id`) on delete set null
);

##補設定foreign key
alter table `employee`
add foreign key(`branch_id`)
references `branch`(`branch_id`)
on delete set null;

alter table `employee`
add foreign key(`sup_id`)
references `employee`(`emp_id`)
on delete set null;


##創建客戶表格client
create table `client`(
	`client_id` int primary key,
    `client_name` varchar(20), 
    `phone` varchar(20)
);

##創建workwith表格  ##`emp_id` `client_id` 同時是primary 也是 foreign
create table `work_with`(
	`emp_id` int ,
    `client_id` int, 
    `total_sales` int,
    primary key(`emp_id`, `client_id`),
    foreign key(`emp_id`) references `employee`(`emp_id`) on delete cascade,
    foreign key(`client_id`) references `client`(`client_id`) on delete cascade
);


#建立公司資料
insert into `branch` values(1,'研發',null);
insert into `branch` values(2,'行政',null);
insert into `branch` values(3,'資訊',null);

insert into `employee` values(206,'小黃','1998-10-08','F',50000,1,null);
insert into `employee` values(207,'小綠','1999-09-10','M',29000,2,206);
insert into `employee` values(208,'小黑','2000-07-08','F',35000,3,206);
insert into `employee` values(209,'小白','2001-06-04','M',39000,3,207);
insert into `employee` values(210,'小蘭','2002-11-01','M',84000,1,207);

update `branch`
set `manager_id` = 206
where `branch_id` = 1;

update `branch`
set `manager_id` = 207
where `branch_id` = 2;

update `branch`
set `manager_id` = 208
where `branch_id` = 3;

insert into `client` values(400,'阿狗','25412121');
insert into `client` values(401,'阿貓','25515551');
insert into `client` values(402,'阿機','15165161');
insert into `client` values(403,'阿朱','88885551');
insert into `client` values(404,'阿牛','18165161');

insert into `work_with` values(206,'400','70000');
insert into `work_with` values(207,'401','24000');
insert into `work_with` values(208,'402','25412');
insert into `work_with` values(208,'403','24000');
insert into `work_with` values(210,'404','87000');