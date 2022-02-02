create database abclp;
use abclp;
create table regions(region_id varchar(10) primary key,region_name varchar(50),last_update_date varchar(50),last_updated_by varchar(50));
insert into regions values('IN','India','05-01-2022','sai');
select * from regions;
create table countries(country_cd varchar(10) primary key,country_name varchar(50),region_id varchar(10),
foreign key(region_id) references regions(region_id),
last_update_date varchar(50),last_updated_by varchar(50));
insert into countries values('+33','Europe','EU','07-01-2022','Siva');
select * from countries;
create table departments(dept_id int primary key,dept_name varchar(50),last_update_date varchar(50),last_updated_by varchar(50));
insert into  departments values(
create table job_types(job_type_cd varchar(10) primary key,job_type_name varchar(50),last_update_date varchar(50),last_updated_by varchar(50));
create table job_status_codes(job_status_cd varchar(10) primary key,status_desc varchar(50),last_update_date varchar(50),last_updated_by varchar(50));
create table appl_status_codes(appl_status_cd varchar(10) primary key,status_desc varchar(50),last_update_date varchar(50),last_updated_by varchar(50));
create table education_levels(edu_level_cd varchar(10) primary key,edu_level_name varchar(50),last_update_date varchar(50),last_updated_by varchar(50));
create table education_type(edu_type_cd varchar(10) primary key,edu_type_name varchar(50),last_update_date varchar(50),last_updated_by varchar(50));
create table jobs(job_id int primary key,job_title varchar(45),job_desc varchar(4000),job_type_cd varchar(10),
foreign key(job_type_cd) references job_types(job_type_cd),dept_id int,
foreign key(dept_id) references departments(dept_id),job_status_cd varchar(10),
foreign key(job_status_cd) references job_status_codes(job_status_cd ),country_cd varchar(10),
foreign key(country_cd ) references countries(country_cd),last_update_date varchar(50),last_updated_by varchar(50)); 
create table applicants(appl_id int primary key,first_name varchar(50),last_name varchar(50),email varchar(50),
phone_num varchar(20),address varchar(50),city varchar(50),state varchar(50),zip varchar(10),
country_cd varchar(10),foreign key(country_cd ) references countries(country_cd),appl_status_cd varchar(10),
foreign key(appl_status_cd) references appl_status_codes(appl_status_cd),edu_level_cd varchar(10),
foreign key(edu_level_cd ) references education_levels(edu_level_cd),
 edu_type_cd varchar(10),foreign key( edu_type_cd) references education_type( edu_type_cd),
 resume_file_name varchar(50),cover_letter_text varchar(50),current_employer varchar(50),
 years_of_exp varchar(20),last_update_date varchar(50),last_updated_by varchar(50));
 create table applicants_jobs(appl_id int,foreign key(appl_id) references applicants(appl_id),job_id int,
 foreign key(job_id) references jobs(job_id),appl_status_cd varchar(10),
foreign key(appl_status_cd) references appl_status_codes(appl_status_cd),date_applied varchar(20),written_test_date varchar(20),
interview1_date varchar(20),interview2_date varchar(20),last_update_date varchar(50),last_updated_by varchar(50));