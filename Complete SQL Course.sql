CREATE DATABASE college;
create database if not exists college;
use college;

create table student (
 id int primary key,
 Name varchar(20),
 age int not null
);

insert into student values(1,"Sehaj",22);
Insert into student values(2,"Preet",23);
insert into student
values(3,"Kamal",26),(4,"Sharda",24),(5,"Aman",26);
insert into student(id,Name,age)
values(6,"Komal",23),(7,"Shilpa",28),(8,"Anmol",26);

Select * from student;

show databases;
show tables;


-- Practice Qustion 1
Create Database XYZ;
use XYZ;

create table table1 (
  id int primary key,
  name varchar(20),
  salary int);
  
  insert into table1 
  values (1,"adam",25000),
  (2,"bob",30000),
  (3,"Casey",40000);
  
  Select * from table1;
  
  
  -- Sample Database
  create database college1;
  use college1;
  
  create table student(
  rollno int primary key,
  name varchar(20),
  marks int not null,
  grade varchar(1),
  city varchar(20));
  
  drop table student;
  
  alter table student rename column name to full_name;
  alter table student change name full_name varchar(30);
  
  delete from student where marks<80;
  
  alter table student drop column grade;
  
  Select * from student;
  
  truncate table student;
  
  
alter table student add column age int not null;
alter table student drop column age;  

    create table department(
  id int primary key,
  name varchar(30));
  
      create table teacher(
  id int primary key,
  name varchar(30),
  dept_id int,
  foreign key(dept_id) references department(id)
  on update cascade
  on delete cascade);
  
  Select t.id as teacher_id,t.name as teacher_name,d.id as department_id,d.name as department_name
  from teacher t
  join department d on t.dept_id=d.id;
  
  insert into department
  values
  (101,"English"),
  (102,"CS");
  
  update department 
  set id=103
  where name="CS";
  
  select * from department;
  
  insert into teacher
  values
  (101,"Alice",101),
  (102,"Bob",102);
  
  Select * from teacher;
  
  
  insert into student
  values
  (101,"anil",78,"C","Pune"),
  (102,"bhumika",93,"A","Mumbai"),
  (103,"chetan",85,"B","Mumbai"),
  (104,"dhruv",96,"A","Delhi"),
  (105,"emanuel",12,"F","Delhi"),
  (106,"farah",82,"B","Delhi");
  
Select * from student;
Select name,marks from student;
select distinct city from student;

Select * from student where marks>80;
Select * from student where city="Mumbai";

Select * from student where marks>80 and city="Delhi";
Select * from student where marks>90 or city="Delhi";
Select * from student where marks + 10 > 90;
Select * from student where marks = 96;
Select * from student where marks > 90;
Select * from student where marks between 80 and 90;
Select * from student where city in ("Delhi","Pune");
Select * from student where city not in ("Delhi");

Select * from student limit 3;
Select * from student where marks > 80 limit 2;

Select * from student order by city asc;
Select * from student order by marks asc;
Select * from student order by rollno desc;
Select * from student order by marks desc limit 2;

Select max(marks) from student;
Select min(marks) from student;
Select sum(marks) from student;
Select count(*) from student;
Select avg(marks) from student;

Select city,count(name) from student group by city;
Select city,avg(marks) from student group by city;

Select city,avg(marks) as avg_marks from student group by city order by avg_marks;

Select grade,count(rollno) as count_of_students from student group by grade order by grade;

-- Practice question 2
create table customers(
customer_id int,
customer varchar(20),
mode varchar(20),
city varchar(20));


insert into customers
values
(101,"Olivia Barrett","Netbanking","Portland"),
(102,"Ethan Sinclair","Credit Card","Miami"),
(103,"Maya Hernandez","Credit Card","Seattle"),
(104,"Liam Donovan","Netbanking","Denver"),
(105,"Sophia Nguyen","Credit Card","New Orleans"),
(106,"Caleb Foster","Debit Card","Minneapolis"),
(107,"Ava Patel","Debit Card","Phoenix"),
(108,"Lucas Carter","Netbanking","Boston"),
(109,"Isabella Martinez","Netbanking","Nashville"),
(110,"Jackson Brooks","Credit Card","Boston");

Select mode,count(customer_id) as total_payments from customers group by mode;

-- General Order --> SELECT....FROM...WHERE...GROUP BY....HAVING....ORDER BY 
-- to off safe mode ---> SET SQL_SAFE_UPDATES=0;

Select city
from student
where grade="A"
group by city
having max(marks)>=90
order by city desc;

Select count(name) , city from student group by city having max(marks)>90;

update student set marks=50 where rollno=105;
update student set marks=marks+2;


Delete from student where marks<33;
Delete from student where grade="F";

Select * from student;




create table stud(
student_id int primary key,
name varchar(20));

insert into stud
values
(101,"Adam"),
(102,"Bob"),
(103,"Casey");

create table course(
student_id int primary key,
course varchar(20));

insert into course
values
(102,"english"),
(105,"math"),
(103,"history"),
(107,"computer science");


-- INNER JOIN
select * 
from stud as s
inner join course as c
on s.student_id=c.student_id;

-- LEFT JOIN
select * 
from stud as s
left join course as c
on s.student_id=c.student_id;

-- RIGHT JOIN
select * 
from stud as s
right join course as c
on s.student_id=c.student_id;

-- FULL JOIN
select * 
from stud as s
left join course as c
on s.student_id=c.student_id
union
select * 
from stud as s
right join course as c
on s.student_id=c.student_id;


-- LEFT EXCLUSIVE JOIN
select * 
from stud as s
left join course as c
on s.student_id=c.student_id
where c.student_id is null;

-- RIGHT EXCLUSIVE JOIN
select * 
from stud as s
right join course as c
on s.student_id=c.student_id
where s.student_id is null;


-- FULL EXCLUSIVE JOIN 
select * 
from stud as s
left join course as c
on s.student_id=c.student_id
where c.student_id is null
union
select * 
from stud as s
right join course as c
on s.student_id=c.student_id
where s.student_id is null;


create table employee(
id int primary key,
name varchar(30),
manager_id int
);

insert into employee
values
(101,"adam",103),
(102,"bob",104),
(103,"casey",NULL),
(104,"donald",103);

select * from employee;

-- SELF JOIN
select a.id as emp_id,a.name as emp_name,b.name as manager_name
from employee as a
join employee as b
where a.id=b.manager_id;

-- union 
Select name from employee
union
Select name from employee;  

-- union all
Select name from employee
union all
Select name from employee;  

-- Subquery
create table student2
(rollno int primary key,
name varchar(20),
marks int);

insert into student2
values
(101,"anil",78),
(102,"bhumika",93),
(103,"chetan",85),
(104,"dhruv",96),
(105,"emanuel",12),
(106,"farah",82);

Select * from student2;

Select name from student2 where marks> (Select avg(marks) from student2);

Select rollno,name from student2 where rollno in (Select rollno from student2 where rollno % 2 = 0);

Select max(marks) from (Select * from student where city="Delhi") as temp;
Select max(marks) from student where city="Delhi";



-- VIEW 
Create view Mumbai_data as
Select * from student where city="Mumbai";

Select * from  Mumbai_data;

