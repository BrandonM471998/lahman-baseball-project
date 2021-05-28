----------------------------------------------------
SELECT p.namefirst AS first_name, p.namelast AS last_name, 
	am.awardid AS award, am.yearid AS year, 
	am.lgid AS al_league, am2.lgid AS nl_league
			FROM awardsmanagers AS am 
			INNER JOIN people AS p
			USING (playerid)
			INNER JOIN awardsmanagers AS am2
			USING (playerid)
				WHERE am.awardid = 'TSN Manager of the Year'
				AND am.lgid = 'AL'
				AND am2.lgid = 'NL';


----------------------------------------------------






SELECT p.namefirst AS first_name, p.namelast AS last_name, 
	am.awardid AS award, am.yearid AS year, t.name AS team_name,
	am.lgid AS al_league, am2.lgid AS nl_league
			FROM awardsmanagers AS am 
			INNER JOIN teams AS t
			USING (lgid)
			INNER JOIN people AS p
			USING (playerid)
			INNER JOIN awardsmanagers AS am2
			USING (playerid)
				WHERE am.awardid = 'TSN Manager of the Year'
				AND am.lgid = 'AL'
				AND am2.lgid = 'NL';

---------------------------------------------------------
--ANSWER

WITH mngr_list AS (SELECT playerid, awardid, COUNT(DISTINCT lgid) AS lg_count
				   FROM awardsmanagers
				   WHERE awardid = 'TSN Manager of the Year'
				   		 AND lgid IN ('NL', 'AL')
				   GROUP BY playerid, awardid
				   HAVING COUNT(DISTINCT lgid) = 2),
		 		   mngr_full AS (SELECT playerid, awardid, lg_count, yearid, lgid
					   			 FROM mngr_list INNER JOIN awardsmanagers USING(playerid, awardid))
								 
											SELECT DISTINCT namegiven, namelast, name AS team_name, mngr_full.lgid, mngr_full.yearid
											FROM mngr_full INNER JOIN people USING(playerid)
											INNER JOIN managers USING(playerid, yearid, lgid)
											INNER JOIN teams ON mngr_full.yearid = teams.yearid 
											AND mngr_full.lgid = teams.lgid AND managers.teamid = teams.teamid;







