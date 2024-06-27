
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

Select Top(3) *, dbo.CalculateAge[Ryear] as Age
from Movies
Order by Age Desc
Offset 3
Fetch next 4 rows only;

Select * from Movies
	where [Ryear] Between 2010 and 2020

Select * from vWLastDecadeMovies; -- Virtual Table / Copy by references
--1. Complex statement - Create view - Easily Readability
--2. Abstraction
--3. Security

Select * from Movies
Select * from Directors

Create view vWRajamouliMovies
As
Select * from Directors
where Names='S.S.Rajamouli'

Select * from vWRajamouliMovies


CREATE DATABASE WORKCLASS
USE WORKCLASS
CREATE TABLE Movies (
MovieID INT PRIMARY KEY,
Title NVARCHAR(100),
ReleaseYear INT,
Director NVARCHAR(100),
Genre NVARCHAR(50),
Budget DECIMAL(18, 2),
BoxOffice DECIMAL(18, 2)
);
CREATE TABLE Actors (
ActorID INT PRIMARY KEY,
FirstName NVARCHAR(50),
LastName NVARCHAR(50),
BirthDate DATE
);
CREATE TABLE MovieActors (
MovieID INT,
ActorID INT,
Role NVARCHAR(100),
PRIMARY KEY (MovieID, ActorID),
FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
FOREIGN KEY (ActorID) REFERENCES Actors(ActorID)
);
-- Movies
INSERT INTO Movies (MovieID, Title, ReleaseYear, Director, Genre, Budget, BoxOffice) VALUES
(1, 'Baahubali: The Beginning', 2015, 'S. S. Rajamouli', 'Action', 1800000000, 6500000000),
(2, 'Baahubali: The Conclusion', 2017, 'S. S. Rajamouli', 'Action', 2500000000, 18000000000),
(3, 'Sye', 2004, 'S. S. Rajamouli', 'Sports Drama', 120000000, 250000000),
(4, 'Magadheera', 2009, 'S. S. Rajamouli', 'Fantasy', 400000000, 1500000000),
(5, 'Arjun Reddy', 2017, 'Sandeep Reddy Vanga', 'Romance', 50000000, 510000000),
(6, 'Rangasthalam', 2018, 'Sukumar', 'Drama', 60000000, 2160000000),
(7, 'Maharshi', 2019, 'Vamsi Paidipally', 'Drama', 100000000, 1750000000),
(8, 'Geetha Govindam', 2018, 'Parasuram', 'Romantic Comedy', 15000000, 1300000000),
(9, 'Ala Vaikunthapurramuloo', 2020, 'Trivikram Srinivas', 'Action Comedy', 100000000, 2620000000),
(10, 'Sarileru Neekevvaru', 2020, 'Anil Ravipudi', 'Action', 75000000, 2600000000);
-- Actors
INSERT INTO Actors (ActorID, FirstName, LastName, BirthDate) VALUES
(1, 'Prabhas', 'Raju', '1979-10-23'),
(2, 'Rana', 'Daggubati', '1984-12-14'),
(3, 'Ram', 'Charan', '1985-03-27'),
(4, 'Vijay', 'Deverakonda', '1989-05-09'),
(5, 'Mahesh', 'Babu', '1975-08-09'),
(6, 'Allu', 'Arjun', '1983-04-08'),
(7, 'Samantha', 'Akkineni', '1987-04-28'),
(8, 'Pooja', 'Hegde', '1990-10-13'),
(9, 'Rashmika', 'Mandanna', '1996-04-05'),
(10, 'Anushka', 'Shetty', '1981-11-07');
-- MovieActors
INSERT INTO MovieActors (MovieID, ActorID, Role) VALUES
(1, 1, 'Baahubali'),
(1, 2, 'Bhallaladeva'),
(2, 1, 'Baahubali'),
(2, 2, 'Bhallaladeva'),
(4, 3, 'Kala Bhairava'),
(5, 4, 'Arjun Reddy'),
(7, 5, 'Rishi'),
(9, 6, 'Bantu'),
(10, 5, 'Ajay Krishna'),
(9, 8, 'Ammu');

Select * from MovieActors
Select * from Actors
Select * from Movies

Exercise 1: View for Movies Released After 2015
Task: Create a view named ViewMoviesAfter2015 that selects movies released after the year 2015.

Create view vWMoviesAfter2015
As
Select * from Movies 
	where ReleaseYear > 2015;

Select * from vWMoviesAfter2015

Exercise 2: View for High Box Office Movies
Task: Create a view named ViewHighBoxOfficeMovies that selects movies with a box office collection greater than 1 billion.

Create view vWBoxoffice
As 
Select * from Movies
	where BoxOffice > 10000000;


Select * from vWBoxoffice

Exercise 3: View for Actor Details in Movies
Task: Create a view named ViewActorDetailsInMovies that joins Movies and Actors through MovieActors and shows movie titles and actor names.

