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
insert into  departments values(11,'Marketing','02-01-2020','Ram'),(12,'Sales','02-01-2020','Sai');
create table job_types(job_type_cd varchar(10) primary key,job_type_name varchar(50),last_update_date varchar(50),last_updated_by varchar(50));
insert into  job_types values('A01','IT Manager','02-01-2020','Sai'),('A11','HR Manager','09-02-2020','Sai');
insert into  job_types values('A03','Sales Manager','02-03-2020','JAYA');
create table job_status_codes(job_status_cd varchar(10) primary key,status_desc varchar(50),last_update_date varchar(50),last_updated_by varchar(50));
insert into job_status_codes values('OP1','open','02-11-2020','Saina'),('OP2','closed','22-11-2020','Samy');
create table appl_status_codes(appl_status_cd varchar(10) primary key,status_desc varchar(50),last_update_date varchar(50),last_updated_by varchar(50));
insert into appl_status_codes values('AP1','pending','20-09-2020','Jaya'),('AP20','rejected','21-08-2020','Surya');
create table education_levels(edu_level_cd varchar(10) primary key,edu_level_name varchar(50),last_update_date varchar(50),last_updated_by varchar(50));
insert into education_levels values('UG','Under Graduation','20-09-2021','Shiva'),('PG','Post Graduation','11-09-2021','Shasi');
create table education_type(edu_type_cd varchar(10) primary key,edu_type_name varchar(50),last_update_date varchar(50),last_updated_by varchar(50));
insert into education_type values('Rg','regular','20-10-2021','Shiva'),('Ds','distance','20-11-2020','Shasi');
create table jobs(job_id int primary key,job_title varchar(45),job_desc varchar(4000),job_type_cd varchar(10),
foreign key(job_type_cd) references job_types(job_type_cd),dept_id int,
foreign key(dept_id) references departments(dept_id),job_status_cd varchar(10),
foreign key(job_status_cd) references job_status_codes(job_status_cd ),country_cd varchar(10),
foreign key(country_cd ) references countries(country_cd),last_update_date varchar(50),last_updated_by varchar(50));
insert into jobs values(001,'Devoloper','must have basics in java,sql','A01',11,'OP1','+33','20-11-2021','Sai');
create table applicants(appl_id int primary key,first_name varchar(50),last_name varchar(50),email varchar(50),
phone_num varchar(20),address varchar(50),city varchar(50),state varchar(50),zip varchar(10),
country_cd varchar(10),foreign key(country_cd ) references countries(country_cd),appl_status_cd varchar(10),
foreign key(appl_status_cd) references appl_status_codes(appl_status_cd),edu_level_cd varchar(10),
foreign key(edu_level_cd ) references education_levels(edu_level_cd),
 edu_type_cd varchar(10),foreign key( edu_type_cd) references education_type( edu_type_cd),
 resume_file_name varchar(50),cover_letter_text varchar(50),current_employer varchar(50),
 years_of_exp varchar(20),last_update_date varchar(50),last_updated_by varchar(50));
 insert into applicants values(1,'Koti','Sai','sai@gmail.com',7899973736,'4-46,pandaripuram','guntur','AP',522600,'+33','AP1','UG','Rg','sai-resume','sai-coverletter','FSS',
 3,'20-11-2021','Sai');
 create table applicants_jobs(appl_id int,foreign key(appl_id) references applicants(appl_id),job_id int,
 foreign key(job_id) references jobs(job_id),appl_status_cd varchar(10),
foreign key(appl_status_cd) references appl_status_codes(appl_status_cd),date_applied varchar(20),written_test_date varchar(20),
interview1_date varchar(20),interview2_date varchar(20),last_update_date varchar(50),last_updated_by varchar(50));
insert into  applicants_jobs values(1,001,'AP1','04-12-2021','07-12-2021','01-01-2022','07-01-2022','08-01-2022','sai');
