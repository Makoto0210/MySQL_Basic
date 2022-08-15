
##修改 刪除資料
set SQL_SAFE_UPDATES = 0;
create table `student02`(
	`id` int auto_increment,
    `name` varchar(20) , 
    `MAJOR` VARCHAR(20) ,  
    primary key(`id`)
);
INSERT INTO `student02`(`name`,`MAJOR`) values('阿7',"歷史");

select * from `student02`;


##修改資料  (把原本叫做英文的改為英語文學) 也可以改成如英文要改成生物等等，也可以合併兩個MAJOR成一個
update `student02`
set `MAJOR` = '化學'
where `MAJOR` = '英語文學' OR `MAJOR` = '國文';


#把id = 1 的資料整列更改 #注意分號只寫再最後一行
update `student02`
set `MAJOR` = '化學',`name`='阿華'
where `id` = 1 ;


##刪除資料
delete from `student02`
where `id` = 2 and `MAJOR` = '英文';


##突然想新增一筆分數資料
ALTER TABLE `student02`ADD score decimal(3,2);
update `student02`
set `score` = 4
where `id` = 5;


##取得OR搜尋資料select
#取得某指定屬性資料 並依照分數高低排序
SELECT * 
from `student02`
where `MAJOR` = '國文' or `score` > 4
order by `score`
limit 2; ##只回傳前兩筆

#取得資料 用in的寫法
SELECT * 
from `student02`
where `MAJOR` in ('國文','化學'); #相當於major='國文' or major = '化學'




















