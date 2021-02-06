--1. Arrange employee records in ascending order of their sal 
 select * from emp order by sal;

--2. Arrange employee records in descending order of their sal 
 select * from emp order by sal desc;

--3. Display employee records working for 10th dept and arrange the result in ascending order of their sal 
select * from emp where deptno=10 order by sal desc;

--4. Arrange employee records in ascending of their deptno and with in dept arrange records in descending order of their sal 
select * from emp order by deptno,sal desc;

--5.  Arrange employee records in descending order of their comm. if comm . Is null then arrange those records last 
 select * from emp order by comm desc nulls last;