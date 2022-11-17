create database insuranced1;
use insuranced1;
create table person
(driver_id varchar(10),
name varchar(15),
address varchar(30),
primary key (driver_id));
show tables;
desc person;
create table car
(reg_num varchar(10),model varchar(15),year year,primary key(reg_num));
show tables;
desc car;
create table owns
(driver_id varchar(10),reg_num varchar(10),primary key(driver_id,reg_num),foreign key(driver_id)references person(driver_id),
foreign key(reg_num)references car(reg_num));
desc owns;
create TABLE ACCIDENT(report_num int,accident_date date,location varchar(20),primary key(report_num));
desc accident;
create table parti
(driver_id varchar(10),reg_num varchar(10),report_num int, damage_amount int,primary key(driver_id,reg_num,report_num),foreign key(driver_id)references person(driver_id),foreign key(reg_num)references car(reg_num),foreign key(report_num)references accident(report_num));
desc parti;
insert into person values('A01','Richard','srinivash nagar'),('A02','Pradeep','Rajaji nagar'),('A03','smith','ashok nagar'),('A04','venu','nr colony'),('A05','jhon','hanumanth ngar');
select *from person;
insert into car values('KA052250','INDICA','1990'),('KA031181','LNCER','1957'),('KA095477','TOYOTA','1998'),('KA053408','HONDA','2008'),('KA041702','AUDI','2005');
select *from car;
INSERT INTO OWNS VALUE('A01','KA052250'),('A02','KA053408'),('A03','KA031181'),('A04','KA095477'),('A05','KA041702');
select *from owns;
insert into parti values('A01','KA052250',11,10000),('A02','KA053408',12,50000),('A03','KA031181',13,25000),('A04','KA095477',14,3000),('A05','KA041702',15,5000);
select *from parti;
insert into accident values(11,'2003-01-01','mysore road'),(12,'2004-02-02','south end circle'),(13,'2003-01-21','bull temple'),(14,'2008-02-17','mysore road'),(15,'2004-03-05','kanakpur road');
select *from accident;
UPDATE PARTICIPATED SET damage_amount=25000 where reg_num='KA053408' AND REPORT_NUM=12;
select *from participated;
drop table owns;
alter table accident
drop location;
select *from accident;
alter table accident
add location varchar(20);
select *from accident;
select *from owns;
truncate table participated ;
select *from participated;
drop table participated;
select *from participated;
insert into person values('F01','SHIVESH','GAJIYABAD');
SELECT *FROM person;
alter table car
modify year int;
desc car;
delete from car
where reg_num ='KA052250';
select *from car;
insert into car values('KA034567','MAHINDRA','1945');
select *from cars;
update car set year=2002
where model='TOYOTA';
update person
set name='jack'
where driver_id='A01';
select *from person;
drop table car;
alter table owns 
add(driver varchar(20));

select * from car
order by year desc;

select count(distinct driver_id) CNT
from parti a,accident b
where a.report_num=b.report_num and b.accident_date like'08%';

select * from parti 
order by damage_amount desc;

select avg(damage_amount) 
from participated;

delete from parti
where damage_amount<(select  t.amt from(select avg(damage_amount)amt from parti)t); 

select name from person
where driver_id in(select driver_id from participated where damage_amount >(select avg(damage_amount) from participated));


show tables;
select max(damage_amount)
from participated;

select per.name,c.model,p.damage_amount from person per, car c , participated p, accident a where per.driver_id=p.driver_id and c.reg_num = p.reg_num and a.report_num = p.report_num and a.location='Mysore road';















