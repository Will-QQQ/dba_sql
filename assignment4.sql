# Databases for Business Analytics
# Spring 2026 | Assignment 4

######### From Assignment 3 ############

## Build the Restaurants database 

DROP DATABASE IF EXISTS restaurants; #drop it if it exists
CREATE DATABASE restaurants;
USE restaurants;

## Build the Restaurant table

CREATE TABLE Restaurant(
  restaurantID int PRIMARY KEY AUTO_INCREMENT,
  restName varchar(255) NOT NULL,
  cuisine varchar(255) NOT NULL,
  borough varchar(255) NOT NULL,
  yearEst int NOT NULL,
  avgPrice int NOT NULL
);

## Build the Reviewer table

CREATE TABLE Reviewer (
  reviewerID int PRIMARY KEY AUTO_INCREMENT,
  firstName varchar(255) NOT NULL,
  lastName varchar(255) NOT NULL,
  affiliation varchar(255) DEFAULT NULL
);

## Populate the Restaurant table

INSERT INTO Restaurant(restName, cuisine, borough, yearEst, avgPrice) VALUES
('Pok Pok', 'Thai', 'Brooklyn', 2005, 100),
('Kiin Thai', 'Thai', 'Manhattan', 2013, 75),
('Carbone', 'Italian', 'Manhattan', 2010, 150),
('Il Mulino', 'Italian', 'Manhattan', 1999, 250),
('Don Peppe', 'Italian', 'Queens', 1998, 75),
('Loukoumi Taverna', 'Greek', 'Queens', 1994, 130),
('Nisi', 'Greek', 'Manhattan', 2014, 100),
('Ela Taverna', 'Greek', 'Brooklyn', 2015, 150);

## Populate the Reviewer table

INSERT INTO Reviewer (firstName, lastName, affiliation) VALUES
('Sarah', 'Martinez', 'NYT'),
('Brittany', 'Harris', 'Vogue'),
('Ashley', 'White', 'NYT'),
('Elizabeth', 'Thomas', 'Chronicle'),
('Chris', 'Jackson', 'NYT');

######### Assignment 4 Part 1 ############

## Build the Rating table

CREATE TABLE Rating (
  ratingID int PRIMARY KEY AUTO_INCREMENT,
  starRating int NOT NULL,
  ratingDate date DEFAULT NULL,
  comments varchar(255) DEFAULT NULL,   
  restaurantID int NOT NULL,
  reviewerID int NOT NULL,   
  CONSTRAINT Rating_restaurantID_fk FOREIGN KEY (restaurantID) REFERENCES Restaurant(restaurantID) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT Rating_reviewerID_fk FOREIGN KEY (reviewerID) REFERENCES Reviewer(reviewerID) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT Rating_chk_1 CHECK ((starRating <= 5)) 
);

## Populate the Rating table

INSERT INTO Rating (starRating, ratingDate, comments, restaurantID, reviewerID) VALUES 
(2, '2014-11-13', 'Good food, bad service', 1, 1),
(2, '2015-02-01', 'Disappointed', 3, 2),
(3, '2003-06-30', 'Overpriced', 4, 3),
(5, '2001-12-21', 'Loved everything', 6, 4),
(3, '2016-07-02', 'Great food, rude staff', 7, 4),
(4, NULL, 'Must try fish', 8, 5);

SELECT * FROM Rating;

######### Assignment 4 Part 2 ############

## Alter the Restaurant table

ALTER TABLE Restaurant
ADD streetAddress varchar(255),
ADD city varchar(50),
ADD state varchar(10),
ADD zipCode varchar(10),
ADD status varchar(10);

## Update records

UPDATE Restaurant SET streetAddress = '117 Columbia St', city = 'New York', state = 'NY', zipCode = '11231', status = 'closed' WHERE restaurantID = 1;
UPDATE Restaurant SET streetAddress = '36 E 8th St', city = 'New York', state = 'NY', zipCode = '10003', status = 'open' WHERE restaurantID = 2;
UPDATE Restaurant SET streetAddress = '181 Thompson St', city = 'New York', state = 'NY', zipCode = '10012', status = 'open' WHERE restaurantID = 3;
UPDATE Restaurant SET streetAddress = '86 W 3rd St', city = 'New York', state = 'NY', zipCode = '10012', status = 'open' WHERE restaurantID = 4;
UPDATE Restaurant SET streetAddress = '135-58 Lefferts Blvd', city = 'New York', state = 'NY', zipCode = '11420', status = 'closed' WHERE restaurantID = 5;
UPDATE Restaurant SET streetAddress = '45-07 Ditmars Blvd', city = 'New York', state = 'NY', zipCode = '11105', status = 'open' WHERE restaurantID = 6;
UPDATE Restaurant SET streetAddress = '250 W 47th St', city = 'New York', state = 'NY', zipCode = '10036', status = 'closed' WHERE restaurantID = 7;
UPDATE Restaurant SET streetAddress = '98 Berry St', city = 'New York', state = 'NY', zipCode = '11249', status = 'closed' WHERE restaurantID = 8;

SELECT * FROM Restaurant;

######### Assignment 4 Part 3 ############

## create a view for open restaurants

CREATE OR REPLACE VIEW OpenRestRatings AS
SELECT re.restName, AVG(ra.starRating) AS averageRating
FROM Restaurant re
JOIN Rating ra ON re.restaurantID = ra.restaurantID
WHERE re.status = 'open'
GROUP BY re.restName;

SELECT * FROM OpenRestRatings;

## Join Restaurant and Rating tables

SELECT re.restName, ra.starRating
FROM Restaurant re
JOIN Rating ra ON re.restaurantID = ra.restaurantID;

