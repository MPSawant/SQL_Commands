--1.Display employee records whose name ends with s 
select ename from emp where ename like '%S';

--2. Display employee records whose name doesn't contain s
select ename from emp where ename not like '%S%';

--3. Display employee records where A is the second char in the name
select * from emp where ename like '_A%';

--4. Display employee records who are joined in JAN month 
select * from emp where hiredate like '%JAN%';

--5. Display employee records who are joined in 1981 year
select * from emp where hiredate like '%81';

--6. Display employee records who are joined in 1st 9 days
select * from emp where hiredate like '0%';
select * from emp where substr(hiredate,1,2)<=9;

--7. Display employee records who are earning 5 digit salary ?
select * from emp where length(sal)=5;
select * from emp where sal like '_____';

--8. Display employee records whose comm IS NULL
select * from emp where comm is null;

8. Display employee records whose comm IS NOT NULL
select * from emp where comm is not null;