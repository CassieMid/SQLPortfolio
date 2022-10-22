SELECT *
FROM Airline..satisfactiontable
ORDER BY 24 DESC

-- How many passengers there are.

SELECT COUNT(ID) AS total_passengers
FROM Airline..satisfactiontable

-- Exploring how many passengers are satisfied vs neutral or dissatisfied

SELECT COUNT(ID) AS total_passengers, Satisfaction
FROM Airline..satisfactiontable
GROUP BY Satisfaction

-- Passenger satisfaction based on Class

SELECT Class, Satisfaction, COUNT(ID) AS total_passengers
FROM Airline..satisfactiontable
GROUP BY Class, Satisfaction
ORDER BY total_passengers DESC

-- Looking at average age, oldest, and youngest age.

SELECT MAX(Age) as Oldest, MIN(Age) as Youngest, AVG(Age) as AverageAge
FROM Airline..satisfactiontable

-- Looking how many passengers are of each age
SELECT Age, COUNT(Age) AS total_passengers
FROM Airline..satisfactiontable
GROUP BY Age
ORDER BY total_passengers DESC

-- Looking at how many passengers are satisfied vs neutral or dissatisfied by age
SELECT Age, COUNT(Satisfaction) as total_passengers, Satisfaction
FROM Airline..satisfactiontable
GROUP BY Satisfaction, Age
--HAVING Satisfaction = 'Neutral or Dissatisfied' 
ORDER BY Age, Satisfaction ASC

-- Looking at how many people are satisfied between the ages of 30 and 50.
SELECT Age, COUNT(Satisfaction) as total_passengers, Satisfaction
FROM Airline..satisfactiontable
WHERE Age BETWEEN 30 AND 50
GROUP BY Satisfaction, Age
HAVING Satisfaction = 'Satisfied' 
ORDER BY Age DESC


-- Exploring Gender count
SELECT Gender, COUNT(Gender) AS total_passengers
FROM Airline..satisfactiontable
GROUP BY Gender

-- Exploring satisfaction rating based on gender
SELECT COUNT(Gender) as total_passengers, Gender, Satisfaction
FROM Airline..satisfactiontable
GROUP BY Satisfaction, Gender
ORDER BY total_passengers DESC

-- Exploring customer type and satisfaction

SELECT Customer_Type, COUNT(Customer_Type) as total_passengers
FROM Airline..satisfactiontable
GROUP BY Customer_Type

-- Looking at satisfaction rating based on customer type

SELECT COUNT(Customer_type) as total_passengers, Customer_Type, Satisfaction
FROM Airline..satisfactiontable
GROUP BY Satisfaction, Customer_Type
ORDER BY total_passengers DESC

-- Exploring type of travel

SELECT Type_of_Travel, COUNT(Type_of_Travel) as total_passengers
FROM Airline..satisfactiontable
GROUP BY Type_of_Travel

-- Exploring type of travel

SELECT COUNT(Type_of_Travel) as total_passengers, Type_of_Travel, Satisfaction
FROM Airline..satisfactiontable
GROUP BY Satisfaction, Type_of_Travel
ORDER BY Type_of_travel DESC


-- Looking at departure delay and age, and how it may affect satisfaction

SELECT Age, Satisfaction, COUNT(ID) AS total_passengers, 
ROUND(AVG(Departure_Delay), 2) AS avg_depature_delay_minutes
FROM Airline..satisfactiontable
WHERE Age > 30
GROUP BY Age, Satisfaction
ORDER BY Satisfaction, avg_depature_delay_minutes DESC


-- Looking at averages of services
-- OVERALL averages
--
SELECT COUNT(ID) as total_passengers, avg(ease_of_online_booking) AS avg_onlinebooking, avg(checkin_service) AS avg_checkin_service, avg(online_boarding) AS avg_online_boarding, avg(gate_location) AS avg_gate_location, avg(onboard_service) AS avg_onboard_service, avg (seat_comfort) AS avg_seat_com, avg(leg_room_service) AS avg_leg_room, avg(cleanliness) AS avg_clean, avg(food_and_drink) AS avg_food_drink, avg(in_flight_service) AS flight_service, avg(in_flight_wifi_service) AS avg_wifi, avg(in_flight_entertainment) AS avg_entertainment, avg(baggage_handling) AS avg_baggage
FROM Airline..satisfactiontable
ORDER BY total_passengers 

-- Looking at the profile of a returning customer.

SELECT *
FROM Airline..satisfactiontable
WHERE Customer_Type = 'Returning'

SELECT Customer_Type, COUNT(Customer_Type) AS total_customers, avg(ease_of_online_booking) AS avg_onlinebooking, avg(checkin_service) AS avg_checkin_service, avg(online_boarding) AS avg_online_boarding, avg(gate_location) AS avg_gate_location, avg(onboard_service) AS avg_onboard_service, avg (seat_comfort) AS avg_seat_com, avg(leg_room_service) AS avg_leg_room, avg(cleanliness) AS avg_clean, avg(food_and_drink) AS avg_food_drink, avg(in_flight_service) AS flight_service, avg(in_flight_wifi_service) AS avg_wifi, avg(in_flight_entertainment) AS avg_entertainment, avg(baggage_handling) AS avg_baggage
FROM Airline..satisfactiontable
GROUP BY Customer_Type
ORDER BY Customer_Type

-- Looking at gender, satisfaction, and customer_type
SELECT Gender, Customer_Type, Satisfaction, COUNT(Customer_Type) AS total_passengers
FROM Airline..satisfactiontable
GROUP BY Customer_Type, satisfaction, gender
ORDER BY total_passengers DESC

--Exploring Flight Distance and customer preferences
SELECT Flight_Distance, COUNT(Satisfaction) AS total_passengers, Satisfaction
FROM Airline..satisfactiontable
GROUP BY Flight_Distance, Satisfaction
ORDER BY Flight_Distance DESC