Create view vWActor
As
Select M.Title, A.FirstName, A.LastName
from Movies M
inner join MovieActors MA on M.MovieID = MA.MovieID
inner join Actors A on MA.ActorID = A.ActorID;

Select * from vWActor

Exercise 4: View for Top Grossing Movies per Genre
Task: Create a view named ViewTopGrossingMoviesPerGenre that shows the highest-grossing movie in each genre.

Select * from MovieActors
Select * from Movies
Select * from Actors

CREATE VIEW ViewTopGrossingMoviesPerGenre AS
SELECT 
    m.Genre,
    m.Title,
    m.BoxOffice
FROM 
    Movies m
WHERE 
    m.BoxOffice = (SELECT MAX(BoxOffice) FROM Movies WHERE Genre = m.Genre);
Select * from ViewTopGrossingMoviesPerGenre
Exercise 5: View for Actor's Total Box Office Collection
Task: Create a view named ViewActorTotalBoxOffice that shows the total box office collection for each actor across all their movies.
'
CREATE VIEW ViewActorTotalBoxOffice AS
SELECT 
    a.FirstName,
    a.LastName,
    SUM(m.BoxOffice) AS TotalBoxOffice
FROM 
    Actors a
JOIN 
    MovieActors ma ON a.ActorID = ma.ActorID
JOIN 
    Movies m ON ma.MovieID = m.MovieID
GROUP BY 
    a.FirstName, a.LastName;

Select * from ViewActorTotalBoxOffice
Exercise 6: View for Actor's Age and Movie Roles
Task: Create a view named ViewActorAgeAndRoles that shows each actor's age when acted that movie & also their current age and the roles they played in different movies.

-- Task 5: View for Actor's Total Box Office Collection
CREATE VIEW ViewActorsTotalBoxOffice AS
SELECT 
    a.FirstName, 
    a.LastName, 
    SUM(m.BoxOffice) AS TotalBoxOffice
FROM 
    Actors a
JOIN 
    MovieActors ma ON a.ActorID = ma.ActorID
JOIN 
    Movies m ON ma.MovieID = m.MovieID
GROUP BY 
    a.ActorID, a.FirstName, a.LastName
ORDER BY 
    TotalBoxOffice DESC;

Select * FROM ViewActorTotalBoxOffice

Use WORKCLASS

Select *,
Case
    When ReleaseYear >= 2020 Then 'Latest'
    When ReleaseYear >= 2010 Then 'Old'
    Else 'Old'
    End as Category
from Movies


Task 1: Categorize Movies Based on Box Office Collections


Task: Create a query to categorize movies into three groups based on their box office collections: 'Blockbuster', 'Hit', and 'Average'. Use the following criteria:

Blockbuster: BoxOffice > 10,000,000,000
Hit: BoxOffice between 1,000,000,000 and 10,000,000,000
Average: BoxOffice < 1,000,000,000

SELECT 
    Title,
    BoxOffice,
    CASE
        WHEN BoxOffice > 10000000000 THEN 'Blockbuster'
        WHEN BoxOffice BETWEEN 1000000000 AND 10000000000 THEN 'Hit'
        ELSE 'Average'
    END AS BoxOfficeCategory
FROM Movies;












Task 2: Determine Actors Age Group
Task: Create a query to determine the age group of each actor based on their birth date. The age groups are 'Young' (age < 30), 'Middle-aged' (age between 30 and 50), and 'Senior' (age > 50).
SELECT 
    FirstName,
    LastName,
    DATEDIFF(YEAR, BirthDate, GETDATE()) AS Age,
    CASE
        WHEN DATEDIFF(YEAR, BirthDate, GETDATE()) < 30 THEN 'Young'
        WHEN DATEDIFF(YEAR, BirthDate, GETDATE()) BETWEEN 30 AND 50 THEN 'Middle-aged'
        ELSE 'Senior'
    END AS AgeGroup
FROM Actors;

Task 3: Evaluate Movie Profitability
Task: Create a query to evaluate the profitability of each movie. Consider a movie 'Profitable' if BoxOffice > Budget and 'Not Profitable' if BoxOffice <= Budget.

SELECT 
    Title,
    Budget,
    BoxOffice,
    CASE
        WHEN BoxOffice > Budget THEN 'Profitable'
        ELSE 'Not Profitable'
    END AS Profitability
FROM Movies;



-- Stored Procedure

Declare @OrderAmount Decimal(10,2) = 1500.00

If @OrderAmount > 1000
Begin 
	Print 'Applying 10% discount'
End
Begin
	Print 'No Discount'
End

Declare @Counter Int = 10

While @Counter > 0
Begin 
	Print @Counter
	Set @Counter = @Counter - 1

End

Create Procedure spGetMoviesByGenre
	@Genre nvarchar(20)
As
Begin

Select * from Movies
	Where Genre = 'Action'
End

Execute spGetMoviesByGenre @Genre = 'Action'



