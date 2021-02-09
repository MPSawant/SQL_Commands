-- query to get empname,empnumber,sal,deptname,location from emp with employee id 7499
declare
v_empno emp.empno%type;
v_ename emp.ename%type;
v_sal emp.sal%type;
v_dname dept.dname%type;
v_loc  dept.loc%type;
begin
select ename,empno,sal,dname,loc into v_ename,v_empno,v_sal,v_dname,v_loc from emp join dept on emp.deptno=dept.deptno where empno=7499;
dbms_output.put_line(v_ename||v_empno||v_sal||v_dname||v_loc);
end;
/



--##USER DEFINED DATATYPE
--create V_UD_RES (not case sensitive) as a dataype. Create v_RES variable with V_UD_RES as datatype.

  1  declare
  2  type V_UD_RES is RECORD(empno number(10),
  3  ename varchar2(20),            --static datatype allocation
  4  sal number(10,2),
  5  dname dept.dname%type,         --reference datatpe allocation
  6  loc dept.loc%type);
  7  v_RES v_UD_RES;
  8  begin
  9  select e.empno,ename, sal,dname,loc into v_RES from emp e natural join dept where empno=7566;
 10  dbms_output.put_line(v_RES.ename||' '||v_RES.empno||' '||v_RES.sal||' '||v_RES.dname||' '||v_RES.loc);
 11* end;
 12  /
JONES 7566 2975 RESEARCH DALLAS                                               --output






  1  declare
  2  v_a number;
  3  v_b number;
  4  v_c number;
  5  begin
  6  v_a:=&v_a;
  7  v_b:=&v_b;
  8  v_c:=&v_c;
  9  if(v_a=v_b and v_a=v_c)
 10  then
 11  dbms_output.put_line('all three numbers are equal' );
 12     else if(v_a>v_b and v_a>v_c)
 13     then
 14             dbms_output.put_line(v_a||' is greater than '||v_b||' and '||v_C );
 15     else if (v_b>v_c) then
 16             dbms_output.put_line(v_b||' is greater than '||v_a||' and '||v_C);
 17     else
 18             dbms_output.put_line(v_c||' is greater than '||v_b ||' and '||v_a);
 19  end if;
 20  end if;
 21  end if;
 22* end;
 23  /
Enter value for v_a: 5
old   6: v_a:=&v_a;
new   6: v_a:=5;
Enter value for v_b: 4
old   7: v_b:=&v_b;
new   7: v_b:=4;
Enter value for v_c: 3
old   8: v_c:=&v_c;
new   8: v_c:=3;
5 is greater than 4 and 3

PL/SQL procedure successfully completed.

--SWITCH CASE
declare
a number(3);
b number(3);
c varchar2(5);
begin
a:=&a;
b:=&b;
c:='&c';
case c
when 'add' then dbms_output.put_line(a+b);
when 'multiply' then dbms_output.put_line(a*b);
when 'sub' then dbms_output.put_line(a-b);
else
dbms_output.put_line('invalid option');
end case;
end;
/
--output
Enter value for a: 7
old   6: a:=&a;
new   6: a:=7;
Enter value for b: 5
old   7: b:=&b;
new   7: b:=5;
Enter value for c: sub
old   8: c:='&c';
new   8: c:='sub';
2

PL/SQL procedure successfully completed.





--LOOPS
(to get infinite loop, dont write exit when statement)

  1  declare
  2  v_i number:=1;
  3  begin
  4  loop
  5  dbms_output.put_line(v_i);
  6  v_i:=v_i+1;
  7  exit when (v_i=10);
  8  end loop;
  9* end;
 10  /
1
2
3
4
5
6
7
8
9

--WHILE LOOP
 1  declare
  2  v_i number:=1;
  3  begin
  4  while v_i<=10 loop
  5  dbms_output.put_line(v_i);
  6  v_i:=v_i+1;
  7  end loop;
  8* end;
  9  /
1
2
3
4
5
6
7
8
9
10

PL/SQL procedure successfully completed.

--to print on one line-> use put() and (put_line() at the end outside the loop);


