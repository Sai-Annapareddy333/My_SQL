create database hospm;
use hospm;
create table department(d_name varchar(30) primary key,d_location varchar(20),d_facilities varchar(200));
create table all_doctors(doc_number varchar(20) primary key,doc_department varchar(20),foreign key(doc_department) references department(d_name));
create table doc_reg(doc_number varchar(20),foreign key(doc_number) references all_doctors(doc_number),doc_name varchar(30),doc_qualification varchar(20),doc_address varchar(50),doc_num char(10), doc_salary float,doc_joining date);
create table doc_on_call(doc_number varchar(20),foreign key(doc_number) references all_doctors(doc_number),doc_name varchar(20),doc_qualification varchar(20),doc_fees float,doc_payment_due float,address varchar(30),doc_num char(10));
create table pat_entry(pat_no varchar(20),sex varchar(5),pat_name varchar(20),pat_age int,pat_address varchar(20),pat_city varchar(20),pat_phnum char(10),pat_entry date,doc_num varchar(20),foreign key(doc_num) references all_doctors(doc_number),d_name varchar(20),foreign key(d_name) references department(d_name));
alter table pat_entry modify pat_no varchar(20) primary key;
create table pat_chkup(pat_no varchar(20),foreign key(pat_no) references pat_entry(pat_no),doc_num char(10),chk_up_date date,diagonsis_date date,treat_date date,ref_pat varchar(20));
create table pat_admit(pat_no varchar(20),foreign key(pat_no) references pat_entry(pat_no),advance_pay float,mod_pay varchar(10),room_no varchar(10),dept varchar(20),foreign key(dept) references department(d_name),date_admission date,ini_cond varchar(10),treatment varchar(10),doc_num varchar(20),foreign key(doc_num) references all_doctors(doc_number));
create table pat_dis(pat_no varchar(20),foreign key(pat_no) references pat_entry(pat_no),treat_given varchar(20),treat_advice varchar(20),pay_made boolean,mod_pay varchar(10), discharge date);
create table pat_reg(pat_no varchar(20),foreign key(pat_no) references pat_entry(pat_no),date_visit date,diagnosis varchar(20),treat varchar(10),medi_recommded varchar(20),status_treat varchar(20));
create table pat_opr(pat_no varchar(20),foreign key(pat_no) references pat_entry(pat_no),date_admission date,date_opr date,doc_number varchar(20),foreign key(doc_number) references all_doctors(doc_number),no_opr int,typ_opr varchar(10),pat_cond_b varchar(10),pat_cond_a varchar(10),treat_advice varchar(10));
create table room_deatails(room_no varchar(10),room_typ char,room_status char,pat_no varchar(20),pat_name varchar(20),charges_day float);
select * from department;
insert into department values('orthopedic','hyderabad','operation theater,laboratory,m r i');
insert into department values('pathology','chennai','operation theater,blood bank,laboratory,m r i');

desc all_doctors;
select * from all_doctors;
insert into all_doctors values('D.100','orthopedic');
insert into all_doctors values('D.101','pathology');
insert into all_doctors values('D.102','dentist');
desc doc_reg;
select * from doc_reg;
insert into doc_reg values('D.100','Sravani','MBBS','hyderabad','9876543210',80000.00,'2018-02-09');
insert into doc_reg values('D.101','Sanju','MBBS','chennai','8765432109',60000.00,'2017-04-07');
desc doc_on_call;
select * from doc_on_call;
insert into doc_on_call values('D.100','Sravani','MBBS',1000,4000.00,'hyderabad','9876543210');
insert into doc_on_call values('D.101','Sanju','MBBS',3000,56000.8,'chennai','8765432109');

desc pat_entry;
select * from pat_entry;
insert into pat_entry values('P-1','male','sai',23,'bg gardens','guntur','9876475865','2021-05-04','D.100','orthopedic');
insert into pat_entry values('P-2','fmale','sailu',20,'narasaraopet','guntur','9876567899','2020-05-09','D.101','pathology');

desc pat_chkup;
select * from pat_chkup;
insert into pat_chkup values('P-1','9876475865','2021-08-11','2021-08-13','2021-08-14','regular');
insert into pat_chkup values('P-2','9876567899','2019-04-10','2019-04-12','2019-04-14','operation');

desc pat_admit;
select * from pat_admit;
insert into pat_admit values('P-1',70000.00,'cash','t11','orthopedic','2021-05-06','normal','medicine','D.100');
insert into pat_admit values('P-2',6000.00,'online','t12','pathology','2021-06-06','emergency','test','D.101');

desc pat_dis;
select * from pat_dis;
insert into pat_dis values('P-1','surgery','surgery',1,'cash','2021-06-01');
insert into pat_dis values('P-2','surgery','surgery',1,'oline','2021-09-15');

desc pat_reg;
select * from pat_reg;
insert into pat_reg values('P-1','2020-06-16','done','surgery','paracetamol','completed');
insert into pat_reg values('P-2','2021-04-18','done','test','aspirin','first stage');
desc pat_opr;
select * from pat_opr;
insert into pat_opr values('P-1','2020-06-11','2020-07-16','D.100',37,'surgery','emergency','normal','surgery');
insert into pat_opr values('P-2','2021-05-15','2020-06-17','D.101',36,'blood test','minor','normal','malaria');
desc room_deatails;
select * from room_deatails;
insert into room_deatails values('R-01','G','y','P-1','sai',2000.00);
insert into room_deatails values('R-14','P','y','P-2','sailu',1500.00);