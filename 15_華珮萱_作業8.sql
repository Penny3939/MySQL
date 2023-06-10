-- 1. 利用下列資料來新建 DEPARTMENT 資料表。
Create TAble DEPARTMENT (
id int not Null ,
name varchar(24) not Null
);

-- 2. 利用DEPT資料表中的資料,將資料新增至DEPARTMENT 資料表中(只新增相對的資料欄)。
insert into Department(id,name)
select distinct(deptno), dname
from dept;

-- 3. 利用下列資料來新建 EMPLOYEE資料表。
create table EMPLOYEE(
id int not null,
last_name varchar(24) not null,
first_name varchar(24) null,
deptno int null
);

-- 4. 將EMPLOYEE資料表中last_name欄位的資料型態更改為 varchar(40)。
alter table Employee
modify column last_name varchar(40);

-- 5. 使用EMP資料表的結構中之EMPNO, ENAME,and DEPTNO之定義來新建EMPLOYEE2資料表並將
-- 欄位名稱設定為 ID, LAST_NAME, and DEPT_ID 。
create table Employee2( 
ID INT Not Null, 
LAST_NAME varchar(10) ,
DEPT_ID int Not Null
);

-- 6. 刪除整個EMPLOYEE資料表。
Drop table employee;

-- 7. 將EMPLOYEE2資料表改名為EMPLOYEE。
alter table employee2
rename to Employee;

-- 8. 將EMPLOYEE資料表中的LAST_NAME欄位刪除。
alter table Employee
drop Last_name;

-- 9. 修改EMPLOYEE資料表,新增一個欄位 SALARY 資料型態為 INT。
alter table employee
add Salary int;

-- 10. 修改EMPLOYEE資料表,使用ID 欄位新增一個Primary key的限制條件(constraint),並為他命名。
Alter table Employee
add constraint PK_employee_ID primary key(ID);

-- 11. 在EMPLOYEE資料表新增一個外來鍵(foreign key)以確保員工不會被分派到一個不存在的部門。
alter table Employee
add constraint FK_employee_deptid foreign key(dept_id)
references employee (id);



