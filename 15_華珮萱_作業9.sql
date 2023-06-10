-- 1. 使用EMP資料表中的員工編號(empno),姓名(ename)及部門編號(deptno)來建立一個
-- EMP_VU view,並將姓名(ename)欄位名稱改成EMPLOYEE。
create view EMP_VU
AS
select empno, ename "Employee" , deptno
from emp;
DESC emp_vu;

-- 2. 顯示EMP_VU view中的資料內容。
select * from emp_vu;

-- 3. 使用EMP_VU view來顯示所有員工之姓名及部門編號。
select employee, deptno
from emp_vu;

-- 4. 新建一個名為 DEPT20的view, 包含在部門20的所有員工之員工編號，員工姓名，及部門
-- 編號。將View中的資料項目命名為 EMPLOYEE_ID, EMPLOYEE, and 
-- DEPARTMENT_ID。並設定不允許使用者透過 DEPT20 來更改員工所屬的部門編號。
create view dept20
AS
select empno EMPLOYEE_ID, ename EMPLOYEE, deptno DEPARTMENT_ID
From emp
where deptno =20;
DESC dept20;

-- 5. 顯示DEPT20 view的欄位定義資料(結構)及其所有資料內容。
select * from dept20;
DESC dept20;

-- 6. 試試看利用DEPT20 view將 Smith 轉調到部門30。
update dept20
set DEPARTMENT_ID=30
where employee="SMITH";

-- 7. 新建一個名為 SALARY_VU的view，包含所有員工之姓名，部門名稱，薪資和薪資等級。
-- 將View中的資料項目分別命名為 Employee, Department, Salary, Grade。
create view Salary_VU (Employee, Department, Salary, Grade)
as 
select e.ename, d.dname, e.sal, s.grade
from emp e
join dept d on d.deptno = e.DEPTNO
join salgrade s on e.sal between s.losal and s.hisal;
SELECT * FROM salary_vu;

-- 8. 在EMP資料表中利用ename欄位建立一個non-unique index 命名為idx_emp_ename。
create index idx_emp_ename on emp(ename);
SHOW INDEXES FROM emp;
