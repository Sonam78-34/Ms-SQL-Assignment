 create database studentinfo

use studentinfo

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Department (DepartmentID, DepartmentName)
VALUES (1, 'Computer Science'),
       (2, 'Electrical Engineering'),
       (3, 'Civil Engineering');




CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

INSERT INTO Student (StudentID, StudentName, DepartmentID)
VALUES (1, 'John Doe', 1),
       (2, 'Jane Smith', 2),
       (3, 'Mike Johnson', 1),
       (4, 'Sarah Wilson', 3);



	   select * from student;
	   select * from department;


	create view studentwithdeparments as  SELECT s.StudentID, s.StudentName, d.DepartmentName, d.DepartmentId FROM Student s
	    INNER JOIN Department d   ON s.DepartmentID = d.DepartmentID ;

		alter view studentwithdeparments as select count(*) as countofstuent from student ;

		select * from studentwithdeparments 






		--schema binding
		alter view studentwithdeparments with schemabinding
		as select studentid, studentname from dbo.student;


	--user stored procedure create
		create procedure uspstuednt
		as
		begin
		select * from student where studentId>1;
		end

		--to run or execute the stored procedure
		exec uspstuednt


	--user stored procedure with parameter

		create proc uspwithstuentnameparameter
		@name varchar(50)
		as
		begin
		select * from student where studentname= @name
		end

		exec uspwithstuentnameparameter 'john Doe'

		exec uspwithstuentnameparameter 'sonam'


	--to make default

		create proc uspwithstuentnameparameterwithdefault
		@name varchar(50)=null
		as
		begin
			if @name is null
				select * from student
			else
				select * from student where studentname= @name
		end

		exec uspwithstuentnameparameter 'john Doe'

		exec uspwithstuentnameparameter 'sonam'
		


		--to insert into storedprocedure

		select * from student

		
		alter proc uspinsertstudents
		@studid int,
		@studname varchar(20),
		@depid int
		as
		begin
		insert  dbo.student values(@studid, @studname, @depid)
		end

		exec uspinsertstudents 6, 'sonam',2;

	

	--- to update the value through stored procedure into original table
	create proc uspupdatestudentname
		@studid int,
		@name varchar(20)
		as
		begin
		update student
		set StudentName= @name
		where StudentID= @studid
		end

		exec dbo.uspupdatestudentname 5, 'sia';

		select * from student;



	--- to delete through stored procedure into original table

	create proc uspdeletestudentid
	 @studid int
	 as 
	 begin 
	 DELETE FROM dbo.student where studentid= @studid
	 end

	 exec uspdeletestudentid 5;

	 select * from student








		