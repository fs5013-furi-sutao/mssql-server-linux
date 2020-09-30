CREATE DATABASE EmployeeDb;
go

use EmployeeDb;
go

DROP TABLE IF EXISTS employees;
GO

CREATE TABLE employees(
    id int identity(1,1) primary key,
    name nvarchar(32),
    birthday datetime
);
GO

BULK INSERT employees
FROM '/usr/src/docker/backup/dbo.employees.csv'
WITH
(
   FIELDTERMINATOR = ',',
   ROWTERMINATOR = '\n'
);
GO