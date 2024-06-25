#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "SELECT SUM(winner_goals + opponent_goals) as total_combinated FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "SELECT AVG(winner_goals) AS avg_winner_goals FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT ROUND(AVG(winner_goals),2) AS avg_winner_goals FROM games")"

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "SELECT AVG(winner_goals + opponent_goals) AS avg_winner_goals FROM games")"

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "SELECT winner_goals FROM games WHERE winner_goals in (SELECT MAX(winner_goals) FROM games)")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "SELECT COUNT(*) FROM games WHERE winner_goals > 2")"

echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "SELECT name FROM teams WHERE team_id IN (SELECT winner_id FROM games WHERE year = 2018 AND round = 'Final')")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "WITH winner AS (SELECT winner_id FROM games WHERE "year"=2014 AND "round"='Eighth-Final'), opponent AS (SELECT opponent_id FROM games WHERE "year"=2014 AND "round"='Eighth-Final') SELECT DISTINCT name FROM teams WHERE team_id IN (SELECT * FROM winner) OR team_id IN (SELECT * FROM opponent) ORDER BY name ")"

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "SELECT name FROM teams WHERE team_id IN (SELECT DISTINCT winner_id FROM games) ORDER BY name")"

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "WITH year_champion AS (SELECT "year", winner_id FROM games WHERE "round"='Final'), winner AS (SELECT * FROM teams WHERE team_id in (SELECT winner_id FROM games WHERE "round"='Final')) SELECT "year", name FROM year_champion y JOIN winner w ON y.winner_id = w.team_id ORDER BY y."year" ASC")"

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "SELECT name FROM teams WHERE name LIKE 'Co%'")"
