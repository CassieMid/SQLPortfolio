CREATE TABLE adoptable_cats (id int,
	name VARCHAR(50),
	age int,
	color VARCHAR(50),
	sex VARCHAR(50),
	weight_lbs int)
--DROP TABLE adoptable_cats
INSERT INTO adoptable_cats VALUES (1001, 'Mittens', 1, 'F','Gray', 7);
INSERT INTO adoptable_cats VALUES (1002, 'Tiger', 5, 'M', 'Orange', 12);
INSERT INTO adoptable_cats VALUES (1003, 'Kiwi', 2, 'F', 'Black', 9);
INSERT INTO adoptable_cats VALUES (1004, 'Bella', 3, 'F', 'Tabby', 8);
INSERT INTO adoptable_cats VALUES (1005, 'Luna', 1, 'F', 'Tuxedo', 7);
INSERT INTO adoptable_cats VALUES (1006, 'Mickey', 10, 'M', 'Cream', 10);

SELECT *
FROM adoptable_cats

CREATE TABLE adoption_price (id int,
	price int,
	location VARCHAR(50))

INSERT INTO adoption_price VALUES (1001, 275, 'StPaul');
INSERT INTO adoption_price VALUES (1002, 175, 'StPaul');
INSERT INTO adoption_price VALUES (1003, 250, 'StPaul');
INSERT INTO adoption_price VALUES (1004, 200, 'Minneapolis');
INSERT INTO adoption_price VALUES (1005, 275, 'Minneapolis');
INSERT INTO adoption_price VALUES (1006, 150, 'StPaul');

SELECT * 
FROM adoption_price

-- Looking at price

SELECT p.id, c.name, c.age, c.color, c.sex, c.weight_lbs, p.price, p.location
    FROM adoptable_cats c
    JOIN adoption_price p
    ON c.id = p.id
ORDER BY p.price DESC

-- Looking at locations

SELECT p.id, c.name, c.age, c.color, c.sex, c.weight_lbs, p.price, p.location
    FROM adoptable_cats c
    JOIN adoption_price p
    ON c.id = p.id
ORDER BY p.location DESC