--------------------------------------
FOR LOOP
--------------------------------------
SQL> edit
Wrote file afiedt.buf

  1  declare
  2  v_i number:=1;
  3  begin
  4  for i in 1..10 loop
  5  dbms_output.put_line(i);
  6  end loop;
  7* end;
  8  /
1
2
3
4
5
6
7
8
9
10

PL/SQL procedure successfully completed.

--reverse order

SQL> edit
Wrote file afiedt.buf

  1  declare
  2  v_i number:=1;
  3  begin
  4  for i in reverse 1..10 loop
  5  dbms_output.put_line(i);
  6  end loop;
  7* end;
SQL> /
10
9
8
7
6
5
4
3
2
1

PL/SQL procedure successfully completed.

------increment/decrement by 2 (use mod)

SQL> edit
Wrote file afiedt.buf

  1  declare
  2  v_i number:=1;
  3  begin
  4  for i in reverse 1..10 loop
  5  if mod(i,2)=1 then
  6  dbms_output.put_line(i);
  7  end if;
  8  end loop;
  9* end;
SQL> /
9
7
5
3
1

PL/SQL procedure successfully completed.

SQL>


-- CURSOR 1.Implicit cursor


  1  declare
  2  begin
  3  update emp set sal=1.01*sal where deptno=20;
  4  if sql%found then                                    -- sql is the default name given to the dml query cursor. 
  5  dbms_output.put_line(sql%rowcount);                  -- get no. of rows affected by query
  6  end if;
  7* end;
SQL> /
5                                                         --output: five records updated

PL/SQL procedure successfully completed.





--2.Explicit CURSOR
SQL> declare
  2  cursor c1 is select * from emp;            -- c1 is name of userdefined cursor. cursor points to the data fetched from emp
  3  v_res emp%rowtype;                         --copy rowtype
  4  begin
  5  open c1;                                   -- cursor name c1
  6  loop
  7  fetch c1 into v_res;                       -- copy c1 into v_res
  8  exit when c1%notfound;                     -- loop until there are records
  9  dbms_output.put_line(v_res.empno||' '||v_res.ename||' '||v_res.sal);
 10  end loop;
 11  close c1;                                   -- close cursor
 12  end;
 13  /                                            -- execute plsql
7369 SMITH 816.08
7499 ALLEN 1600
7521 WARD 1250
7566 JONES 3034.8
7654 MARTIN 1250
7698 BLAKE 2850
7782 CLARK 2450
7788 SCOTT 3060.3
7839 KING 5000
7844 TURNER 1500
7876 ADAMS 1122.11
7900 JAMES 950
7902 FORD 3060.3
7934 MILLER 1300

PL/SQL procedure successfully completed.


--Q. get empno,ename,sal of all emop from emp using explicit cursor and store enpno,ename,sal into %type variables and display


  1  declare
  2  cursor c1 is select ename,empno,sal from emp;
  3  v_ename emp.ename%type;
  4  v_empno emp.empno%type;
  5  v_sal emp.sal%type;
  6  begin
  7  open c1;
  8  loop
  9  fetch c1 into v_ename,v_empno,v_sal;
 10  exit when c1%notfound;
 11  dbms_output.put_line(v_empno||' '||v_ename||' '||v_sal);
 12  end loop;
 13  close c1;
 14* end;
SQL> /
7369 SMITH 816.08
7499 ALLEN 1600
7521 WARD 1250
7566 JONES 3034.8
7654 MARTIN 1250
7698 BLAKE 2850
7782 CLARK 2450
7788 SCOTT 3060.3
7839 KING 5000
7844 TURNER 1500
7876 ADAMS 1122.11
7900 JAMES 950
7902 FORD 3060.3
7934 MILLER 1300

PL/SQL procedure successfully completed.



--CURSOR with PARAMETERS
--OUTPUT the empno and ename of the employees with dept no 20

  1  declare
  2  cursor c4(v_deptno number) is select * from emp                  --pass deptno as parameter . select query returns the records having deptno=20
  3  where deptno=v_deptno;
  4  v_res emp%rowtype;               
  5  begin
  6  open c4(20);                                                     --pass 20 as deptno. OR can declare a variable and use '&' operator to accept user input at runtime.
  7  loop
  8  fetch c4 into v_res;
  9  exit when c4%notfound;
 10  dbms_output.put_line(v_res.empno||' '||v_res.ename||' ');
 11  end loop;
 12  close c4;
 13* end;
