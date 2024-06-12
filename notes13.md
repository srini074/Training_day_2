## Mapping or Injection Table

- In order to divide a database with duplicate Id, name, gender and gmail id we can divide the database into three different tables such that the first table has 

- Separated data is called normalized data and before separation is called as de-normalized data.
- To avoid the anamolies and for storage purposes we are dividing one table into three.

![![Mapping table](image-40.png)](image-39.png)

## Normalization

- It is done to maintain safety of the data.

![normalization](image-41.png)

![alter table](image-42.png)

## Question and it's answer with explanation

![Question](image-43.png)

- Here we have to reduce the number of columns and make the table as shown in the image such that we can find the people with greater than 10 copper coins. Here we have the composite key

![Composite key](image-44.png)

- Further we have insertion,deletion and updation anamoly in the above image so we need to go for normalization 2.

![Normalization 2](image-45.png)

- In the second normal form as shown in the above image we have broken the table into two tables for data safety.

- If the colum is not entirely dependent on th entire primary key then we have to divide it into second noormal form.
- If a table is in second normal form it has to satisfy both first and second normal forms

- Lesser updates more data safety
![3rd](image-47.png)

![3nd normal form](image-46.png)

## 3rd normal form rules

![3rd normal form rules](image-48.png)
- Primary key also should depend on Primary key
## Joins

![Joins](image-49.png)

![Joins](image-50.png)

- Inner join - common elements
- Left join extra items of first table - others null
- Right join - extra items of second table - others null
- Full join 

## Excersice - 6

- SELECT * FROM movies INNER JOIN boxoffice ON movies.id = boxoffice.movie_id
- SELECT title, domestic_sales, international_sales
FROM movies
  JOIN boxoffice
    ON movies.id = boxoffice.movie_id
WHERE international_sales > domestic_sales;
- SELECT * FROM movies INNER JOIN boxoffice ON movies.Id=boxoffice.movie_id ORDER BY rating DESC;

![Screenshot-6](image-51.png)

## Excersice - 7

- SELECT DISTINCT buildings from employees;
- SELECT * FROM buildings;
- SELECT distinct building_name,role FROM buildings LEFT JOIN employees ON building_name=building; 

![Screenshot-7](image-52.png)

## Excersice - 8

- SELECT * FROM employees WHERE building is NULL;
- SELECT Building_name FROM buildings LEFT JOIN employees ON buildings.building_name=employees.building WHERE employees.name is NULL;

![Screenshot-8](image-53.png)

## Excersice 9

- SELECT title, (Domestic_sales + International_sales)/1000000 AS sales
FROM Boxoffice b
INNER JOIN movies m
ON b.Movie_id=m.id;
- SELECT title, (Rating)*10 AS sales
FROM Boxoffice b
INNER JOIN movies m
ON b.Movie_id=m.id;
- SELECT title, year
FROM movies
WHERE year % 2 = 0;

![Screenshot-9](image-54.png)

## Excersice 10

- SELECT MAX(years_employed) FROM employees ;
- SELECT role, AVG(years_employed) as ag FROM employees group by role;
- SELECT building, SUM(years_employed) as Total_years_employed
FROM employees
GROUP BY building;

![Screenshot-10](image-55.png)