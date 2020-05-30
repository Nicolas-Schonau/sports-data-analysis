# SQL, Python and the Major League Baseball
The aim of this repository is to show how SQL queries and Python can be used to analyze the data of the MLB.

## Database system
The database system used here is [PostgreSQL](https://www.postgresql.org/about/) 12, and the queries have been run directly in [PgAdmin 4](https://www.pgadmin.org/), the management tool for Postgres.

## Data source

The data come from the [Lahman's Baseball Database](http://www.seanlahman.com/baseball-archive/statistics/), which *contains complete batting and pitching statistics from 1871 to 2019, plus fielding statistics, standings, team stats, managerial records, post-season data, and more.*

## Creation of the tables

The files have been downloaded in .csv format and, for the purpose of this exercise, only a few of them have been uploaded to the database i.e.: `batting`, `people`, `teams`,`pitching`and `pitchingpost`. All the code necessary to create the tables can be found in the [tables_creations.sql file](https://github.com/Nicotops/SQL-and-the-Major-League-Baseball/blob/master/tables_creation.sql).

## SQL cases

In order to understand how SQL can help us query this dataset to give us meaningful insights, a [Jupyter notebook](https://github.com/Nicolas-Schonau/SQL-Python-and-the-Major-League-Baseball/blob/master/guide_to_query_the_data_with_sql.ipynb) breaks down all the steps necessary to make an analysis on the leader in terms of strike-outs.

The other queries in the [analysis.sql file](https://github.com/Nicotops/SQL-and-the-Major-League-Baseball/blob/master/analysis.sql) aim to recreate some of the MLB's All time records, such as :
- a list of all players with at least 155 runs scored in one season
- all players with 1800+ career runs scored 
- the pitcher with the most wins in a season.

**Note**: for some reason, the data show some discrepancies with the ones found on [mlb.com/stats](https://www.mlb.com/stats/), but all comply with the ones on [Baseball-Reference](https://www.baseball-reference.com/).

## Python use : Can money buy wins?

SQL and Python can be used at the same time to perform some calculations on the data and get some visualisations. A [Jupyter notebook](https://github.com/Nicolas-Schonau/SQL-Python-and-the-Major-League-Baseball/blob/master/wins_payroll_correlation.ipynb) is available to explain how both languages can be used in order to answer the question: "Is there a correlation between salaries spendings and the number of wins a team can get?" In other words, "can money buy wins?"