SQL> /
7369 SMITH
7566 JONES
7788 SCOTT
7876 ADAMS
7902 FORD

PL/SQL procedure successfully completed.


--using FOR loop

 1  declare
  2  cursor c4 is select * from emp;
  3  begin
  4  for v_res in c4 loop
  5  dbms_output.put_line(v_res.empno||' '||v_res.ename||' ');
  6  end loop;
  7* end;


---------------------------------------------------------------------------------
EXCEPTION HANDLING
---------------------------------------------------------------------------------
1. Invalid number exception

  1  declare
  2  a varchar2(20);
  3  begin
  4  select 'mnn'+10 into a from dual;
  5  exception
  6  when invalid_number then
  7  dbms_output.put_line('please perform valid calculation');
  8* end;
  9  /
please perform valid calculation

2. value_error : entered value higher than precision or scale. or incorrect value for given datatype
3. zero_divide
4. no_data_found

---more than one exception check:

declare
a number(2);
b number(2);
c number(2);
begin
a:=&a;
b:=&b;
c=a/b;
exception
when invalid_number then
dbms_output.put_line('please enter valid data');
when zero_divide then
dbms_output.put_line('divide by zero error');
when others then
dbms_output.put_line('ERROR found :'||SQLERRM||SQLCODE);                --to print error msg and error code
end;
/

--------------------------------------
USER DEFINED EXCEPTIONs
--------------------------------------
--Q. Raise an exception if the user is not eligible to vote

declare
v_age number(3);
v_age_exp exception;
begin
v_age:=&v_age;
if v_age<18 then
raise v_age_exp;
end if;
exception
when v_age_exp then
dbms_output.put_line('age should be equal to or greater than 18 to vote');
end;
/

---EX2 using raise_application_error. the error code shud be between -(20,000 and 20,999). other error codes are already assigned to system defined exceptions.

declare
v_age number(3);
v_age_exp exception;
begin
v_age:=&v_age;
if v_age<18 then
raise_application_error(-20008,'Age should be equal to and greater than 18 to vote');
end if;
dbms_output.put_line('valid age');
end;
/
--output

SQL> /
Enter value for v_age: 1
old   5: v_age:=&v_age;
new   5: v_age:=1;
declare
*
ERROR at line 1:
ORA-20008: Age should be equal to and greater than 18 to vote
ORA-06512: at line 7


--here ORA-20008 is the user defined error code.






-----------PRoCEDure
------------------


create or replace procedure emp_cursor(v_dno number)
is
v_eno emp.empno%type;
v_en emp.ename%type;
v_sa emp.sal%type;
cursor c1 is select empno, ename, sal from emp where deptno=v_dno;
begin
open c1;
loop
fetch c1 into v_eno,v_en,v_sa;
exit when c1%notfound;
dbms_output.put_line(v_eno||' '||v_en);
end loop;
close c1;
end emp_cursor;
cl scr;
/




---------------------------procedure to return value   make use of out keyword
  1  create or replace procedure prod_add1(a in number, b in number,c out number)
  2  is
  3  v_res number(3);
  4  begin
  5  v_res:=a+b;
  6  c:=v_res;
  7* end;
SQL> /

---calling procedure
declare
v_res number(20);
begin
prod_add1(2,3,v_res);
dbms_output.put_line('sum of two numbers is '|| v_res);
end;
/


----- to insert a row using procedure
SQL> select * from emp11;

no rows selected

SQL> create or replace procedure proc_insert(empno number, ename varchar2,sal number)
  2  is
  3  begin
  4  insert into emp11 values (empno,ename,sal);
  5  end;
  6  /

Procedure created.

SQL> execute proc_insert(3333,'Mansi',3333);

PL/SQL procedure successfully completed.

SQL> select * from emp11;

     EMPNO ENAME             SAL
---------- ---------- ----------
      3333 Mansi            3333


---------------also use commit because insert is dml statement

