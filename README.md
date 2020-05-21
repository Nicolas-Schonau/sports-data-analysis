# SQL and the Major League Baseball
The aim of this repository is to show some SQL queries that can be used to analyze the data of the MLB.

## Database system
The database system used here is [PostgreSQL](https://www.postgresql.org/about/) 12, and the queries have been run directly in [PgAdmin 4](https://www.pgadmin.org/), the management tool for Postgres.

## Data source

All the data come from the [Lahman's Baseball Database](http://www.seanlahman.com/baseball-archive/statistics/), which *contains complete batting and pitching statistics from 1871 to 2019, plus fielding statistics, standings, team stats, managerial records, post-season data, and more.*

## Creation of the tables

The files have been downloaded in .csv format and, for the purpose of this exercise, only a few of them have been uploaded to the database i.e.: `batting`, `people`, `teams`,`pitching`and `pitchingpost`. All the code necessary to create the tables can be found in the [tables_creations.sql file](https://github.com/Nicotops/SQL-and-the-Major-League-Baseball/blob/master/tables_creation.sql).
