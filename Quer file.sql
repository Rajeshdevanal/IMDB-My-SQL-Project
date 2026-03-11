show databases;
use project_movie_database;
Show tables;

describe movies;
describe directors;

#join Both Tables.
SELECT *
FROM movies m
LEFT JOIN directors d
ON m.director_id = d.id
union
SELECT *
FROM movies m
RIGHT JOIN directors d
ON m.director_id = d.id;



#Can you get all data about movies.
Select * From movies;

#How do you get all data about directors.
select * from directors;

#Check how many movies are present in IMDB.
select count(original_title) as total_movies from movies;

#Find these 3 directors: James Cameron ; Luc Besson ; John Woo
SELECT *
FROM directors
WHERE name IN ('James Cameron', 'Luc Besson', 'John Woo');

#Find all directors with name starting with S.
SELECT count(*) AS Start_with_S
FROM directors
WHERE name LIKE 'S%';

SELECT name AS Start_with_S
FROM directors
WHERE name LIKE 'S%';


#Count female directors.
select count(*) as females from directors where gender = 1;

#Find the name of the 10th first women directors
select name  from directors where gender = 1 limit 10;

#What are the 3 most popular movies.
select original_title from movies order by popularity desc limit 3;

#What are the 3 most bankable movies
select original_title ,(revenue - budget) as profit from movies order by profit desc limit 3;

#What is the most awarded average vote since the January 1st, 2000

select original_title,vote_average from movies where release_date > "2000-1-1" order by vote_average desc;

#Which movie(s) were directed by Brenda Chapman
select m.original_title from movies m join directors d on m.director_id = d.id  where d.name ="Brenda Chapman";

SELECT m.title
FROM movies m
JOIN directors d
ON m.director_id = d.id
WHERE d.name = 'Brenda Chapman';

#Which director made the most movies
SELECT d.name, COUNT(m.id) AS movie_count FROM movies m JOIN directors d ON m.director_id = d.id GROUP BY d.name ORDER BY movie_count DESC 
LIMIT 1;

#Which director is the most bankable
select d.name,
 sum(m.revenue - m.budget) as profit from movies m  join directors d on m.director_id = d.id group by d.name order by profit desc limit 3;






