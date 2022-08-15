#表格table 鍵代表key ， 設定primary key 可以將整筆資料做唯一區分，比方說學號。如果資料沒有任何一行是沒有重複的，就必須設定兩個以上的primarykey
#foreign key代表外鍵，可以是此筆資料的外鍵同時又是別的資料的primarykey，可以將foreignkey連接別張表格的primary甚至是自己表格的primary也可以，但一定要是連primarykey


#創建資料庫
create database `sql01`;
show databases;
use `sql01`;

#創建表格
	#INT -- 整數
	#DECIMAL(m,n) -- 有小數點的數
    #VARCHAR(n) -- 字串
    #BLOB -- 二維資料如圖片 影片 
    #DATE -- 日期
    #TIMESTAMP -- 紀錄時間
    
create table `student`(
	`id` int primary key,
    `name` varchar(20), 
    `MAJOR` VARCHAR(20)
);
DESCRIBE `student`; #刪除表格用 DROP TABLE `----`;

##新增屬性
ALTER TABLE `student`ADD gpa decimal(3,2);    #新增GPA屬性  #刪除屬性用ALTER TABLE `student` DROP gpa decimal(3,2);


##儲存資料INSERT
INSERT INTO `student` values(3,"許祐誠","數學",4);  #如果沒有要填某欄位就填null    #primary key 不能重複
INSERT INTO `student`(`gpa`,`name`,`MAJOR`,`id`) values(3,"許祐誠","數學",4); #有指定要填在哪一欄的寫法
##秀出資料
select * from `student`;



##constrain 限制/約束
drop table `student01`;
create table `student01`(
	`id` int auto_increment,
    `name` varchar(20) not null, 
    `MAJOR` VARCHAR(20) unique,  #如果把unique改成default'歷史' 則會將此欄屬性預設全部為歷史
    primary key(`id`)
);
		#INSERT INTO `student01` values(3,null,"數學")    ##會跑出column can not be null 也就是限制
INSERT INTO `student01` values(1,'阿成',"數學");
		#INSERT INTO `student01` values(3,'阿華',"數學")   ##第三列因為設了unique 因此不能再放一次數學
INSERT INTO `student01` values(2,'阿成',"國文");
INSERT INTO `student01`(`name`,`MAJOR`) values('阿成',"英文");

select * from `student01`;