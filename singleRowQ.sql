--1. Display ename,salaries and display names in lower case ?
select lower(ename),sal from emp;

--2. convert all ename from uppercase to lowercase in table ? 
update emp set ename=lower(ename);

--3. Display employee records whose whose name constain 5 characters ?
select ename from emp where length(ename)=5;

--4.
select SUBSTR('hello',2,4) FROM DUAL;
--ello

--5.
SELECT SUBSTR('hello welcome',-5,4) FROM DUAL;
--lcom