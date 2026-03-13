# Databases for Business Analytics
# Spring 2026 | Assignment 5

######### STEP 1: ALTER THE TABLE (CHOICE B) ############

ALTER TABLE Restaurant MODIFY borough VARCHAR(255);
ALTER TABLE Restaurant MODIFY yearEst INT;
ALTER TABLE Restaurant MODIFY avgPrice VARCHAR(10);
ALTER TABLE Restaurant MODIFY streetaddress VARCHAR(255);
ALTER TABLE Restaurant MODIFY state VARCHAR(2);
ALTER TABLE Restaurant MODIFY zip VARCHAR(5);
ALTER TABLE Restaurant MODIFY status VARCHAR(225);

######### STEP 4: IMPORT RECORDS ############

SELECT restaurantID, restName, cuisine, avgPrice, city, zip
FROM Restaurant
WHERE restaurantID >= 9;

######### STEP 5: QUERY BY CUSINE ############

SELECT cuisine, COUNT(*) AS restaurant_count
FROM Restaurant
WHERE restaurantID >= 9
GROUP BY cuisine
ORDER BY restaurant_count DESC, cuisine ASC;


