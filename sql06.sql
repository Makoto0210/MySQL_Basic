##union聯集

##1.員工名字 連集 客戶名字
select `name`
from `employee`
union
select `client_name`
from `client`
union
select `beanch_name`
from `branch`;


##2.員工ｉｄ　＋　員工名字　　ｕｎｉｏｎ　　客戶ｉｄ　＋　客戶名字
select `emp_id` as `ID`, `name` as `NAME` from `employee`
union
select `client_id`,`client_name` from `client`;

###############################################################################
##join 連接
select `emp_id`,`name`,`beanch_name`
from`employee`
join`branch`
on `employee`.`emp_id` = `branch`.`manager_id`;

###############################################################################
#subquery子查詢 (在搜尋語句中再包另一個搜尋語句)

#1.找研發部門經理名字
#先找在branch資料中 研發部門的經理id
select `manager_id` from `branch`
where `beanch_name` = '研發';

##在把找到的經理id丟回去員工資料找經理名稱
select `name` from `employee`
where `emp_id` = (
	select `manager_id` from `branch`
	where `beanch_name` = '研發'
);

##找出對單一位客戶銷售金額超過50000的員工名字
#先找在work with 中 金額超過5萬的員工id
select `emp_id`
from `work_with`
where `total_sales`>50000;

#在把上面找到的id丟進去員工table中找名字
select `name` from `employee`
where emp_id in (select `emp_id`
	from `work_with`
	where `total_sales`>50000);

