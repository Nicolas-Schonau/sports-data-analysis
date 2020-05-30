# SQL, Python and the Major League Baseball
The aim of this repository is to show how SQL queries and Python can be used to analyze the data of the MLB.

## Database system
The database system used here is [PostgreSQL](https://www.postgresql.org/about/) 12, and the queries have been run directly in [PgAdmin 4](https://www.pgadmin.org/), the management tool for Postgres.

## Data source

All the data come from the [Lahman's Baseball Database](http://www.seanlahman.com/baseball-archive/statistics/), which *contains complete batting and pitching statistics from 1871 to 2019, plus fielding statistics, standings, team stats, managerial records, post-season data, and more.*

## Creation of the tables

The files have been downloaded in .csv format and, for the purpose of this exercise, only a few of them have been uploaded to the database i.e.: `batting`, `people`, `teams`,`pitching`and `pitchingpost`. All the code necessary to create the tables can be found in the [tables_creations.sql file](https://github.com/Nicotops/SQL-and-the-Major-League-Baseball/blob/master/tables_creation.sql).

## Case

The first few queries of the [analysis.sql file](https://github.com/Nicotops/SQL-and-the-Major-League-Baseball/blob/master/analysis.sql) aim to recreate some of the MLB's All time records, such as :
- a list of all players with at least 155 runs scored in one season
- all players with 1800+ career runs scored 
- the pitcher with the most wins in a season.

**Note**: for some reason, the data show some discrepancies with the ones that can be found on [mlb.com/stats](https://www.mlb.com/stats/), but they all comply with the ones on [Baseball-Reference](https://www.baseball-reference.com/).

## Example: Analysis on the leader in strike-outs

So the objective of this query is to get, per year, the name of the player with the most strike-outs (regular season and post-season included) with his actual number of strike-outs.
This query in an interesting one to break down, because it combines several files who don't always have the same structure. The ```pitching``` table contains a line per player and per year for the regular season, meaning every stats of a player for a particular season is on a single line. the ```pitchingpost``` table, on the contrary, details the results per match, meaning that for a single post-season, we'll have several lines to add. 

Let's start by querying the ```playerid```, ```yearid``` and ```so``` from the ```pitching``` table to get the number of strike-outs per player and per year, with a limit on 10 results just for the example:
```sql
SELECT playerid, yearid, so
FROM pitching
LIMIT 10;
```

Which gives us this:
|	playerid	|	yearid	|	so	|
|		---		|	---		|	---	|
|	bechtge01	|	1871	|	1	|
|	brainas01	|	1871	|	13	|
|	fergubo01	|	1871	|	0	|
|	fishech01	|	1871	|	15	|
|	fleetfr01	|	1871	|	0	|

Let's now add the ```pitchingpost``` table. This can be done with several steps:
1. Create a ```LEFT JOIN``` on the playerid columns, which are present in both tables. The ```LEFT JOIN``` here will return all lines present in the first table, ```pitching```, plus the matching lines in the ```pitchingpost```
2. Get the total number of strike-outs per player, by adding the column ```so``` from ```pitching``` to the sum of all strike-outs of the different matches in the post-seasons.
3. We want to make sure that the strike-outs of a post-season are added to the strike-outs of the related season (e.g.: the strike-outs in the 2019 post-season must be added to the strike-outs of the 2019 season, not to another season), so we are going to add a ```WHERE``` clause and link the years of both tables
4. As we have an aggregate in the ```SELECT ``` clause, we'll have to group our results, so the ```GROUP BY``` clause will be added
 

 ```sql
SELECT pi.playerid, pi.yearid, (pi.so + SUM(po.so)) AS total_so
FROM pitching pi
LEFT JOIN pitchingpost po ON pi.playerid = po.playerid
WHERE pi.yearid = po.yearid
GROUP BY pi.playerid, pi.yearid, po.yearid,pi.so
LIMIT 5;
```
This gives us :
|	playerid	|	yearid	|	total_so	|
|		---		|		---	|	---	|
|	aasedo01	|	1979	|	102	|
|	abadfe01	|	2014	|	51	|
|	abbotgl01	|	1975	|	51	|
|	abbotpa01	|	2000	|	104	|
|	abbotpa01	|	2001	|	123	|

The next step is to actually keep one name per year. This can be done by ordering the results first per ```pi.yearid``` and then by ```total_so``` by using a ```GROUP BY``` clause. Then, we'll add a ```DISTINCT ON``` clause that we'll apply to ```pi.yearid```, which will allow us to keep the best result per year :
```sql
SELECT DISTINCT ON (pi.yearid)
	pi.playerid, pi.yearid, (pi.so + SUM(po.so)) AS total_so
FROM pitching pi
LEFT JOIN pitchingpost po ON pi.playerid = po.playerid
WHERE pi.yearid = po.yearid
GROUP BY pi.playerid, pi.yearid, po.yearid,pi.so
ORDER BY pi.yearid DESC, total_so DESC
LIMIT 5;
```

As result we obtain:
|	playerid	|	yearid	|	total_so	|
|		---		|	---		| ---	|
|	colege01	|	2019	|	373	|
|	verlaju01	|	2018	|	307	|
|	salech01	|	2017	|	320	|
|	scherma01	|	2016	|	296	|
|	kershcl01	|	2015	|	320	|

Finally, in order to make the results a litlle bit easier to read, let's give the player their full name instead of their playerid. This info is located in the ```people``` table, so we'll just need another ```LEFT JOIN```. Let's also change the ```yearid``` column to ```season``` and ```total_so``` by ```total_strikeouts``` and then we'll be clear :

```sql
SELECT DISTINCT ON (pi.yearid)
	pe.namefirst||' '||pe.namelast AS pitcher_name, pi.yearid AS season, (pi.so + SUM(po.so)) AS total_strikeouts
FROM pitching pi
LEFT JOIN pitchingpost po ON pi.playerid = po.playerid
LEFT JOIN people pe ON pi.playerid = pe.playerid
WHERE pi.yearid = po.yearid
GROUP BY pitcher_name, pi.yearid, po.yearid,pi.so
ORDER BY pi.yearid DESC, total_strikeouts DESC
LIMIT 5;
```

And voilà!
|	pitcher_name	|	season	|	total_strikeouts	|
|		---			|	---		|	---	|
|	Gerrit Cole	|	2019	|	373	|
|	Justin Verlander	|	2018	|	307	|
|	Chris Sale	|	2017	|	320	|
|	Max Scherzer	|	2016	|	296	|
|	Clayton Kershaw	|	2015	|	320	|

For the full results, just delete the ```LIMIT``` clause and you'll have the complete results.
