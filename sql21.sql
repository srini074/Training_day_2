Drop Table Actors
DROP TABLE MovieActors
DROP TABLE Movies
DROP TABLE Directors

Create database moviedb
Use moviedb
DROP database moviedb
CREATE DATABASE moviesactors
Use moviesactors
CREATE TABLE Directors(
DirectorId INT Identity(1,1) NOT NULL PRIMARY KEY,
Names VARCHAR(40) NOT NULL,
)


CREATE TABLE Actor(
ActorId INT Identity(20,1) PRIMARY KEY NOT NULL,
Names Varchar(40) NOT NULL,
)



CREATE TABLE Movies(
    MovieId INT Identity(10,1) NOT NULL PRIMARY KEY,
    Title VARCHAR(40) NOT NULL,
    Ryear INT NOT NULL,
    DirectorId INT NOT NULL,
    FOREIGN KEY (DirectorId) REFERENCES Directors(DirectorId)
);


CREATE TABLE MovieActors(
    MovieId INT NOT NULL,
    ActorId INT NOT NULL,
    PRIMARY KEY (MovieId, ActorId),
    FOREIGN KEY (MovieId) REFERENCES Movies(MovieId),
    FOREIGN KEY (ActorId) REFERENCES Actor(ActorId)
);


INSERT INTO Directors VALUES
('S.S.Rajamouli'),
('Trivikram Srinivas'),
('Puri Jagannadh'),
('S.S.Rajamouli'),
('Koratala Siva'),
('Sandeep Reddy Vanga'),
('Parasuram'),
('Puri Jagannadh'),
('S.S.Rajamouli'),
('Trivikram Srinivas');

Insert into Actor values
('Prabhas'),
('Allu Arjun'),
('Mahesh Babu'),
('Ram Charan'),
('Mahesh Babu'),
('Vijay Deverakonda'),
('Vijay Deverakonda'),
('Jr. NTR'),
('Nani'),
('Pawan Kalyan');

Select * from Directors
Select * from Actor
Select * from Movies

INSERT INTO Movies VALUES
   ('Baahubali',2015,1),		
   ('Ala Vaikunthapurramuloo',2020,2),	
	('Pokiri',2006,3),
	('Magadheera',2009,4),	
	('Srimanthudu',2015,5),	
	('Arjun Reddy',2017,6),	
	('Geetha Govindam',2018,7),
	('Temper',2015,8),	
	('Eega',2012,9),
	('Attarintiki Daredi',2013,10);

Select * from Movies

INSERT INTO MovieActors VALUES
(10,20),
(11,21),
(12,22),
(13,23),
(14,24),
(15,25),
(16,26),
(17,27),
(18,28),
(19,29);

Drop Table Actors
DROP TABLE MovieActors
DROP TABLE Movies
DROP TABLE Directors

Create database moviedb
Use moviedb
DROP database moviedb
CREATE DATABASE moviesactors
Use moviesactors
CREATE TABLE Directors(
DirectorId INT Identity(1,1) NOT NULL PRIMARY KEY,
Names VARCHAR(40) NOT NULL,
)


CREATE TABLE Actor(
ActorId INT Identity(20,1) PRIMARY KEY NOT NULL,
Names Varchar(40) NOT NULL,
)



CREATE TABLE Movies(
    MovieId INT Identity(10,1) NOT NULL PRIMARY KEY,
    Title VARCHAR(40) NOT NULL,
    Ryear INT NOT NULL,
    DirectorId INT NOT NULL,
    FOREIGN KEY (DirectorId) REFERENCES Directors(DirectorId)
);


CREATE TABLE MovieActors(
    MovieId INT NOT NULL,
    ActorId INT NOT NULL,
    PRIMARY KEY (MovieId, ActorId),
    FOREIGN KEY (MovieId) REFERENCES Movies(MovieId),
    FOREIGN KEY (ActorId) REFERENCES Actor(ActorId)
);


