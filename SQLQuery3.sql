--select * from Employees
--union
--select * from Customers

--select * from Employees
--union all
--select * from Customers

--select * from Employees
--except
--select * from Customers

--select * from Employees
--intersect
--select * from Customers

--select GETDATE()

--select *from Employees
--order by Age desc

--select * from Employees
--order by [Name] desc

--select *from Employees where Id > 3
--order by Age desc

--select COUNT(*) as 'Count by age',Age from Employees where [Age]>19
--group by Age

--select COUNT(*) as 'Count by age',Age from Employees
--group by Age
--having Count(*)>1
--order by Count(*) desc

--create view vw_TeactersByAge
--as
--select *from Teachers where Age>30

--select *from Teachers where Age>30


--select *from vw_TeachersByAge


--CREATE VIEW vw_TeachersbySalaryMain3
--AS
--SELECT TOP 100 PERCENT
--COUNT(*) as 'Count',Salary,Age
--FROM Teachers
--group by Salary,Age

--select *from vw_TeachersbySalaryMain3 order by Age

--create view vw_getTeachersByName
--as
--select *from Teachers where [Name] like 'c%'
--select *from vw_getTeachersByName


--create function GetTeachersCount()
--returns int
--as
--begin
--declare @age = count(*) from Teachers
--return @age
--end

--select GetTeachersCount()

--select *from Teachers

--create function GetTeachersCountByAgeStatic()
--returns int
--as
--begin
--declare @age int;
--declare @mainAge int = 30;
--select @age = count(*) from Teachers where Age >@mainAge
--return @age
--end

--select dbo.GetTeachersCountByAgeStatic()


--create function GetTeachersCountByAge(@age int)
--returns int
--as
--begin
--declare @count int;
--select @count = count(*) from Teachers where Age > @age
--return @count
--end

--select dbo.GetTeachersCountByAge(30)


--Function yaziriq. Funtion Id-si function gelen id-den boyuk olan userlerin orta yashlarini qaytarsin.

select * from Teachers

create function dbo.getTeachersAverageAgesByCondition(@id int)
returns float
as
Begin
declare @sum float = cast((select sum(Age) from Teachers where Id>@id) as float)
declare @count float = cast((select count(Age) from Teachers where Id>@id) as float)
return @sum/@count
End

select dbo.getTeachersAverageAgesByCondition(4)

create function dbo.getTeachersAverageSalaryByCondition(@id int)
returns decimal
as
Begin
declare @avg decimal;
select @avg = AVG(salary) from Teachers where Id > @id;
return @avg
End

select dbo.getTeachersAverageSalaryByCondition(4)


create procedure usp_InsertTeacher
@name nvarchar(50),
@surname nvarchar(50),
@age int,
@email nvarchar(100),
@salary decimal
AS
Begin
insert into Teachers([Name],[Surname],[Age],[Email],[Salary])
values(@name, @surname, @age, @email, @salary)
End


exec usp_InsertTeacher 'Novreste','Aslanzade',25,'novreste@code.edu.az',1500

create procedure usp_SumOfNums
@num1 int,
@num2 int
as
select @num1+@num2

exec usp_SumOfNums 5,7