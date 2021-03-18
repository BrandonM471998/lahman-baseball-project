SELECT  DISTINCT p.namegiven AS player_name, 
		p.height AS player_height, 
		SUM(a.g_all) OVER (PARTITION BY p.namegiven) AS all_games_played
		--t.name AS team_name
		FROM people AS p INNER JOIN appearances AS a
			USING (playerid) INNER JOIN teams AS t
			USING (yearid)
				ORDER BY player_height ASC;



/*QUESTION 2: Edward Carl, 43 inches, played on Boston Braves, 
  Boston Red Sox, Brooklyn Dodgers, Chicago Cubs, Chicago White Sox, 
  Cincinnati Reds, Cleveland Indians, Detroit Tigers, New York Giants,
  New York Yankees, Philadelphia Athletics, Philadelphia Phillies,
  Pittsburgh Pirates, St. Louis Cardinals, Washington Senators*/