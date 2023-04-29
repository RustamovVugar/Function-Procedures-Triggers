
create database Course

use Course

create table Students(
[Id] int primary key identity(1,1),
[Name] nvarchar(50) not null,
[Surname] nvarchar(50),
[Age] int,
[Email] nvarchar(100) unique,
[Address] nvarchar(100),
)

insert into Students([Name], [Surname], [Age], [Email], [Address])
values ('Ceyhun', 'Nagiyev', 39,'ceyhun@gmail.com', 'Zabrat'),
( 'Ramil', 'Ehmedov', 21, 'ramil@gmail.com', 'Sumqayit'),
( 'Qoshqar', 'Isayev', 35, 'qosa@gmail.com', 'Yasamal'),
('Asim', 'Pireliyev', 34, 'asim@mail.ru', 'Xirdalan'),
('Idret', 'Necefov', 40, 'idi@mail.ru', 'Masazir'),
('Elgiz', 'Zeynalov', 28, 'elgiz@mail.ru', 'Ceyranbatan')


insert into Students([Name],[Surname],[Age],[Email],[Address])
values('Rafail', 'Haciyev', 23, 'rafi@gmail.com', 'Sahil')

create table StudentArchives(
[Id] int primary key identity(1,1),
[StudentId] int,
[Operation] nvarchar(50),
[Date] datetime
)

create trigger trg_InsertStudent on Students
for insert
as
Begin
insert into StudentArchives([StudentId],[Operation],[Date])
select Id, 'Insert', GETDATE() from inserted
End

create procedure usp_InsertStudents
@name nvarchar(50),
@surname nvarchar(50),
@age int,
@email nvarchar(100),
@address nvarchar(100)
AS
Begin
insert into Students([Name],[Surname],[Age],[Email],[Address])
values(@name, @surname, @age, @email, @address)
End

exec usp_InsertStudent 'Vuqar', 'Rustamov', 38, 'vugarar@code.edu.az', 'Xirdalan'


delete from Students where Id = 8