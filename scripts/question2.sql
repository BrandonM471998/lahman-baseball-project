
/*attempt 1*/
SELECT DISTINCT p.namegiven AS player_name, 
		p.height AS player_height, 
		SUM(a.g_all) OVER (PARTITION BY p.namegiven) AS all_games_played,
		t.name AS team_name
		FROM people AS p INNER JOIN appearances AS a
			USING (playerid) INNER JOIN teams AS t
			USING (yearid)
				ORDER BY player_height ASC;





			/*attempt 2*/
			SELECT *
			FROM people AS p INNER JOIN appearances AS a
			USING (playerid) INNER JOIN teams AS t
			USING (teamid, yearid)
			WHERE p.height = (SELECT MIN(height) FROM people);




  
  /*attempt 3*/
  SELECT p.namegiven AS player_name, 
		 p.height AS player_height, 
		 a.g_all AS all_games_played,
		 t.name AS team_name
		 FROM people AS p INNER JOIN appearances AS a
			USING (playerid) INNER JOIN teams AS t
			USING (teamid, yearid)
			WHERE p.height = (SELECT MIN(height) FROM people)
			
/*QUESTION 2: Edward Carl, 43 inches, played for the St. Louis Browns*/