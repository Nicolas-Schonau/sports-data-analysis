-- All players with 155 runs scored in one season, ordered by their runs scored

SELECT  p.namefirst||' '||p.namelast AS player_name,b.r AS runs_scored, b.yearid AS season
FROM batting b
LEFT JOIN people p on b.playerid = p.playerid
WHERE r >= 155
ORDER BY r DESC
;

-- All players with 1800+ career runs scored, ordered by their total runs scored

SELECT  p.namefirst||' '||p.namelast AS player_name, SUM(b.r) AS total_runs_scored
FROM batting b
LEFT JOIN people p on b.playerid = p.playerid
GROUP BY player_name
HAVING SUM(b.r) > 1800
ORDER BY total_runs_scored DESC
;

-- The pitcher with the most wins in a season

SELECT  pe.namefirst||' '||pe.namelast AS pitcher_name, SUM(pi.w) AS total_wins, pi.yearid AS season
FROM pitching pi
LEFT JOIN people pe on pi.playerid = pe.playerid
GROUP BY pitcher_name, season
ORDER BY total_wins DESC
LIMIT 1
; 

-- Pitchers with the most strike-outs per year (season and post season included), ordered by year
SELECT DISTINCT ON (pi.yearid)
	pe.namefirst||' '||pe.namelast AS pitcher_name, pi.yearid AS season, (pi.so + SUM(po.so)) AS total_so
FROM pitching pi
LEFT JOIN pitchingpost po ON pi.playerid = po.playerid
LEFT JOIN people pe ON pi.playerid = pe.playerid
WHERE pi.yearid = po.yearid 
GROUP BY pitcher_name,pi.yearid,po.yearid,pi.so
ORDER BY pi.yearid DESC, total_so DESC
;

-- Total strike-outs per pitcher for every season (post-season included)

SELECT pe.namefirst||' '||pe.namelast AS pitcher_name, pi.yearid AS season, (pi.so + SUM(po.so)) AS total_so
FROM pitching pi
LEFT JOIN pitchingpost po ON pi.playerid = po.playerid
LEFT JOIN people pe ON pi.playerid = pe.playerid
WHERE pi.yearid = po.yearid 
GROUP BY pitcher_name,pi.yearid,po.yearid,pi.so
ORDER BY pi.yearid DESC, total_so DESC
;
