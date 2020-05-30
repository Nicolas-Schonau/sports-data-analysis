# SQL, Python and the Major League Baseball
The aim of this repository is to show how SQL queries and Python can be used to analyze the data of the MLB.

## Database system
The database system used here is [PostgreSQL](https://www.postgresql.org/about/) 12, and the queries have been run directly in [PgAdmin 4](https://www.pgadmin.org/), the management tool for Postgres.

## Data source

The data come from the [Lahman's Baseball Database](http://www.seanlahman.com/baseball-archive/statistics/), which *contains complete batting and pitching statistics from 1871 to 2019, plus fielding statistics, standings, team stats, managerial records, post-season data, and more.*

## Creation of the tables

The files have been downloaded in .csv format and, for the purpose of this exercise, only a few of them have been uploaded to the database i.e.: `batting`, `people`, `teams`,`pitching`and `pitchingpost`. All the code necessary to create the tables can be found in the [tables_creations.sql file](https://github.com/Nicotops/SQL-and-the-Major-League-Baseball/blob/master/tables_creation.sql).

## Cases

The first few queries of the [analysis.sql file](https://github.com/Nicotops/SQL-and-the-Major-League-Baseball/blob/master/analysis.sql) aim to recreate some of the MLB's All time records, such as :
- a list of all players with at least 155 runs scored in one season
- all players with 1800+ career runs scored 
- the pitcher with the most wins in a season.

**Note**: for some reason, the data show some discrepancies with the ones found on [mlb.com/stats](https://www.mlb.com/stats/), but all comply with the ones on [Baseball-Reference](https://www.baseball-reference.com/).

## Python use 
SQL and Python can be used at the same time to perform some calculations on the data and get some visualisations. A Jupyter notebook is available to explain how both languages can be used in order to answer the question: "Can money buy wins?"
