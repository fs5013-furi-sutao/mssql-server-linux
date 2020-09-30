-- Insert rows into table 'TableName'
INSERT INTO [EmployeeDb].[dbo].[Frameworks]
( -- columns to insert data into
[Name], [Language], [RegisterDate]
)
VALUES
( -- first row: values for the columns in the list above
 'ASP.NET Core', 'C#', '2020-09-30'
),
( -- second row: values for the columns in the list above
 'Spring Boot', 'Java', '2020-09-30'
),
( -- second row: values for the columns in the list above
 'Vue.js', 'JavaScript', '2020-09-30'
),
( -- second row: values for the columns in the list above
 'React', 'JavaScript', '2020-09-30'
)
-- add more rows here
GO