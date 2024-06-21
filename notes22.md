## Constraints in SQL

- The following constraints are commonly used in SQL:

- NOT NULL - Ensures that a column cannot have a NULL value
- UNIQUE - Ensures that all values in a column are different
- PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
- FOREIGN KEY - Prevents actions that would destroy links between tables
- CHECK - Ensures that the values in a column satisfies a specific condition
- DEFAULT - Sets a default value for a column if no value is specified
- CREATE INDEX - Used to create and retrieve data from the database very quickly

## Cascading delete

- What is a foreign key with Cascade DELETE in SQL Server?
A foreign key with cascade delete means that if a record in the parent table is deleted, then the corresponding records in the child table will automatically be deleted. This is called a cascade delete in SQL Server.

- A foreign key with cascade delete can be created using either a CREATE TABLE statement or an ALTER TABLE statement.

## Types of Inner Joins

- https://www.scholarhat.com/tutorial/sqlserver/difference-between-inner-join-and-equi-join-and-natural-join

## Previous day's question and answer

 
Declare  @movieId Int = 3

Select * from Movies
	Where MovieId = @movieId

Create Function dbo.CalculateAges(@ReleaseDate Int)
Returns Int
As
Begin 
	Return Year(GetDate()) - @ReleaseDate;
End;

Select dbo.CalculateAges([Ryear]) from Movies

Select dbo.CalculateAges(2005);
