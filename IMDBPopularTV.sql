


/****** Checking the data types. ******/

sp_help [IMDB.dbo.IMDBpopular];

SELECT *
FROM IMDB.dbo.IMDBpopular;



/****** Changing the Rating data type from nvarchar to float. ******/

ALTER TABLE IMDB.dbo.IMDBpopular
ALTER COLUMN Rating float;



/****** Finding the top-rated TV shows based on IMDB rating. (Top 10) ******/

SELECT TOP 10 Name, Rating
FROM IMDB.dbo.IMDBpopular
ORDER BY Rating DESC;




/****** Grouping TV shows by year of release and finding the average IMDB rating for each year. ******/

SELECT Year, AVG(Rating) AS avg_rating
FROM IMDB.dbo.IMDBpopular
GROUP BY Year
ORDER BY avg_rating DESC;




/****** Counting the number of TV shows released each year. ******/

SELECT Year, COUNT(*) AS num_shows
FROM IMDB.dbo.IMDBpopular
GROUP BY Year
ORDER BY num_shows DESC;




/****** Finding TV shows with the highest and lowest IMDB ratings. ******/

-- TV shows with the highest IMDb rating
SELECT *
FROM IMDB.dbo.IMDBpopular
WHERE Rating = (SELECT MAX(Rating) FROM IMDB.dbo.IMDBpopular);

-- TV shows with the lowest IMDb rating
SELECT *
FROM IMDB.dbo.IMDBpopular
WHERE Rating = (SELECT MIN(Rating) FROM IMDB.dbo.IMDBpopular WHERE Rating > 0);



/****** What are the most popular TV shows on IMDB based on "user rating"(Rank)? (Top 10) ******/

SELECT TOP 10 Name
FROM IMDB.dbo.IMDBpopular
ORDER BY Rank;