--1.Display the name of each employee with his department name.
select e.ename,d.dname from emp e left join dept d on e.deptno=d.deptno;
--left join is used bcoz there can be a employee who is not yet assigned a dept still his records need to be retrieved.

--2.Display a list of all departments with the employees in each department.
select d.dname,nvl(e.ename,'no employee') as EmpName from dept d left join emp e on e.deptno=d.deptno;
--dept left join emp to display all the depts but not the emp who dont have any dept. Replace null values for emp with some message.

--3.Display all the departments with the manager for that department.
select d.dname,d.deptno,e.mgr,(select ename from emp where empno=e.mgr) as mgrName from dept d left join emp e on e.deptno=d.deptno group by e.mgr,d.deptno,d.dname;
-- displays dept name, dept no, manager for that dept and manager name. As per the table, one dept can have more than one manager. If group by or distinct keyword is not used then there will be redundant records in the output.

--OR

select distinct d.dname,d.deptno,e.mgr,(select ename from emp where empno=e.mgr) as mgrName from dept d left join emp e on e.deptno=d.deptno order by d.dname asc;
-- to group same dept , dept name wise.



--4.Display the names of each employee with the name of his/her boss.
select e1.ename,e1.mgr,e2.ename as mgrname from emp e1 join emp e2 on e1.mgr=e2.empno;



--5.Display the names of each employee with the name of his/her boss with a blank for the boss of the president.

select e.ename,e.mgr,(select ename from emp where empno=e.mgr) as mgrname  from emp e;
-- select query. IMP: to give alias to outer query table;

--OR
select e1.ename,e1.mgr,e2.ename as mgrname from emp e1 left join emp e2 on e1.mgr=e2.empno;
-- using left join. if only join is used then KING having no manager will not be listed


--6.Display the employee number and name of each employee who manages other employees with the number of people he or she manages.
select e.ename as mgrname,e.empno as mgrno,(select count(*) from emp where mgr=e.empno) as countemmp from emp e order by countemmp desc;
--doubt:how to remove records with 0 as count from output
--Solution: use one more select query to get columns as alias names.
select mgrname,mgrno,countemmp from (select e.ename as mgrname,e.empno as mgrno,(select count(*) from emp where mgr=e.empno) as countemmp from emp e order by countemmp desc) where countemmp>0;
--OR
select m.mgr,count(m.mgr) as noOfEmp,e.ename as mgrname from emp e join emp m on e.empno=m.mgr group by m.mgr,e.ename;

--7.Repeat the display for the last question, but this time display the rows in descending order of the number of employees managed.
select m.mgr,e.ename,count(m.mgr) as c from emp m join emp e on m.mgr=e.empno group by m.mgr,e.ename order by c desc;


