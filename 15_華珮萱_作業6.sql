-- 1. 顯示和Blake同部門的所有員工之姓名和進公司日期。
select ename, hiredate
from emp
where deptno = (select deptno from emp 
where ename="Blake");

-- 2. 顯示所有在Blake之後進公司的員工之姓名及進公司日期。
select ename, hiredate
from emp
where hiredate >any (select hiredate from emp where hiredate="2011-05-01");

-- 3. 顯示薪資比公司平均薪資高的所有員工之員工編號,姓名和薪資，並依薪資由高到低排列。
select empno, ename, sal
from emp
where sal>any (select avg(sal) from emp)
order by sal desc;

-- 4. 顯示和姓名中包含 T 的人在相同部門工作的所有員工之員工編號和姓名。
select empno, ename
from emp
where deptno = any (select deptno from emp where ename like "%T%");

-- 5. 顯示在Dallas工作的所有員工之姓名, 部門編號和職稱。
select e.ename, e.deptno, e.job 
from emp e 
join dept d on e.deptno = d.deptno
where d.loc = "DALLAS";

-- 6. 顯示直屬於”King”的員工之姓名和薪資。
select e.ename, e.sal
from emp e 
join emp b on e.mgr = b.empno
where b.ename ="King";

-- 7. 顯示銷售部門”Sales” 所有員工之部門編號,姓名和職稱。
select e.deptno, e.ename, e.job
from emp e
join dept d on e.deptno = d.deptno
where dname = "Sales";

-- 8. 顯示薪資比公司平均薪資還要高且和名字中有 T 的人在相同部門上班的所有員工之員工編號,姓名和薪資。
select empno, ename, sal
from emp 
where sal > (select avg(sal) from emp) and deptno in (select deptno from emp where ename like"%T%" );

-- 9. 顯示和有賺取佣金的員工之部門編號和薪資都相同的員工之姓名,部門編號和薪資。
select e.ename, e.deptno, e.sal
from emp e
join emp b on b.comm >0 and e.ename!= b.ename and e.sal=b.sal;

-- 10.顯示和在Dallas工作的員工之薪資和佣金都相同的員工之姓名,部門編號和薪資。
select e.ename, e.deptno, e.sal
from emp e 
join emp b on e.ename != b.ename and e.sal=b.sal and ifnull(e.comm,0) = ifnull(b.comm,0) 
join dept d on e.deptno = d.deptno
where d.loc = "Dallas";

-- 11.顯示薪資和佣金都和Scott相同的所有員工之姓名,進公司日期和薪資。(不要在結果中顯示Scott的資料)
select e.ename, e.hiredate, e.sal, e.comm
from emp e 
join emp b on (e.ename!=b.ename) and e.sal = b.sal and ifnull(e.comm,0) = ifnull(b.comm,0)
where e.ename != "Scott";

-- 12.顯示薪資比所有職稱是”Clerk”還高的員工之姓名,進公司日期和薪資，並將結果依薪資由高至低顯示。
select ename, hiredate, sal
from emp
having sal > all (select MAX(sal) from emp where job = "CLERK")
order by sal desc;