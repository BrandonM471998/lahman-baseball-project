
/*attempt 1*/
SELECT ROUND(AVG(soa), 2) AS strikeouts, ROUND(AVG(hr), 2) AS homeruns,
CASE WHEN yearid BETWEEN 1920 AND 1929 THEN '1920s'
WHEN yearid BETWEEN 1930 AND 1939 THEN '1930s'
WHEN yearid BETWEEN 1940 AND 1949 THEN '1940s'
WHEN yearid BETWEEN 1950 AND 1959 THEN '1950s'
WHEN yearid BETWEEN 1960 AND 1969 THEN '1960s'
WHEN yearid BETWEEN 1970 AND 1979 THEN '1970s'
WHEN yearid BETWEEN 1980 AND 1989 THEN '1980s'
WHEN yearid BETWEEN 1990 AND 1999 THEN '1990s'
WHEN yearid BETWEEN 2000 AND 2009 THEN '2000s'
ELSE '2010s' END AS games_by_decades
FROM teams
GROUP BY games_by_decades
ORDER BY games_by_decades ASC;




/*attempt 2*/
SELECT yearid, g, name, hr, soa, so
FROM teams
LIMIT 5;

WITH test AS

	(SELECT ROUND(AVG(soa + so)/2, 2) AS strikeouts,
	 ROUND(AVG(hr), 2) AS homeruns,
	 yearid AS year, name AS team_name, g AS games_played
		FROM teams
		GROUP BY yearid, name, g
		LIMIT 20)

			SELECT *, ROUND(strikeouts / games_played, 2) AS strikeouts_per_game
			FROM test;
			
			
			
			
/*attempt 3*/
WITH baseball_decades AS

(SELECT ROUND(AVG(soa + so)/2, 2) AS strikeouts,
	 ROUND(AVG(hr), 2) AS homeruns, FLOOR(yearid/10)*10 AS decades
		FROM teams
		GROUP BY decades
		ORDER BY decades ASC)
		
			SELECT *
			FROM baseball_decades
			WHERE decades >= 1920;
			
---------------------------------------------
/*QUESTION 5 ANSWER*/