
##aggregation 聚合

select * from `employee`;
##取得員工人數(其實就是有幾筆資料(列))
select count(*) from `employee`;

##取得 1999-01-01 出生後的女性員工人數
select count(*) 
from `employee`
where `date` > '1999-01-01' and `sex` = 'F';

##取得所有員工平均薪水
select avg(`salary`) from `employee`;

##取得員工薪水總和
select sum(`salary`) from `employee`;

##取得最高薪水員工
select max(`salary`) from `employee`;

##取得最低薪水員工
select min(`salary`) from `employee`;

######################################################################################
#wildcard 萬用字元  %代表多個字元, _代表一個字元

#--1. 取得電話號碼尾數為335客戶
select * 
from `client`
where `phone` like '%161';


#--2. 取得字尾為狗的客戶
select * 
from `client`
where `client_name` like '%狗';

#--3.取得生日在12月員工
select * 
from `employee`
where `date` like '_____10%%';

select * 
from `branch`
