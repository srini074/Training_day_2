Select * from moviedb
Select * from MovieActors

CREATE FUNCTION dbo.GetMoviesByBudgetRange(@MiniBudget DECIMAL(18,2),@MaxBudget DECIMAL(18,2))
RETURNS TABLE
AS
RETURN
(
	SELECT *
	FROM Movies
	WHERE Budget BETWEEN @MinBudget AND @MaxBudget
)

Select * from Movies 
Select * from MovieActors

Create Table Employees
(
	Id int primary key identity,
	[Name] nvarchar(50),
	Email nvarchar(50),
	Department nvarchar(50)
)
Go
 
SET NOCOUNT ON
Declare @counter int = 1
 
While(@counter <= 1000000)
Begin
	Declare @Name nvarchar(50) = 'ABC ' + RTRIM(@counter)
	Declare @Email nvarchar(50) = 'abc' + RTRIM(@counter) + '@proclink.com'
	Declare @Dept nvarchar(10) = 'Dept ' + RTRIM(@counter)
 
	Insert into Employees values (@Name, @Email, @Dept)
 
	Set @counter = @counter +1
 
	If(@Counter%100000 = 0)
		Print RTRIM(@Counter) + ' rows inserted'
End 
Select * from Employees
WHERE [Name] = 'ABC 893939'

eXEC SP_HELPINDEX Employees

-- clustered 
-- 1. (pk)
-- 2.(Decides table order)
-- 3.(only one per table)

-- non-clustered index
-- 1. (non pk)
-- 2. not decides table order
-- 3. many per tables

CREATE NONCLUSTERED INDEX    
    ON movieactors.;   
GO

CREATE TABLE [tblEmployee]
(
[Id] int Primary Key,
[Name] nvarchar(50),
[Salary] int,
[Gender] nvarchar(10),
[City] nvarchar(50)
)
 
Insert into tblEmployee Values(3,'John',4500,'Male','New York')
Insert into tblEmployee Values(1,'Sam',2500,'Male','London')
Insert into tblEmployee Values(4,'Sara',5500,'Female','Tokyo')
Insert into tblEmployee Values(5,'Todd',3100,'Male','Toronto')
Insert into tblEmployee Values(2,'Pam',6500,'Female','Sydney')
 
Select * from tblEmployee
--	Cluster index determines the table order

Exec sp_helpindex tblEmployee

Select 
Rank() Over (Partition by Gender Order by salary desc),
*
from
tblEmployee

Select 
Rank() Over (Partition by Gender Order by Gender desc, salary desc),
*
from
tblEmployee

Drop Index tblEmployee.PK_tblEmplo_3214EC07ED810568

DECLARE @xmlDoc INT;
DECLARE @xmlData NVARCHAR(MAX);
 
-- 1. Assign XML data to a variable
SET @xmlData = 
'<Books>
<Book id="1">
<Title>SQL for Beginners</Title>
<Author>John Doe</Author>
<Price>29.99</Price>
</Book>
<Book id="2">
<Title>Advanced SQL</Title>
<Author>Jane Smith</Author>
<Price>49.99</Price>
</Book>
</Books>';
 
-- 2. Parse the XML document
EXEC sp_xml_preparedocument @xmlDoc OUTPUT, @xmlData;
 
-- 3. Query the XML data using OPENXML
SELECT *
FROM OPENXML(@xmlDoc, '/Books/Book', 1)
WITH (
    id INT '@id',
    Title NVARCHAR(100) 'Title',
    Author NVARCHAR(100) 'Author',
    Price DECIMAL(10,2) 'Price'
);
 
-- Clear the memory
EXEC sp_xml_removedocument @xmlDoc;

