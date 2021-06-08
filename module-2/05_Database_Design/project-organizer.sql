Begin transaction;

Create table employee(
    id serial,
    last_name varchar(255) NOT NULL, 
    first_name varchar(255) NOT NULL,
    job_title varchar(255) NOT NULL,
    gender char(1),
    date_of_birth date NOT NULL,
    date_of_hire date NOT NULL,
    department_id integer NOT NULL,
    CONSTRAINT pk_employee_id PRIMARY KEY (id)
    );
    
Create table department(
    dept_id serial,
    name varchar(255) NOT NULL,
    CONSTRAINT pk_department_id PRIMARY KEY (dept_id)
    );
    
Create table project(
    project_id serial,
    name varchar(255) NOT NULL,
    employee_id integer NOT NULL,
    start_date date NOT NULL,
    CONSTRAINT pk_project_id PRIMARY KEY (project_id)
    );
      
 Alter table employee
 add foreign key (department_id)
 references department(dept_id);
 
 Alter table project
 add foreign key (employee_id)
 references employee(id);
 
 Insert into department (name) values ('Finance');
 Insert into department (name) values ('Human Resources');
 Insert into department (name) values ('Education');
 Insert into department (name) values ('Software Development');
 Insert into employee (last_name, first_name, job_title, gender, date_of_birth, date_of_hire, department_id)
      values ('West', 'Kanye', 'Manager', 'M', '1977-06-08', '2020-06-15', (select dept_id from department where name = 'Finance'));
 Insert into employee (last_name, first_name, job_title, gender, date_of_birth, date_of_hire, department_id)
      values ('Swift', 'Taylor', 'Finance Director', 'F', '1989-12-13', '2020-06-13', (select dept_id from department where name = 'Finance'));
 Insert into employee (last_name, first_name, job_title, gender, date_of_birth, date_of_hire, department_id)
      values ('Jackson', 'Michael', 'Manager', 'M', '1955-10-28', '2020-08-29', (select dept_id from department where name = 'Human Resources'));
 Insert into employee (last_name, first_name, job_title, gender, date_of_birth, date_of_hire, department_id)
      values ('DeGeneres', 'Ellen', 'Hiring Director', 'F', '1958-01-26', '2020-06-15', (select dept_id from department where name = 'Human Resources'));     
 Insert into employee (last_name, first_name, job_title, gender, date_of_birth, date_of_hire, department_id)
      values ('Winfrey', 'Oprah', 'Teacher', 'F', '1954-01-29', '2020-05-10', (select dept_id from department where name = 'Education'));     
 Insert into employee (last_name, first_name, job_title, gender, date_of_birth, date_of_hire, department_id)
      values ('Zuckerberg', 'Mark', 'Teacher', 'M', '1984-05-14', '2020-04-20', (select dept_id from department where name = 'Education'));     
 Insert into employee (last_name, first_name, job_title, gender, date_of_birth, date_of_hire, department_id)
      values ('Gates', 'Bill', 'CEO', 'M', '1977-06-08', '2019-11-22', (select dept_id from department where name = 'Software Development'));
 Insert into employee (last_name, first_name, job_title, gender, date_of_birth, date_of_hire, department_id)
      values ('Jobs', 'Steve', 'CFO', 'M', '1955-02-24', '2020-12-03', (select dept_id from department where name = 'Software Development'));
 Insert into project (name, employee_id, start_date) 
      values('Vocal Range Research', (select id from employee where first_name = 'Taylor' and last_name = 'Swift'), '2020-06-15');
 Insert into project (name, employee_id, start_date) 
      values('Data Stealing', (select id from employee where first_name = 'Mark' and last_name = 'Zuckerberg'), '2020-05-12');
 Insert into project (name, employee_id, start_date) 
      values('Make More Money', (select id from employee where first_name = 'Bill' and last_name = 'Gates'), '2020-05-14');   
 Insert into project (name, employee_id, start_date) 
      values('Make the Best Music Video', (select id from employee where first_name = 'Kanye' and last_name = 'West'), '2020-06-20');  
      
 Select * from employee;
 Select * from department;
 Select * from project;
 
 --rollback;  
 commit;     
                     