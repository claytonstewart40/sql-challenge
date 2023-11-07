create table departments (dept_no varchar(255), dept_name varchar(25),primary key (dept_no));

select * from departments;

create table employees (emp_no int not null, 
						emp_title_id varchar(255) not null, 
						birth_date date not null, 
						first_name varchar(255) not null,
					   last_name varchar(255) not null, 
					   sex varchar (1) not null,
					  hire_date date not null, primary key (emp_no) );
					  
select * from employees;



create table dept_emp (emp_no int not null, dept_no varchar(255) not null,
					  foreign key (emp_no) references employees(emp_no), 
					  foreign key (dept_no) references departments (dept_no)
					  );
--got error
select * from dept_emp;

create table dept_manager(dept_no varchar (20), emp_no int not null, 
						 foreign key (emp_no) references employees(emp_no), 
					  foreign key (dept_no) references departments (dept_no)
						);
					  
select * from dept_manager;

create table salaries (emp_no int not null, salary int not null,
					  foreign key (emp_no) references employees(emp_no));
					  
select * from salaries;

create table titles(title_id varchar(255) not null, title varchar(255) not null, 
				   primary key (title_id));
select * from titles;


select e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
from employees as e 
left join salaries as s
on e.emp_no = s.emp_no;