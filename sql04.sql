
##取得員工資料
select * from `employee`;

##取得客戶資料
select * from  `client`;

##取得員工資料依照薪水高低
select * from  `employee` order by `salary`;

##取得薪水前三高員工
select * 
from  `employee` 
order by `salary` 
limit 3 ;       ##限制只取前三高，desc代表由大到小 ; asc代表由小到大

##取得所有員工名字
select `name`     ##select放資料屬性 from放從哪個資料 
from  `employee`;

##取得所有員工性別 有重複
select `sex`     ##select放資料屬性 from放從哪個資料 
from  `employee`;
##取得所有員工性別 不重複
select distinct `sex`     ##寫一個dictinct 就會讓資料唯一化
from  `employee`;