--1. Display all information in the tables EMP and DEPT.
select * from emp;
select * from dept;

--2. Display only the hire date and employee name for each employee.
select hiredate,ename from emp;

--3. Display the hire date, name and department number for all clerks.
select hiredate,ename,deptno from emp where job='CLERK';

--4. Display the names and salaries of all employees with a salary greater than 2000.
select ename,sal from emp where sal>2000;

--5. Display the names of all employees with an `A' in their name
 select ename from emp where ename like '%A%';

--6. Display the names of all employees with exactly 5 letters in their name.
 select ename from emp where length(ename)=5;

--7. Display the names and hire dates of all employees hired in 1981 or 1982
select ename,hiredate from emp where hiredate like '%81' or hiredate like '%82';


--8. Display the names and dates of employees with the column headers \Name" and \Start Date"
select ename as "NAME", hiredate as "START DATE" from emp;

--9. Display the names and hire dates of all employees in the order they were hired.
select ename,hiredate from emp order by hiredate;

--10. Display the names and salaries of all employees in reverse salary order.
select ename,sal from emp order by sal desc;

--11. Display `ename of department deptno earned commission $' for each salesman in reverse salary order
 select ename||deptno||comm as "EMP DATA" from emp order by sal desc;

--12. Display the department numbers of all departments employing a clerk.
select d.dname,d.deptno from dept d, emp e where d.deptno=e.deptno and job='CLERK';