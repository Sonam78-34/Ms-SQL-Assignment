create database HospitalService

use HospitalService


create table hospital
(
PNo int primary key,
Name varchar(20), 
Age int,
Department varchar(15),
Dateofadm Date,
Charges Numeric(7,2),
Sex char(1)
)

insert into hospital values (1, 'Arpit', 62, 'Surgery', '1981-01-12', 300, 'M')

insert into hospital values (2, 'Zarina', 22, 'ENT', '1997-12-12', 250, 'F'),
(3, 'Kareem', 32, 'Orthopedic', '1982-02-19', 200, 'M'),
(4, 'Arun', 12, 'Surgery', '1998-01-11', 300, 'M'),
(5, 'Zubin', 30, 'ENT', '1998-01-12', 250, 'M'),
(6, 'Ketaki', 16, 'ENT', '1998-02-24', 250, 'F'),
(7, 'Ankita', 29, 'Cardiology', '1998-02-20', 800, 'F'),
(8, 'Zareen', 45, 'Gynaecologist', '1998-02-22', 300, 'F'),
(9, 'Kush', 19, 'Cardiology', '1998-01-13', 800, 'M'),
(10, 'Shilpa', 23, 'NuclearMedicine', '1998-01-20', 400, 'F');


--1
create index dateofadmitIndex on hospital(Dateofadm);


--2
alter table hospital
add constraint unique_name UNIQUE (name);

create  unique index uniqueindexname on hospital(Name)

--3
select Name ,age as of_age , Dateofadm as got_Admitted_On from hospital

--4
alter table hospital 
add  Addressofhospital char(20);


--5
alter table hospital
alter column Addressofhospital char(25);

--6
alter table hospital
alter column Addressofhospital  varchar(25);


--7
EXEC sp_rename 'hospital.Addressofhospital', 'home_address', 'COLUMN';


--8
ALTER TABLE hospital
DROP COLUMN home_address;


--9
exec sp_rename 'hospital', 'Hospital_Data';

--10
select * from hospital_data

update hospital_data set age= 30  where PNo= 7;




select * from hospital_data

--11
ALTER TABLE hospital_data DROP CONSTRAINT PK__hospital__C5773DEFAD93C1CB;




--12
select department, count(*) as noofpatient  from hospital_data group by department




--13
delete from hospital_data;


--14
drop table hospital_data;












