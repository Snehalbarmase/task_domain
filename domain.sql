--Task find different ways domain can be used in database

--using(create,update,drop,view,insert,where) such domain can be used in database

create domain EmployeeStatus as varchar(20)
default 'Active'
check (value in ('Active','Inactive','On Leave','Pending'))

create table Employees (
emp_id int primary key,
emp_name varchar(30),
status EmployeeStatus 
)

insert into employees (emp_id,emp_name) values (301,'john'), (302,'monu'),(303,'jay'),(304,'jai'),(305,'sonu')

select * from Employees

alter domain EmployeeStatus set default 'Pending'

select * from Employees

insert into employees (emp_id,emp_name) values (306,'komal')

insert into employees (emp_id,emp_name) values (309,'rahul')

insert into employees (emp_id,emp_name) values (307,'sonal')

insert into employees (emp_id,emp_name) values (300,'suru')


select * from Employees

select emp_id, emp_name, status from Employees 
where status = 'Active'

select emp_id, emp_name, status from Employees 
where status in ('Pending') and emp_id in (309)

select status, count(emp_id) as Employeecount from Employees 
group by status

update Employees
set status ='On Leave'
where emp_id = 302

update Employees  ---error because terminated is not in the allowed list for employeestatus
set status ='Terminated'
where emp_id = 308

update Employees
set status ='Inactive'
where emp_id = 300
 
select * from Employees

delete from Employees
where emp_id = 303

select * from Employees

create view CurrentEmployees as 
select emp_id, emp_name, status from Employees
where status in ('Active','Pending')

select * from CurrentEmployees

insert into Employees (emp_id,emp_name,status) values (402,'eve','On Leave')

select * from CurrentEmployees