INSERT INTO Directors VALUES
('S.S.Rajamouli'),
('Trivikram Srinivas'),
('Puri Jagannadh'),
('S.S.Rajamouli'),
('Koratala Siva'),
('Sandeep Reddy Vanga'),
('Parasuram'),
('Puri Jagannadh'),
('S.S.Rajamouli'),
('Trivikram Srinivas');

Insert into Actor values
('Prabhas'),
('Allu Arjun'),
('Mahesh Babu'),
('Ram Charan'),
('Mahesh Babu'),
('Vijay Deverakonda'),
('Vijay Deverakonda'),
('Jr. NTR'),
('Nani'),
('Pawan Kalyan');

Select * from Directors
Select * from Actor
Select * from Movies

INSERT INTO Movies VALUES
   ('Baahubali',2015,1),		
   ('Ala Vaikunthapurramuloo',2020,2),	
	('Pokiri',2006,3),
	('Magadheera',2009,4),	
	('Srimanthudu',2015,5),	
	('Arjun Reddy',2017,6),	
	('Geetha Govindam',2018,7),
	('Temper',2015,8),	
	('Eega',2012,9),
	('Attarintiki Daredi',2013,10);

Select * from Movies

INSERT INTO MovieActors VALUES
(10,20),
(11,21),
(12,22),
(13,23),
(14,24),
(15,25),
(16,26),
(17,27),
(18,28),
(19,29);
------------------------------------
Select * from movies
SELECT * FROM Actor
Select * from MovieActors

select 
		m.movieID as [@movieID], 
		title as [MovieInfo/movietitle], 
		Ryear as [MovieInfo/releaseYear], 
		d.Names, 
		Names
FROM movies m
    JOIN Directors d ON d.DirectorId = m.DirectorId
    JOIN movieActors ma ON m.MovieId = ma.MovieId
    JOIN actor a ON a.ActorId = ma.ActorId
FOR XML Path ('Movie'), Root('Movies')

SELECT 
	MovieId as [@MovieId], -- attribute
	Title as [MovieInfo/Title], -- nesting xml
	[Ryear] as [MovieInfo/Year],
	DirectorId
FROM Movies
FOR XML Path ('Movie'), Root('Movies')

SELECT 
	MovieId as [@MovieId], -- attribute
	Title as [MovieInfo/Title], -- nesting xml
	[Ryear] as [MovieInfo/Year],
	DirectorId
FROM Movies
FOR XML Path ('Movie'), Root('Movies')
 
SELECT 
	MovieId as [Id],-- renameing the key
	Title as 'MovieInfo.Title', -- nesting JSON
	[Ryear] as 'MovieInfo.Year', -- nesting JSON
	DirectorId
FROM Movies
FOR JSON Path, Root('Movies')

select 
		m.movieID as [@movieID], 
		title as [MovieInfo/movietitle], 
		Ryear as [MovieInfo/releaseYear], 
		d.Names, 
		Names
FROM movies m
    JOIN Directors d ON d.DirectorId = m.DirectorId
    JOIN movieActors ma ON m.MovieId = ma.MovieId
    JOIN actor a ON a.ActorId = ma.ActorId
FOR XML Path ('Movie'), Root('Movies')

select 
		m.movieID as [@movieID], 
		title as [MovieInfo/movietitle], 
		Ryear as [MovieInfo/releaseYear], 
		d.Names, 
		Names
FROM movies m
    JOIN Director d ON d.DirectorId = m.DirectorId
    JOIN MovieActors ma ON m.MovieId = ma.MovieId
    JOIN actor a ON a.actorID = ma.actorID
FOR XML Path ('Movie'), Root('Movies')


select 
		
		movietitle as 'Movie.movietitle', 
		[releaseYear] as 'Movie.releaseYear', 
		m.movieID as 'Movie.MovieID', 
		d.directorID as'Director.dierctorID',
		d.directorName as'Director.dierctorName', 
		a.actorID as 'Actor.actorID',
		actorName as 'Actor.actorName'
FROM movies m
    JOIN director d ON d.directorID = m.directorId
    JOIN movieActors ma ON m.movieID = ma.movieID
    JOIN actor a ON a.actorID = ma.actorID
FOR JSON Path, Root('Movies')



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

