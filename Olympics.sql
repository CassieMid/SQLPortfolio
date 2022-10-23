SELECT *
FROM OlympicsProject..athlete_events
ORDER BY 1

--Total Athletes
SELECT COUNT(DISTINCT ID) AS Athletes
FROM OlympicsProject..athlete_events

-- Looking at how many athletes were female

SELECT Sex, COUNT(DISTINCT ID) AS Athletes
FROM OlympicsProject..athlete_events
GROUP BY SEX

SELECT Sex, COUNT(DISTINCT ID) AS Athletes, Sport
FROM OlympicsProject..athlete_events
GROUP BY Sex, Sport
ORDER BY Sex

-- Looking at age in regard to gender,
--SELECT MAX(Age) AS MaxAge, MIN(Age) AS MinAge, AVG(Age) AS AverageAge
--FROM OlympicsProject..athlete_events

SELECT Sex, MAX(Age) AS MaxAge, MIN(Age) AS MinAge, AVG(Age) AS AverageAge
FROM OlympicsProject..athlete_events
GROUP BY Sex

-- Looking at height and weight

SELECT Sex, MAX(Height) AS MaxHeight, MIN(Height) AS MinHeight, AVG(Height) AS AverageHeight
FROM OlympicsProject..athlete_events
GROUP BY Sex

SELECT Sex, MAX(Weight) AS MaxWeight, MIN(Weight) AS MinWeight, AVG(Weight) AS AverageWeight
FROM OlympicsProject..athlete_events
GROUP BY Sex
-- Looking at how many distinct athletes are in each game
SELECT COUNT(DISTINCT ID) AS athletes, Games
FROM OlympicsProject..athlete_events
GROUP BY Games
ORDER BY Games DESC

-- Looking at which city had most olympians
SELECT COUNT(ID) as Olympians, City
FROM OlympicsProject..athlete_events
GROUP BY City
ORDER BY Olympians DESC

-- Looking at which sport had the most participants
SELECT COUNT(Sport) as Olympians, Sport
FROM OlympicsProject..athlete_events
GROUP BY Sport
ORDER BY Olympians DESC

-- Seeing if theres a correlation between age and sport
SELECT Age, COUNT(Sport) as Olympians, Sport
FROM OlympicsProject..athlete_events
GROUP BY Sport, Age
ORDER BY Olympians DESC

-- Seeing if a certain age wins more medals
SELECT Age, COUNT(medal) as Olympians, medal
FROM OlympicsProject..athlete_events
WHERE medal <> 'NA'
GROUP BY medal, Age
ORDER BY Olympians DESC

-- Looking at how many countries participate in each season

SELECT COUNT(co.region) AS Countries, ath.season
FROM OlympicsProject..athlete_events ath
JOIN OlympicsProject..country_definitions co
	ON ath.NOC = co.NOC
GROUP BY ath.season

-- Looking at how many atheletes participate in each season
SELECT COUNT(DISTINCT ID) AS athletes, Season
FROM OlympicsProject..athlete_events
GROUP BY Season

-- Looking at which event had the most total athletes
SELECT COUNT(DISTINCT ID) AS athletes, Event
FROM OlympicsProject..athlete_events
GROUP BY Event
ORDER BY athletes DESC

SELECT COUNT(DISTINCT ID) AS athletes, Event, Sex
FROM OlympicsProject..athlete_events
GROUP BY Event, Sex
ORDER BY athletes DESC

SELECT COUNT(DISTINCT ID) AS athletes, Event, Age, Sex
FROM OlympicsProject..athlete_events
GROUP BY Event, Sex, Age
ORDER BY athletes DESC

SELECT COUNT(DISTINCT ID) AS athletes, Event, Age, Sex
FROM OlympicsProject..athlete_events
WHERE AGE BETWEEN 30 AND 60
GROUP BY Event, Sex, Age
ORDER BY athletes DESC

SELECT COUNT(DISTINCT ID) AS athletes, Event, Age
FROM OlympicsProject..athlete_events
WHERE AGE > 60
GROUP BY Event, Age
ORDER BY athletes DESC

SELECT COUNT(DISTINCT ID) AS athletes, Event, Age
FROM OlympicsProject..athlete_events
WHERE AGE < 18
GROUP BY Event, Age
ORDER BY athletes DESC

-- Looking at which countries had the most olympians (in general)

SELECT COUNT(DISTINCT ID) AS athletes, co.region
FROM OlympicsProject..athlete_events ath
JOIN OlympicsProject..country_definitions co
	ON ath.NOC = co.NOC
GROUP BY co.region
ORDER BY athletes DESC

-- Looking at which countries had the most women, USA had the most women.

SELECT Sex, COUNT(DISTINCT ID) AS athletes, co.region
FROM OlympicsProject..athlete_events ath
JOIN OlympicsProject..country_definitions co
	ON ath.NOC = co.NOC
GROUP BY Sex, co.region
ORDER BY athletes DESC

--Looking at which countries had the most medals (gold medals)

SELECT COUNT(DISTINCT ID) AS athletes, co.region, medal
FROM OlympicsProject..athlete_events ath
JOIN OlympicsProject..country_definitions co
	ON ath.NOC = co.NOC
WHERE medal = 'Gold'
GROUP BY medal, co.region 
ORDER BY athletes DESC

--Looking at which countries had the most olympians during certain years

SELECT COUNT(ID) AS Olympians, co.region, Year
FROM OlympicsProject..athlete_events ath
JOIN OlympicsProject..country_definitions co
	ON ath.NOC = co.NOC
WHERE Year = 1896
GROUP BY Year, co.region
ORDER BY Olympians DESC

SELECT Max(Year) as MaxYear, Min(Year) AS MinYear
FROM OlympicsProject..athlete_events


