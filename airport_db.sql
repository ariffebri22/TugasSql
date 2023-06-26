-- A

CREATE TABLE airport (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(225),
    country VARCHAR(225),
    iata_code VARCHAR(3),
    airline INT
);

CREATE TABLE airline (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(225),
    country VARCHAR(225),
    iata_code VARCHAR(2),
    aircraft INT
);

CREATE TABLE aircraft (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    airline INT,
    name VARCHAR(225),
    model VARCHAR(225),
    years INT,
    capacity INT
);

CREATE TABLE flight (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    airline INT,
    airport_from INT,
    airport_to INT,
    departure TIMESTAMP,
    arrival TIMESTAMP,
    status VARCHAR(255)
);

CREATE TYPE gender AS ENUM ('Male', 'Female');

CREATE TABLE passenger (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(225),
    gender gender,
    flight_id INT,
    seat VARCHAR(3)
);


-- B
-- CREATE

INSERT INTO airport (name, country, iata_code, airline) 
VALUES ('Bandara Internasional Soekarno-Hatta', 'Indonesia', 'CGK', 1),
('Bandara Changi', 'Singapore', 'SIN', 2),
('Heathrow Airport', 'United Kingdom', 'LHR', 3),
('Los Angeles International Airport', 'United States', 'LAX', 4),
('Sydney Airport', 'Australia', 'SYD', 5),
('Narita International Airport', 'Japan', 'NRT', 6),
('Dubai International Airport', 'United Arab Emirates', 'DXB', 7);

INSERT INTO airline (name, country, iata_code, aircraft) 
VALUES ('Garuda Indonesia', 'Indonesia', 'GA', 3),
('Singapore Airlines', 'Singapore', 'SQ', 1),
('British Airways', 'United Kingdom', 'BA', 5),
('American Airlines', 'United States', 'AA', 6),
('Qantas', 'Australia', 'QF', 4),
('Japan Airlines', 'Japan', 'JL', 2),
('Emirates', 'United Arab Emirates', 'EK', 7);

INSERT INTO aircraft (airline, name, model, years, capacity)
VALUES (1, 'Boeing 737-800', 'Narrow-body', 2010, 189),
(2, 'Airbus A320neo', 'Narrow-body', 2018, 180),
(1, 'Boeing 777-300ER', 'Wide-body', 2012, 396),
(3, 'Boeing 787-9 Dreamliner', 'Wide-body', 2016, 296),
(4, 'Airbus A380-800', 'Wide-body', 2007, 853),
(5, 'Boeing 747-400', 'Wide-body', 1991, 416),
(6, 'Embraer E190', 'Regional Jet', 2005, 98);

INSERT INTO flight (airline, airport_from, airport_to, departure, arrival, status)
VALUES (1, 1, 2, '2023-06-24 08:00:00', '2023-06-24 10:00:00', 'Normal'),
(2, 2, 1, '2023-06-24 09:00:00', '2023-06-24 11:00:00', 'Normal'),
(4, 3, 4, '2023-06-24 12:00:00', '2023-06-24 17:00:00', 'Delay'),
(6, 4, 3, '2023-06-24 14:00:00', '2023-06-24 21:00:00', 'Normal'),
(3, 5, 1, '2023-06-24 16:00:00', '2023-06-24 20:00:00', 'Canceled'),
(5, 6, 4, '2023-06-24 18:00:00', '2023-06-24 23:00:00', 'Normal'),
(7, 7, 3, '2023-06-24 20:00:00', '2023-06-24 23:30:00', 'Delay');

INSERT INTO passenger (name, gender, flight_id, seat)
VALUES ('John Doe', 'Male', 1, '26K'),
('Jane Smith', 'Female', 2, '12B'),
('Michael Johnson', 'Male', 1, '10C'),
('Emily Davis', 'Female', 4, '30L'),
('David Wilson', 'Male', 2, '24J'),
('Sophia Brown', 'Female', 1, '19D'),
('Daniel Anderson', 'Male', 6, '07F');

-- FOREIGN KEY

ALTER TABLE airport ADD FOREIGN KEY (airline) REFERENCES airline(id);

ALTER TABLE airline ADD FOREIGN KEY (aircraft) REFERENCES aircraft(id);

ALTER TABLE aircraft ADD FOREIGN KEY (airline) REFERENCES airline(id);

ALTER TABLE flight ADD FOREIGN KEY (airline) REFERENCES airline(id); 
ALTER TABLE flight ADD FOREIGN KEY (airport_from) REFERENCES airport(id);
ALTER TABLE flight ADD FOREIGN KEY (airport_to) REFERENCES airport(id);

ALTER TABLE passenger ADD FOREIGN KEY (flight_id) REFERENCES flight(id);

-- READ

SELECT * FROM airport WHERE iata_code = 'CGK';

SELECT name FROM airline WHERE name ILIKE '%Air%';

SELECT * FROM aircraft ORDER BY years ASC;

SELECT * FROM flight OFFSET 2 LIMIT 3;

SELECT name FROM passenger ORDER BY gender;


-- UPDATE

UPDATE airport SET name = 'Bandara Internasional Juanda' WHERE id = 1;

UPDATE airline SET name = 'Lion Air' WHERE id = 1;

UPDATE aircraft SET years = 2015 WHERE id = 3;

UPDATE flight SET departure = '2023-06-25 10:00:00' WHERE id = 2;

UPDATE passenger SET seat = '02C' WHERE name = 'John Doe';


-- DELETE

DELETE FROM airport WHERE id = 7;

DELETE FROM airline WHERE name = 'Lion Air';

DELETE FROM aircraft WHERE years < 2000;

DELETE FROM flight WHERE departure > '2023-06-24 23:00:00';

DELETE FROM passenger WHERE name = 'John Doe';


-- C

-- Tabel airport
--Sorting
SELECT * FROM aiport ORDER BY name ASC;

-- Filtering
SELECT * FROM airport WHERE country = 'Singapore';


-- Tabel airline
-- Sorting
SELECT * FROM airline ORDER BY iata_code DESC; 

--Filtering
SELECT * FROM airline WHERE name LIKE = 'Inter';


