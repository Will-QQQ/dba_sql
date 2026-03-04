# Databases for Business Analytics
# Spring 2026 | Assignment 3

######### PART 1: CREATE DB AND TABLES ############

DROP DATABASE IF EXISTS restaurants_db;
CREATE DATABASE restaurants_db;
USE restaurants_db;

CREATE TABLE Restaurant (
    restaurantID INT AUTO_INCREMENT PRIMARY KEY,
    restName VARCHAR(255) NOT NULL,
    cuisine VARCHAR(255) NOT NULL,
    borough VARCHAR(255) NOT NULL,
    yearEst INT NOT NULL,                          #integer only
    avgPrice INT NOT NULL                          #integer only
);

CREATE TABLE Reviewer (
    reviewerID INT AUTO_INCREMENT PRIMARY KEY, 
    firstName VARCHAR(255) NOT NULL CHECK (firstName REGEXP '^[A-Za-z ]+$'),  #letters & spaces allowed
    lastName VARCHAR(255) NOT NULL CHECK (lastName REGEXP '^[A-Za-z ]+$'),    #letters & spaces allowed
    affiliation VARCHAR(255) DEFAULT NULL                                     #not required
);

######### PART 3: POPULATE AND QUERY DB ############

SHOW TABLES;
DESCRIBE Restaurant;
DESCRIBE Reviewer;

## insert data into the Restaurant table

INSERT INTO Restaurant (restName, cuisine, borough, yearEst, avgPrice) VALUES
('Pok Pok', 'Thai', 'Brooklyn', 2005, 100),
('Kiin Thai', 'Thai', 'Manhattan', 2013, 75),
('Carbone', 'Italian', 'Manhattan', 2010, 150),
('II Mulino', 'Italian', 'Manhattan', 1999, 250),
('Don Peppe', 'Italian', 'Queens', 1998, 75),
('Loukoumi Taverna', 'Greek', 'Queens', 1994, 130),
('Nisi', 'Greek', 'Manhattan', 2014, 100),
('Ela Taverna', 'Greek', 'Brooklyn', 2015, 150);

INSERT INTO Reviewer (firstName, lastName, affiliation) VALUES
('Sarah', 'Martinez', 'NYT'),
('Brittany', 'Harris', 'Vogue'),
('Ashley', 'While', 'NYT'),
('Elizabeth', 'Thomas', 'Chronicle'),
('Chris', 'Jackson', 'NYT');

## query 1: what are the names and year established of all restaurants, ordered from oldest to newest
SELECT restName, yearEst FROM Restaurant ORDER BY yearEst ASC;

## query 2: how many restaurants are there for each cuisine type
SELECT cuisine, COUNT(*) AS total_restaurants FROM Restaurant
GROUP BY cuisine ORDER BY total_restaurants DESC;

## query 3: which restaurants have an average price between $100 and $200?
SELECT restName, avgPrice FROM Restaurant
WHERE avgPrice BETWEEN 100 AND 200;