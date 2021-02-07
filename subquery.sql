--1. Display the names and job titles of all employees with the same job as Jones.
 select e.ename,e.job from emp e where e.job in (select job from emp where ename='JONES') and e.ename!='JONES';

--2. Display the names and department name of all employees working in the same city as Jones.
select ename, deptno from emp where deptno in(select deptno from dept where loc in (select loc from dept where deptno in (select deptno from emp where ename='JONES')));
-- need of nested queery bcoz there can be two depts in same city.
-- query evaluated as JONES->DEPTNO->CITY->DEPTNO of ALL depts in that city-> EMPNAME of all the employess working in those depts


--3.Display the name of the employee whose salary is the lowest.
select ename from emp where sal in( select min(sal) from emp);


--4. Display the names of all employees except the lowest paid.
select ename from emp where sal not in( select min(sal) from emp);

--5. Display the names of all employees whose job title is the same as anyone in the sales dept.
select ename,job from emp where job in (select job from emp where deptno in (select deptno from dept where dname='SALES'));

--6.Display the names of all employees who work in a department that employs an analyst.
 select ename from emp where deptno in ( select deptno from emp where job='ANALYST');


--7.Display the names of all employees with their job title,
--  their current salary and their salary following a 10% pay 
--  rise for clerks and a 7% pay rise for all other employees

select job,sal,(10*sal/100 + sal) from emp where job='CLERK' union (select job,sal,(7*sal/100 + sal) from emp where job!='CLERK');

--8. Display the names of all employees with their salary and
-- commission earned. Employees with a null
--   commission eld should have 0 in the commission column.

select ename,sal,nvl(comm,0) as COMM from emp;

--9. Display the names of ALL employees with the total they have earned (ie. salary plus commission).
select ename, (sal+nvl(comm,0)) as total from emp;

