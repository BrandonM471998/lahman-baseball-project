# lahman-baseball-project

# Introduction
Our team was given Lahman's Baseball Database, and we were tasked with analyzing the data and reporting back any interesting findings. There were a total of 9 main questions and I was assigned with questions 2, 5, and 9. There were a total of 27 tables, and for this project our team used PostgreSQL.

Data Sources: <br/>[Lahman's Baseball Database](http://www.seanlahman.com/baseball-archive/statistics/)<br/>
[Lahman's Baseball ERD](http://www.seanlahman.com/files/database/readme2016.txt)

# Table of Contents
* [Introduction](#Introduction)
* [SQL Walkthrough](#SQL-Walkthrough)

# SQL Walkthrough

1. For question 2, I was asked to find the name and height of the shortest palyer in the database along with how many games he played in and what team he was on.

2. I start the query by using the `FROM` statement to select the tables I need to `INNER JOIN` in order to find my answer. I'm able to join the tables with the `USING` statement because the keys are the same for each table. I then use `SELECT` to get the player name, player height, all games played, and team name from each respective table.
Lastly I use the `WHERE` statement with a subquery to only return the player with the minimum height from the people table.

![Question 2](./assets/question_2.jpg)

3. For question 5 I needed to find the average number of strikeouts per game by decade since 1920 and rounding to 2 decimal places, along with finding the average number of home runs per game by decade.

4. 

![Question 5](./assets/question_5.jpg)

5. For question 9 I was asked to find which managers had won the TSN Manager of the Year award in both the National Leage and the Americal League, along with their full name and the teams they were managing when they won the award.

6. 

![Question 9](./assets/question_9.jpg)